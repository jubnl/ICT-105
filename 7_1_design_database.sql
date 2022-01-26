DROP DATABASE IF EXISTS `Ex7v2`;
CREATE DATABASE IF NOT EXISTS `Ex7v2`;
USE `Ex7v2`;

-- Create Departments table
CREATE TABLE Departments
(
    DepNo  INT         NOT NULL,
    DepNom VARCHAR(25) NOT NULL
);

-- Create Projects table
CREATE TABLE Projects
(
    ProjectNo   INT         NOT NULL,
    ProjectName VARCHAR(25) NOT NULL
);

-- create employees table
CREATE TABLE Employees
(
    EmpNo   INT         NOT NULL,
    EmpName VARCHAR(25) NOT NULL,
    EmpCity VARCHAR(25),
    DepNo   INT         NOT NULL
);

-- create affect table
CREATE TABLE Affect
(
    EmpNo     INT  NOT NULL,
    ProjectNo INT  NOT NULL,
    Duration  REAL NOT NULL
);

/*
    PRIMARY KEYS
*/
ALTER TABLE Departments
    ADD CONSTRAINT PKDepartments PRIMARY KEY (DepNo);
ALTER TABLE Projects
    ADD CONSTRAINT PKProjects PRIMARY KEY (ProjectNo);
ALTER TABLE Employees
    ADD CONSTRAINT PKEmployees PRIMARY KEY (EmpNo);
ALTER TABLE Affect
    ADD CONSTRAINT PKAffect PRIMARY KEY (EmpNo, ProjectNo);

/*
    FOREIGN KEYS
*/
ALTER TABLE Employees
    ADD CONSTRAINT FKEmployeesDepartments FOREIGN KEY (DepNo) REFERENCES Departments (DepNo);
ALTER TABLE Affect
    ADD CONSTRAINT FKAffectEmployees FOREIGN KEY (EmpNo) REFERENCES Employees (EmpNo);
ALTER TABLE Affect
    ADD CONSTRAINT FKAffectProjects FOREIGN KEY (ProjectNo) REFERENCES Projects (ProjectNo);