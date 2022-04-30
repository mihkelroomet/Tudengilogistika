// Leiab antud kohale kolm l�himat rattadokki, tagastades rattadokkide ID-d ja kaugused kohast
// Ette ei anta mitte koha nimi, vaid koha ID, sest antud protseduur on m�eldud kasutamiseks vaid k�rgema taseme p�ringutes
// (ehk see ei ole m�eldud l�ppkasutajale otse kasutamiseks)
CREATE OR REPLACE PROCEDURE sp_kolm_lahimat_rattadokki (IN koha_id int)
RESULT (
    Rattadokid_ID int,
    Kaugus int
)
    BEGIN
        SELECT TOP 3 Rattadokid_ID, round(sqrt(Kauguse_Ruut), 0)
        FROM sp_kolme_lahima_rattadoki_sisemine_sest_sql_anywhere_on_vaga_piiratud_voimalustega(koha_id)
        ORDER BY 2;
    END;

// Leiab antud kohale kolm l�himat bussipeatust, tagastades bussipeatuste ID-d ja kaugused kohast
// Ette ei anta mitte koha nimi, vaid koha ID, sest antud protseduur on m�eldud kasutamiseks vaid k�rgema taseme p�ringutes
// (ehk see ei ole m�eldud l�ppkasutajale otse kasutamiseks)
CREATE OR REPLACE PROCEDURE sp_kolm_lahimat_bussipeatust (IN koha_id int)
RESULT (
    Bussipeatused_ID int,
    Kaugus int
)
    BEGIN
        SELECT TOP 3 Bussipeatused_ID, round(sqrt(Kauguse_Ruut), 0)
        FROM sp_kolme_lahima_bussipeatuse_sisemine_sest_sql_anywhere_on_vaga_piiratud_voimalustega(koha_id)
        ORDER BY 2;
    END;