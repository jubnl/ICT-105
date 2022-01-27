-- a) liste des départements qui n'ont pas d'employé (avec jointure externe)
SELECT tD.*
FROM tblDepartements tD
         LEFT JOIN tblEmployes tE on tD.DNo = tE.DNo
WHERE tE.DNo IS NULL;

SELECT tD.*
FROM tblEmployes tE
         RIGHT JOIN tblDepartements tD on tE.DNo = tD.DNo
WHERE tE.DNo IS NULL;

-- b) liste de tous les départements avec leur nombre d'employés (avec jointure externe)
SELECT tD.*, COUNT(tE.ENo)
FROM tblDepartements tD
         LEFT JOIN tblEmployes tE on tD.DNo = tE.DNo
GROUP BY tD.DNom;

SELECT tD.*, COUNT(tE.ENo)
FROM tblEmployes tE
         RIGHT JOIN tblDepartements tD on tD.DNo = tE.DNo
GROUP BY tD.DNom;

-- c) liste de tous les employés avec le nom de leur chef (N+1)
SELECT emp.ENom, boss.ENom
FROM tblEmployes emp
         LEFT JOIN tblEmployes boss on emp.EChef = boss.ENo;

SELECT emp.ENom, boss.ENom
FROM tblEmployes boss
         RIGHT JOIN tblEmployes emp on emp.EChef = boss.ENo;

/* d) liste de tous les employés avec le nom de leur chef (N+1), le nom du chef de leur chef (N+2) et le nom du chef de
leur chef de leur chef (N+3), ceci équivaut à l’organigramme de l’entreprise sur 4 niveaux */
SELECT emp.ENom  employee,
       man.ENom  manager,
       boss.ENom boss,
       CEO.ENom  CEO
FROM tblEmployes emp
         LEFT JOIN tblEmployes man ON emp.EChef = man.ENo
         LEFT JOIN tblEmployes boss ON man.EChef = boss.ENo
         LEFT JOIN tblEmployes CEO ON boss.EChef = CEO.ENo
ORDER BY emp.ENom;

SELECT emp.ENom  employee,
       man.ENom  manager,
       boss.ENom boss,
       CEO.ENom  CEO
FROM tblEmployes CEO
         RIGHT JOIN tblEmployes boss ON boss.EChef = CEO.ENo
         RIGHT JOIN tblEmployes man ON man.EChef = boss.ENo
         RIGHT JOIN tblEmployes emp ON emp.EChef = man.ENo
ORDER BY emp.ENom;

-- e) liste de tous les départements basé à Lausanne avec la somme des salaires (ESal) à versés (avec jointure externe)
SELECT dep.*,
       IFNULL(SUM(emp.Esal), 0) totalSalary
FROM tblDepartements dep
         LEFT JOIN tblEmployes emp on dep.DNo = emp.DNo
WHERE dep.DLoc = 'lausanne'
GROUP BY dep.DNo;

SELECT dep.*,
       IFNULL(SUM(emp.Esal), 0) totalSalary
FROM tblEmployes emp
         RIGHT JOIN tblDepartements dep on dep.DNo = emp.DNo
WHERE dep.DLoc = 'lausanne'
GROUP BY dep.DNo;

/* f) liste des employés avec un N° de département incorrect (N° de département qui n’existerait pas dans la table
département – Cas sans intégrité référentielle dans la base de données) */
SELECT dep.*
FROM tblEmployes emp
         LEFT JOIN tblDepartements dep on dep.DNo = emp.DNo
WHERE emp.DNo NOT IN (SELECT DNo FROM tblDepartements);

SELECT dep.*
FROM tblDepartements dep
         RIGHT JOIN tblEmployes emp on dep.DNo = emp.DNo
WHERE emp.DNo NOT IN (SELECT DNo FROM tblDepartements);

-- g) Collaborateur (nom) de la table tblEmployesArchives qui ne sont pas dans la table tblEmployes
SELECT arch.ENom
FROM tblEmployesArchives arch
         LEFT JOIN tblEmployes emp on arch.ENom = emp.ENom;

SELECT arch.ENom
FROM tblEmployes emp
         RIGHT JOIN tblEmployesArchives arch on arch.ENom = emp.ENom;

-- h) Liste des jobs dans la table tblEmployesArchives qu’on ne retrouve pas dans la table tblEmployes
SELECT arch.EJob
FROM tblEmployesArchives arch
         LEFT JOIN tblEmployes emp on emp.EJob = arch.EJob
WHERE emp.EJob IS NULL;

SELECT arch.EJob
FROM tblEmployes emp
         RIGHT JOIN tblEmployesArchives arch on emp.EJob = arch.EJob
WHERE emp.EJob IS NULL;

-- i) Salaire minimum par département en faisant afficher 0.- pour les départements sans employés
SELECT dep.DNom, IFNULL(MIN(emp.Esal), 0) minSalary
FROM tblDepartements dep
         LEFT JOIN tblEmployes emp on dep.DNo = emp.DNo
GROUP BY dep.DNom
ORDER BY minSalary DESC;

SELECT dep.DNom, IFNULL(MIN(emp.Esal), 0) minSalary
FROM tblEmployes emp
         RIGHT JOIN tblDepartements dep on dep.DNo = emp.DNo
GROUP BY dep.DNom
ORDER BY minSalary DESC;
