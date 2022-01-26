-- a : liste complète des employés (tous les attributs de tous les employés)
SELECT *
FROM `tblEmployes`;

-- b : liste complète des départements (tous les attributs de tous les départements)
SELECT *
FROM `tblDepartements`;

-- c : liste des noms et des jobs de tous les employés
SELECT `ENom` employeeName,
       `EJob` jobName
FROM `tblEmployes`;

-- d : liste des noms et des salaires de tous les employés, en traduisant le titre des colonnes en français
SELECT `ENom` employeeName,
       `Esal` salary
FROM `tblEmployes`;

-- e : idem, classé par ordre alphabétique des noms
SELECT `ENom` employeeName,
       `Esal` salary
FROM `tblEmployes`
ORDER BY employeeName;

-- f : idem, classé par ordre alphabétique des professions et des noms
SELECT `ENom` employeeName,
       `Esal` salary
FROM `tblEmployes`
ORDER BY `EJob`, employeeName;

-- g : liste du nom des employés et de leur salaire, en allant du salaire le plus bas au salaire le plus haut
SELECT `ENom` employeeName,
       `Esal` salary
FROM `tblEmployes`
ORDER BY salary;

-- h : liste des jobs des employés de notre société
SELECT `EJob` jobName
FROM `tblEmployes`;

-- i : liste des jobs des employés de notre société en évitant les doublons dans le résultat proposé
SELECT DISTINCT `EJob` jobName
FROM `tblEmployes`;