-- a) nom du département, moyenne des salaires du département, moyenne des commissions du département,
SELECT tD.DNom                           departmentName,
       ROUND(AVG(tE.Esal), 2)            avgSalary,
       ROUND(AVG(IFNULL(tE.ECom, 0)), 2) avgCommission
FROM tblDepartements tD
         INNER JOIN tblEmployes tE ON tD.DNo = tE.DNo
GROUP BY tD.DNom;

-- b) idem, mais en mettant des titres clairs pour chaque colonne
SELECT tD.DNom                           departmentName,
       ROUND(AVG(tE.Esal), 2)            avgSalary,
       ROUND(AVG(IFNULL(tE.ECom, 0)), 2) avgCommission
FROM tblDepartements tD
         INNER JOIN tblEmployes tE ON tD.DNo = tE.DNo
GROUP BY tD.DNom;

-- c) nom du département, nombre d'employés pour chaque classe, salaire moyen pour chaque classe, salaire minimum pour chaque classe
SELECT tC.Classe              salaryClass,
       tD.DNom                departmentName,
       COUNT(tE.ENo)          employeeAmountPerClass,
       ROUND(AVG(tE.Esal), 2) avgSalaryPerClass,
       tC.SalMin              minimumSalaryPerClass
FROM tblDepartements tD
         INNER JOIN tblEmployes tE ON tD.DNo = tE.DNo
         INNER JOIN tblClasses tC ON tE.Esal BETWEEN tC.SalMin AND tC.SalMax
GROUP BY tC.Classe
ORDER BY tC.Classe;

SELECT tC.Classe              salaryClass,
       tD.DNom                departmentName,
       COUNT(tE.ENo)          employeeAmountPerClass,
       ROUND(AVG(tE.Esal), 2) avgSalaryPerClass,
       tC.SalMin              minimumSalaryPerClass
FROM tblDepartements tD
         INNER JOIN tblEmployes tE ON tD.DNo = tE.DNo
         INNER JOIN tblClasses tC on tE.Esal BETWEEN tC.SalMin AND tC.SalMax
GROUP BY tC.Classe, tD.DNom
ORDER BY tC.Classe, tD.DNom;

-- d) idem, mais on ne veut que les employés qui ne sont pas "Analystes"
SELECT tC.Classe              salaryClass,
       tD.DNom                departmentName,
       COUNT(tE.ENo)          employeeAmountPerClass,
       ROUND(AVG(tE.Esal), 2) avgSalaryPerClass,
       tC.SalMin              minimumSalaryPerClass
FROM tblDepartements tD
         INNER JOIN tblEmployes tE ON tD.DNo = tE.DNo
         INNER JOIN tblClasses tC on tE.Esal BETWEEN tC.SalMin AND tC.SalMax
WHERE tE.EJob != 'Analyste'
GROUP BY tD.DNom, tC.Classe
ORDER BY tC.Classe, tD.DNom;

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
         INNER JOIN tblDepartements tD ON tE.DNo = tD.DNo
GROUP BY tD.DNom, tE.EJob;

-- g) liste des montants versés les plus bas (salaire + commission) par département et par job ?
SELECT tD.DNom                      departmentName,
       tE.EJob                      JobName,
       tE.Esal + IFNULL(tE.ECom, 0) salary
FROM tblEmployes tE
         INNER JOIN tblDepartements tD ON tE.DNo = tD.DNo
GROUP BY tD.DNom, tE.EJob
ORDER BY salary, tE.EJob;

-- h) liste des années d’engagement par département.
SELECT tD.DNom                                               departmentName,
       IFNULL(MAX(TIMESTAMPDIFF(year, tE.EDebut, NOW())), 0) SeniorityPerDepartment
FROM tblEmployes tE
         RIGHT JOIN tblDepartements tD ON tE.DNo = tD.DNo
GROUP BY tD.DNom
ORDER BY SeniorityPerDepartment DESC, tD.DNom;