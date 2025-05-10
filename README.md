# 🗂 Excel SQL Data Pipeline (Intermediate–Advanced Level)

**By Moid Ahmed**  
*Information Systems Student at SNHU | Fulfillment & Data Analysis Specialist*

---

## 📋 Overview

This project demonstrates a **hybrid data pipeline** that begins with a multi-sheet Excel workbook designed to simulate a **relational database**. The workbook includes interconnected tables—Customers, Orders, Products, Inventory, Departments, Staff, Shipments, Returns, Reviews, Tracking, and more—each linked through cross-referenced keys and maintained with **XLOOKUPs, helper columns, structured tables, and data validation**.

As Excel reaches its practical limits in querying and analyzing complex, interrelated datasets, the workflow transitions to **SQL-based analysis**. By importing the Excel tables into a relational database environment (e.g., SQLite or SQL Server), I use **JOINs, aggregations, filtering, and conditional logic** to perform more scalable and efficient analysis. This shift highlights the strengths of each tool and mirrors real-world data handling practices in business intelligence and analytics.

---


## 🔧 Steps Completed

### 1️⃣ Planning & Design

- **Created an ERD (Entity Relationship Diagram):**
  - Designed relationships between key tables (Customers, Orders, Products, etc.).
  - Used [dbdiagram.io](https://dbdiagram.io/dn) with **DBML code** to build a crows foot ERD for clear schema planning.

![image](https://github.com/user-attachments/assets/608e092a-8100-48be-b783-aaaa565ed8ba)

- **Mapped keys and relationships:**
  - Added **foreign keys (FKs)** to connect tables.
  - Set up **primary keys (PKs)** for easy reference and validation.

![image](https://github.com/user-attachments/assets/daff3973-a8a5-451c-a11a-17b353303baa)

---

### 2️⃣ Workbook Setup

- **Created worksheets:**
  - Customers, Orders, Products, Inventory, Departments, Staff, Shipments, Returns, Reviews, Tracking, Replenishments.

- **Defined structured tables:**
  - Added clear **table names** for use in formulas & references.
  - Populated initial data using ChatGPT for speed and accuracy.

![image](https://github.com/user-attachments/assets/4bd4dfa7-6404-43fd-bd9e-27bc45dafa79)

---

### 3️⃣ Inventory Logic

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

### 4️⃣ Orders & Payment

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

### 5️⃣ Address & Tracking

- **Shipping Addresses:**
  - Linked Ship Address to Customer ID as an FK.
  - Ensured **Orders table validates** Customer ID to maintain referential integrity.

![image](https://github.com/user-attachments/assets/33d1e274-0ce1-4345-a8ba-c008fa0f209e)

- **Tracking Sheet:**
  - Filled tracking table with statuses connected to Orders.
 
![image](https://github.com/user-attachments/assets/5f5a2e21-6812-4ccd-a5f7-a8b7e486e2ba)

---

### 6️⃣ Reviews & Replenishment

- **Added Reviews Table:**
  - Linked reviews to Customers & Products for feedback tracking.

![image](https://github.com/user-attachments/assets/5735eb9c-6edb-472b-ae22-35bc77fa8f2c)

- **Tested Replenishment:**
  - Updated replenishment for a product (e.g., P-003) and confirmed dynamic update to Inventory.

![image](https://github.com/user-attachments/assets/ef35c357-49b5-4dc4-ab54-0c39a1f4f288)

![image](https://github.com/user-attachments/assets/e3e50ff1-3acf-4d42-9e5b-9127d7118454)

![image](https://github.com/user-attachments/assets/669565ba-daf0-4b34-bd4f-ffe7dff965e5)

---

### 7️⃣ Helper Columns & Analysis Prep

- Added **helper columns**:
  - Extracted *Year* & *Month* from key dates to enable time-based analysis.

- **Initial testing:**
  - Ran through data pipelines to confirm relationships & calculations hold under changes.

![image](https://github.com/user-attachments/assets/7711752c-3648-427f-bbe8-fffc72e503da)

---

## 📝 Next Steps (Ongoing Work)

- ## Data Analysis Approach

While Excel offers powerful tools for basic data manipulation, it becomes less practical when working with multiple interrelated tables that need to function interchangeably. To ensure a more efficient, scalable, and maintainable workflow, this project transitions to SQL for handling data analysis. SQL enables seamless querying across relational datasets, supports complex joins and aggregations, and is better suited for larger or more dynamic data environments.

---

## 🚀 Why This Matters

This project demonstrates:

- Strong **data modeling** using Excel and SQL, including a complete **Entity Relationship Diagram (ERD)**.
- Advanced **formula skills** (XLOOKUPs, dynamic calculations, validation checks).
- Practical understanding of **data integrity** through primary/foreign keys and referential logic.
- Hands-on experience with **business pipeline simulation** in Excel.
- Integration of **SQL for scalable data analysis** and multi-table relational querying.
- A real-world approach to **transitioning from spreadsheet models to relational databases**.

---

## 🛠 Tools & Skills Used

- Entity Relationship Diagram (ERD) Design
- DBML & dbdiagram.io
- Excel Tables & Structured References
- XLOOKUP & Named Ranges
- Data Validation & Error Checking
- Dynamic Inventory & Pricing Logic
- Multi-sheet Integration
- Helper Columns (for Date Analysis)
- SQL (JOINs, GROUP BY, Aggregation, Subqueries)
- SQLite / SQL Server for Data Import & Querying

---

## 👤 About Me

**Moid Ahmed**  
Information Systems Student at SNHU | Team Lead at Walmart Fulfillment | Excel & Data Analytics Enthusiast
