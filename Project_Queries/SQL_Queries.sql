-- ABC Store Power BI Dashboard
-- SQL Analysis Queries
-- Author: Rebaona Radebe

-- 1. Total Revenue
-- Purpose: Calculates total sales revenue

SELECT 
    SUM(total) AS Revenue
FROM o_ord;

-- 2. Total Orders
-- Purpose: Counts the number of orders

SELECT 
    COUNT(ordid) AS "Total Orders"
FROM o_ord;

-- 3. Customer Count
-- Purpose: Counts the number customers

SELECT COUNT(DISTINCT custid) as “Total Customers”
FROM o_customer;

-- 4. Total Items Sold
-- Purpose: Counts the number of items sold

SELECT SUM(qty) AS “Items Sold”
FROM o_item;


-- 5. Top Products
-- Purpose: Identifies products generating the highest sales

SELECT
    p.prodid,
    p.descrip,
    SUM(i.qty * i.actualprice) AS "Total Sales"
FROM o_product p
INNER JOIN o_item i
ON p.prodid = i.prodid
GROUP BY p.prodid, p.descrip
ORDER BY "Total Sales" DESC;

-- 6. Customer Analysis
-- Purpose: Shows customers ranked by number of orders and spending

SELECT 
    c.custid,
    c.name,
    COUNT(o.ordid) AS Total_Orders,
    SUM(o.total) AS Total_Amount
FROM o_customer c
INNER JOIN o_ord o
ON c.custid = o.custid
GROUP BY c.custid, c.name
ORDER BY Total_Amount DESC;

-- 7. Employee Department Analysis
-- Purpose: Shows employee distribution by department

SELECT
    d.deptno, d.dname,
    COUNT(e.empno) AS Employee_Count
FROM o_dept d
INNER JOIN o_emp e
ON d.deptno = e.deptno
GROUP BY d.deptno, d.dname;

-- 8. Product Price Analysis
-- Purpose: Compares Standard Price and Minimum Price

SELECT
    prodid,
    AVG(stdprice) AS Average_Standard_Price,
    AVG(minprice) AS Average_Minimum_Price
FROM o_price
GROUP BY prodid
ORDER BY prodid;
