-- ------------------------------------------------ --
-- ------- INSERTING SCRIPS FOR EACH TABLE -------- --
-- ------------------------------------------------ --

-- Sector
INSERT INTO NepalStockTrade_DB.Sector (SectorName) VALUES 
('Banking'),
('Hydropower'),
('Telecom'),
('Insurance'),
('Investment'),
('Manufacturing');


-- Stock
INSERT INTO NepalStockTrade_DB.Stock (SectorID, StockSymbol, CompanyName, CurrentPrice) VALUES
(1, 'NABIL', 'Nabil Bank Limited', 800.00),
(1, 'NICA', 'NIC Asia Bank', 750.50),
(2, 'API', 'Api Power Company', 290.25),
(2, 'CHCL', 'Chilime Hydro', 450.00),
(3, 'NTC', 'Nepal Telecom', 900.00),
(4, 'NLIC', 'Nepal Life Insurance', 1350.00),
(5, 'NRIC', 'Nepal Reinsurance Co.', 820.00);


-- User
INSERT INTO NepalStockTrade_DB.User (FullName, Email, Phone) VALUES
('Avery Johnson', 'avery@gmail.com', '019283744'),
('Madison Brooks', 'mardison@gmail.com', '098375393'),
('Elijah Walker', 'elijah@gmail.com', '0022745896'),
('Scarlett Martinez', 'scarlett@gmail.com', '2200436790');

-- KYC_Details
INSERT INTO NepalStockTrade_DB.KYC_Details (UserID, CitizenshipNo, PAN, Verified) VALUES
(1, '001-001-0001', 'PAN1010', TRUE),
(2, '002-002-0002', 'PAN2020', TRUE),
(3, '003-003-0003', 'PAN3020', TRUE),
(4, '004-004-0004', 'PAN4040', TRUE);


-- Linked_Bank
INSERT INTO NepalStockTrade_DB.Linked_Bank (UserID, BankName, AccountNumber, IFSC, Balance) VALUES
(1, 'NMB Bank', '0123456789', 'NMBL1234', 50000.00),
(2, 'Kumari Bank', '9876543210', 'KMBL4321', 60000.00),
(3, 'Global IME', '4567891230', 'GIMEL567', 80000.00),
(4, 'Nabil Bank', '3210987654', 'NABIL987', 70000.00);


-- Portfolio
INSERT INTO NepalStockTrade_DB.Portfolio (UserID, StockID, Quantity, AvgBuyPrice) VALUES
(1, 1, 30, 780.00),
(1, 3, 100, 275.00),
(2, 2, 40, 740.00),
(3, 4, 20, 430.00),
(4, 5, 50, 880.00);


-- StockOrder
INSERT INTO NepalStockTrade_DB.StockOrder (UserID, StockID, OrderType, Quantity, OrderPrice, Status) VALUES
(1, 1, 'Buy', 30, 780.00, 'Completed'),
(2, 2, 'Buy', 40, 740.00, 'Completed'),
(3, 4, 'Buy', 20, 430.00, 'Completed'),
(4, 5, 'Buy', 50, 880.00, 'Completed');


-- Trade
INSERT INTO NepalStockTrade_DB.Trade (OrderID, StockID, Quantity, TradePrice) VALUES
(1, 1, 30, 780.00),
(2, 2, 40, 740.00),
(3, 4, 20, 430.00),
(4, 5, 50, 880.00);


-- Transaction
INSERT INTO NepalStockTrade_DB.Transaction (UserID, TransactionType, Amount) VALUES
(1, 'Deposit', 50000.00),
(1, 'Trade Payment', 23400.00),
(2, 'Deposit', 60000.00),
(2, 'Trade Payment', 29600.00),
(3, 'Deposit', 80000.00),
(3, 'Trade Payment', 8600.00);


-- Watchlist 
INSERT INTO NepalStockTrade_DB.Watchlist (UserID, StockID) VALUES
(1, 2),
(2, 3),
(3, 1),
(4, 4);


-- Brokerage_Fee
INSERT INTO NepalStockTrade_DB.Brokerage_Fee (TradeID, FeePercent, FeeAmount) VALUES
(1, 0.50, 117.00),
(2, 0.50, 148.00),
(3, 0.50, 43.00),
(4, 0.50, 220.00);


-- Dividend
INSERT INTO NepalStockTrade_DB.Dividend (StockID, DividendPerShare, DeclaredDate, PaymentDate) VALUES
(1, 25.00, '2024-03-15', '2024-03-31'),
(2, 20.00, '2024-02-10', '2024-02-28'),
(5, 30.00, '2024-04-01', '2024-04-20');
