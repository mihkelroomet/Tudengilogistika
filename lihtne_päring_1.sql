// Leiab k�ik bussiliinid, mis l�bivad peatust 'Kesklinn' v�i peatust 'Soola'
SELECT f_bussiliini_nimi(Bussiliinid.Bussiliinid_ID) AS Bussiliin
FROM Bussiliinid KEY JOIN Bussiliinid_Bussipeatused KEY JOIN Bussipeatused
WHERE Bussipeatused_Nimi = 'Kesklinn' OR Bussipeatused_Nimi = 'Soola';