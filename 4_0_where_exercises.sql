-- a1 : liste des employés dont le nom commence par M
SELECT *
FROM tblEmployes
WHERE ENom LIKE 'M%';


-- a2 : idem but Case sensitive
SELECT *
FROM tblEmployes
WHERE `ENom` LIKE BINARY 'm%';

-- b : liste des employés dont le nom se termine par ER
SELECT *
FROM tblEmployes
WHERE ENom LIKE '%ER';

-- c : liste des employés dont le nom se compose de 6 caractères
SELECT *
FROM tblEmployes
WHERE LENGTH(ENom) = 6;

SELECT *
FROM tblEmployes
WHERE ENom LIKE '______';

-- d : liste des employés dont le nom se compose de 6 caractères et dont le dernier est R
SELECT *
FROM tblEmployes
WHERE LENGTH(ENom) = 6
  AND ENom LIKE '%R';

SELECT *
FROM tblEmployes
WHERE ENom LIKE '_____R';

-- e : liste des employés dont la 2ème lettre du nom est A
SELECT *
FROM tblEmployes
WHERE ENom LIKE '_A%';

-- f : liste des employés dont le nom comprend 5 caractères
SELECT *
FROM tblEmployes
WHERE LENGTH(ENom) = 5;

SELECT *
FROM tblEmployes
WHERE ENom LIKE '_____';

-- g : iste des employés dont le nom commence par un V ou un C ou un S
SELECT *
FROM tblEmployes
WHERE ENom LIKE 'V%'
   OR ENom LIKE 'C%'
   OR ENom LIKE 'S%';

SELECT *
FROM tblEmployes
WHERE ENom REGEXP '^[CSV]';

-- h : liste des employés du département 30 avec un salaire supérieur à 2000
SELECT *
FROM tblEmployes
WHERE DNo = 30
  AND Esal > 2000;

-- i : liste des "Vendeur" du département 30 avec un salaire entre 1500 et 2000
SELECT *
FROM tblEmployes
WHERE EJob = 'Vendeur'
  AND DNo = 30
  AND Esal BETWEEN 1500 AND 2000;

-- j : liste des "Vendeur" du département 30 qui gagnent plus de 1500 et des "Manager" du même département qui gagnent plus de 3000
SELECT *
FROM tblEmployes
WHERE DNo = 30
  AND ((EJob = 'Vendeur' AND Esal > 1500) OR (EJob = 'Manager' AND Esal > 3000));

-- k : iste des employés du département 10 qui ne sont ni "Manager", ni "Vendeur"
SELECT *
FROM tblEmployes
WHERE DNo = 10
  AND EJob NOT IN ('Manager', 'Vendeur');

-- l : liste des noms, salaires, commissions, salaires versés des employés dont la commission dépasse le 25% du salaire
SELECT ENom                     employeeName,
       Esal                     salary,
       ECom                     commission,
       Esal + COALESCE(ECom, 0) totalSalary
FROM tblEmployes
WHERE COALESCE(ECom, 0) > Esal * 0.25;

-- m : liste des jobs dont les employés n’ont pas droit à une commission
SELECT DISTINCT EJob jobName
FROM tblEmployes
WHERE ECom IS NULL;

SELECT DISTINCT EJob jobName
FROM tblEmployes
WHERE EJob NOT IN (
    SELECT EJob
    FROM tblEmployes
    WHERE ECom IS NOT NULL
);

SELECT DISTINCT EJob jobName
FROM tblEmployes
WHERE EJob NOT IN (
    SELECT EJob
    FROM tblEmployes
    WHERE ECom > 0
);
