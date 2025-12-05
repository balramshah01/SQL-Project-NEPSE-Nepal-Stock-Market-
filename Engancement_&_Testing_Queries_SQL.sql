-- ------------------------------------------------------- --
-- ----- Top 3 Users with Highest Portfolio Value ----- --
-- ------------------------------------------------------- --

USE NepalStockTrade_DB;
SELECT 
    u.FullName,
    SUM(p.Quantity * s.CurrentPrice) AS PortfolioValue
FROM Portfolio p
JOIN Stock s ON p.StockID = s.StockID
JOIN User u ON p.UserID = u.UserID
GROUP BY u.UserID
ORDER BY PortfolioValue DESC
LIMIT 3;

-- ------------------------------------------------------- --
-- ----- Sector-wise Total Investment Across Users ----- --
-- ------------------------------------------------------- --
SELECT 
    sec.SectorName,
    SUM(p.Quantity * s.CurrentPrice) AS TotalInvestment
FROM Portfolio p
JOIN Stock s ON p.StockID = s.StockID
JOIN Sector sec ON s.SectorID = sec.SectorID
GROUP BY sec.SectorID
ORDER BY TotalInvestment DESC;

-- ------------------------------------------------------- --
-- ----- Recent Trades Summary with Fees ----- --
-- ------------------------------------------------------- --
SELECT 
    t.TradeID,
    u.FullName,
    s.StockSymbol,
    t.Quantity,
    t.TradePrice,
    (bf.FeePercent * t.Quantity * t.TradePrice / 100) AS FeeCharged
FROM Trade t
JOIN StockOrder o ON t.OrderID = o.OrderID
JOIN User u ON o.UserID = u.UserID
JOIN Stock s ON t.StockID = s.StockID
JOIN Brokerage_Fee bf ON t.TradeID = bf.TradeID
ORDER BY t.TradeDate DESC
LIMIT 5;

-- ------------------------------------------------------- --
-- ----- Users with No Trades but Active Watchlist ----- --
-- ------------------------------------------------------- --
SELECT u.FullName, u.Email
FROM User u
WHERE u.UserID NOT IN (SELECT DISTINCT UserID FROM StockOrder)
  AND u.UserID IN (SELECT DISTINCT UserID FROM Watchlist);


-- ------------------------------------------------------- --
-- ----- : Dividend Summary Per Stock ----- --
-- ------------------------------------------------------- --
SELECT 
    s.StockSymbol,
    COUNT(d.DividendID) AS TotalDeclarations,
    SUM(d.DividendPerShare) AS TotalDividend,
    MAX(d.PaymentDate) AS LastPaid
FROM Dividend d
JOIN Stock s ON d.StockID = s.StockID
GROUP BY s.StockID;
