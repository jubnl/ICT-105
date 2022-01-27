-- a) nom des employés qui ont le même job que le collaborateur Dupond ; le job de Dupond doit être trouvé par une sous requête
SELECT tE.ENom
FROM tblEmployes tE
WHERE tE.EJob = (
    SELECT tiE.EJob
    FROM tblEmployes tiE
    WHERE tE.ENom = 'Dupond'
    LIMIT 1
);

-- b) départements qui n’ont pas d’employé (en utilisant une requête imbriquée)
SELECT DNom
FROM tblDepartements
WHERE DNo NOT IN (
    SELECT DISTINCT DNo
    FROM tblEmployes
);

-- c) employés dont le salaire dépasse le salaire moyen des employés du département vente
SELECT *
FROM tblEmployes
WHERE Esal > (
    SELECT AVG(Esal)
    FROM tblEmployes
             INNER JOIN tblDepartements tD on tblEmployes.DNo = tD.DNo
    WHERE tD.DNom = 'vente'
);

-- d) employés dont le salaire est inférieur au salaire le plus bas du département vente
SELECT *
FROM tblEmployes
WHERE Esal < (
    SELECT MIN(Esal)
    FROM tblEmployes
             INNER JOIN tblDepartements tD on tblEmployes.DNo = tD.DNo
    WHERE tD.DNom = 'vente'
);

-- e) nom et job des employés du département recherche dont le job existe dans le département vente
SELECT ENom, EJob
FROM tblEmployes emp
         INNER JOIN tblDepartements dep on emp.DNo = dep.DNo
WHERE emp.EJob IN (
    SELECT emp.EJob
    FROM tblDepartements dep
             INNER JOIN tblEmployes emp on dep.DNo = emp.DNo
    WHERE DNom = 'vente'
)
  AND dep.DNom = 'recherche';

/* f) Nom des collaborateurs dont le chef (N+1) est Manager ; ici N+1 représente le chef d’une personne ; N+2 représenterai
   le chef du chef d’un collaborateur et ainsi de suite. */
SELECT emp.ENom
FROM tblEmployes emp
         INNER JOIN tblEmployes boss on emp.EChef = boss.ENo
WHERE boss.EJob = 'manager';

SELECT emp.ENom
FROM tblEmployes emp
WHERE EChef IN (SELECT Eno FROM tblEmployes WHERE EJob = 'manager');


-- g) Nom des collaborateurs dont le chef (N+1) n’est pas Manager
SELECT emp.ENom
FROM tblEmployes emp
         INNER JOIN tblEmployes boss on emp.EChef = boss.ENo
WHERE boss.EJob != 'manager';

SELECT emp.ENom
FROM tblEmployes emp
WHERE EChef NOt IN (SELECT Eno FROM tblEmployes WHERE EJob = 'manager');


-- h) liste des jobs du département recherche qui existent dans le département vente avec le nombre d’employés qui l’exercent
select EJob, count(ENom)
from tblEmployes
         inner join tblDepartements tD on tblEmployes.DNo = tD.DNo
WHERE DNom = 'recherche'
  AND EJob IN (SELECT DISTINCT EJob
               FROM tblEmployes
                        INNER Join tblDepartements t on tblEmployes.DNo = t.DNo
               WHERE t.DNom = 'vente')
GROUP BY EJob;

-- i) nom, job, salaire des employés qui ont le même job et un salaire inférieur que Jan
SELECT ENom, EJob, Esal
FROM tblEmployes
WHERE EJob = (SELECT EJob FROM tblEmployes WHERE ENom = 'Jan')
  AND Esal < (SELECT Esal FROM tblEmployes WHERE ENom = 'Jan');

-- j) nom, salaire, nom du département des employés qui gagnent plus que le salaire moyen des employés du département vente.
SELECT emp.ENom, emp.Esal, dep.DNom
FROM tblEmployes emp
         INNER JOIN tblDepartements dep on emp.DNo = dep.DNo
WHERE Esal > (SELECT AVG(Esal)
              FROM tblEmployes
                       INNER JOIN tblDepartements tD on tblEmployes.DNo = tD.DNo
              WHERE tD.DNom = 'vente');

-- k) liste des collaborateurs qui ne sont chef de personne (en utilisant une requête imbriquée)
SELECT *
FROM tblEmployes
WHERE ENo NOT IN (SELECT EChef FROM tblEmployes WHERE EChef IS NOT NULL);

-- l) liste des presque chefs : collaborateurs (nom) ayant seulement un seul niveau hiérarchique soit seulement un N+1
SELECT emp.ENom
FROM tblEmployes emp
         INNER JOIN tblEmployes boss on emp.EChef = boss.ENo
WHERE boss.EChef IS NULL