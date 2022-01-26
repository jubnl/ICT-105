-- a : nom, salaire, augmentation (nouvelle colonne calculée représentant 10% du salaire), nouveau salaire (salaire actuel + augmentation
SELECT ENom                emplyeeName,
       Esal                salary,
       Esal * 0.1          raise,
       Esal + (Esal * 0.1) newSalary
FROM tblEmployes;

-- b : nom, salaire, montant d’une augmentation du salaire de 1.27%, salaire augmenté
SELECT ENom                             emplyeeName,
       Esal                             salary,
       ROUND(Esal * 0.0127, 2)          raise,
       ROUND(Esal + (Esal * 0.0127), 2) newSalary
FROM tblEmployes;

-- c : nom, salaire, salaire, salaire annuel sur 12 mois (salaire * 12), salaire annuel sur 13 mois (salaire * 13)
SELECT ENom      emplyeeName,
       Esal      salary,
       Esal * 12 'Annual salary (12 months)',
       Esal * 13 'Annual salary (13 months)'
FROM tblEmployes;

-- d : moyenne des salaires versés aux employés
SELECT ROUND(AVG(Esal + COALESCE(ECom, 0)), 2) avgSalary
FROM tblEmployes;

-- e : moyenne des salaires versés aux employés ainsi que le nombre de salaire
SELECT COUNT(Esal)                             'salary count',
       ROUND(AVG(Esal + COALESCE(ECom, 0)), 2) 'average salary'
FROM tblEmployes;

-- f : total, moyenne, maximum, minimum des montants versés aux employés
SELECT SUM(Esal + COALESCE(ECom, 0))           total,
       ROUND(AVG(Esal + COALESCE(ECom, 0)), 2) avg,
       MAX(Esal + COALESCE(ECom, 0))           max,
       MIN(Esal + COALESCE(ECom, 0))           min
FROM tblEmployes;

-- g : total des salaires versés aux employés et nombre de salaires versés
SELECT SUM(Esal + COALESCE(ECom, 0)) total,
       COUNT(Esal)                   amount
FROM tblEmployes;

-- h : nombre d’employés recevant une commission >= 0
SELECT COUNT(ECom) employeeAmount
FROM tblEmployes;