ALTER TABLE Otse�hendused ADD CONSTRAINT fk_otse�hendused_kohad_1 FOREIGN KEY (Kohad_ID_1) REFERENCES Kohad (Kohad_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Otse�hendused ADD CONSTRAINT fk_otse�hendused_kohad_2 FOREIGN KEY (Kohad_ID_2) REFERENCES Kohad (Kohad_ID)
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE Bussiliinid_Bussipeatused ADD CONSTRAINT fk_bussiliinid_bussipeatused_bussiliinid FOREIGN KEY (Bussiliinid_ID) REFERENCES Bussiliinid (Bussiliinid_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Bussiliinid_Bussipeatused ADD CONSTRAINT fk_bussiliinid_bussipeatused_bussipeatused FOREIGN KEY (Bussipeatused_ID) REFERENCES Bussipeatused (Bussipeatused_ID)
ON DELETE CASCADE ON UPDATE CASCADE;
