// Abiprotseduur; väljastab kõikide rattadokkide ID-d ja kauguse ruudud etteantud kohast
CREATE OR REPLACE PROCEDURE sp_kolme_lahima_rattadoki_sisemine_sest_sql_anywhere_on_vaga_piiratud_voimalustega (koha_id int)
RESULT (
    Rattadokid_ID int,
    Kauguse_Ruut int
)
    BEGIN
        SELECT Rattadokid_ID, power(Kohad_X_m - Rattadokid_X_m, 2) + power(Kohad_Y_m - Rattadokid_Y_m, 2)
        FROM Rattadokid, Kohad
        WHERE Kohad_ID = koha_id
        ORDER BY 2;
    END;

// Abiprotseduur; väljastab kõikide bussipeatuste ID-d ja kauguse ruudud etteantud kohast
CREATE OR REPLACE PROCEDURE sp_kolme_lahima_bussipeatuse_sisemine_sest_sql_anywhere_on_vaga_piiratud_voimalustega (koha_id int)
RESULT (
    Bussipeatused_ID int,
    Kauguse_Ruut int
)
    BEGIN
        SELECT Bussipeatused_ID, power(Kohad_X_m - Bussipeatused_X_m, 2) + power(Kohad_Y_m - Bussipeatused_Y_m, 2)
        FROM Bussipeatused, Kohad
        WHERE Kohad_ID = koha_id
        ORDER BY 2;
    END;