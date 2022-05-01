// Leiab kõik rattadokid 500 m raadiuses kohast 'Pepleri ühikas' (ID 3)
SELECT Rattadokid.Rattadokid_Nimi AS Rattadokk, f_kaugus(Kohad_X_m, Kohad_Y_m, Rattadokid_X_m, Rattadokid_Y_m) AS Kaugus
FROM Rattadokid, Kohad
WHERE Kohad.Kohad_ID = 3 AND Kaugus < 500
ORDER BY Kaugus;