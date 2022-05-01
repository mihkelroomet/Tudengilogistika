// Leiab antud kohale kolm l�himat rattadokki, tagastades rattadokkide ID-d ja kaugused kohast
// Ette ei anta mitte koha nimi, vaid koha ID, sest antud protseduur on m�eldud kasutamiseks vaid k�rgema taseme p�ringutes
// (ehk see ei ole m�eldud l�ppkasutajale otse kasutamiseks)
CREATE OR REPLACE PROCEDURE sp_kolm_l�himat_rattadokki (IN koha_id int)
RESULT (
    Rattadokid_ID int,
    Kaugus int
)
    BEGIN
        SELECT Rattadokid_ID, round(sqrt(Kauguse_Ruut), 0)
        FROM sp_kolme_l�hima_rattadoki_sisemine_sest_sql_anywhere_on_v�ga_piiratud_v�imalustega(koha_id);
    END;

// Leiab antud kohale kolm l�himat bussipeatust, tagastades bussipeatuste ID-d ja kaugused kohast
// Ette ei anta mitte koha nimi, vaid koha ID, sest antud protseduur on m�eldud kasutamiseks vaid k�rgema taseme p�ringutes
// (ehk see ei ole m�eldud l�ppkasutajale otse kasutamiseks)
CREATE OR REPLACE PROCEDURE sp_kolm_l�himat_bussipeatust (IN koha_id int)
RESULT (
    Bussipeatused_ID int,
    Kaugus int
)
    BEGIN
        SELECT Bussipeatused_ID, round(sqrt(Kauguse_Ruut), 0)
        FROM sp_kolme_l�hima_bussipeatuse_sisemine_sest_sql_anywhere_on_v�ga_piiratud_v�imalustega(koha_id);
    END;