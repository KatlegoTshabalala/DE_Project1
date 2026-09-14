---Query 1- Every order joined to customer name, product name, category, and a calculated line_revenue (quantity times unit_price)
SELECT 
    O.ORDER_ID,
    O.QUANTITY,
    c.CUSTOMER_NAME,
    p.PRODUCT_NAME,
    p.CATEGORY,
FROM ORDERS o
INNER JOIN CUSTOMERS c ON o.customer_id = c.CUSTOMER_ID
INNER JOIN PRODUCTS p ON o.product_id = p.PRODUCT_ID;

---Query 2 - Total revenue per customer.

SELECT
    o.ORDER_ID,
    c.CUSTOMER_NAME,
SUM(o.QUANTITY * p.UNIT_PRICE) AS LINE_REVENUE
FROM ORDERS o
INNER JOIN CUSTOMERS c ON o.CUSTOMER_ID = c.customer_id
INNER JOIN PRODUCTS p ON o.product_id = p.product_id
GROUP BY o.order_id, c.customer_name;

---Query 3 - Total revenue per product category

select 
    p.category,
    SUM(o.QUANTITY*p.UNIT_PRICE) AS LINE_REVENUE
from PRODUCTS p
INNER JOIN ORDERS o ON p.PRODUCT_ID = o.product_id
GROUP BY p.category
ORDER BY p.category

---Query 4 -- Top 5 Customers by total spend

select c.CUSTOMER_ID,
    c.CUSTOMER_NAME,
    sum(o.quantity*UNIT_PRICE) AS LINE_REVENUE
FROM CUSTOMERS c
INNER JOIN ORDERS o ON c.customer_id = o.customer_id
INNER JOIN PRODUCTS p ON o.product_id = p.product_id
GROUP BY c.customer_name, c.customer_id
LIMIT 5

