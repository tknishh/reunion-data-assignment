## Problem 2: SQL

With the above data, write SQL queries for the following:

1. Retrieve the top 5 customers who have made the highest average order amounts in the last 6 months. The average order amount should be calculated for each customer, and the result should be sorted in descending order.
2. Retrieve the list of customer whose order value is lower this year as compared to previous year
3. Create a table showing cumulative purchase by a particular customer
4. Retrieve the list of top 5 selling products. Further bifurcate the sales by product variants

## Solution

### 1. Retrieve the top 5 customers who have made the highest average order amounts in the last 6 months. The average order amount should be calculated for each customer, and the result should be sorted in descending order.

```
SELECT Customers.customer_id, Customers.name, AVG(Orders.total_amount) AS average_order_amount
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE Orders.order_date >= DATE('now', '-6 months')
GROUP BY Customers.customer_id, Customers.name
ORDER BY average_order_amount DESC
LIMIT 5;
```

### 2. Retrieve the list of customer whose order value is lower this year as compared to previous year

```
SELECT Customers.customer_id, Customers.name
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE strftime('%Y', Orders.order_date) = strftime('%Y', 'now')
  AND Orders.total_amount < (
    SELECT SUM(total_amount)
    FROM Orders
    WHERE strftime('%Y', order_date) = strftime('%Y', 'now', '-1 year')
      AND Customers.customer_id = Orders.customer_id
  );
```

### 3. Create a table showing cumulative purchase by a particular customer

```
CREATE TABLE CumulativePurchase AS
SELECT Orders.order_id, Orders.customer_id, Orders.order_date, SUM(Orders.total_amount) OVER (PARTITION BY Orders.customer_id ORDER BY Orders.order_date) AS cumulative_purchase
FROM Orders;
```

### 4. Retrieve the list of top 5 selling products. Further bifurcate the sales by product variants

```
SELECT Products.name, SUM(OrderItems.quantity) AS total_quantity
FROM Products
JOIN OrderItems ON Products.product_id = OrderItems.product_id
GROUP BY Products.name
ORDER BY total_quantity DESC
LIMIT 5;
```

To further bifurcate the sales by product variants, we can use the following query:

```
SELECT Products.name, Variants.name, SUM(OrderItems.quantity) AS total_quantity
FROM Products
JOIN OrderItems ON Products.product_id = OrderItems.product_id
JOIN Products AS Variants ON Products.product_id = Variants.parent_product_id
GROUP BY Products.name, Variants.name
ORDER BY total_quantity DESC;
```
