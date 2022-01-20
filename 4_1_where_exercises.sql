-- a : liste des employés du département N° 20
SELECT *
FROM tblEmployes
WHERE DNo = 20;

-- b : liste des employés qui ne sont pas "Manager"
SELECT *
FROM tblEmployes
WHERE EJob != 'Manager';

SELECT *
FROM tblEmployes
WHERE EJob <> 'Manager';

SELECT *
FROM tblEmployes
WHERE NOT EJob = 'Manager';

-- c : liste des employés dont le salaire est supérieur à leur commission
SELECT *
FROM tblEmployes
WHERE Esal > COALESCE(ECom, 0);

-- d : liste des employés qui touchent entre 2000 et 3000 (tenir compte du salaire et de la commission)
SELECT *
FROM tblEmployes
WHERE Esal + COALESCE(ECom, 0) BETWEEN 2000 AND 3000;

-- e : liste des employés qui touchent moins de 2000 ou plus de 3000 (salaire et commission)
SELECT *
FROM tblEmployes
WHERE (Esal + COALESCE(ECom, 0)) NOT BETWEEN 2000 AND 3000;

SELECT *
FROM tblEmployes
WHERE NOT (Esal + COALESCE(ECom, 0)) BETWEEN 2000 AND 3000;

-- f : liste des employés qui sont "Manager" ou "Analyste"
SELECT *
FROM tblEmployes
WHERE EJob IN ('Manager', 'Analyste');

-- g : liste des employés qui ne sont ni "Manager", ni "Analyste"
SELECT *
FROM tblEmployes
WHERE EJob NOT IN ('Manager', 'Analyste');

SELECT *
FROM tblEmployes
WHERE NOT EJob IN ('Manager', 'Analyste');

-- h : liste des employés qui n'ont pas droit à une commission (commission nulle)
SELECT *
FROM tblEmployes
WHERE ECom IS NULL;

-- i : liste des employés qui ont droit à une commission
SELECT *
FROM tblEmployes
WHERE ECom > 0;

SELECT *
FROM tblEmployes
WHERE ECom IS NOT NULL;

SELECT *
FROM tblEmployes
WHERE NOT ECom IS NULL;