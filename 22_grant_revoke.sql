/*
 Création d’un nouvel utilisateur ‘Stagiaire’ avec comme mot de
passe sta456
 Ce nouvel utilisateur aura accès en lecture/écriture/Modification
à la table des départements
 Accès en lecture à la table des employés
 Vérifier les droits sur les tables
*/

CREATE USER IF NOT EXISTS 'Stagiaire'@'%' IDENTIFIED BY 'sta456';

GRANT SELECT, INSERT, UPDATE, DELETE ON `tblDepartements` TO 'Stagiaire';

GRANT SELECT ON `tblEmployes` TO 'Stagiaire';

REVOKE SELECT ON `tblEmployes` TO 'Stagiaire';

DROP USER IF EXISTS 'Stagiaire'@'%';

SELECT User FROM mysql.user;

SHOW GRANTS FOR 'Stagiaire';