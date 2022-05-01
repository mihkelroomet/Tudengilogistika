// Leiab, kui kaua läheb jala kõndimiseks kohast 'Purde ühikas' (ID 5) kohta 'Delta' (ID 2).
// Eeldame siin, et nende vahel on täpselt üks koht, mis neid ühendab.
SELECT
    f_ajakulu(f_kaugus(Lähtekoht.Kohad_X_m, Lähtekoht.Kohad_Y_m, Ühenduskoht.Kohad_X_m, Ühenduskoht.Kohad_Y_m), 1) +
    f_ajakulu(f_kaugus(Ühenduskoht.Kohad_X_m, Ühenduskoht.Kohad_Y_m, Sihtkoht.Kohad_X_m, Sihtkoht.Kohad_Y_m), 1) AS 'Ajakulu (min)'

FROM (
    SELECT O1.Kohad_ID_2 AS Lähtekoha_ID, O1.Kohad_ID_1 AS Ühenduskoha_ID, O2.Kohad_ID_2 AS Sihtkoha_ID
    FROM Otseühendused AS O1 JOIN Otseühendused AS O2 ON O1.Kohad_ID_1=O2.Kohad_ID_1 WHERE O1.Kohad_ID_2 = 5 AND O2.Kohad_ID_2 = 2
    UNION
    SELECT O1.Kohad_ID_2 AS Lähtekoha_ID, O1.Kohad_ID_1 AS Ühenduskoha_ID, O2.Kohad_ID_1 AS Sihtkoha_ID
    FROM Otseühendused AS O1 JOIN Otseühendused AS O2 ON O1.Kohad_ID_1=O2.Kohad_ID_2 WHERE O1.Kohad_ID_2 = 5 AND O2.Kohad_ID_1 = 2
    UNION
    SELECT O1.Kohad_ID_1 AS Lähtekoha_ID, O1.Kohad_ID_2 AS Ühenduskoha_ID, O2.Kohad_ID_2 AS Sihtkoha_ID
    FROM Otseühendused AS O1 JOIN Otseühendused AS O2 ON O1.Kohad_ID_2=O2.Kohad_ID_1 WHERE O1.Kohad_ID_1 = 5 AND O2.Kohad_ID_2 = 2
    UNION
    SELECT O1.Kohad_ID_1 AS Lähtekoha_ID, O1.Kohad_ID_2 AS Ühenduskoha_ID, O2.Kohad_ID_1 AS Sihtkoha_ID
    FROM Otseühendused AS O1 JOIN Otseühendused AS O2 ON O1.Kohad_ID_2=O2.Kohad_ID_2 WHERE O1.Kohad_ID_1 = 5 AND O2.Kohad_ID_1 = 2
) AS Kohtade_IDd

JOIN Kohad AS Lähtekoht ON Kohtade_IDd.Lähtekoha_ID = Lähtekoht.Kohad_ID
JOIN Kohad AS Ühenduskoht ON Kohtade_IDd.Ühenduskoha_ID = Ühenduskoht.Kohad_ID
JOIN Kohad AS Sihtkoht ON Kohtade_IDd.Sihtkoha_ID = Sihtkoht.Kohad_ID;