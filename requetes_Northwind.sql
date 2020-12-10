--1--

SELECT CompanyName AS "Société", ContactName AS "Contact", ContactTitle AS "Fonction", Phone AS "Téléphone"
FROM CUSTOMERS
WHERE Country = "France"

--2--

SELECT ProductName AS "Produit", UnitPrice AS "Prix"
FROM Products
JOIN Suppliers
ON Suppliers.SupplierID = Products.SupplierID
WHERE CompanyName = "Exotic Liquids"

--3--

SELECT CompanyName AS "Fournisseur", COUNT(ProductID) AS "Nbre produits"
FROM Suppliers
JOIN Products
ON Products.SupplierID = Suppliers.SupplierID
WHERE country = "France"
GROUP BY CompanyName
ORDER BY COUNT(ProductID) DESC


--4--

SELECT CompanyName AS "Client", COUNT(OrderID) AS "Nbre Commandes"
FROM Customers 
JOIN Orders
ON orders.CustomerID = Customers.CustomerID
WHERE  Country = "France "
GROUP BY CompanyName
HAVING COUNT(OrderID) > 10

--5--

SELECT CompanyName AS "Client", SUM(UnitPrice*Quantity) AS "CA", ANY_VALUE(Country) AS "Pays"
FROM `order details`
JOIN orders
ON orders.OrderID = `order details`.OrderID
JOIN Customers
ON Customers.CustomerID = Orders.CustomerID
GROUP BY 
CompanyName 
HAVING SUM(UnitPrice*Quantity) > 30000
ORDER BY SUM(UnitPrice*Quantity) DESC

--6--

SELECT DISTINCT Customers.Country AS "Pays"
FROM Customers
JOIN Orders
ON Orders.CustomerID = Customers.CustomerID
JOIN `order details`
ON `order details`.OrderID = Orders.OrderID
JOIN Products
ON Products.ProductID = `order details`.ProductID
JOIN Suppliers
ON Suppliers.SupplierID = Products.SupplierID
WHERE Suppliers.CompanyName = "Exotic Liquids"
ORDER BY Customers.Country ASC

--7--

SELECT SUM(UnitPrice*QUANTITY) AS "Montant des ventes 1997"
FROM `order details`
JOIN Orders
ON Orders.OrderID = `order details`.OrderID
WHERE YEAR(OrderDate) = "1997"

--8--

SELECT MONTH(OrderDate) AS "Mois 97", SUM(UnitPrice*QUANTITY) AS "Montants ventes"
FROM `order details`
JOIN Orders
ON Orders.OrderID = `order details`.OrderID
WHERE YEAR(OrderDate) = "1997"
GROUP BY MONTH(OrderDate)

--9--

SELECT MAX(OrderDate) AS "Date dernière commande"
FROM Orders
JOIN Customers
ON Customers.CustomerID = Orders.customerID
WHERE CompanyName = "Du monde entier"

--10--

SELECT ROUND(AVG(DATEDIFF(ShippedDate, OrderDate))) AS "Délai moyen de livraison en jours"
FROM Orders