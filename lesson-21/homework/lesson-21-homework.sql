--Merge
-- task 1
--MERGE INTO Employees AS t
--USING NewEmployees AS s
--ON t.EmployeeID = s.EmployeeID
--WHEN MATCHED THEN 
--    UPDATE SET 
--        t.Name = s.Name,
--        t.Position = s.Position,
--        t.Salary = s.Salary
--WHEN NOT MATCHED THEN 
--    INSERT (EmployeeID, Name, Position, Salary)
--    VALUES (s.EmployeeID, s.Name, s.Position, s.Salary)

--task 2
--MERGE INTO OldProducts AS target
--USING CurrentProducts AS source
--ON target.ProductID = source.ProductID
--WHEN NOT MATCHED BY SOURCE THEN 
--    DELETE

-- task 3
--MERGE INTO Employees AS t
--USING NewSalaryDetails AS s
--ON t.EmployeeID = s.EmployeeID
--WHEN MATCHED AND s.Salary > t.Salary THEN 
--    UPDATE SET t.Salary = s.Salary

-- task 4
--MERGE INTO Orders AS target
--USING NewOrders AS source
--ON target.OrderID = source.OrderID
--WHEN MATCHED AND target.CustomerID = source.CustomerID AND source.OrderAmount > target.OrderAmount THEN 
--    UPDATE SET target.OrderAmount = source.OrderAmount
--WHEN NOT MATCHED THEN 
--    INSERT (OrderID, CustomerID, OrderAmount, OrderDate)
--    VALUES (source.OrderID, source.CustomerID, source.OrderAmount, source.OrderDate)

--task 5
--MERGE INTO StudentRecords AS target
--USING (SELECT * FROM NewStudentRecords WHERE Age > 18) AS source
--ON target.StudentID = source.StudentID
--WHEN MATCHED THEN 
--    UPDATE SET 
--        target.Name = source.Name,
--        target.Age = source.Age,
--        target.Grade = source.Grade
--WHEN NOT MATCHED THEN 
--    INSERT (StudentID, Name, Age, Grade)
--    VALUES (source.StudentID, source.Name, source.Age, source.Grade);
--INSERT INTO MergeLog (StudentID, ActionType, ActionDate)
--SELECT source.StudentID, 
--       CASE 
--           WHEN target.StudentID IS NOT NULL THEN 'UPDATED'
--           ELSE 'INSERTED'
--       END AS ActionType, 
--       GETDATE()
--FROM NewStudentRecords AS source
--LEFT JOIN StudentRecords AS target
--ON source.StudentID = target.StudentID
--WHERE source.Age > 18

--View and Function
--task 1
--CREATE VIEW SalesSummary AS
--SELECT 
--    CustomerID,
--    COUNT(OrderID) AS TotalOrders,
--    SUM(SalesAmount) AS TotalSales
--FROM Orders
--GROUP BY CustomerID

--task 2
--CREATE VIEW EmployeeDepartmentDetails AS
--SELECT 
--    e.EmployeeID, 
--    e.Name AS EmployeeName, 
--    e.Position, 
--    d.DepartmentID, 
--    d.DepartmentName
--FROM Employees e
--JOIN Departments d ON e.DepartmentID = d.DepartmentID

--task 3
--CREATE VIEW InventoryStatus AS
--SELECT 
--    p.ProductID, 
--    p.ProductName, 
--    p.Category, 
--    i.QuantityInStock, 
--    CASE 
--        WHEN i.QuantityInStock > 50 THEN 'High Stock'
--        WHEN i.QuantityInStock BETWEEN 10 AND 50 THEN 'Medium Stock'
--        WHEN i.QuantityInStock BETWEEN 1 AND 9 THEN 'Low Stock'
--        ELSE 'Out of Stock'
--    END AS StockStatus
--FROM Products p
--JOIN Inventory i ON p.ProductID = i.ProductID

--task 4
--CREATE FUNCTION fn_GetFullName (
--    @FirstName VARCHAR(30),
--    @LastName VARCHAR(30)
--)
--RETURNS VARCHAR(60)
--AS
--BEGIN
--    RETURN TRIM(@FirstName + ' ' + @LastName)
--END

--task 5
--CREATE FUNCTION fn_GetHighSales (@Threshold DECIMAL(18,2))
--RETURNS TABLE AS
--RETURN
--(    SELECT 
--        OrderID, 
--        CustomerID, 
--        SalesAmount, 
--        OrderDate
--    FROM Orders
--    WHERE SalesAmount > @Threshold
--)

--task 6
--CREATE FUNCTION fn_GetCustomerStats ()
--RETURNS @CustomerStats TABLE
--(    CustomerID INT PRIMARY KEY,
--    TotalOrders INT,
--    TotalSales DECIMAL(18,2),
--    AvgOrderValue DECIMAL(18,2)
--)AS
--BEGIN
--    INSERT INTO @CustomerStats
--    SELECT 
--        CustomerID,
--        COUNT(OrderID) AS TotalOrders,
--        SUM(SalesAmount) AS TotalSales,
--        AVG(SalesAmount) AS AvgOrderValue
--    FROM Orders
--    GROUP BY CustomerID
--    RETURN
--END

-- Window Functions

--task 1
--SELECT *, 
--    SUM(SalesAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS CumulativeSales
--FROM Orders

--task 2
--SELECT *, 
--    AVG(Salary) OVER (PARTITION BY DepartmentID) AS AvgSalary
--FROM Employees

--SELECT 
--    DepartmentID, 
--    AVG(Salary) AS AvgSalary
--FROM Employees
--GROUP BY DepartmentID

-- task 3
--WITH CumulativeRevenue AS (
--    SELECT *, 
--        SUM(Revenue) OVER (PARTITION BY CategoryID ORDER BY OrderDate) AS CumulativeRevenue
--    FROM Sales
--),
--TotalRevenue AS (
--    SELECT 
--        CategoryID, 
--        SUM(Revenue) AS TotalRevenue
--    FROM Sales
--    GROUP BY CategoryID
--)
--SELECT c.CumulativeRevenue, 
--    t.TotalRevenue
--FROM CumulativeRevenue c
--JOIN TotalRevenue t ON c.CategoryID = t.CategoryID;

--task 4
--SELECT *, 
--    ROW_NUMBER() OVER (ORDER BY TestScore DESC) AS RowNumberRank, 
--    RANK() OVER (ORDER BY TestScore DESC) AS Rank, 
--    DENSE_RANK() OVER (ORDER BY TestScore DESC) AS DenseRank
--FROM Students

--task 5
--SELECT *,
--    LAG(StockPrice) OVER (PARTITION BY StockID ORDER BY TradeDate) AS PreviousDayPrice, 
--    LEAD(StockPrice) OVER (PARTITION BY StockID ORDER BY TradeDate) AS NextDayPrice, 
--FROM StockPrices

--task 6
--SELECT *,
--    NTILE(4) OVER (ORDER BY TotalSpending DESC) AS Quartile, 
--    NTILE(5) OVER (ORDER BY TotalSpending DESC) AS Quintile
--FROM (
--    SELECT 
--        CustomerID, 
--        CustomerName, 
--        SUM(SpendingAmount) AS TotalSpending
--    FROM Transactions
--    GROUP BY CustomerID, CustomerName
--) AS CustomerSpending









