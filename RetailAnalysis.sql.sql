/*=========================================================
Task 1/2: Preview the Orders Table and Product supplier table

Purpose:
Display the first 10 records from both tables to
understand the structure of the dataset and identify
the available columns before beginning analysis.

Expected Outcome:
A sample of order data including customer, product,
quantity and pricing information.
=========================================================*/
SELECT TOP 10 *
FROM dbo.orders;
select top 10*
from dbo.[product-supplier];


/*=========================================================
Task 3: Count Total Orders

Purpose:
Calculate the total number of customer orders stored
within the Orders table.

Expected Outcome:
A single value representing the total number of orders.
=========================================================*/
SELECT COUNT(*) AS TotalOrders
FROM dbo.orders;

/*=========================================================
Task 4: Count Total Products

Purpose:
Calculate the total number of products contained within
the Product-Supplier table.

Expected Outcome:
A single value representing the total number of products.
=========================================================*/
SELECT COUNT(*) AS TotalProducts
FROM dbo.[product-supplier];
/*=========================================================
Task 5: Join Orders and Product Information

Purpose:
Combine the Orders table with the Product-Supplier table
using Product_ID to create a complete dataset containing
both order details and product information.

Expected Outcome:
A unified dataset containing customer orders together
with product names, categories and supplier information.
=========================================================*/
SELECT
    o.Order_ID,
    o.Customer_ID,
    ps.Product_Name,
    ps.Product_Category
FROM dbo.orders AS o
INNER JOIN dbo.[product-supplier] AS ps
    ON o.Product_ID = ps.Product_ID;
SELECT TOP 10
    o.*,
    ps.*
FROM dbo.orders AS o
INNER JOIN [dbo].[product-supplier] AS ps
    ON o.product_id = ps.product_id;

SELECT TOP 20
    o.Order_ID,
    o.Customer_ID,
    o.Customer_Status,
    o.Date_Order_was_placed,
    o.Delivery_Date,
    o.Product_ID,
    ps.Product_Name,
    ps.Product_Category,
    ps.Product_Group,
    ps.Supplier_Country,
    o.Quantity_Ordered,
    o.Total_Retail_Price_for_This_Order,
    o.Cost_Price_Per_Unit
FROM dbo.orders AS o
INNER JOIN dbo.[product-supplier] AS ps
    ON o.Product_ID = ps.Product_ID;


	/*=========================================================
Task 6: Calculate Total Revenue

Purpose:
Calculate the total revenue generated from all customer
orders.

Expected Outcome:
A single value representing total retail revenue.
=========================================================*/
SELECT
SUM(o.Total_Retail_Price_for_This_Order) AS TotalRevenue
FROM dbo.orders AS o;

/*=========================================================
Task 7: Revenue by Product Category

Purpose:
Identify which product categories generate the highest
total revenue.

Expected Outcome:
A ranked list of product categories ordered from highest
to lowest revenue.
=========================================================*/
SELECT
    ps.Product_Category,
    SUM(o.Total_Retail_Price_for_This_Order) AS TotalRevenue
FROM dbo.orders AS o
INNER JOIN dbo.[product-supplier] AS ps
ON o.Product_ID = ps.Product_ID
GROUP BY ps.Product_Category
ORDER BY TotalRevenue DESC;

SELECT TOP 10
    ps.Product_Name,
    SUM(o.Total_Retail_Price_for_This_Order) AS TotalRevenueByProduct
FROM dbo.orders AS o
INNER JOIN dbo.[product-supplier] AS ps
    ON o.Product_ID = ps.Product_ID
GROUP BY
    ps.Product_Name
ORDER BY
    TotalRevenueByProduct DESC;
