CREATE TABLE Kohad (
	Kohad_ID integer PRIMARY KEY DEFAULT AUTOINCREMENT,
	Kohad_Nimi varchar(100) NOT NULL,
	Kohad_X_m integer NOT NULL,
	Kohad_Y_m integer NOT NULL
);

CREATE TABLE Otseühendused (
	Otseühendused_ID integer PRIMARY KEY DEFAULT AUTOINCREMENT,
	Kohad_ID_1 integer NOT NULL,
	Kohad_ID_2 integer NOT NULL
);

CREATE TABLE Liikumisviisid (
	Liikumisviisid_ID integer PRIMARY KEY DEFAULT AUTOINCREMENT,
	Liikumisviisid_Nimi varchar(20),
	Kiirus_m_min integer NOT NULL,
    UNIQUE(Liikumisviisid_Nimi)
);

CREATE TABLE Bussipeatused (
	Bussipeatused_ID integer PRIMARY KEY DEFAULT AUTOINCREMENT,
	Bussipeatused_Nimi varchar(50) NOT NULL,
	Bussipeatused_X_m integer NOT NULL,
	Bussipeatused_Y_m integer NOT NULL
);

CREATE TABLE Rattadokid (
	Rattadokid_ID integer PRIMARY KEY DEFAULT AUTOINCREMENT,
	Rattadokid_Nimi varchar(50) NOT NULL,
	Rattadokid_X_m integer NOT NULL,
	Rattadokid_Y_m integer NOT NULL
);

CREATE TABLE Bussiliinid (
	Bussiliinid_ID integer PRIMARY KEY DEFAULT AUTOINCREMENT,
    Bussiliinid_Number integer NOT NULL,
	Bussiliinid_Lähtepeatus varchar(50) NOT NULL,
	Bussiliinid_Sihtpeatus varchar(50) NOT NULL,
	Keskmine_Intervall_min integer NOT NULL
);

CREATE TABLE Bussiliinid_Bussipeatused (
	Bussiliinid_Bussipeatused_ID integer PRIMARY KEY DEFAULT AUTOINCREMENT,
	Bussiliinid_ID integer NOT NULL,
	Bussipeatused_ID integer NOT NULL,
	Bussipeatuse_Järjekorranumber integer NOT NULL
);
