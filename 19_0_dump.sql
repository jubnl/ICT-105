-- database creation
DROP DATABASE IF EXISTS `students`;
CREATE DATABASE IF NOT EXISTS `students`;
USE `students`;
CREATE TABLE `tblEleves`
(
    IdEleve            INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NomEleve           CHAR(50),
    PrenomEleve        CHAR(50),
    DateNaissanceEleve DATE,
    AVSEleve           CHAR(13)
);

-- get database size
SELECT TABLE_SCHEMA                                     "DB Name",
       ROUND(SUM(DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024, 4) "DB Size in MB"
FROM information_schema.tables
WHERE TABLE_SCHEMA = 'students'
GROUP BY TABLE_SCHEMA;

-- insert
INSERT INTO tblEleves (NomEleve, PrenomEleve, DateNaissanceEleve, AVSEleve)
VALUES ('Einstein', 'Albert', NOW(), '1245234');

-- get number of rows
SELECT COUNT(IdEleve) FROM tblEleves;

-- insert multiple rows
INSERT INTO tblEleves (NomEleve, PrenomEleve, DateNaissanceEleve, AVSEleve)
SELECT NomEleve, PrenomEleve, DateNaissanceEleve, AVSEleve
FROM tblEleves;

OPTIMIZE TABLE tblEleves;
ANALYZE TABLE tblEleves;

-- delete rows
DELETE FROM tblEleves WHERE IdEleve > 10000;

SELECT * FROM tblEleves;