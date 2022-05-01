// Leiab infot selle kohta, kuidas liikuda bussiga kohast 'Kesklinn' (ID 1) kohta 'Physicum' (ID 4).
// Kasutajale väljastatakse lähtepeatuse nimi, distants lähtekohast lähtepeatuseni, bussiliini nimi, peatuste arv,
// sihtpeatuse nimi, distants sihtpeatusest sihtkohani ja teekonna oodatav kestus.
SELECT TOP 1
    Lähtepeatused.Bussipeatused_Nimi AS Lähtepeatus,
    f_kaugus(Lähtepeatused.Bussipeatused_X_m, Lähtepeatused.Bussipeatused_Y_m, Lähtekoht.Kohad_X_m, Lähtekoht.Kohad_Y_m) AS 'Kaugus lähtepeatusest (m)',
    f_bussiliini_nimi(Bussiliinid.Bussiliinid_ID) AS 'Bussiliin',
    Bl_Bp_Sihtpeatus.Bussipeatuse_Järjekorranumber - Bl_Bp_Lähtepeatus.Bussipeatuse_Järjekorranumber AS 'Peatuste arv',
    Sihtpeatused.Bussipeatused_Nimi AS Sihtpeatus,
    f_kaugus(Sihtpeatused.Bussipeatused_X_m, Sihtpeatused.Bussipeatused_Y_m, Sihtkoht.Kohad_X_m, Sihtkoht.Kohad_Y_m) AS 'Kaugus sihtpeatusest (m)',

    // aeg, mis kulub kõndimiseks lähtekohast lähtepeatusse
    f_ajakulu(f_kaugus(Lähtepeatused.Bussipeatused_X_m, Lähtepeatused.Bussipeatused_Y_m, Lähtekoht.Kohad_X_m, Lähtekoht.Kohad_Y_m), 1) +
    // keskmine bussi ooteaeg
    round(Bussiliinid.Keskmine_Intervall_min / 2, 0) +
    // aeg, mis kulub bussiga sõitmisele
    f_ajakulu(f_bussisõidu_pikkus_m(Bussiliinid.Bussiliinid_ID, Bl_Bp_Lähtepeatus.Bussipeatuse_Järjekorranumber, Bl_Bp_Sihtpeatus.Bussipeatuse_Järjekorranumber), 3) +
    // aeg, mis kulub kõndimiseks sihtpeatusest sihtkohta
    f_ajakulu(f_kaugus(Sihtpeatused.Bussipeatused_X_m, Sihtpeatused.Bussipeatused_Y_m, Sihtkoht.Kohad_X_m, Sihtkoht.Kohad_Y_m), 1) AS 'Ajakulu (min)'

FROM (sp_kolm_lähimat_bussipeatust(1) AS Lähimad_Lähtepeatused
        JOIN Bussipeatused AS Lähtepeatused ON Lähimad_Lähtepeatused.Bussipeatused_ID=Lähtepeatused.Bussipeatused_ID),
    Kohad AS Lähtekoht,
    (sp_kolm_lähimat_bussipeatust(4) AS Lähimad_Sihtpeatused
        JOIN Bussipeatused AS Sihtpeatused ON Lähimad_Sihtpeatused.Bussipeatused_ID=Sihtpeatused.Bussipeatused_ID),
    Kohad AS Sihtkoht,
    Bussiliinid_Bussipeatused AS Bl_Bp_Lähtepeatus,
    Bussiliinid_Bussipeatused AS Bl_Bp_Sihtpeatus
        JOIN Bussiliinid ON Bl_Bp_Sihtpeatus.Bussiliinid_ID = Bussiliinid.Bussiliinid_ID

WHERE
    Lähtekoht.Kohad_ID = 1 AND
    Sihtkoht.Kohad_ID = 4 AND
    Bl_Bp_Lähtepeatus.Bussipeatused_ID = Lähtepeatused.Bussipeatused_ID AND
    Bl_Bp_Sihtpeatus.Bussipeatused_ID = Sihtpeatused.Bussipeatused_ID AND
    Bl_Bp_Lähtepeatus.Bussiliinid_ID = Bl_Bp_Sihtpeatus.Bussiliinid_ID AND
    Bl_Bp_Lähtepeatus.Bussipeatuse_Järjekorranumber < Bl_Bp_Sihtpeatus.Bussipeatuse_Järjekorranumber

ORDER BY 'Ajakulu (min)';