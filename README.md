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

- **Mapped keys and relationships:**
  - Added **foreign keys (FKs)** to connect tables.
  - Set up **primary keys (PKs)** for easy reference and validation.

---

### 2️⃣ Workbook Setup

- **Created worksheets:**
  - Customers, Orders, Products, Inventory, Departments, Staff, Shipments, Returns, Reviews, Tracking, Replenishments.

- **Defined structured tables:**
  - Added clear **table names** for use in formulas & references.
  - Populated initial data using ChatGPT for speed and accuracy.

---

### 3️⃣ Inventory Logic

- **Dynamic Inventory Calculation:**
  - Added a **helper column** for Starting Inventory.
  - Used formulas to calculate:
    ```
    Actual Inventory = Starting Inventory - Quantity + Refund + Replenishment
    ```
- **Tested replenishment:**
  - Verified that updates to replenishment **dynamically update inventory** totals.

---

### 4️⃣ Orders & Payment

- **Order Details:**
  - Added Orders & Order Details tables with:
    - Dynamic **Total Price** calculation (auto-updating).
    - Tax & Shipping logic:
      - Free shipping on orders ≥ $75.
      - 7% discount on orders ≥ $140.
  - Used **named cells** to manage thresholds and keep logic flexible.

- **Payment & Validation:**
  - Set up Payment table.
  - Added **validation check cells:**
    - Ensured that Product ID & Order ID matched in Returns.
    - Showed **“Valid” / “Invalid”** indicators.
  - Return price auto-updates or shows `N/A` if validation fails.

---

### 5️⃣ Address & Tracking

- **Shipping Addresses:**
  - Linked Ship Address to Customer ID as an FK.
  - Ensured **Orders table validates** Customer ID to maintain referential integrity.

- **Tracking Sheet:**
  - Filled tracking table with statuses connected to Orders.

---

### 6️⃣ Reviews & Replenishment

- **Added Reviews Table:**
  - Linked reviews to Customers & Products for feedback tracking.

- **Tested Replenishment:**
  - Updated replenishment for a product (e.g., P-003) and confirmed dynamic update to Inventory.

---

### 7️⃣ Helper Columns & Analysis Prep

- Added **helper columns**:
  - Extracted *Year* & *Month* from key dates to enable time-based analysis.

- **Initial testing:**
  - Ran through data pipelines to confirm relationships & calculations hold under changes.

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
