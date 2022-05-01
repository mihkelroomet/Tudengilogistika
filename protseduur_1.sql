// Abiprotseduur; väljastab kõikide rattadokkide ID-d ja kauguse ruudud etteantud kohast
CREATE OR REPLACE PROCEDURE sp_kolme_lähima_rattadoki_sisemine_sest_sql_anywhere_on_väga_piiratud_võimalustega (koha_id int)
RESULT (
    Rattadokid_ID int,
    Kauguse_Ruut int
)
    BEGIN
        SELECT TOP 3 Rattadokid_ID, power(Kohad_X_m - Rattadokid_X_m, 2) + power(Kohad_Y_m - Rattadokid_Y_m, 2)
        FROM Rattadokid, Kohad
        WHERE Kohad_ID = koha_id
        ORDER BY 2;
    END;

// Abiprotseduur; väljastab kõikide bussipeatuste ID-d ja kauguse ruudud etteantud kohast
CREATE OR REPLACE PROCEDURE sp_kolme_lähima_bussipeatuse_sisemine_sest_sql_anywhere_on_väga_piiratud_võimalustega (koha_id int)
RESULT (
    Bussipeatused_ID int,
    Kauguse_Ruut int
)
    BEGIN
        SELECT TOP 3 Bussipeatused_ID, power(Kohad_X_m - Bussipeatused_X_m, 2) + power(Kohad_Y_m - Bussipeatused_Y_m, 2)
        FROM Bussipeatused, Kohad
        WHERE Kohad_ID = koha_id
        ORDER BY 2;
    END;