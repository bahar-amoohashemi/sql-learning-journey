/*
  File: AdventureWorks_StringFunctions.sql
  Author: Bahar Amoohashemi
  Purpose: Practicing SQL String Functions (LEN, UPPER, LEFT, LIKE, etc.)
  Description: Exercises covering string manipulation on AdventureWorks tables.
*/

--1.  NAME نام همه محصولات را نمایش بده،و در ستون دوم تعداد کاراکترهای هر

SELECT Name, LEN(Name) AS Namelength
FROM [Production].[Product]
  
--2نام همه محصولات را به حروف بزرگ نمایش بده.
  
SELECT Name , UPPER (Name) as PU
FROM [Production].[Product]

--3.  نام همه محصولات را به حروف کوچک نمایش بده

SELECT Name , LOWER (Name) as PL
FROM [Production].[Product]

--4.[:Name + ' - ' + ProductNumber]:برای هر محصول، یک ستون جدید بساز که این‌طور باشد
  
SELECT Name , CONCAT (Name, '_',[ProductNumber]) as FULLINFO
FROM Production.Product

  --5.فقط 3 حرف اول نام هر محصول را نمایش بده

SELECT Name , LEFT ([Name],3) AS FIRSTTHREE
FROM Production.Product

--6.فقط 4 حرف آخر نام هر محصول را نمایش بده
  
SELECT Name , RIGHT ([Name],4) AS LASTFOUR
FROM Production.Product

--7. کاراکتر اول را جدا کن و نمایش بده(5) [ProductNumber]از ستون 
  
SELECT [ProductNumber] , LEFT (ProductNumber,5) AS PN5
FROM Production.Product

--8.محصولاتی را نمایش بده که در نام آن‌ها کلمه‌ی [ROAD] وجود دارد
  
SELECT Name 
FROM Production.Product
WHERE Name LIKE '%Road%'

--9.محصولاتی را نمایش بده که نام آن‌ها با حرف B شروع می‌شود.
  
SELECT Name 
FROM Production.Product
WHERE Name LIKE 'B%'

--10. محصولاتی را نمایش بده که نام آن‌ها با 'er' تمام می‌شود
  
SELECT Name 
FROM Production.Product
WHERE Name LIKE '%er'

--11.اگر طول نام بیشتر از 10 کاراکتر بود → Long Name
  --در غیر این صورت → Short Name

SELECT Name ,
CASE WHEN LEN(Name) > 10 THEN 'LongName'
     ELSE 'ShortName'
     END AS Namelength
FROM Production.Product

--12.یک ستون جدید بساز به نام CleanName که فقط 10 کاراکتر اول نام محصول را نمایش بده 
  
SELECT Name, LEFT (Name, 10) as CleanName
FROM Production.Product
  
--13.Product: [Name] | Code: [ProductNumber]
  
SELECT CONCAT ('Product:',[Name],'|', 'Code:',[ProductNumber]) as ProductInfo
FROM Production.Product

--14.محصولاتی را نمایش بده که طول نامشان بین 10 تا 20 کاراکتر باشد
  
SELECT Name,
       LEN (Name) AS NameLength 
FROM Production.Product
WHERE  LEN(Name) BETWEEN 10 AND 20

--15./* Exercise: Show Name, name length, first 3 letters, and last 3 letters.Sort the result by name length in descending order.*/
  
SELECT Name,
       LEN(Name) AS LengthName,
       LEFT(Name,3)AS LeftName,
       RIGHT(Name,3)AS RightName
FROM Production.Product  
ORDER BY LEN(Name) DESC

/* ---------------------------------------------------- */
/*           NEW EXERCISES / UPDATES                    */
/* ---------------------------------------------------- */


/* Exercise 1: Select products with list price greater than 50 */
SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice > 50;

/* Exercise 2: Select products ordered by list price descending */
SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

/* Exercise 3: Select products with list price > 50, ordered by list price descending */
SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice > 50
ORDER BY ListPrice DESC;

/* Exercise 4: Categorize products as 'expensive' or 'cheap' using CASE */
SELECT Name, ListPrice,
       CASE WHEN ListPrice > 1000 THEN 'expensive'
       ELSE 'cheap'
       END AS PriceRange
FROM Production.Product;

/* Exercise 5: Categorize products into 'expensive', 'normal', and 'cheap' using CASE */
SELECT Name, ListPrice,
       CASE WHEN ListPrice > 1000 THEN 'expensive'
            WHEN ListPrice BETWEEN 100 AND 1000 THEN 'normal'
            ELSE 'cheap'
       END AS PriceRange
FROM Production.Product
ORDER BY ListPrice DESC;

/* 
  Exercise 6: Find products with name length exactly 10 
*/
SELECT 
   Name, 
   LEN(Name) AS NameLength
FROM Production.Product
WHERE LEN(Name) = 10;

/* 
  Exercise 7: Find products starting with 'S', sorted descending
*/
SELECT 
     Name
FROM Production.Product
WHERE Name LIKE 'S%'
ORDER BY Name DESC;

/* 
  Exercise 8: Products starting with 'S' and Price < 100
  (Verified by debugging: No products found > 100, so adjusted to < 100)
*/
SELECT 
     Name, 
     ListPrice, 
     LEN(Name) AS NameLength
FROM Production.Product
WHERE ListPrice < 100 AND Name LIKE 'S%'
ORDER BY LEN(Name) DESC;
