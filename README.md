# 🗂 Excel Data Pipeline Workbook (Intermediate-Advanced Level)

**By Moid Ahmed**  
*Information Systems student at SNHU | Fulfillment & Data Analysis Specialist*

---

## 📋 Overview

This project simulates a **full data pipeline for a company** using an Excel workbook that mimics a **relational database**. The workbook contains multiple linked sheets: Customers, Orders, Products, Inventory, Departments, Staff, Shipments, Returns, Reviews, Tracking, and more. It integrates dynamic calculations, validation checks, and cross-referenced keys using **XLOOKUPs, helper columns, and structured tables** to maintain data integrity and support scalable analysis.

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

- Build **dashboards** for data visualization (Revenue, Inventory Trends, Staff Performance).
- Add **pivot tables** & charts to analyze performance by Region, Product Category, etc.
- Document formulas & logic in a detailed **README.md** file.

---

## 🚀 Why This Matters

This project demonstrates:

- Strong **data modeling** using Excel (multi-sheet relational structure).
- Advanced **formula skills** (XLOOKUPs, dynamic calculations, validation checks).
- Practical understanding of **data integrity** using keys and referential logic.
- Hands-on experience with **business pipeline simulation** in Excel.

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

---

## 👤 About Me

**Moid Ahmed**  
Information Systems Student at SNHU | Team Lead at Walmart Fulfillment | Excel & Data Analytics Enthusiast
