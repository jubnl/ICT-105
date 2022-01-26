DROP DATABASE IF EXISTS `Ex7`;
CREATE DATABASE IF NOT EXISTS `Ex7`;
USE `Ex7`;

CREATE TABLE `Employees` (
	`EmpNo` INT NOT NULL,
	`EmpName` varchar(25) NOT NULL UNIQUE,
	`City` varchar(25) NOT NULL,
	`DepartmentNo` INT NOT NULL,
	PRIMARY KEY (`EmpNo`)
);

CREATE TABLE `Projects` (
	`ProjectNo` INT NOT NULL,
	`ProjectName` varchar(25) NOT NULL,
	PRIMARY KEY (`ProjectNo`)
);

CREATE TABLE `WorkingOn` (
	`EmpNo` INT NOT NULL,
	`ProjectNo` INT NOT NULL,
	`Duration` REAL NOT NULL,
	PRIMARY KEY (`EmpNo`, `ProjectNo`)
);

CREATE TABLE `Departments` (
	`DepNo` INT NOT NULL,
	`DepName` varchar(25) NOT NULL,
	PRIMARY KEY (`DepNo`)
);

ALTER TABLE `Employees` ADD CONSTRAINT `Employees_fk0` FOREIGN KEY (`DepartmentNo`) REFERENCES `Departments`(`DepNo`);

ALTER TABLE `WorkingOn` ADD CONSTRAINT `WorkingOn_fk0` FOREIGN KEY (`EmpNo`) REFERENCES `Employees`(`EmpNo`);

ALTER TABLE `WorkingOn` ADD CONSTRAINT `WorkingOn_fk1` FOREIGN KEY (`ProjectNo`) REFERENCES `Projects`(`ProjectNo`);