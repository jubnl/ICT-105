-- a : noms des employés qui n’ont pas de chef
SELECT ENom
FROM tblEmployes
WHERE EChef IS NULL;

-- b : noms des employés qui ont un chef
SELECT ENom
FROM tblEmployes
WHERE EChef IS NOT NULL;

-- c : liste des employés (ENom, EDebut) engagés en 1997
SELECT ENom, EDebut
FROM tblEmployes
WHERE YEAR(EDebut) = 1997;

-- d : liste des employés (ENom, EDebut) engagés en 1997. Faire une seconde proposition.
/*
SELECT ENom, EDebut
FROM tblEmployes
WHERE EDebut LIKE '1997%';
 */

SELECT ENom, EDebut
FROM tblEmployes
WHERE EDebut BETWEEN '1997-01-01' AND '1997-12-31';

SELECT ENom, EDebut
FROM tblEmployes
WHERE EDebut BETWEEN '19970101' AND '19971231';

-- e : Quelle est la date d’engagement (Edebut) du premier employé « ouvrier » ?
SELECT EDebut
FROM tblEmployes
WHERE EJob = 'Ouvrier'
ORDER BY EDebut
LIMIT 1;

SELECT MIN(EDebut)
FROM tblEmployes;

-- f : liste des employés (ENom, EDebut) engagés au mois de mai. Tenir compte du mois de mai de toutes les années.
SELECT *
FROM tblEmployes
WHERE MONTH(EDebut) = '05';

SELECT *
FROM tblEmployes
WHERE MONTH(EDebut) = 5;

-- g : Liste des départements (DNo) ayant des employés.
SELECT DISTINCT DNo
FROM tblEmployes;

-- h : Nombre de département (DNom) dans la table des départements.
SELECT COUNT(DNom)
FROM tblDepartements;
