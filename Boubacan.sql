DROP SCHEMA IF EXISTS Boubacan cascade;
CREATE SCHEMA Boubacan ;

/*Héritage de vidéo à film et série : disjoint complet. Traduit en SQl par un héritage*/
/*Héritage de personne à réalisateur et acteur : chevauchante complete. Traduit en SQL par une clé étrangère */

CREATE TABLE boubacan.abonne (
	pseudo VARCHAR,
	motDePasse VARCHAR,
	dateNaissance DATE,
	mail VARCHAR,
	iban VARCHAR,
	CONSTRAINT pk_abonne PRIMARY KEY (pseudo)
);

CREATE TABLE boubacan.personalite (
	idPers    INT,
	nom	  VARCHAR,
	prenom    VARCHAR,
	naissance DATE,
	deces     DATE,
	CONSTRAINT pk_personne PRIMARY KEY (idPers)
);

CREATE TABLE boubacan.realisateur (
	idRea INT,
	CONSTRAINT pk_realisateur PRIMARY KEY (idRea),
	CONSTRAINT fk_personalite_realisateur FOREIGN KEY (idRea) REFERENCES boubacan.personalite(idPers)
);

CREATE TABLE boubacan.acteur (
	idActeur INT,
	CONSTRAINT pk_acteur PRIMARY KEY (idActeur),
	CONSTRAINT fk_personalite_realisateur FOREIGN KEY (idActeur) REFERENCES boubacan.personalite(idPers)
);

CREATE TABLE boubacan.video(
	idVideo INT,
	categorie VARCHAR,
	titre VARCHAR,
	tempsMinutes INT,
	idRea INT,
	
	CONSTRAINT pk_video PRIMARY KEY (idVideo),
	CONSTRAINT fk_realisateur_video FOREIGN KEY (idRea) REFERENCES boubacan.realisateur(idRea)
);

CREATE TABLE boubacan.film(
	anneeRea INT,
	CONSTRAINT pk_film PRIMARY KEY (idVideo)	
)INHERITS (boubacan.video);

CREATE TABLE boubacan.serie(
	nbEpisode INT,
	CONSTRAINT pk_serie PRIMARY KEY (idVideo)
)INHERITS (boubacan.video);

CREATE TABLE boubacan.aJoueDans(
	idActeur INT,
	idVideo INT,
	CONSTRAINT pk_aJoueDans PRIMARY KEY (idActeur,idVideo),
	CONSTRAINT fk_idActeur_aJoueDans FOREIGN KEY (idActeur) REFERENCES boubacan.acteur(idActeur),
	CONSTRAINT fk_idVideo_aJoueDans FOREIGN KEY (idVideo) REFERENCES boubacan.video(idVideo)
);

CREATE TABLE boubacan.vuePar(
	pseudo 		VARCHAR,
	aRegarde 	INT,
	dateVisionage 	DATE,
	nbTempViso	INT,
	
	CONSTRAINT pk_vuepar PRIMARY KEY (pseudo,aRegarde),
	CONSTRAINT fk_abonné_vuepar FOREIGN KEY (pseudo) REFERENCES boubacan.abonne(pseudo),
	CONSTRAINT fk_video_vuepar FOREIGN KEY(aRegarde) REFERENCES
boubacan.video(idVideo)
);
	

INSERT INTO boubacan.abonne (pseudo, motDePasse, dateNaissance, mail, iban) VALUES 
		('xXMarieXx','xWooT!>.?','1972-11-25','MarieBonnet@gmail.com','FR7612548029989876543210917'),
		('LorisAkaFatigue','Opa.BdqPm!>.','1986-07-01','LorisOOk@gmail.com','FR76125480299898765432109178'),
		('SalmaShio','CinqAjqoYd.ol!','2004-08-24','SalmaHayate@gmail.com','FR7612548029989876543210919'),
		('PierrePasCaillou','PmaU>>.!Ao','2001-01-19','Caillou61@gmail.com','FR7612548029989876543210920'),
		('Calamardu75','MotDePasse123','2005-06-11','RayanAlloma@gmail.com','FR7612548029989876543210921'),
		('WinnieLourson','ouiouicestmoi104','1956-12-20','WinnieLourson@gmail.com','FR7612548029989876543210922'),
		('Plantexe','e[mR2.-E8Q.6','2004-08-25','Quarantedouzee@gmail.com','FR7612548029989876543210923'),
		('BadisxX7','Carouselle_7!','1978-03-28','BadisHabadi@gmail.com','FR7612548029989876543210924'),
		('Momo.exe','rYiDLM.q?.w','1999-04-01','mohammedDo@gmail.com','FR7612548029989876543210924'),
		('DupontPasVraimentUnPont','hspO.!G?','2000-10-15','DupontLePont@gmail.com','FR7612548029989876543210925'),
	    ('aAAaAaaAAaA','JeVaisBien0478','1977-04-29','gmail@hotmail.net','FR7612548029989876543210926'),	
		('TadopT','hAk§,7!!','2001-01-01','Jaiplusdinspi@outlook.com','FR7612548029989876543210927'),
		('Gongonga','O:w>P!!.o','1991-02-18','ZackFaitDesSquats@gmail.com','FR7612548029989876543210928'),
		('rATATATATA','Ratatataaaa.!','2000-08-08','BernardAlti@gmail.com','FR7612548029989876543210929'),
		('PoneyTonerre','455I,hq01101','2007-10-09','TonerreLePoney@gmail.com','FR7612548029989876543210930')
	;

INSERT INTO boubacan.personalite (idPers, nom, prenom , naissance, deces) VALUES 
		('001','Jonhson','Dwayne','1972-05-02',null),
		('002','Zemmour','Eric','1958-08-31',null),
		('003','Sy','Omar','1978-01-20',null),
		('004','Dupont','Xavier','1961-01-09',null),
		('005','Malek','Rami','1981-05-12',null),
		('006','Mars','Bruno','1985-09-08',null),
		('007','McAfee','John','1945-06-23','2021-06-23'),
		('008','Corbato','Fernando','1926-06-01','2019-07-12'),
		('009','Mercury','Freddie','1946-09-05','1991-10-24'),
		('010','Michael','Joseph','1958-08-29','2009-06-25'),
	    ('011','Cristiano','Ronaldo','1985-02-05',null),		
		('012','Benzema','Karim','1987-12-19',null),
		('013','Mariee','Oukasi','2000-07-18',null),
		('014','Shirley','Anne','2001-10-07',null),
		('015','Farod','Clément','1995-01-19',null),
		('016', 'Smith', 'John', '1985-03-02', '2022-06-15'),
		('017', 'Johnson', 'Emily', '2000-07-15', '2021-11-30'),
		('018', 'Williams', 'Michael', '1989-09-23', '2022-08-31'),
		('019', 'Jones', 'Jessica', '1997-11-11', '2021-12-15'),
		('020', 'Brown', 'Jacob', '1992-02-01', '2022-09-30'),
		('021', 'Davis', 'Samantha', '1999-04-05', '2021-10-31'),
		('022', 'Miller', 'Ashley', '1987-06-17', '2022-07-31')

	;
	
INSERT INTO boubacan.realisateur (idRea) VALUES 
		('001'),
 		('002'),
		('003'),
		('004'),
		('005'),
 		('006'),
		('007'),
		('008'),
		('009'),
		('010'),
		('011'),
		('012'),
		('013'),
		('014'),
		('015')		
		
	;
	
INSERT INTO boubacan.acteur (idActeur) VALUES 
		('016'),
 		('017'),
		('018'),
		('019'),
		('020'),
 		('021'),
		('022'),
		('001'),
		('002'),
		('003'),
		('004'),
		('005'),
 		('006'),
		('007'),
		('008')			
	;

 INSERT INTO boubacan.video (idVideo, categorie, titre, tempsMinutes, idRea) VALUES 
		 ('01', 'Comedy', 'Stand-up Comedy Show', '60','001'),
		 ('02', 'Drama', 'The Godfather', '175','002'),
		 ('03', 'Science-Fiction', 'Inception', '148','003'),
		 ('04', 'Action', 'The Matrix', '136','004'),
		 ('05', 'Adventure', 'Indiana Jones and the Raiders of the Lost Ark', '115','004'),
		 ('06', 'Thriller', 'The Silence of the Lambs', '118', '005'),
		 ('07', 'Animation', 'Up', '96', '006'),
		 ('08', 'Horror', 'The Exorcist', '122', '007'),
		 ('09', 'Thriller', 'Riverdale', '360','008'),
		 ('10', 'Slice of Life', 'Anne with an E', '500','009'),
		 ('11', 'Drama', 'Mr Robot', '753', '010'),
		 ('12', 'Animation', 'Gravity falls', '628','010'),
		 ('13', 'Action', 'Your lie in April', '122','011'),
		 ('14', 'Action', 'Breaking Bad', '1209','012'),
		 ('15', 'Horror', 'American Horror Story', '2176','013'),
		 ('16', 'Science-Fiction', 'Moon Knight', '700','014'),
		 ('17','Science-Fiction','Les poneys cannibales','85','015'),
		 ('18','Drama','Pourquoi les chats ont des moustaches ?','145','010'),
		 ('19','Slice of Life','J ai mangé ta mère ','740','004'),
		 ('20','Adventure','Lucy Luke et les 7 polonais','650','001'),
		 ('21','Horor','Amour dans le près','75','002'),
		 ('22','Comedy','Les taupes tueuses','850','003'),
		 ('23','Action','Monter la pyramide en rampant','210','005'),
		 ('24','Slice of Life','La mouche au mur','642','006'),
		 ('25','Animation','La baguette du touriste','121','007'),
		 ('26','Drama','Ton père est pas vitrier','580','008'),
		 ('27','Horror','A vue trouble','201','009'),
		 ('28','Action','J aurais dû écouter le lama','640','011'),
		 ('29','Comedy','Vivre chez mon beaufils','124','012'),
		 ('30','Adventure','Who let the dogs out','820','013')
		
	;

 INSERT INTO boubacan.film (idVideo, anneeRea ) VALUES 
		('01', '2000'),
		('02', '2002'),
		('03', '2004'),
		('04', '2006'),
		('05', '2008'),
		('06', '2010'),
		('07', '2012'),
		('08', '2014'),
		('17', '2015'),
		('18', '1998'),
		('21', '2005'),
		('23','2018'),
		('25','2012'),
		('27','2014'),
		('29','2007')
		
		

	;

 INSERT INTO boubacan.serie (idVideo, nbEpisode) VALUES 
		
		('09', '26'),
		('10', '28'),
		('11', '30'),
		('12', '32'),
		('13', '34'),
		('14', '36'),
		('15', '38'),
		('16','27'),
		('19','30'),
		('20','32'),
		('22','35'),
		('24','29'),
		('26','31'),
		('28','35'),
		('30','32')

          ;

INSERT INTO boubacan.aJoueDans (idActeur, idVideo) VALUES 
		('001', '01'),
		('002', '02'),
		('004', '03'),
		('004', '04'),
		('005', '05'),
		('006', '06'),
		('007', '07'),
		('017', '08'),
		('017', '09'),
		('021', '10'),
		('022', '11'),
		('018', '12'),
		('002', '13'),
		('019', '14'),
		('016', '15'),
		('003','16'),
		('008','17'),
		('008','18'),
		('003','19'),
		('015','20'),
		('017','21'),
		('018','22'),
		('019','23'),
		('020','24'),
		('021','25'),
		('001','26'),
		('002','27'),
		('004','28'),
		('005','29'),
		('006','30')
		

	;

INSERT INTO boubacan.vuePar (pseudo, aRegarde, dateVisionage, nbTempViso) VALUES
		('xXMarieXx', '01', '2022-01-01', '120'),
		('SalmaShio', '02', '2022-01-02', '90'),
		('Gongonga', '03', '2022-01-03', '150'),
		('WinnieLourson', '04', '2022-01-04', '110'),
		('Momo.exe', '05', '2022-01-05', '130'),
		('rATATATATA', '06', '2022-01-06', '140'),
		('PoneyTonerre', '07', '2022-01-07', '160'),
		('WinnieLourson', '08', '2022-01-08', '75'),
		('xXMarieXx', '09', '2022-01-09', '200'),
		('rATATATATA', '10', '2022-01-10', '180'),
		('BadisxX7', '11', '2022-01-11', '210'),
		('Calamardu75', '05', '2022-01-12', '190'),
		('Plantexe', '13', '2022-01-13', '220'),
		('TadopT', '14', '2022-01-14', '100'),
        ('PierrePasCaillou', '15', '2022-01-15', '230')

	;

