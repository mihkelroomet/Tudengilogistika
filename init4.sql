CREATE OR REPLACE FUNCTION f_bussiliini_nimi(bussiliini_id int)
RETURNS varchar(104)
    BEGIN
        DECLARE bussiliini_nimi varchar(104);
        DECLARE bussiliini_number int;
        DECLARE bussiliini_l�htepeatus varchar(50);
        DECLARE bussiliini_sihtpeatus varchar(50);
        SELECT Bussiliinid_Number, Bussiliinid_L�htepeatus, Bussiliinid_Sihtpeatus INTO bussiliini_number, bussiliini_l�htepeatus, bussiliini_sihtpeatus
        FROM Bussiliinid WHERE Bussiliinid.Bussiliinid_ID = bussiliini_id;
        SET bussiliini_nimi = bussiliini_number || ' ' || bussiliini_l�htepeatus || '-' || bussiliini_sihtpeatus;
        RETURN bussiliini_nimi;
    END;

CREATE OR REPLACE FUNCTION f_kaugus(x1 int, y1 int, x2 int, y2 int)
RETURNS int
    BEGIN
        DECLARE kaugus int;
        SET kaugus = round(sqrt(power(x1 - x2, 2) + power(y1 - y2, 2)), 0);
        RETURN kaugus;
    END;

CREATE OR REPLACE FUNCTION f_ajakulu(kaugus int, liikumisviisi_id int)
RETURNS int
    BEGIN
        DECLARE ajakulu int;
        DECLARE kiirus int;
        SELECT Kiirus_m_min INTO kiirus FROM Liikumisviisid WHERE Liikumisviisid_ID = liikumisviisi_id;
        SET ajakulu = round(kaugus / kiirus, 0);
        RETURN ajakulu;
    END;

CREATE OR REPLACE FUNCTION f_bussis�idu_pikkus_m(bussiliini_id int, l�htepeatuse_jrknr int, sihtpeatuse_jrknr int)
RETURNS int
    BEGIN
        DECLARE s�idu_pikkus int;
        SELECT sum(f_kaugus(L�htepeatused.Bussipeatused_X_m, L�htepeatused.Bussipeatused_Y_m, Sihtpeatused.Bussipeatused_X_m, Sihtpeatused.Bussipeatused_Y_m))
        INTO s�idu_pikkus
        FROM 
            Bussiliinid_Bussipeatused AS Bl_Bp_L�htepeatused KEY JOIN Bussipeatused AS L�htepeatused,
            Bussiliinid_Bussipeatused AS Bl_Bp_Sihtpeatused KEY JOIN Bussipeatused AS Sihtpeatused
        WHERE
            Bl_Bp_L�htepeatused.Bussiliinid_ID = bussiliini_id AND
            Bl_Bp_Sihtpeatused.Bussiliinid_ID = bussiliini_id AND
            Bl_Bp_L�htepeatused.Bussipeatuse_J�rjekorranumber >= l�htepeatuse_jrknr AND
            Bl_Bp_L�htepeatused.Bussipeatuse_J�rjekorranumber < sihtpeatuse_jrknr AND
            Bl_Bp_L�htepeatused.Bussipeatuse_J�rjekorranumber + 1 = Bl_Bp_Sihtpeatused.Bussipeatuse_J�rjekorranumber;
        RETURN s�idu_pikkus;
    END;