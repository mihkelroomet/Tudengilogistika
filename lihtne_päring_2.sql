// Leiab k�ik j�rjestikused peatused, mida l�bib liin nr 2 suunal L�unakeskus
SELECT Bussipeatused_Nimi AS Bussipeatus
FROM Bussipeatused KEY JOIN Bussiliinid_Bussipeatused KEY JOIN Bussiliinid
WHERE Bussiliinid_Number = 2 AND Bussiliinid_Sihtpeatus = 'L�unakeskus'
ORDER BY Bussipeatuse_J�rjekorranumber;