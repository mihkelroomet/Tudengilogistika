// Leiab kõik bussiliinid, mis läbivad peatust 'Kesklinn' või peatust 'Soola'
SELECT f_bussiliini_nimi(Bussiliinid.Bussiliinid_ID) AS Bussiliin
FROM Bussiliinid KEY JOIN Bussiliinid_Bussipeatused KEY JOIN Bussipeatused
WHERE Bussipeatused_Nimi = 'Kesklinn' OR Bussipeatused_Nimi = 'Soola';
