-- a) Liste des clients de 1997 (nom et adresse)
SELECT DISTINCT cust.CompanyName
FROM customers cust
         INNER JOIN orders ord on cust.CustomerID = ord.CustomerID
WHERE YEAR(ord.OrderDate) = 1997;

/*
b) Liste des bons clients de 1996 (chiffre d’affaire supérieur à 15'000.- ; Pour le chiffre d’affaire tenir compte de
la quantité * prix unitaire)
*/
SELECT cust.ContactName, SUM(ordDet.Quantity * ordDet.UnitPrice) ChiffreDAffaire, ord.OrderDate
FROM customers cust
         RIGHT JOIN orders ord on cust.CustomerID = ord.CustomerID
         LEFT JOIN orderdetails ordDet on ord.OrderID = ordDet.OrderID
WHERE YEAR(ord.OrderDate) = 1996
GROUP BY cust.CustomerID
HAVING ChiffreDAffaire > 15000;

/*
c) Liste des meilleurs produits de 1998 (produits commandés en 1998, avec la quantité commandés ; trié de la
plus grande quantité vers la plus petite)
*/
SELECT prod.ProductName, SUM(ordDet.Quantity) 'productQuantity'
FROM products prod
         RIGHT JOIN orderdetails ordDet on prod.ProductID = ordDet.ProductID
         LEFT JOIN orders ord on ordDet.OrderID = ord.OrderID
WHERE YEAR(ord.OrderDate) = 1998
GROUP BY prod.ProductID
ORDER BY productQuantity DESC;

-- d) Quel est notre plus grand fournisseur en termes de quantité vendue ?
SELECT sup.CompanyName, SUM(ordDet.Quantity) productQuantity
FROM suppliers sup
         LEFT JOIN products prod on sup.SupplierID = prod.SupplierID
         LEFT JOIN orderdetails ordDet on prod.ProductID = ordDet.ProductID
GROUP BY sup.SupplierID
ORDER BY productQuantity DESC
LIMIT 1;

-- e) Quelle est le montant moyen des factures de 1997 ?
SELECT ROUND(AVG(ordDet.Quantity * ordDet.UnitPrice), 2) AvgInvoice
FROM orders ord
         RIGHT JOIN orderdetails ordDet on ord.OrderID = ordDet.OrderID
WHERE YEAR(ord.OrderDate) = 1997;

/*
f) Qui est notre meilleur client en termes de chiffre d’affaire? (Pour le chiffre d’affaire tenir compte de la quantité
* prix unitaire)
*/
SELECT cust.CompanyName, ROUND(SUM(ordDet.Quantity * ordDet.UnitPrice), 2) ChiffreDAffaire
FROM customers cust
         LEFT JOIN orders ord on cust.CustomerID = ord.CustomerID
         LEFT JOIN orderdetails ordDet on ord.OrderID = ordDet.OrderID
GROUP BY cust.CustomerID
ORDER BY ChiffreDAffaire DESC
LIMIT 1;

-- g) Qui est notre meilleur client étranger en termes de chiffre d’affaire ? (pays différent de Suisse)
SELECT cust.CompanyName, ROUND(SUM(ordDet.Quantity * ordDet.UnitPrice), 2) ChiffreDAffaire
FROM customers cust
         LEFT JOIN orders ord on cust.CustomerID = ord.CustomerID
         LEFT JOIN orderdetails ordDet on ord.OrderID = ordDet.OrderID
WHERE cust.Country != 'switzerland'
GROUP BY cust.CustomerID
ORDER BY ChiffreDAffaire DESC
LIMIT 1;

-- h) Quelles sont les régions de nos clients qui nous ont passés des commandes en 1998 ?
SELECT DISTINCT cust.Region
FROM customers cust
         INNER JOIN orders ord on cust.CustomerID = ord.CustomerID
WHERE YEAR(ord.OrderDate) = 1998
  AND cust.Region IS NOT NULL;

-- i) Quelles sont les provenances (pays du fournisseur) de nos produits commandés par nos clients en 1996 ?
SELECT DISTINCT sup.Country
FROM suppliers sup
         INNER JOIN products prod on sup.SupplierID = prod.SupplierID
         INNER JOIN orderdetails ordDet on prod.ProductID = ordDet.ProductID
         INNER JOIN orders ord on ordDet.OrderID = ord.OrderID
WHERE YEAR(ord.OrderDate) = 1996;


-- j) Quelle est la moyenne mensuelle de nos commandes en 1996 ?
SELECT ord.OrderDate, AVG(ordDet.Quantity * ordDet.UnitPrice) avgMonthlyInvoice
FROM orders ord
         INNER JOIN orderdetails ordDet on ord.OrderID = ordDet.OrderID
WHERE YEAR(ord.OrderDate) = 1996
GROUP BY MONTH(ord.OrderDate)
ORDER BY MONTH(ord.OrderDate);

/*
k) Pour la mise à jour du site web nous avons besoin de la liste des catégories de produits commandés en 1997
et n’ayant pas d’image ?
*/
SELECT DISTINCT cat.CategoryName
FROM categories cat
         LEFT JOIN products prod on cat.CategoryID = prod.CategoryID
         LEFT JOIN orderdetails ordDet on prod.ProductID = ordDet.ProductID
         LEFT JOIN orders ord on ord.OrderID = ordDet.OrderID
WHERE YEAR(ord.OrderDate) = 1997
  AND cat.Picture IS NULL;

/*
l) Pour la vente nous avons besoin de la liste des produits qui ont été commandé en entre le 01.07.1997 et le
31.12.1997 ?
*/
SELECT DISTINCT prod.*
FROM products prod
         INNER JOIN orderdetails ordDet on prod.ProductID = ordDet.ProductID
         INNER JOIN orders ord on ord.OrderID = ordDet.OrderID
WHERE ord.OrderDate BETWEEN '19970701' AND '19971231';

-- m) Quel est le nombre de nos clients de 1997 ?
SELECT COUNT(DISTINCT cust.CustomerID)
FROM customers cust
         LEFT JOIN orders o on cust.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = 1997;

-- n) Quel est le pays qui nous achète le plus de marchandise en termes de quantité ?
SELECT DISTINCT cust.Country, SUM(ordDet.Quantity) productQuantity
FROM customers cust
         INNER JOIN orders ord on cust.CustomerID = ord.CustomerID
         INNER JOIN orderdetails ordDet on ord.OrderID = ordDet.OrderID
GROUP BY cust.Country
ORDER BY productQuantity DESC
LIMIT 1;

-- o) Proposer une liste du nombre de commande et du chiffre d’affaire de 1996 par localité de nos clients
SELECT cust.CompanyName,
       cust.Country,
       COUNT(DISTINCT ord.OrderID)                       ordersAmount,
       ROUND(SUM(ordDet.Quantity * ordDet.UnitPrice), 2) ChiffreDAffaire
FROM orders ord
         LEFT JOIN orderdetails ordDet on ord.OrderID = ordDet.OrderID
         LEFT JOIN customers cust on cust.CustomerID = ord.CustomerID
WHERE YEAR(ord.OrderDate) = 1996
GROUP BY cust.City
ORDER BY ordersAmount DESC, ChiffreDAffaire DESC;

-- p) Proposer la liste des pays de provenance par produits en stock
SELECT DISTINCT sup.Country
FROM suppliers sup
         INNER JOIN products prod on sup.SupplierID = prod.SupplierID
WHERE prod.UnitsInStock > 0;

-- q) Quelle est la moyenne du nombre d’articles achetés pour les commandes de 1997 ?
SELECT AVG(ordDet.Quantity) avgBuyedProduct
FROM orderdetails ordDet
         LEFT JOIN orders ord on ord.OrderID = ordDet.OrderID
WHERE YEAR(ord.OrderDate) = 1997;

/*
r) Ajouter le client suivant :
o Entreprise = Docteur Gab’s
o Contact = Brasseur
o Titre = Monsieur
o Adresse = Ch de Geffry 7 , CH-1073 Savigny
o Tél : +41 21 781 30 90
*/
INSERT INTO customers(CustomerID, CompanyName, ContactName, ContactTitle, Address, City, PostalCode, Country, Phone)
VALUES ('DOCGA', 'Docteur Gab''s', 'Brasseur', 'Monsieur', 'Ch de Geffry 7', 'Savigny', 'CH-1073', 'Switzerland',
        '+41 21 781 30 90');

-- s) Supprimer toutes les commandes de 1996
-- drop fk, then create a new one with on delete cascade constraint
ALTER TABLE orderdetails
    DROP FOREIGN KEY FK_Order_Details_Orders;
ALTER TABLE orderdetails
    ADD FOREIGN KEY (OrderID) REFERENCES orders (OrderID) ON DELETE CASCADE;
DELETE
FROM orders
WHERE YEAR(OrderDate) = 1996;

-- disable key check during delete. /!\ it does not delete order details
ALTER TABLE `orderdetails`
    DISABLE KEYS;
DELETE
FROM orders
WHERE YEAR(OrderDate) = 1996;
ALTER TABLE `orderdetails`
    ENABLE KEYS;

-- delete order details 1st, then delete orders
DELETE
FROM orderdetails ordDet
WHERE ordDet.OrderID IN (
    SELECT ord.OrderID
    FROM orders ord
    WHERE YEAR(ord.OrderDate) = 1996
);
DELETE
FROM orders ord
WHERE YEAR(ord.OrderDate) = 1996;
