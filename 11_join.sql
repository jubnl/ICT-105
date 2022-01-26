-- a) liste des employés du département "Vente" par ordre alphabétique des noms d'employé
SELECT tE.*
FROM tblEmployes tE
         INNER JOIN tblDepartements tD ON tE.DNo = tD.DNo
WHERE tD.DNom = 'Vente'
ORDER BY tE.ENom;

-- b) liste du nom de l'employé avec le nom de son département pour les "Vendeur" gagnant plus de 1000.-
SELECT tE.ENom employeeName,
       tD.DNom departmentName
FROM tblEmployes tE
         INNER JOIN tblDepartements tD ON tE.DNo = tD.DNo
WHERE tE.EJob = 'vendeur'
  AND tE.Esal > 1000;

-- c) nom du département et tous les attributs de l'employé
SELECT tD.DNom departmentName,
       tE.*
FROM tblEmployes tE
         INNER JOIN tblDepartements tD ON tE.DNo = tD.DNo;

-- d) liste des employés qui gagnent plus que leur chef
SELECT tE.*
FROM tblEmployes tE
         INNER JOIN tblEmployes tEBoss ON tE.EChef = tEBoss.ENo
WHERE tE.Esal > tEBoss.Esal;

-- e) nom du département, nom de l'employé, nom du chef, classé par département, employé
SELECT tD.DNom     department,
       tE.ENom     employee,
       tEBoss.ENom boss
FROM tblEmployes tE
         INNER JOIN tblEmployes tEBoss ON tE.EChef = tEBoss.ENo
         INNER JOIN tblDepartements tD ON tE.DNo = tD.DNo
ORDER BY tD.DNom, tE.ENom;

-- f) nom des employés, nom du département pour les employés qui gagnent plus que leur chef
SELECT tE.ENom employeeName,
       tD.DNom departmentName
FROM tblEmployes tE
         INNER JOIN tblEmployes tEBoss ON tE.EChef = tEBoss.ENo
         INNER JOIN tblDepartements tD ON tEBoss.DNo = tD.DNo
WHERE tE.Esal > tEBoss.Esal;

-- g) liste des jobs par département (nom du job et nom du département)
SELECT DISTINCT tE.EJob job,
                tD.DNom department
FROM tblEmployes tE
         INNER JOIN tblDepartements tD ON tE.DNo = tD.DNo
ORDER BY tD.DNom;

-- h) liste des départements de 5 lettres ayant au moins un employé
SELECT DISTINCT tD.DNom departmentName
FROM tblDepartements tD
         INNER JOIN tblEmployes tE ON tD.DNo = tE.DNo
WHERE tD.DNom LIKE '_____';

-- i) nom de l'employé, nom du chef, nom du chef du chef classé par employé
SELECT tE.ENom         employee,
       tEBoss.ENom     manager,
       tEBossBoss.ENom boss
FROM tblEmployes tE
         INNER JOIN tblEmployes tEBoss ON tE.EChef = tEBoss.ENo
         INNER JOIN tblEmployes tEBossBoss ON tEBoss.EChef = tEBossBoss.ENo
ORDER BY tE.ENom;

SELECT emp.ENom  employee,
       man.ENom  manager,
       boss.ENom boss,
       CEO.ENom  CEO
FROM tblEmployes emp
         INNER JOIN tblEmployes man ON emp.EChef = man.ENo
         INNER JOIN tblEmployes boss ON man.EChef = boss.ENo
         INNER JOIN tblEmployes CEO ON boss.EChef = CEO.ENo
ORDER BY emp.ENom;

SELECT emp.ENom  employee,
       man.ENom  manager,
       boss.ENom boss,
       CEO.ENom  CEO
FROM tblEmployes emp
         LEFT JOIN tblEmployes man ON emp.EChef = man.ENo
         LEFT JOIN tblEmployes boss ON man.EChef = boss.ENo
         LEFT JOIN tblEmployes CEO ON boss.EChef = CEO.ENo
ORDER BY emp.ENom;