-- a) Qui a eu le plus de gratification toute année confondue ?
SELECT tE.ENom, SUM(tG.Gratification) sum
FROM tblGratifications tG
         INNER JOIN tblEmployes tE on tG.Eno = tE.ENo
GROUP BY tE.ENom
ORDER BY sum DESC
LIMIT 1;


-- b) Nom des collaborateurs ayant une gratification en 2000, trié par gratification de la plus grande vers la plus petite
SELECT tE.ENom
FROM tblGratifications tG
         INNER JOIN tblEmployes tE on tG.ENo = tE.ENo
WHERE tG.Annee = 2000
ORDER BY tG.Gratification DESC;


-- c) Somme des gratifications de l’année 2000 par département et par ordre alphabétique des départements
SELECT tD.DNom, SUM(tG.Gratification) sum
FROM tblGratifications tG
         INNER JOIN tblEmployes tE on tG.Eno = tE.ENo
         INNER JOIN tblDepartements tD on tE.DNo = tD.DNo
WHERE tG.Annee = 2000
GROUP BY tD.DNom
ORDER BY tD.DNom;

-- d) Quelle est le département qui distribue le plus de gratification, toute année confondue ?
SELECT tD.DNom, SUM(tG.Gratification) sum
FROM tblGratifications tG
         INNER JOIN tblEmployes tE on tG.Eno = tE.ENo
         INNER JOIN tblDepartements tD on tE.DNo = tD.DNo
GROUP BY tD.DNom
ORDER BY sum DESC
LIMIt 1;


-- e) Liste des ouvriers avec une gratification de plus de 500.- en 2001
SELECT tE.ENom, tG.Gratification
FROM tblGratifications tG
         INNER JOIN tblEmployes tE on tG.Eno = tE.ENo
WHERE tE.EJob = 'ouvrier'
  AND tG.Annee = 2001
  AND tG.Gratification > 500
GROUP BY tE.ENom;

-- f) Liste des employés archivés avec leur nom de leur chef ; on considère que le chef n’est pas archivé.
SELECT tEA.ENom employee, tE.ENom boss
FROM tblEmployesArchives tEA
         INNER JOIN tblEmployes tE on tEA.EChef = tE.ENo;

-- g) Existe-t-il des employés ayant un total de gratification plus important que le total des gratifications de son chef ?
SELECT tE.ENom
FROM tblGratifications tGemployee
         INNER JOIN tblEmployes tE on tGemployee.Eno = tE.ENo
         INNER JOIN tblGratifications tGBoss on tGBoss.Eno = tE.EChef
GROUP BY tE.ENom
HAVING SUM(tGemployee.Gratification) > SUM(tGBoss.Gratification);


select employee.ENom, SUM(tgemp.Gratification) totemp, boss.ENom, sum(tgboss.Gratification) totboss
FROM tblEmployes employee
         INNER JOIN tblEmployes boss on employee.EChef = boss.ENo
         INNER JOIN tblGratifications tgemp on employee.ENo = tgemp.Eno
         INNER JOIN tblGratifications tgboss on boss.ENo = tgboss.Eno
GROUP BY employee.ENom, boss.ENom
HAVING totemp > totboss;