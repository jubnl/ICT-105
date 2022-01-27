/*
a) nom du département, nombre d'employés pour ce département, salaire moyen, salaire minimum, salaire maximum pour les
départements qui ont plus de 3 employés
*/
SELECT tD.DNom       departmentName,
       COUNT(tE.ENo) employeeCount,
       AVG(tE.Esal)  avgSalary,
       MIN(tE.Esal)  minSalary,
       MAX(tE.Esal)  maxSalary
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
GROUP BY tD.DNom
HAVING employeeCount > 3;

SELECT tD.DNom,
       COUNT(tE.ENo) nb,
       AVG(tE.Esal) avgSalary,
       MIN(tE.Esal) min,
       MAX(tE.Esal) max
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
GROUP BY tD.DNom
HAVING nb > 3;

-- b) idem, mais seulement pour le département "Vente" ou "Comptabilité"
SELECT tD.DNom       departmentName,
       COUNT(tE.ENo) employeeCount,
       AVG(tE.Esal)  avgSalary,
       MIN(tE.Esal)  minSalary,
       MAX(tE.Esal)  maxSalary
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
GROUP BY tD.DNom
HAVING employeeCount > 3
   AND tD.DNom IN ('vente', 'comptabilité');

SELECT tD.DNom,
       COUNT(tE.ENo) nb,
       AVG(tE.Esal) avgSalary,
       MIN(tE.Esal) min,
       MAX(tE.Esal) max
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
WHERE tD.DNom IN ('vente', 'comptabilité')
GROUP BY tD.DNom
HAVING nb > 3;

-- c) nom des départements ayant entre 1 et 5 employés
SELECT tD.DNom
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
GROUP BY tD.DNom
HAVING COUNT(tE.ENo) BETWEEN 1 AND 5;

-- d) nom des départements versant plus de 1500.- de commission
SELECT tD.DNom, SUM(IFNULL(tE.ECom, 0)) sum
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
GROUP BY tD.DNom
HAVING sum > 1500;

-- e) nom des départements versant moins de 1500.- de commission
SELECT tD.DNom
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
GROUP BY tD.DNom
HAVING IFNULL(SUM(tE.ECom), 0) < 1500;

-- f) nom des départements, moyenne des salaires par département, mais en ne comptant que les employés touchant plus de 1500.-
SELECT tD.DNom departmentName, AVG(tE.Esal) avgSalary
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
WHERE tE.Esal > 1500
GROUP BY tD.DNom;

-- g) département avec leur moyenne des salaires seulement pour les moyennes supérieures à 1500.-
SELECT tD.DNom departmentName, AVG(tE.Esal) avgSalary
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
GROUP BY tD.DNom
HAVING avgSalary > 1500;

-- h) salaire maximum par département en prenant en compte seulement les collaborateurs engagés entre le 01.01.1990 et le 31.12.1999
SELECT tD.DNom, MAX(tE.Esal)
FROM tblEmployes tE
         INNER JOIN tblDepartements tD on tE.DNo = tD.DNo
WHERE EDebut BETWEEN '19900101' AND '19991231'
GROUP BY tD.DNom;

-- i) nombre de salaire par département et montant versé moyen par département (salaire + commission)
SELECT tD.DNom, COUNT(tE.ENo), AVG(tE.Esal + IFNULL(tE.ECom, 0))
FROM tblEmployes tE
         INNER JOIN tblDepartements tD on tE.DNo = tD.DNo
GROUP BY tD.DNom;
