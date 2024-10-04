use TALLER2
-- 1. Reporte sobre los 10 empleados con más publicaciones realizadas en días laborados
SELECT TOP 10
    i.EmployeeID,
    e.Name,
    i.EditDate,
    i.TotalEdits
FROM 
    Invoices i
JOIN 
    Employees e ON i.EmployeeID = e.ID
WHERE 
    i.TotalEdits = (
        SELECT MAX(TotalEdits)
        FROM Invoices
        WHERE EmployeeID = i.EmployeeID
    )
ORDER BY 
    i.TotalEdits DESC;

-- 2. Reporte sobre los 10 empleados con menos publicaciones realizadas en días laborados.
SELECT TOP 10
    i.EmployeeID,
    e.Name,
    i.EditDate,
    i.TotalEdits
FROM 
    Invoices i
JOIN 
    Employees e ON i.EmployeeID = e.ID
WHERE 
    i.EditDate = (
        SELECT MIN(EditDate)
        FROM Invoices
        WHERE EmployeeID = i.EmployeeID
        AND TotalEdits = (
            SELECT MIN(TotalEdits)
            FROM Invoices
            WHERE EmployeeID = i.EmployeeID
        )
    )
ORDER BY 
    i.TotalEdits ASC;

-- 3. Reporte de los 5 empleados con el mayor promedio de tiempo de edición por día laboral.
SELECT TOP 5
    e.ID,
	e.Name,
	COUNT(i.EditDate) as LabDays,
    SUM(i.EditTime)/COUNT(i.EditDate) as AvgTimeEditonPerDay,
	SUM(i.TotalEdits) as TotalEdits
FROM Employees e
JOIN Invoices i ON e.ID = i.EmployeeID
GROUP BY e.ID, e.Name
ORDER BY AvgTimeEditonPerDay DESC

-- 4. Reporte sobre los Empleados con Mayor Número de Ediciones por Día Laboral.
SELECT TOP 5
    e.ID,
	e.Name,
	COUNT(i.EditDate) as LabDays,
    SUM(i.TotalEdits)/COUNT(i.EditDate) as EditsPerDay,
	SUM(i.TotalEdits) as TotalEdits
FROM Employees e
JOIN Invoices i ON e.ID = i.EmployeeID
GROUP BY e.ID, e.Name
ORDER BY EditsPerDay DESC


SELECT 
	e.Name,
	e.HireDate,
	(DATEDIFF(
		WEEK, 
		e.HireDate, 
		'2015-03-22'
	) * 5) AS TotalDays,
	COUNT(i.EditDate) AS LabDays,
	SUM(i.TotalEdits) AS TotalEdits,
	SUM(i.EditTime) AS EditTime
FROM Employees e
JOIN Invoices i ON e.ID = i.EmployeeID
GROUP BY e.Name, e.HireDate








