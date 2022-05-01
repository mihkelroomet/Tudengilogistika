// Leiab, kui kaua l�heb jala k�ndimiseks kohast 'Purde �hikas' (ID 5) kohta 'Delta' (ID 2).
// Eeldame siin, et nende vahel on t�pselt �ks koht, mis neid �hendab.
SELECT
    f_ajakulu(f_kaugus(L�htekoht.Kohad_X_m, L�htekoht.Kohad_Y_m, �henduskoht.Kohad_X_m, �henduskoht.Kohad_Y_m), 1) +
    f_ajakulu(f_kaugus(�henduskoht.Kohad_X_m, �henduskoht.Kohad_Y_m, Sihtkoht.Kohad_X_m, Sihtkoht.Kohad_Y_m), 1) AS 'Ajakulu (min)'

FROM (
    SELECT O1.Kohad_ID_2 AS L�htekoha_ID, O1.Kohad_ID_1 AS �henduskoha_ID, O2.Kohad_ID_2 AS Sihtkoha_ID
    FROM Otse�hendused AS O1 JOIN Otse�hendused AS O2 ON O1.Kohad_ID_1=O2.Kohad_ID_1 WHERE O1.Kohad_ID_2 = 5 AND O2.Kohad_ID_2 = 2
    UNION
    SELECT O1.Kohad_ID_2 AS L�htekoha_ID, O1.Kohad_ID_1 AS �henduskoha_ID, O2.Kohad_ID_1 AS Sihtkoha_ID
    FROM Otse�hendused AS O1 JOIN Otse�hendused AS O2 ON O1.Kohad_ID_1=O2.Kohad_ID_2 WHERE O1.Kohad_ID_2 = 5 AND O2.Kohad_ID_1 = 2
    UNION
    SELECT O1.Kohad_ID_1 AS L�htekoha_ID, O1.Kohad_ID_2 AS �henduskoha_ID, O2.Kohad_ID_2 AS Sihtkoha_ID
    FROM Otse�hendused AS O1 JOIN Otse�hendused AS O2 ON O1.Kohad_ID_2=O2.Kohad_ID_1 WHERE O1.Kohad_ID_1 = 5 AND O2.Kohad_ID_2 = 2
    UNION
    SELECT O1.Kohad_ID_1 AS L�htekoha_ID, O1.Kohad_ID_2 AS �henduskoha_ID, O2.Kohad_ID_1 AS Sihtkoha_ID
    FROM Otse�hendused AS O1 JOIN Otse�hendused AS O2 ON O1.Kohad_ID_2=O2.Kohad_ID_2 WHERE O1.Kohad_ID_1 = 5 AND O2.Kohad_ID_1 = 2
) AS Kohtade_IDd

JOIN Kohad AS L�htekoht ON Kohtade_IDd.L�htekoha_ID = L�htekoht.Kohad_ID
JOIN Kohad AS �henduskoht ON Kohtade_IDd.�henduskoha_ID = �henduskoht.Kohad_ID
JOIN Kohad AS Sihtkoht ON Kohtade_IDd.Sihtkoha_ID = Sihtkoht.Kohad_ID;