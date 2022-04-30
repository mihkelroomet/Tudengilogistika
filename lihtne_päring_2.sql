// Leiab kõik järjestikused peatused, mida läbib liin nr 2 suunal Lõunakeskus
SELECT Bussipeatused_Nimi AS Bussipeatus
FROM Bussipeatused KEY JOIN Bussiliinid_Bussipeatused KEY JOIN Bussiliinid
WHERE Bussiliinid_Number = 2 AND Bussiliinid_Sihtpeatus = 'Lõunakeskus'
ORDER BY Bussipeatuse_Järjekorranumber;
