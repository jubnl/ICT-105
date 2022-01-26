USE Ex7v2;

INSERT INTO Departments(DepNo, DepNom)
VALUES (1, 'Recherche'),
       (2, 'Vente');

INSERT INTO Projects(ProjectNo, ProjectName)
VALUES (11, 'A'),
       (12, 'B'),
       (13, 'C');

INSERT INTO Employees(EmpNo, EmpName, EmpCity, DepNo)
VALUES (101, 'Jean', 'Lausanne', 1),
       (102, 'Paul', 'Genève', 2),
       (103, 'Anne', 'Fribourg', 2);

INSERT INTO Affect(EmpNo, ProjectNo, Duration)
VALUES (101, 11, 60),
       (101, 12, 40),
       (102, 13, 100),
       (103, 12, 30),
       (103, 13, 30);