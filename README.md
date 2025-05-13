# 🗂 Excel SQL Data Pipeline (Intermediate–Advanced Level)

**By Moid Ahmed**  
*Information Systems Student at SNHU | Fulfillment & Data Analysis Specialist*

---

## 📋 Overview

This project demonstrates a **hybrid data pipeline** that begins with a multi-sheet Excel workbook designed to simulate a **relational database**. The workbook includes interconnected tables—Customers, Orders, Products, Inventory, Departments, Staff, Shipments, Returns, Reviews, Tracking, and more—each linked through cross-referenced keys and maintained with **XLOOKUPs, helper columns, structured tables, and data validation**.

As Excel reaches its practical limits in querying and analyzing complex, interrelated datasets, the workflow transitions to **SQL-based analysis**. By importing the Excel tables into a relational database environment (e.g., MySql), I use **JOINs, aggregations, filtering, and conditional logic** to perform more scalable and efficient analysis. This shift highlights the strengths of each tool and mirrors real-world data handling practices in business intelligence and analytics.

---


## 🔧 Steps Completed

### Planning & Design

- **Created an ERD (Entity Relationship Diagram):**
  - Designed relationships between key tables (Customers, Orders, Products, etc.).
  - Used [dbdiagram.io](https://dbdiagram.io/dn) with **DBML code** to build a crows foot ERD for clear schema planning.

![image](https://github.com/user-attachments/assets/608e092a-8100-48be-b783-aaaa565ed8ba)

- **Mapped keys and relationships:**
  - Added **foreign keys (FKs)** to connect tables.
  - Set up **primary keys (PKs)** for easy reference and validation.

![image](https://github.com/user-attachments/assets/daff3973-a8a5-451c-a11a-17b353303baa)

---

### Workbook Setup

- **Created worksheets:**
  - Customers, Orders, Products, Inventory, Departments, Staff, Shipments, Returns, Reviews, Tracking, Replenishments.

- **Defined structured tables:**
  - Added clear **table names** for use in formulas & references.
  - Populated initial data using ChatGPT for speed and accuracy.

![image](https://github.com/user-attachments/assets/4bd4dfa7-6404-43fd-bd9e-27bc45dafa79)

---

### Inventory Logic

- **Dynamic Inventory Calculation:**
  - Added a **helper column** for Starting Inventory.
  - Used formulas to calculate:
    ```
    Actual Inventory = Starting Inventory - Quantity + Refund + Replenishment
    ```

![image](https://github.com/user-attachments/assets/89f9fd2c-b245-4325-9db3-92430a12a266)

- **Tested replenishment:**
  - Verified that updates to replenishment **dynamically update inventory** totals.

![image](https://github.com/user-attachments/assets/1cc6bee7-6fe3-4aac-85aa-55bb3e5b7669)

---

### Orders & Payment

- **Order Details:**
  - Added Orders & Order Details tables with:
    - Dynamic **Total Price** calculation (auto-updating).
    - Tax & Shipping logic:
      - Free shipping on orders ≥ $75.
      - 7% discount on orders ≥ $140.
     
![image](https://github.com/user-attachments/assets/d67be50a-5467-4ebe-8462-b6e99a41fc7b)

  - Used **named cells** to manage thresholds and keep logic flexible.

![image](https://github.com/user-attachments/assets/29fe15e5-f228-4e82-a482-cb99f3b3c9b2)

![image](https://github.com/user-attachments/assets/541d267f-4893-428c-8114-875fa70448fb)

- **Payment & Validation:**
  - Set up Payment table.
 
![image](https://github.com/user-attachments/assets/511da847-3332-47e2-a59d-df081245a542)

  - Added **validation check cells:**
    - Ensured that Product ID & Order ID matched in Returns.
    - Showed **“Valid” / “Invalid”** indicators.
  - Return price auto-updates or shows `N/A` if validation fails.

![image](https://github.com/user-attachments/assets/94e0ad2a-276e-400b-b19a-0bba690274ca)

---

### Address & Tracking

- **Shipping Addresses:**
  - Linked Ship Address to Customer ID as an FK.
  - Ensured **Orders table validates** Customer ID to maintain referential integrity.

![image](https://github.com/user-attachments/assets/33d1e274-0ce1-4345-a8ba-c008fa0f209e)

- **Tracking Sheet:**
  - Filled tracking table with statuses connected to Orders.
 
![image](https://github.com/user-attachments/assets/5f5a2e21-6812-4ccd-a5f7-a8b7e486e2ba)

---

### Reviews & Replenishment

- **Added Reviews Table:**
  - Linked reviews to Customers & Products for feedback tracking.

![image](https://github.com/user-attachments/assets/5735eb9c-6edb-472b-ae22-35bc77fa8f2c)

- **Tested Replenishment:**
  - Updated replenishment for a product (e.g., P-003) and confirmed dynamic update to Inventory.

![image](https://github.com/user-attachments/assets/ef35c357-49b5-4dc4-ab54-0c39a1f4f288)

![image](https://github.com/user-attachments/assets/e3e50ff1-3acf-4d42-9e5b-9127d7118454)

![image](https://github.com/user-attachments/assets/669565ba-daf0-4b34-bd4f-ffe7dff965e5)

---

## 📊 SQL Queries

### -- Customer Behavior & Segmentation --

- **Top 10 Most Valuable Customers by Lifetime Spend**  
 - Identifies the top 10 customers based on their total lifetime spending.

![image](https://github.com/user-attachments/assets/23587f3d-a052-43b5-823c-0efb6608ab1f)

- **Average Rating Based on State and Year**  
 - Computes the average rating per state for orders placed in 2024.

![image](https://github.com/user-attachments/assets/441c7521-e8c2-466d-9f9f-d390ebae79a9)

- **Top Purchases by Product Category**  
 - Calculates the top 5 product purchases by total sales per product.

![image](https://github.com/user-attachments/assets/e860aedd-25db-4440-a2f7-287dccce8479)

- **Top Purchases by Product Category (Grouped by Category)**  
 - Computes total sales for each product category and ranks them by revenue.

![image](https://github.com/user-attachments/assets/1bbdceb1-02bd-49ca-a814-0b46508b6af3)

- **Which Category of Products Receive the Most Negative/Positive Reviews?**  
 - Identifies which product categories receive the highest ratings and the most negative feedback.

![image](https://github.com/user-attachments/assets/d59a1474-cfd5-4ee3-938d-237b88aac0c0)

- **Do Customer Returns Relate to Negative Reviews?**  
 - Analyzes if there’s a correlation between customer returns and negative reviews.

![image](https://github.com/user-attachments/assets/aa5d6221-54d0-417c-a0db-29bf8f541ac4)

- **Rate of Orders Per Day and Average Days Between Orders**  
 - Calculates the average number of days between customer orders and determines the rate of orders per day.

![image](https://github.com/user-attachments/assets/6523e665-0565-48bc-9a93-5b426b76a1c8)

---

### -- Revenue and Performance --

- **Most/Least Bought Product(s)**  
  Identifies the most and least purchased products based on order frequency.

![image](https://github.com/user-attachments/assets/ed5fec7b-2f2c-41c4-b191-750a6bbdf930)

- **Most/Least Profitable Product and Most/Least Profit Margin Per Product**  
  Determines the most and least profitable products, including their profit margins.

![image](https://github.com/user-attachments/assets/b2fbeedd-2c2b-4619-a89d-8f78dcc2e6b0)

* **Total Revenue in 2024**
* Computes the overall revenue generated in the year 2024.

![image](https://github.com/user-attachments/assets/2ea2e8d0-175a-41c3-96ec-797991ce72af)

* **Total Revenue in 2024 (Arkansas Only)**
* Calculates the total revenue from Arkansas in the year 2024.

![image](https://github.com/user-attachments/assets/dc8230c1-0270-4e8f-b270-364c7ff174fd)

* **Total Profitability in 2024**
* Computes the net profit for 2024 after deducting taxes, shipping fees, and product costs.

![image](https://github.com/user-attachments/assets/bc80527e-fb90-47c0-8b53-87a1d73844d3)

* **Top 5 Most and Least Profitable States**
* Lists the 5 states with the highest and lowest revenue based on total order values.

![image](https://github.com/user-attachments/assets/6fcb0137-242f-484c-86c9-091c57a609dd)

* **Highest Revenue Month in 2023**
* Identifies the month in 2023 with the most revenue.

![image](https://github.com/user-attachments/assets/405fc7f0-bdb6-4ba1-90b4-5f7f239ba652)

* **Return on Investment (ROI) in 2024**
* Calculates ROI in 2024 based on profit, product cost, and total staff salary.

![image](https://github.com/user-attachments/assets/504e3043-e10a-4297-858a-37873f98930f)

* **Cost of Goods Sold (COGS) in 2024**
* Total cost of goods sold based on inventory usage in 2024.

![image](https://github.com/user-attachments/assets/08d446b2-d008-4c43-893d-09a759ca07e8)

* **Shipping & Tax Fees Collected in 2023**
* Displays total shipping and tax fees received in 2023.

![image](https://github.com/user-attachments/assets/28f54d17-6891-496c-a2c6-d29f7369a819)

* **Profit Difference: 2023 vs. 2024**
* Compares revenue differences between 2023 and 2024 to determine if profit increased or decreased.

![image](https://github.com/user-attachments/assets/95c8750b-01e3-4e76-8c75-ac3f0b5fcdca)

---

### -- Inventory Performance --

* **Product with Highest/Lowest Inventory Price**
* Displays product with the highest or lowest total inventory price.

![image](https://github.com/user-attachments/assets/5f41b5db-ab4a-43f2-84a7-192bb88e286a)

* **Product with the Highest Total Cost**
* Shows which product holds the highest cost in inventory.

![image](https://github.com/user-attachments/assets/da78caad-ff92-40a4-9581-95e7b95dccdf)

* **Dead Inventory / Least Sold Product**
* Identifies inventory items with the lowest sales or no movement.

![image](https://github.com/user-attachments/assets/93d11d48-2c04-4c6e-bb47-5ae1f56c1913)

---

### -- Staff & Department Analysis --

* **Most Expensive Department**
* Ranks departments based on total staff salary cost.

![image](https://github.com/user-attachments/assets/c5eb72a9-1fd5-477e-abb3-cbf107327b93)

* **Staff Demographics by Generation**
* Categorizes staff based on generational age groups.

![image](https://github.com/user-attachments/assets/4539eb09-92d4-457e-9582-fc0f32e81727)

* **Highest Paid Staff Member**
* Identifies the staff member with the highest salary.

![image](https://github.com/user-attachments/assets/2bb77ac9-449c-41bf-8c7e-f28462110890)


---

## 📈 Final Thoughts

With this, I conclude the repository. It demonstrates practical skills in data modeling, analysis, and reporting—blending SQL and Excel for real-world insights.

---

## 🚀 Why This Matters

This project demonstrates:

- Strong **data modeling** using Excel and SQL, including a complete **Entity Relationship Diagram (ERD)**.
- Advanced **formula skills** (dynamic calculations, validation checks).
- Practical understanding of **data integrity** through primary/foreign keys and referential logic.
- Hands-on experience with **business pipeline simulation** in Excel.
- Integration of **SQL for scalable data analysis** and multi-table relational querying.
- A real-world approach to **transitioning from spreadsheet models to relational databases**.

---

## 🛠 Tools & Skills Used

- Entity Relationship Diagram (ERD) Design
- DBML & dbdiagram.io
- Excel Tables & Structured References
- Named Ranges
- Data Validation & Error Checking
- Dynamic Inventory & Pricing Logic
- Multi-sheet Integration
- Helper Columns (for Date Analysis)
- SQL (JOINs, GROUP BY, Aggregation, Subqueries, CTEs)
- MySQL Server for Data Import & Querying

---

## 👤 About Me

**Moid Ahmed**  
Information Systems Student at SNHU | Team Lead at Walmart Fulfillment | Excel & Data Analytics Enthusiast
