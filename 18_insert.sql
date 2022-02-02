/*
a) Ajouter un collaborateur 7950, DUPUIS, ouvrier dans le département Vente avec un salaire de 3333.- Son chef sera
Stoll
*/

INSERT INTO tblEmployes (ENo, ENom, EJob, EChef, EDebut, Esal, ECom, DNo)
VALUES (7950, 'DUPUIS', 'Ouvrier',
        (SELECT Eno FROM tblEmployes boss WHERE ENom = 'Stoll'), NOW(), 3333, NULL,
        (SELECT DNo FROM tblDepartements WHERE DNom = 'Vente'));

/*
b) Dupliquer tous les collaborateurs par un seul ordre insert. Les
nouveaux numéros devront avoir 10 000 de plus que ceux
existant.
*/
INSERT INTO tblEmployes (ENo, ENom, EJob, EChef, EDebut, Esal, ECom, DNo)
SELECT ENo + 10000, ENom, EJob, EChef, EDebut, Esal, ECom, DNo FROM tblEmployes;