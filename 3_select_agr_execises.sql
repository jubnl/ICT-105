-- a : nom, salaire, augmentation (nouvelle colonne calculée représentant 10% du salaire), nouveau salaire (salaire actuel + augmentation
SELECT ENom,
       Esal,
       Esal * 0.1          AS 'Augmentation',
       Esal + (Esal * 0.1) AS 'Nouveau salaire'
FROM tblEmployes;

-- b : nom, salaire, montant d’une augmentation du salaire de 1.27%, salaire augmenté
SELECT ENom,
       Esal,
       ROUND(Esal * 0.0127, 2)          AS 'Augmentation',
       ROUND(Esal + (Esal * 0.0127), 2) AS 'Nouveau salaire'
FROM tblEmployes;

-- c : nom, salaire, salaire, salaire annuel sur 12 mois (salaire * 12), salaire annuel sur 13 mois (salaire * 13)
SELECT ENom,
       Esal,
       Esal * 12 as 'Annual salary (12 months)',
       Esal * 13 as 'Annual salary (13 months)'
FROM tblEmployes;

-- d : moyenne des salaires versés aux employés
SELECT ROUND(AVG(Esal + COALESCE(ECom, 0)), 2) 'average salary'
FROM tblEmployes;

-- e : moyenne des salaires versés aux employés ainsi que le nombre de salaire
SELECT COUNT(Esal)                             'salary count',
       ROUND(AVG(Esal + COALESCE(ECom, 0)), 2) 'average salary'
FROM tblEmployes;

-- f : total, moyenne, maximum, minimum des montants versés aux employés
SELECT SUM(Esal + COALESCE(ECom, 0)),
       ROUND(AVG(Esal + COALESCE(ECom, 0)), 2),
       MAX(Esal + COALESCE(ECom, 0)),
       MIN(Esal + COALESCE(ECom, 0))
FROM tblEmployes;

-- g : total des salaires versés aux employés et nombre de salaires versés
SELECT SUM(Esal + COALESCE(ECom, 0)),
       COUNT(Esal)
FROM tblEmployes;

-- h : nombre d’employés recevant une commission >= 0
SELECT COUNT(ECom)
FROM tblEmployes;