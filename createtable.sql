CREATE TABLE dbo.RetailSales (
    RecordID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    StoreName NVARCHAR(100),
    TransactionDate DATE,
    Aisle NVARCHAR(50),
    ProductName NVARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    TotalAmount DECIMAL(10, 2),
    DiscountAmount DECIMAL(10, 2),
    FinalAmount DECIMAL(10, 2),
    LoyaltyPoints INT,
    UploadedAt DATETIME2 DEFAULT GETDATE()
);