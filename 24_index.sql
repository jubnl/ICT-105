/*
1. On souhaite avoir la « Liste des jobs dans la table des employés
qui existent dans la table des employés archives ».
o Faire la requête et l’exécuter
o Contrôler le plan d’exécution
o Créer les index si nécessaires
o Vérifier le nouveau plan d’exécution
*/
ANALYZE
SELECT DISTINCT emp.EJob
FROM tblEmployes emp
         INNER JOIN tblEmployesArchives tEA on emp.EJob = tEA.EJob;

SHOW PROCESSLIST;