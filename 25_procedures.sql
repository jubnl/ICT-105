DROP PROCEDURE IF EXISTS SelectEmpListByDep;
CREATE PROCEDURE SelectEmpListByDep(
    IN DepName VARCHAR(50)
)
BEGIN
    SELECT ENom, Esal, EDebut
    FROM tblEmployes emp
             JOIN tblDepartements dep on dep.DNo = emp.DNo
    WHERE dep.DNom = DepName;
END;

CALL SelectEmpListByDep('Recherche');
CALL SelectEmpListByDep('Vente');