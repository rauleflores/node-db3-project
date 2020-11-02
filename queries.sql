-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT ProductName, CategoryName
FROM product p LEFT JOIN category c ON p.categoryid = c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT
    o.id as OrderId,
    s.CompanyName as ShippedWith
FROM "order" o LEFT JOIN Shipper s ON s.id = o.shipvia
WHERE o.OrderDate < "2012-9-8"
ORDER BY ShippedWith;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.ProductName, o.Quantity
FROM Product p LEFT JOIN OrderDetail o ON p.id = o.ProductId
WHERE o.OrderId = 10251
ORDER BY ProductName;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT 
    o.id as OrderId,
    c.CompanyName as CustomerCompanyName,
    e.LastName as EmployeeLastName
FROM Order o
LEFT JOIN Customer c ON c.id = o.CustomerId
LEFT JOIN Employee e ON e.id = o.EmployeeId;

-- Stretch Queries --

-- 1 --

SELECT
        CategoryName as "Category",
        COUNT(*) as "Count"
FROM Products p
JOIN Categories c ON c.CategoryId = p.CategoryId
GROUP BY CategoryName;

-- 2 --

SELECT
        OrderId,
        SUM(Quantity) as "ItemCount"
FROM OrderDetails
GROUP BY OrderId;