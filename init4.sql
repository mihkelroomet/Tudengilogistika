CREATE OR REPLACE FUNCTION f_bussiliini_nimi(bussiliini_id int)
RETURNS varchar(104)
    BEGIN
        DECLARE bussiliini_nimi varchar(104);
        DECLARE bussiliini_number int;
        DECLARE bussiliini_lähtepeatus varchar(50);
        DECLARE bussiliini_sihtpeatus varchar(50);
        SELECT Bussiliinid_Number, Bussiliinid_Lähtepeatus, Bussiliinid_Sihtpeatus INTO bussiliini_number, bussiliini_lähtepeatus, bussiliini_sihtpeatus
        FROM Bussiliinid WHERE Bussiliinid.Bussiliinid_ID = bussiliini_id;
        SET bussiliini_nimi = bussiliini_number || ' ' || bussiliini_lähtepeatus || '-' || bussiliini_sihtpeatus;
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

CREATE OR REPLACE FUNCTION f_bussisõidu_pikkus_m(bussiliini_id int, lähtepeatuse_jrknr int, sihtpeatuse_jrknr int)
RETURNS int
    BEGIN
        DECLARE sõidu_pikkus int;
        SELECT sum(f_kaugus(Lähtepeatused.Bussipeatused_X_m, Lähtepeatused.Bussipeatused_Y_m, Sihtpeatused.Bussipeatused_X_m, Sihtpeatused.Bussipeatused_Y_m))
        INTO sõidu_pikkus
        FROM 
            Bussiliinid_Bussipeatused AS Bl_Bp_Lähtepeatused KEY JOIN Bussipeatused AS Lähtepeatused,
            Bussiliinid_Bussipeatused AS Bl_Bp_Sihtpeatused KEY JOIN Bussipeatused AS Sihtpeatused
        WHERE
            Bl_Bp_Lähtepeatused.Bussiliinid_ID = bussiliini_id AND
            Bl_Bp_Sihtpeatused.Bussiliinid_ID = bussiliini_id AND
            Bl_Bp_Lähtepeatused.Bussipeatuse_Järjekorranumber >= lähtepeatuse_jrknr AND
            Bl_Bp_Lähtepeatused.Bussipeatuse_Järjekorranumber < sihtpeatuse_jrknr AND
            Bl_Bp_Lähtepeatused.Bussipeatuse_Järjekorranumber + 1 = Bl_Bp_Sihtpeatused.Bussipeatuse_Järjekorranumber;
        RETURN sõidu_pikkus;
    END;