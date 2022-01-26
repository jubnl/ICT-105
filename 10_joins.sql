-- a) Liste du nom des employés par ordre alphabétique
SELECT EmpName employeeName
FROM Employees
ORDER BY EmpName;

-- b) Nombre de projet
SELECT COUNT(ProjectNo) Amount
FROM Projects;

-- c) Liste des employés (EmpNom) avec le nom de leur département (DepNom)
SELECT E.EmpName employeeName,
       D.DepNom  departmentName
FROM Employees E
         INNER JOIN Departments D ON E.DepNo = D.DepNo;

-- d) Liste des employés (EmpNom) qui travaillent dans le département « Recherche »
SELECT E.EmpName employeeName
FROM Employees E
         INNER JOIN Departments D ON E.DepNo = D.DepNo
WHERE D.DepNom = 'Recherche';

-- e) Liste des employés (EmpNom) avec le nom et la durée des projets sur lesquels ils travaillent (ProjetNom, Durée)
SELECT E.EmpName     employeeName,
       P.ProjectName projectName,
       A.Duration    'duration(%)'
FROM Employees E
         INNER JOIN Affect A ON E.EmpNo = A.EmpNo
         INNER JOIN Projects P ON A.ProjectNo = P.ProjectNo;

/* f) Liste des employés (EmpNom) avec le nom de leur département (DepNom) et avec le nom et la durée des projets sur
      lesquels ils travaillent (ProjetNom, durée)
*/
SELECT E.EmpName     employeeName,
       D.DepNom      departmentName,
       P.ProjectName projectName,
       A.Duration    'duration(%)'
FROM Employees E
         INNER JOIN Departments D ON E.DepNo = D.DepNo
         INNER JOIN Affect A ON E.EmpNo = A.EmpNo
         INNER JOIN Projects P ON A.ProjectNo = P.ProjectNo;
