/* =========================================
   NORTHWIND - SQL PRACTICE
   Author: Bahar Amoohashemi
   ========================================= */


/* =========================================
   BASIC SELECT & WHERE
   ========================================= */

-- 1. نمایش همه مشتریان
SELECT *
FROM Customers;

-- 2. نمایش نام و شهر مشتریان
SELECT CompanyName, City
FROM Customers;

-- 3. مشتریان شهر London
SELECT *
FROM Customers
WHERE City = 'London';

-- 4. مشتریانی که کشورشان Germany است
SELECT CompanyName, Country
FROM Customers
WHERE Country = 'Germany';

-- 5. مرتب‌سازی مشتریان بر اساس نام
SELECT CompanyName
FROM Customers
ORDER BY CompanyName;


/* =========================================
   DISTINCT & ORDER BY
   ========================================= */

-- 6. نمایش کشورهای غیرتکراری
SELECT DISTINCT Country
FROM Customers;

-- 7. مرتب‌سازی محصولات بر اساس قیمت نزولی
SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;


/* =========================================
   AGGREGATE FUNCTIONS
   ========================================= */

-- 8. تعداد کل محصولات
SELECT COUNT(*) AS TotalProducts
FROM Products;

-- 9. میانگین قیمت محصولات
SELECT AVG(UnitPrice) AS AvgPrice
FROM Products;

-- 10. بیشترین و کمترین قیمت
SELECT 
    MAX(UnitPrice) AS MaxPrice,
    MIN(UnitPrice) AS MinPrice
FROM Products;


/* =========================================
   GROUP BY & HAVING
   ========================================= */

-- 11. تعداد محصولات در هر دسته‌بندی
SELECT CategoryID,
       COUNT(ProductID) AS TotalProducts
FROM Products
GROUP BY CategoryID;

-- 12. دسته‌بندی‌هایی که بیش از 5 محصول دارند
SELECT CategoryID,
       COUNT(ProductID) AS TotalProducts
FROM Products
GROUP BY CategoryID
HAVING COUNT(ProductID) > 5;


/* =========================================
   BONUS - ANALYTICAL STYLE
   ========================================= */

-- 13. تعداد سفارش‌ها در هر کشور
SELECT ShipCountry,
       COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY ShipCountry;

-- 14. 5 محصول گران‌تر
SELECT TOP 5 ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;
