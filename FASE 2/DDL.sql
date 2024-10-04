use TALLER2;

CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name NVARCHAR(255),
    Supervisor NVARCHAR(255),
    HireDate DATE
);


CREATE TABLE #TempInvoices (
    EmployeeID INT,
    TotalEdits INT,
    EditTime INT,
    EditDate DATE
);

BULK INSERT Employees
FROM '.\Employees.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
	CODEPAGE = '65001' -- Especifica UTF-8
);

BULK INSERT #TempInvoices
FROM '.\Invoices.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

CREATE TABLE Invoices (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    TotalEdits INT,
    EditTime INT,
    EditDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(ID)
);


INSERT INTO Invoices (EmployeeID, TotalEdits, EditTime, EditDate)
SELECT EmployeeID, TotalEdits, EditTime, EditDate
FROM #TempInvoices;

DROP TABLE #TempInvoices;
