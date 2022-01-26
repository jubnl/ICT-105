DROP DATABASE IF EXISTS `ich105DML`;
CREATE DATABASE IF NOT EXISTS `ich105DML`;
USE `ich105DML`;
CREATE TABLE tblClasses
(
    Classe INT  NOT NULL,
    SalMin REAL NULL,
    SalMax REAL NULL
);

ALTER TABLE tblClasses
    ADD CONSTRAINT PKtblClasses PRIMARY KEY (Classe);

CREATE TABLE tblDepartements
(
    DNo  INT      NOT NULL,
    DNom CHAR(20) NULL,
    DLoc CHAR(20) NULL
);

ALTER TABLE tblDepartements
    ADD CONSTRAINT PKtblDepartements PRIMARY KEY (DNo);

CREATE TABLE tblEmployes
(
    ENo    INT      NOT NULL,
    ENom   CHAR(20) NOT NULL,
    EJob   CHAR(20) NOT NULL,
    EChef  INT      NULL,
    EDebut DATE     NULL,
    Esal   REAL     NULL,
    ECom   REAL     NULL,
    DNo    INT      NOT NULL
);

ALTER TABLE tblEmployes
    ADD CONSTRAINT PKtblEmployes PRIMARY KEY (ENo);
ALTER TABLE tblEmployes
    ADD CONSTRAINT FKtblEmployestblDepartements FOREIGN KEY (DNo) REFERENCES tblDepartements (DNo);
ALTER TABLE tblEmployes
    ADD CONSTRAINT FKtblEmployesChef FOREIGN KEY (Echef) REFERENCES tblEmployes (ENo);

CREATE TABLE tblEmployesArchives
(
    ENo    INT      NOT NULL,
    ENom   CHAR(20) NOT NULL,
    EJob   CHAR(20) NOT NULL,
    EChef  INT      NULL,
    EDebut datetime NULL,
    Esal   REAL     NULL,
    ECom   REAL     NULL,
    DNo    INT      NULL
);

ALTER TABLE tblEmployesArchives
    ADD CONSTRAINT PKtblEmployesArchives PRIMARY KEY (ENo);

CREATE TABLE tblGratifications
(
    Eno           INT  NOT NULL,
    Annee         INT  NOT NULL,
    Gratification REAL NULL
);

ALTER TABLE tblGratifications
    ADD CONSTRAINT PKtblGratifications PRIMARY KEY (ENo, Annee);



INSERT INTO tblClasses (Classe, SalMin, SalMax)
VALUES (1, 700.0000, 1199.0000),
       (2, 1200.0000, 1399.0000),
       (3, 1400.0000, 1999.0000),
       (4, 2000.0000, 2999.0000),
       (5, 3000.0000, 10000.0000);

INSERT INTO tblDepartements (DNo, DNom, DLoc)
VALUES (10, 'Comptabilité', 'Genève'),
       (20, 'Recherche', 'Lausanne'),
       (30, 'Vente', 'Fribourg'),
       (40, 'Publicité', 'Sion'),
       (50, 'Marketing', 'Lausanne'),
       (60, 'MI5', 'Lausanne');

INSERT INTO tblEmployes (ENo, ENom, EJob, EChef, EDebut, Esal, ECom, DNo)
VALUES (7839, 'Stoll', 'Président', NULL, '19910215', 1500.0000, NULL, 10),
       (7566, 'Cartier', 'Manager', 7839, '19950531', 2975.0000, 500.0000, 20),
       (7698, 'Blanc', 'Manager', 7839, '19940528', 3850.0000, 14000.0000, 30),
       (7782, 'Clarion', 'Manager', 7839, '19930611', 3000.0000, NULL, 10),
       (7902, 'Moulin', 'Analyste', 7566, '19921011', 2450.0000, NULL, 20),
       (7369, 'Dupond', 'Ouvrier', 7902, '19980205', 1800.0000, NULL, 20),
       (7499, 'Jurt', 'Vendeur', 7698, '19950325', 1600.0000, NULL, 30),
       (7521, 'Durand', 'Vendeur', 7698, '19970215', 1250.0000, 300.0000, 30),
       (7654, 'Martin', 'Vendeur', 7698, '19950423', 1250.0000, NULL, 30),
       (7788, 'Noir', 'Analyste', 7566, '19911212', 5000.0000, NULL, 20),
       (7844, 'Gelli', 'Vendeur', 7698, '19960630', 1100.0000, NULL, 30),
       (7876, 'Volery', 'Ouvrier', 7788, '19930905', 950.0000, NULL, 20),
       (7900, 'Jan', 'Ouvrier', 7698, '19911013', 3000.0000, 0.0000, 30),
       (7934, 'Tripet', 'Ouvrier', 7782, '19940801', 1300.0000, NULL, 10);

INSERT INTO tblEmployesArchives (ENo, ENom, EJob, EChef, EDebut, Esal, ECom, DNo)
VALUES (7999, 'Kurt', 'Gardien', 7839, '19910215', 1500.0000, NULL, 20),
       (7998, 'Klauss', 'Ouvrier', 7839, '19920401', 1650.0000, NULL, 10),
       (7997, 'Kottak', 'vendeur', 7902, '19991225', 1833.0000, NULL, 30);

INSERT INTO tblGratifications (Eno, Annee, Gratification)
VALUES (7028, 2000, 3000.0000),
       (7521, 2001, 1500.0000),
       (7698, 2000, 2000.0000),
       (7839, 2000, 450.0000),
       (7876, 2000, 350.0000),
       (7900, 2000, 1250.0000),
       (7902, 2001, 1800.0000);
