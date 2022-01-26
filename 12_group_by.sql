-- a) nom du département, moyenne des salaires du département, moyenne des commissions du département,
SELECT tD.DNom                           department,
       ROUND(AVG(tE.Esal), 2)            avgSalary,
       ROUND(AVG(IFNULL(tE.ECom, 0)), 2) avgCommission
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
GROUP BY tD.DNom;

-- b) idem, mais en mettant des titres clairs pour chaque colonne
SELECT tD.DNom                 department,
       AVG(tE.Esal)            avgSalary,
       AVG(IFNULL(tE.ECom, 0)) avgCommission
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
GROUP BY tD.DNom;

-- c) nom du département, nombre d'employés pour chaque classe, salaire moyen pour chaque classe, salaire minimum pour chaque classe
SELECT tC.Classe                        salaryClass,
       tD.DNom                          departmentName,
       COUNT(tE.ENo)                    employeeAmountPerClass,
       AVG((tC.SalMin + tC.SalMax) / 2) avgSalaryPerClass,
       tC.SalMin                        minimumSalaryPerClass
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
         INNER JOIN tblClasses tC
WHERE tE.Esal BETWEEN tC.SalMin AND tC.SalMax
GROUP BY tC.Classe
ORDER BY tC.Classe;

SELECT tC.Classe                        salaryClass,
       tD.DNom                          departmentName,
       COUNT(tE.ENo)                    employeeAmountPerClass,
       AVG((tC.SalMin + tC.SalMax) / 2) avgSalaryPerClass,
       tC.SalMin                        minimumSalaryPerClass
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
         INNER JOIN tblClasses tC
WHERE tE.Esal BETWEEN tC.SalMin AND tC.SalMax
GROUP BY tD.DNom, tC.Classe
ORDER BY tC.Classe, tD.DNom;

-- d) idem, mais on ne veut que les employés qui ne sont pas "Analystes"
SELECT tC.Classe                        salaryClass,
       tD.DNom                          departmentName,
       COUNT(tE.ENo)                    employeeAmountPerClass,
       AVG((tC.SalMin + tC.SalMax) / 2) avgSalaryPerClass,
       tC.SalMin                        minimumSalaryPerClass
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
         INNER JOIN tblClasses tC
WHERE tE.Esal BETWEEN tC.SalMin AND tC.SalMax
  AND tE.EJob != 'Analyste'
GROUP BY tC.Classe
ORDER BY tC.Classe;

-- e) nom du job, nombre d'employés ayant ce job, salaire moyen par job et par ordre alphabétique des jobs
SELECT EJob        jobName,
       COUNT(ENom) employeeAmount,
       AVG(Esal)   avgSalary
FROM tblEmployes
GROUP BY EJob
ORDER BY EJob;

-- f) nom du département, nom des jobs de ce département, nombre d'employés ayant ce job pour tous les départements
SELECT tD.DNom     departmentName,
       tE.EJob     jobName,
       COUNT(ENom) employeeAmount
FROM tblEmployes tE
         INNER JOIN tblDepartements tD on tE.DNo = tD.DNo
GROUP BY tD.DNom, tE.EJob;

-- g) liste des montants versés les plus bas (salaire + commission) par département et par job ?
SELECT tD.DNom                      departmentName,
       tE.EJob                      JobName,
       tE.Esal + IFNULL(tE.ECom, 0) salary
FROM tblEmployes tE
         INNER JOIN tblDepartements tD on tE.DNo = tD.DNo
GROUP BY tD.DNom, tE.EJob
ORDER BY salary, tE.EJob;

-- h) liste des années d’engagement par département.
SELECT tD.DNom                                    departmentName,
       MAX(TIMESTAMPDIFF(year, tE.EDebut, NOW())) Anciennete
FROM tblEmployes tE
         INNER JOIN tblDepartements tD on tE.DNo = tD.DNo
GROUP BY tD.DNom
ORDER BY tD.DNom;