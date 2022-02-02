-- a) liste de tous les employés présents et archivés (table tblEmployesArchives) avec le non de leur chef
SELECT emp.ENom Nom, boss.ENom
FROM tblEmployes emp
         LEFT JOIN tblEmployes boss ON emp.EChef = boss.ENo
UNION
SELECT arch.Enom, tE.ENom
FROM tblEmployesArchives arch
         LEFT JOIN tblEmployes tE on arch.EChef = tE.DNo
ORDER BY Nom;

/*
b) En prévision d’une loterie le chef des RH vous demande une liste cumulés des noms des employés et des noms de tout les
départements le tout classés par ordre alphabétiques
*/
SELECT ENom
FROM tblEmployes
UNION
SELECT DNom
FROM tblDepartements
ORDER BY ENom;

-- c) Liste de tous les chefs ayant des ouvriers sous leurs ordres cumulés avec tous les employés entant Vendeur
SELECT emp.ENom
FROM tblEmployes emp
         LEFT JOIN tblEmployes boss ON emp.EChef = boss.ENo
WHERE emp.EJob = 'Ouvrier'
UNION
SELECT emp2.ENom
FROM tblEmployes emp2
WHERE emp2.EJob = 'vendeur';

-- d) Faire une requête SQL permettant d’obtenir le résultat suivant :
SELECT 'Nombre de collaborateurs' AS 'Texte', COUNT(emp.ENo) AS 'Value'
FROM tblEmployes emp
UNION
SELECT 'Total des commission' AS 'Texte', SUM(IFNULL(emp2.ECom, 0)) AS 'Value'
FROM tblEmployes emp2
UNION
SELECT 'Total des salaires' AS 'Texte', SUM(emp3.Esal) AS 'Value'
FROM tblEmployes emp3;