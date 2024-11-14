CREATE TABLE `klient` (
  `idklient` int NOT NULL AUTO_INCREMENT,
  `fio` varchar(45) DEFAULT NULL,
  `gorod` varchar(45) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `userrole` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idklient`)
);

CREATE TABLE `sotrudniki` (
  `idsotrudniki` int NOT NULL AUTO_INCREMENT,
  `fio` varchar(45) DEFAULT NULL,
  `gorod` varchar(45) DEFAULT NULL,
  `pasport` int DEFAULT NULL,
  `data_rozjden` date DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  `doljnost` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsotrudniki`)
);

CREATE TABLE `towars` (
  `idtowars` int NOT NULL AUTO_INCREMENT,
  `nazvanie` varchar(45) DEFAULT NULL,
  `marka` varchar(45) DEFAULT NULL,
  `cena` int DEFAULT NULL,
  `kod_tipa` int DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtowars`)
);

CREATE TABLE `zakazi` (
  `idzakazi` int NOT NULL AUTO_INCREMENT,
  `adres_pokupatela` varchar(45) DEFAULT NULL,
  `data_razmesheniya` date DEFAULT NULL,
  `klient_idklient` int NOT NULL,
  `sotrudniki_idsotrudniki` int NOT NULL,
  PRIMARY KEY (`idzakazi`),
  KEY `fk_zakazi_klient1_idx` (`klient_idklient`),
  KEY `fk_zakazi_sotrudniki1_idx` (`sotrudniki_idsotrudniki`),
  CONSTRAINT `fk_zakazi_klient1` FOREIGN KEY (`klient_idklient`) REFERENCES `klient` (`idklient`),
  CONSTRAINT `fk_zakazi_sotrudniki1` FOREIGN KEY (`sotrudniki_idsotrudniki`) REFERENCES `sotrudniki` (`idsotrudniki`)
);

CREATE TABLE `towars_has_zakazi` (
  `towars_idtowars` int NOT NULL,
  `zakazi_idzakazi` int NOT NULL,
  `cena` int DEFAULT NULL,
  `kolichestvo` int DEFAULT NULL,
  PRIMARY KEY (`towars_idtowars`,`zakazi_idzakazi`),
  KEY `fk_towars_has_zakazi_zakazi1_idx` (`zakazi_idzakazi`),
  KEY `fk_towars_has_zakazi_towars_idx` (`towars_idtowars`),
  CONSTRAINT `fk_towars_has_zakazi_towars` FOREIGN KEY (`towars_idtowars`) REFERENCES `towars` (`idtowars`),
  CONSTRAINT `fk_towars_has_zakazi_zakazi1` FOREIGN KEY (`zakazi_idzakazi`) REFERENCES `zakazi` (`idzakazi`)
);