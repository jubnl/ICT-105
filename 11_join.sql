-- a) liste des employés du département "Vente" par ordre alphabétique des noms d'employé
SELECT tE.*
FROM tblEmployes tE
         INNER JOIN tblDepartements tD on tE.DNo = tD.DNo
WHERE tD.DNom = 'Vente'
ORDER BY tE.ENom;

-- b) liste du nom de l'employé avec le nom de son département pour les "Vendeur" gagnant plus de 1000.-
SELECT tE.ENom, tD.DNom
FROM tblEmployes tE
         INNER JOIN tblDepartements tD on tE.DNo = tD.DNo
WHERE tE.EJob = 'vendeur'
  AND tE.Esal > 1000;

-- c) nom du département et tous les attributs de l'employé
SELECT tD.DNom, tE.*
FROM tblEmployes tE
         INNER JOIN tblDepartements tD on tE.DNo = tD.DNo;

-- d) liste des employés qui gagnent plus que leur chef
SELECT tE.*
FROM tblEmployes tE
         INNER JOIN tblEmployes tEBoss ON tE.EChef = tEBoss.ENo
WHERE tE.Esal > tEBoss.Esal;

-- e) nom du département, nom de l'employé, nom du chef, classé par département, employé
SELECT tD.DNom department, tE.ENom employee, tEBoss.ENom boss
FROM tblEmployes tE
         INNER JOIN tblEmployes tEBoss on tE.EChef= tEBoss.ENo
         INNER JOIN tblDepartements tD on tE.DNo = tD.DNo
ORDER BY tD.DNom, tE.ENom;

-- f) nom des employés, nom du département pour les employés qui gagnent plus que leur chef
SELECT tE.ENom, tD.DNom
FROM tblEmployes tE
         INNER JOIN tblEmployes tEBoss ON tE.EChef = tEBoss.ENo
         INNER JOIN tblDepartements tD on tEBoss.DNo = tD.DNo
WHERE tE.Esal > tEBoss.Esal;

-- g) liste des jobs par département (nom du job et nom du département)
SELECT DISTINCT tE.EJob job, tD.DNom department
FROM tblEmployes tE
         INNER JOIN tblDepartements tD on tE.DNo = tD.DNo
ORDER BY tD.DNom;

-- h) liste des départements de 5 lettres ayant au moins un employé
SELECT DISTINCT tD.DNom
FROM tblDepartements tD
         INNER JOIN tblEmployes tE on tD.DNo = tE.DNo
WHERE tD.DNom LIKE '_____';

-- i) nom de l'employé, nom du chef, nom du chef du chef classé par employé
SELECT tE.ENom employee, tEBoss.ENom manager, tEBossBoss.ENom boss
FROM tblEmployes tE
         INNER JOIN tblEmployes tEBoss on tE.EChef = tEBoss.ENo
         INNER JOIN tblEmployes tEBossBoss on tEBoss.EChef = tEBossBoss.ENo
ORDER BY tE.ENom;

SELECT tE.ENom employee, tEBoss.ENom manager, tEBossBoss.ENom boss, tEBossBossBoss.ENom megaBoss
FROM tblEmployes tE
         INNER JOIN tblEmployes tEBoss on tE.EChef = tEBoss.ENo
         INNER JOIN tblEmployes tEBossBoss on tEBoss.EChef = tEBossBoss.ENo
         INNER JOIN tblEmployes tEBossBossBoss on tEBossBoss.EChef = tEBossBossBoss.ENo
ORDER BY tE.ENom;

SELECT tE.ENom employee, tEBoss.ENom manager, tEBossBoss.ENom boss, tEBossBossBoss.ENom megaBoss
FROM tblEmployes tE
         LEFT JOIN tblEmployes tEBoss on tE.EChef = tEBoss.ENo
         LEFT JOIN tblEmployes tEBossBoss on tEBoss.EChef = tEBossBoss.ENo
         LEFT JOIN tblEmployes tEBossBossBoss on tEBossBoss.EChef = tEBossBossBoss.ENo
ORDER BY tE.ENom;