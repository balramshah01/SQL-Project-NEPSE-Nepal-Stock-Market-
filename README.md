# NepaliTradeHub: NEPSE Portfolio Database System

## 📚 Table of Contents
- [Project Overview](#-project-overview)
- [Key Features](#-key-features)
- [ERD Diagram](#-erd-diagram)
- [Entities Overview](#-entities-overview)
- [Database Workflow](#-database-workflow)
- [Data Population Logic](#-data-population-logic)
- [SQL Reports Overview](#-sql-reports-overview)
- [Future Enhancements](#-future-enhancements)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Contact](#-contact)

---

## 🚀 Project Overview
**NepaliTradeHub** is a relational database system simulating real operations of **NEPSE (Nepal Stock Exchange)**.  
It models essential stock trading backend workflows including:

- User onboarding  
- KYC verification  
- Stock ordering & trading  
- Portfolio tracking  
- Watchlist & dividend management  
- Financial transactions and reporting  

This project was developed under the **Advanced SQL Module (Dursikshya Training Institute)** using proper:

- ER Modeling  
- Third Normal Form (3NF)  
- Referential Integrity  
- Realistic trading logic  

---

## ⭐ Key Features
- Secure user registration & identity verification  
- Linked bank accounts with balance tracking  
- Buy/Sell stock order placement  
- Trade execution with brokerage fee calculation  
- Real-time portfolio updates (quantity + avg buy price)  
- Watchlist for tracking stock interest  
- Complete financial transaction history  
- Dividend declaration & payment tracking  

---

## 🖼 ERD Diagram
https://github.com/balramshah01/SQL-Project-NEPSE-Nepal-Stock-Market-/blob/main/NEPSE%20(ERD).png

---

## 🏛 Entities Overview

### **1. User**
Central identity of investors; linked with all major tables.

### **2. KYC_Details**
Stores citizenship number, PAN, and verification status.

### **3. Linked_Bank**
Tracks bank account details like IFSC, account number, balance.

### **4. Sector**
Industry category (Banking, Hydro, Insurance, etc.).

### **5. Stock**
Stock symbol, company name, and current market price.

### **6. StockOrder**
User’s buy/sell requests including quantity & order price.

### **7. Trade**
Executed orders with final trade price & quantity.

### **8. Portfolio**
User’s holdings and average buy price calculations.

### **9. Brokerage_Fee**
Fee percentage and value charged per trade.

### **10. Transaction**
Deposits, withdrawals, and trade payments.

### **11. Watchlist**
Tracks stocks watched by users.

### **12. Dividend**
Dividend per share, declared date, payment date.

---

## 🔄 Database Workflow

```
User → KYC → Linked Bank → StockOrder → Trade → Brokerage Fee → Portfolio Update → Transaction
```

---

## 🧩 Data Population Logic

Order of insertion to avoid foreign key errors:

1. Sector  
2. Stock  
3. User  
4. KYC_Details & Linked_Bank  
5. Portfolio  
6. StockOrder  
7. Trade  
8. Transaction  
9. Watchlist  
10. Brokerage_Fee  
11. Dividend  

---

## 📊 SQL Reports Overview

### **1. Top 3 Users by Portfolio Value**
Shows highest-value investors.

### **2. Sector-wise Total Investment**
Helps analyze which industries dominate investments.

### **3. Recent Trades with Brokerage Fee**
Shows recent trading activity + platform revenue generation.

### **4. Users With Watchlist But No Trades**
Useful for re-engagement campaigns.

### **5. Dividend Summary Per Stock**
Tracks dividend history and last payout date.

---

## 🚀 Future Enhancements

### **1. Real-Time Notification System**
Alerts for trades, price changes, dividends, KYC updates.

### **2. Tax Summary & Export Module**
Capital gains/losses + dividend income reports (PDF/CSV).

### **3. Multi-Currency Portfolio View**
View portfolio in USD/INR using live exchange rates.

---

## 🛠 Tech Stack
- **MySQL / SQL**
- **ERD Modeling**
- **VS Code**
- **PDF Documentation**

---

## 📁 Project Structure

```
NepaliTradeHub-NEPSE-DB/
│
├── Project_Report.pdf
├── README.md
├── ERD_Image.png          ← insert your own ERD image here
├── SQL Scripts/
│     ├── schema.sql
│     ├── inserts.sql
│     └── reports.sql
└── Documentation/
```

## 🔎 Contact

📧 Email : sawmar044@gmail.com

🔗 Linkedin : https://www.linkedin.com/in/balram-shah/
