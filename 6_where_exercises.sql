/* a : liste des employés du département N° 30 qui gagne plus de 1500 qui ne sont pas ouvrier ou pas vendeur et qui ont
   été engagé avant le 01.01.2000
 */
SELECT *
FROM tblEmployes
WHERE DNo = 30
  AND Esal > 1500
  AND EJob != 'Ouvrier'
  AND EJob != 'Vendeur'
  AND EDebut < DATE('2000-01-01');

/* b : liste des employés qui touchent moins de 1500 ou plus de 2000 (salaire et commission) et qui sont analyste ou
   vendeur et qui ont un chef.
 */
SELECT *
FROM `tblEmployes`
WHERE (Esal + COALESCE(ECom, 0)) NOT BETWEEN 1500 AND 2000
  AND EJob IN ('Analyste', 'Vendeur')
  AND EChef IS NOT NULL;

/* c : Liste des employés triés par nom qui ont droit à une commission (en tenant compte des commissions à zéro) dont
   le nom ne comprend pas la lettre « z » et dont le job commence par un « o »
 */
SELECT *
FROM tblEmployes
WHERE NOT ISNULL(ECom)
  AND ENom NOT LIKE '%z%'
  AND EJob NOT LIKE 'o%'
ORDER BY ENom;

/* d : Liste des employés qui auraient droit à une augmentation de salaire de 10% si leur futur salaire serait compris
   entre 2000 et 3000
 */
SELECT *
FROM tblEmployes
WHERE (Esal + COALESCE(ECom, 0)) * 1.1 BETWEEN 2000 and 3000;

-- e : Liste des employés engagés en 1997 en tant que « ouvrier » ou « manager » avec un salaire plus petit que 1500
SELECT *
FROM tblEmployes
WHERE YEAR(EDebut) = '1997'
  AND EJob IN ('Ouvrier', 'Manager')
  AND Esal < 1500;

/* f : Liste des ouvriers avec leur année d’ancienneté du plus ancien vers le plus récent. Ancienneté = nombre d’année
   de travail du collaborateur dans l’entreprise
 */
SELECT *, TIMESTAMPDIFF(year, EDebut, NOW()) AS 'Anciennete'
FROM tblEmployes
WHERE EJob = 'Ouvrier'
ORDER BY EDebut;
