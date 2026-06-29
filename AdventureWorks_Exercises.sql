/* =========================================
   ADVENTUREWORKS - SQL PRACTICE
   Author: Bahar Amoohashemi
   ========================================= */


/* =========================================
   BASIC SELECT
   ========================================= */

-- 1. نمایش نام و رنگ محصولات
SELECT Name, Color
FROM Production.Product;


-- 2. نمایش محصولاتی که رنگ آنها Black است
SELECT Name, Color
FROM Production.Product
WHERE Color = 'Black';


/* =========================================
   DISTINCT
   ========================================= */

-- 3. نمایش رنگ‌های موجود (بدون تکرار)
SELECT DISTINCT Color
FROM Production.Product;


/* =========================================
   GROUP BY
   ========================================= */

-- 4. تعداد محصولات در هر رنگ
SELECT Color,
       COUNT(ProductID) AS TotalProducts
FROM Production.Product
GROUP BY Color;


/* =========================================
   HAVING
   ========================================= */

-- 5. رنگ‌هایی که بیش از 10 محصول دارند
SELECT Color,
       COUNT(ProductID) AS TotalProducts
FROM Production.Product
GROUP BY Color
HAVING COUNT(ProductID) > 10;


/* =========================================
   AGGREGATE FUNCTIONS
   ========================================= */

-- 6. کمترین، بیشترین و میانگین قیمت
SELECT 
       MIN(ListPrice) AS MinPrice,
       MAX(ListPrice) AS MaxPrice,
       AVG(ListPrice) AS AvgPrice
FROM Production.Product;


/* =========================================
   THREE VALUED LOGIC
   ========================================= */

-- 7. محصولاتی که رنگ ندارند
SELECT Name, Color
FROM Production.Product
WHERE Color IS NULL;


-- 8. محصولاتی که رنگ دارند
SELECT Name, Color
FROM Production.Product
WHERE Color IS NOT NULL;


/* =========================================
   TOP
   ========================================= */

-- 9. 5 محصول گران‌تر
SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;


-- 10. 5 محصول ارزان‌تر
SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice ASC;


/* =========================================
   OFFSET / FETCH
   ========================================= */

-- 11. رد کردن 10 محصول اول و نمایش 10 محصول بعدی
SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;


/* =========================================
   CASE
   ========================================= */

-- 12. دسته‌بندی قیمت محصولات
SELECT Name,
       ListPrice,
       CASE
           WHEN ListPrice < 100 THEN 'Cheap'
           WHEN ListPrice BETWEEN 100 AND 1000 THEN 'Mid'
           ELSE 'Expensive'
       END AS PriceCategory
FROM Production.Product;


/* =========================================
   CASE + GROUP BY
   ========================================= */

-- 13. تعداد محصولات در هر دسته قیمت
SELECT 
       CASE
           WHEN ListPrice < 100 THEN 'Cheap'
           WHEN ListPrice BETWEEN 100 AND 1000 THEN 'Mid'
           ELSE 'Expensive'
       END AS PriceCategory,
       COUNT(*) AS TotalProducts
FROM Production.Product
GROUP BY
       CASE
           WHEN ListPrice < 100 THEN 'Cheap'
           WHEN ListPrice BETWEEN 100 AND 1000 THEN 'Mid'
           ELSE 'Expensive'
       END;


/* =========================================
   CASE + ORDER BY
   ========================================= */

-- 14. مرتب‌سازی بر اساس دسته قیمت
SELECT Name,
       ListPrice,
       CASE
           WHEN ListPrice < 100 THEN 3
           WHEN ListPrice BETWEEN 100 AND 1000 THEN 2
           ELSE 1
       END AS PriceRank
FROM Production.Product
ORDER BY PriceRank;
