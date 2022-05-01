// Leiab antud kohale kolm lähimat rattadokki, tagastades rattadokkide ID-d ja kaugused kohast
// Ette ei anta mitte koha nimi, vaid koha ID, sest antud protseduur on mõeldud kasutamiseks vaid kõrgema taseme päringutes
// (ehk see ei ole mõeldud lõppkasutajale otse kasutamiseks)
CREATE OR REPLACE PROCEDURE sp_kolm_lähimat_rattadokki (IN koha_id int)
RESULT (
    Rattadokid_ID int,
    Kaugus int
)
    BEGIN
        SELECT Rattadokid_ID, round(sqrt(Kauguse_Ruut), 0)
        FROM sp_kolme_lähima_rattadoki_sisemine_sest_sql_anywhere_on_väga_piiratud_võimalustega(koha_id);
    END;

// Leiab antud kohale kolm lähimat bussipeatust, tagastades bussipeatuste ID-d ja kaugused kohast
// Ette ei anta mitte koha nimi, vaid koha ID, sest antud protseduur on mõeldud kasutamiseks vaid kõrgema taseme päringutes
// (ehk see ei ole mõeldud lõppkasutajale otse kasutamiseks)
CREATE OR REPLACE PROCEDURE sp_kolm_lähimat_bussipeatust (IN koha_id int)
RESULT (
    Bussipeatused_ID int,
    Kaugus int
)
    BEGIN
        SELECT Bussipeatused_ID, round(sqrt(Kauguse_Ruut), 0)
        FROM sp_kolme_lähima_bussipeatuse_sisemine_sest_sql_anywhere_on_väga_piiratud_võimalustega(koha_id);
    END;