CREATE DATABASE NepalStockTrade_DB;

-- 1. User Table
CREATE TABLE NepalStockTrade_DB.User (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

 -- 2. KYC_Details Table
CREATE TABLE NepalStockTrade_DB.KYC_Details (
    KYCID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    CitizenshipNo VARCHAR(30) UNIQUE,
    PAN VARCHAR(20),
    Verified BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- 3. Linked_Bank Table
CREATE TABLE NepalStockTrade_DB.Linked_Bank (
    BankID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    BankName VARCHAR(50),
    AccountNumber VARCHAR(30) UNIQUE,
    IFSC VARCHAR(15),
    Balance DECIMAL(12,2) DEFAULT 0.00,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);


-- 4. Sector Table
CREATE TABLE NepalStockTrade_DB.Sector (
    SectorID INT PRIMARY KEY AUTO_INCREMENT,
    SectorName VARCHAR(50) UNIQUE NOT NULL
);


-- 5. Stock Table
CREATE TABLE NepalStockTrade_DB.Stock (
    StockID INT PRIMARY KEY AUTO_INCREMENT,
    SectorID INT,
    StockSymbol VARCHAR(10) UNIQUE NOT NULL,
    CompanyName VARCHAR(100),
    CurrentPrice DECIMAL(10,2),
    FOREIGN KEY (SectorID) REFERENCES Sector(SectorID)
);


-- 6. Order Table
CREATE TABLE NepalStockTrade_DB.StockOrder (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    StockID INT,
    OrderType ENUM('Buy', 'Sell') NOT NULL,
    Quantity INT CHECK (Quantity > 0),
    OrderPrice DECIMAL(10,2),
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Pending', 'Completed', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (StockID) REFERENCES Stock(StockID)
);


-- 7. Trade Table
CREATE TABLE NepalStockTrade_DB.Trade (
    TradeID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    StockID INT,
    Quantity INT,
    TradePrice DECIMAL(10,2),
    TradeDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES StockOrder(OrderID),
    FOREIGN KEY (StockID) REFERENCES Stock(StockID)
);


-- 8. Portfolio Table
CREATE TABLE NepalStockTrade_DB.Portfolio (
    PortfolioID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    StockID INT,
    Quantity INT DEFAULT 0,
    AvgBuyPrice DECIMAL(10,2),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (StockID) REFERENCES Stock(StockID)
);


-- 9. Transaction Table
CREATE TABLE NepalStockTrade_DB.Transaction (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    TransactionType ENUM('Deposit', 'Withdraw', 'Trade Payment'),
    Amount DECIMAL(10,2),
    TransactionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);


-- 10. Watchlist Table
CREATE TABLE NepalStockTrade_DB.Watchlist (
    WatchID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    StockID INT,
    AddedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (StockID) REFERENCES Stock(StockID)
);


-- 11. Brokerage_Fee Table
CREATE TABLE NepalStockTrade_DB.Brokerage_Fee (
    FeeID INT PRIMARY KEY AUTO_INCREMENT,
    TradeID INT,
    FeePercent DECIMAL(4,2) CHECK (FeePercent BETWEEN 0 AND 5),
    FeeAmount DECIMAL(10,2),
    FOREIGN KEY (TradeID) REFERENCES Trade(TradeID)
);


-- 12. Dividend Table
CREATE TABLE NepalStockTrade_DB.Dividend (
    DividendID INT PRIMARY KEY AUTO_INCREMENT,
    StockID INT,
    DividendPerShare DECIMAL(6,2),
    DeclaredDate DATE,
    PaymentDate DATE,
    FOREIGN KEY (StockID) REFERENCES Stock(StockID)
);
