## Problem 1: Data Modelling

Imagine you are designing a database for an e-commerce platform. The database should store information about products, customers, orders, and order items. Each order can contain multiple order items, and each order item is associated with a specific product. Each customer can have multiple orders. Customer details such as shipping address, contact number etc. can change over time. We want to retain the historical information as well in our schema.

1. Design a **star-schema / snowflake schema model** for the above requirements
    1. Use an entity-relationship diagram (ERD) that represents the relationships between these entities
    2. Include the necessary attributes and primary/foreign key relationships. Briefly explain your design choices.
2. Generate and insert sample data in the above model. Include the process and code of generating random data in your submission. You data should have:
    1. At least 2 years of order history
    2. At least 10 products; at least 2 products with variants.
    3. At least 10 customers
  



## Solution

### 1. Data model

![DataModel](DataModel.png)

**Explanation:**
- The main entities in the schema are Customers, Orders, Order Items, and Products.
- Customers have a one-to-many relationship with Orders since each customer can have multiple orders.
- Orders have a one-to-many relationship with Order Items since each order can contain multiple order items.
- Order Items are associated with specific products through the product_id foreign key.
- Products entity contains information about the products such as name, description, and category.
- Also since Customers details are subjected to change over a time whoch define them as SCD. We introduce a current_flag column that depicts whether the details of the customer are updated or not.


### 2. Data Generation 

Here we generate a fake database using the faker library to populate our tables. The provided code in `dataGeneration.ipynb` generates a sample SQLite database for an e-commerce platform. It creates tables for customers, orders, order items, and products. Random data, including customer details, order history spanning two years, and product information, is inserted into the tables, allowing for testing and development of e-commerce database operations.
