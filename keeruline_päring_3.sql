// Leiab infot selle kohta, kuidas liikuda bussiga kohast 'Kesklinn' (ID 1) kohta 'Physicum' (ID 4).
// Kasutajale v�ljastatakse l�htepeatuse nimi, distants l�htekohast l�htepeatuseni, bussiliini nimi, peatuste arv,
// sihtpeatuse nimi, distants sihtpeatusest sihtkohani ja teekonna oodatav kestus.
SELECT TOP 1
    L�htepeatused.Bussipeatused_Nimi AS L�htepeatus,
    f_kaugus(L�htepeatused.Bussipeatused_X_m, L�htepeatused.Bussipeatused_Y_m, L�htekoht.Kohad_X_m, L�htekoht.Kohad_Y_m) AS 'Kaugus l�htepeatusest (m)',
    f_bussiliini_nimi(Bussiliinid.Bussiliinid_ID) AS 'Bussiliin',
    Bl_Bp_Sihtpeatus.Bussipeatuse_J�rjekorranumber - Bl_Bp_L�htepeatus.Bussipeatuse_J�rjekorranumber AS 'Peatuste arv',
    Sihtpeatused.Bussipeatused_Nimi AS Sihtpeatus,
    f_kaugus(Sihtpeatused.Bussipeatused_X_m, Sihtpeatused.Bussipeatused_Y_m, Sihtkoht.Kohad_X_m, Sihtkoht.Kohad_Y_m) AS 'Kaugus sihtpeatusest (m)',

    // aeg, mis kulub k�ndimiseks l�htekohast l�htepeatusse
    f_ajakulu(f_kaugus(L�htepeatused.Bussipeatused_X_m, L�htepeatused.Bussipeatused_Y_m, L�htekoht.Kohad_X_m, L�htekoht.Kohad_Y_m), 1) +
    // keskmine bussi ooteaeg
    round(Bussiliinid.Keskmine_Intervall_min / 2, 0) +
    // aeg, mis kulub bussiga s�itmisele
    f_ajakulu(f_bussis�idu_pikkus_m(Bussiliinid.Bussiliinid_ID, Bl_Bp_L�htepeatus.Bussipeatuse_J�rjekorranumber, Bl_Bp_Sihtpeatus.Bussipeatuse_J�rjekorranumber), 3) +
    // aeg, mis kulub k�ndimiseks sihtpeatusest sihtkohta
    f_ajakulu(f_kaugus(Sihtpeatused.Bussipeatused_X_m, Sihtpeatused.Bussipeatused_Y_m, Sihtkoht.Kohad_X_m, Sihtkoht.Kohad_Y_m), 1) AS 'Ajakulu (min)'

FROM (sp_kolm_l�himat_bussipeatust(1) AS L�himad_L�htepeatused
        JOIN Bussipeatused AS L�htepeatused ON L�himad_L�htepeatused.Bussipeatused_ID=L�htepeatused.Bussipeatused_ID),
    Kohad AS L�htekoht,
    (sp_kolm_l�himat_bussipeatust(4) AS L�himad_Sihtpeatused
        JOIN Bussipeatused AS Sihtpeatused ON L�himad_Sihtpeatused.Bussipeatused_ID=Sihtpeatused.Bussipeatused_ID),
    Kohad AS Sihtkoht,
    Bussiliinid_Bussipeatused AS Bl_Bp_L�htepeatus,
    Bussiliinid_Bussipeatused AS Bl_Bp_Sihtpeatus
        JOIN Bussiliinid ON Bl_Bp_Sihtpeatus.Bussiliinid_ID = Bussiliinid.Bussiliinid_ID

WHERE
    L�htekoht.Kohad_ID = 1 AND
    Sihtkoht.Kohad_ID = 4 AND
    Bl_Bp_L�htepeatus.Bussipeatused_ID = L�htepeatused.Bussipeatused_ID AND
    Bl_Bp_Sihtpeatus.Bussipeatused_ID = Sihtpeatused.Bussipeatused_ID AND
    Bl_Bp_L�htepeatus.Bussiliinid_ID = Bl_Bp_Sihtpeatus.Bussiliinid_ID AND
    Bl_Bp_L�htepeatus.Bussipeatuse_J�rjekorranumber < Bl_Bp_Sihtpeatus.Bussipeatuse_J�rjekorranumber

ORDER BY 'Ajakulu (min)';