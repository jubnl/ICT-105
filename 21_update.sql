-- START TRANSACTION;
-- a) augmenter le salaire de tous les employés du département "Vente" de 5 % pour les salaires inférieurs à 3000.-
UPDATE tblEmployes emp
SET emp.Esal = emp.Esal * 1.05
WHERE emp.Esal < 3000
  AND emp.DNo = 30; -- (SELECT dep.Dno FROM tblDepartements dep WHERE DNom = 'Vente');

-- b) augmenter le salaire de tous les employés de 10 % supérieurs ou égaux à 3000
UPDATE tblEmployes emp
SET emp.Esal = ROUND(emp.Esal * 1.1, 2)
WHERE emp.Esal >= 3000;
-- ROLLBACK;

-- c) créer les requêtes permettant de remettre les salaires dans l’état initial
UPDATE tblEmployes emp
SET emp.Esal = ROUND(emp.Esal / 1.1, 2)
WHERE emp.Esal >= 3300;

UPDATE tblEmployes emp
SET emp.Esal = emp.Esal / 1.05
WHERE emp.Esal < 3150
  AND emp.DNo = 30; -- (SELECT dep.Dno FROM tblDepartements dep WHERE DNom = 'Vente');