
/* 
Name: Yashwant Bist
Id:T100169692
Date:2025-02-10
Purpose: Multi-row functions
*/

/*-- Q1: Create a query to determine the average and the total sales in the database. Named the
columns “Total” and “Total average per sale” */
// Q1 SOLUTION
SELECT 
    SUM(lab2_sale_price) AS "Total", 
    AVG(lab2_sale_price) AS "Total average per sale"
FROM 
    lab2_sale;
    
    
    
/*Q2: Repeat the same as the previous questions but add another column named “Email
domain” that represents the domain of the email of the user (google.com, icloud.com,
outlook.com, etc). Calculate the total sales and the average value per sale per each email
domain*/
//Q2 Solution

SELECT 
    SUBSTR(email, INSTR(email, '@') + 1) AS "Email domain", 
    SUM(lab2_sale_price) AS "Total", 
    AVG(lab2_sale_price) AS "Total average per sale"
FROM 
    lab2_sale
JOIN 
    lab2_customer ON lab2_sale.lab2_customer_id = lab2_customer.id
GROUP BY 
    SUBSTR(email, INSTR(email, '@') + 1);

/*- Q3: Create a query that returns the name of the month a sale took place, the number of
sales for each of those months, plus the average sale amount per month*/
//Q2 Solution
SELECT 
    TO_CHAR(lab2_sale_date, 'Month') AS "Month", 
    COUNT(*) AS "Number of sales", 
    AVG(lab2_sale_price) AS "Average sale amount"
FROM 
    lab2_sale
GROUP BY 
    TO_CHAR(lab2_sale_date, 'Month');



/* - Q4: Create a query to calculate the minimum, maximum and total sales per user. Display the
user name in one column and named it “fullname”, the user_id, the minimum, maximum and
total sales per user*/
//Q2 Solution

SELECT 
    (name || ' ' || last_name) AS "fullname",
    lab2_customer.id AS "user_id",
    MIN(lab2_sale_price) AS "Minimum Sale",
    MAX(lab2_sale_price) AS "Maximum Sale",
    SUM(lab2_sale_price) AS "Total Sales"
FROM 
    lab2_customer
JOIN 
    lab2_sale ON lab2_customer.id = lab2_sale.lab2_customer_id
GROUP BY 
    lab2_customer.id, name, last_name;




/* - Q5: Create a query that lists every sale ID, sale date and total price plus tax. Assume a ta rate
of 13 percent.*/
//Q2 Solution

SELECT 
    id , 
    lab2_sale_date , 
    lab2_sale_price * 1.13 AS "Total price plus tax"
FROM 
    lab2_sale;







