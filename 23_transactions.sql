/*
Encapsuler les 2 ordres SQL ci-dessous dans une transaction. Vérifiez
l’ajout dans les 2 tables puis exécuter l’ordre ROLLBACK pour annuler
l’ensemble des 2 ordres SQL.
- INSERT INTO tbldepartements (Dno, Dnom, Dloc) VALUES
(100,'Informatique','Yverdon-les-Bains');
- INSERT INTO tblemployes (Eno, Enom, Ejob, Echef, Esal,Dno)
VALUES (8001,'Schmidt','Manager',7566,2500,100);
*/

START TRANSACTION;
INSERT INTO tblDepartements (Dno, Dnom, Dloc) VALUES
(100,'Informatique','Yverdon-les-Bains');
INSERT INTO tblEmployes (Eno, Enom, Ejob, Echef, Esal,Dno)
VALUES (8001,'Schmidt','Manager',7566,2500,100);
SELECT * FROM tblDepartements;
SELECT * FROM tblEmployes;
ROLLBACK;
SELECT * FROM tblDepartements;
SELECT * FROM tblEmployes;

SHOW GLOBAL VARIABLES LIKE 'general_log%';

SET GLOBAL general_log_file='/var/log/mysql/node66332-unified.log';