# Online Store SQL Challenge

## Description
This project contains a complete **SQL script** that builds and analyzes an online store database.  
The goal is to practice **advanced SQL concepts**, including data modeling, analytical queries, and data manipulation.

The database simulates a real e-commerce environment with customers, products, and orders.

---

## Database Structure

The model includes the following main entities:

- **customers** – information about store customers  
- **products** – details about available products  
- **orders** – orders placed by customers  
- **order_items** – products included in each order (links orders and products)

---

## Objectives

The project includes a series of **advanced SQL challenges** that explore realistic business use cases.

1. **Top 10 customers by total spending**  
   Show the customers who spent the most, including total spent and number of orders.

2. **Unsold products**  
   List all products that have never been sold in any order.

3. **Average order value per customer**  
   Calculate the average value of orders per customer, including those who never placed an order.

4. **VIP customers**  
   List customers whose total spending is higher than the overall customer average.

5. **Product performance classification**  
   Classify products into:  
   - “High demand” → sold more than 10 times  
   - “Low demand” → sold fewer than 3 times  

6. **Orders above monthly average**  
   List all orders with a total value higher than the monthly average for that period.

7. **Best-selling product**  
   Find the product with the highest number of units sold.

8. **Estimated profit**  
   Assume a 25% profit margin and list the five most profitable products based on sales.

9. **Inactive customers**  
   Find customers who have purchased before but not in the last six months.

10. **Automatic price adjustment**  
    Increase by 10% the price of products sold more than 20 times in the last three months.

---

## How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/online-store-sql-challenge.git
