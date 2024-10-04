use TALLER2

/*                              SELECT                              */

SELECT * 
FROM  Employees;

SELECT Employees.Name, Empleados.HireDate
FROM Employees;

SELECT 
    DAY(HireDate) AS DayPart,
    MONTH(HireDate) AS MonthPart,
    YEAR(HireDate) AS YearPart
FROM Employees;


/*                              WHERE                             */
SELECT Employees.Name, Employees.HireDate
FROM Employees
WHERE Employees.HireDate > '9/30/2013' AND Employees.HireDate < '8/11/2014';


SELECT Employees.Name, Invoices.TotalEdits
FROM Employees, Invoices
WHERE Employees.ID = Invoices.EmployeeID AND Invoices.TotalEdits < 100;

/*                              GROUP BY                            */
SELECT Employees.Name, SUM(Invoices.TotalEdits)
FROM Employees, Invoices
WHERE Employees.ID = Invoices.EmployeeID
GROUP BY Employees.Name;


/*                              HAVING                            */
SELECT Employees.Name, SUM(Invoices.TotalEdits)
FROM Employees, Invoices
WHERE Employees.ID = Invoices.EmployeeID
GROUP BY Employees.Name
HAVING SUM(Invoices.TotalEdits) > 100;


/*                              ORDER BY                            */
SELECT Employees.Name, SUM(Invoices.TotalEdits)
FROM Employees, Invoices
WHERE Employees.ID = Invoices.EmployeeID
GROUP BY Employees.Name
HAVING SUM(Invoices.TotalEdits) > 100
ORDER BY SUM(Invoices.TotalEdits) ASC;


/* SELECCIONAR EL NOMBRE DE LOS EMPLEADOS QUE HAN REALIZADO MÁS DE 10 EDITS EN UN DÍA*/
SELECT Employees.Name
FROM Employees
WHERE Employees.ID = Invoices.EmployeeID
GROUP BY Employees.Name
HAVING Invoices.TotalEdits > 10
ORDER BY DESC;

/*
                INNER JOIN
Retorna solo los valores que coinciden en ambas tablas.

*/

SELECT Employees.Name, Invoices.TotalEdits
FROM Employees -- Employees es la tabla izquierda
INNER JOIN Invoices ON Employees.ID = Invoices.EmployeeID; -- Alias a tabla B, tabla derecha


/*
                LEFT JOIN
Retorna todos los valores de la tabla izquierda y los valores de la tabla derecha que coinciden,
para todos los valores que no coinciden de la tabla derecha retorna valores nulos.

*/

SELECT Employees.Name, Invoices.TotalEdits
FROM Employees -- Employees es la tabla izquierda
LEFT JOIN Invoices ON Employees.ID = Invoices.EmployeeID; -- Alias a tabla B, tabla derecha



/*
                RIGHT JOIN
Retorna todos los valores de la tabla derecha y los valores de la tabla izquierda que coinciden,
para todos los valores que no coinciden de la tabla izquierda retorna valores nulos.

*/

SELECT Employees.Name, Invoices.TotalEdits
FROM Employees -- Employees es la tabla izquierda
LEFT JOIN Invoices ON Employees.ID = Invoices.EmployeeID; -- Alias a tabla B, tabla derecha



/*
                FULL OUTER JOIN
Devuelve todas las filas cuando hay una coincidencia en la tabla izquierda o derecha. 
Si no hay coincidencia, se devuelven valores NULL para las columnas de la tabla que no tiene coincidencia.
*/

SELECT Employees.Name, Invoices.TotalEdits
FROM Employees -- Employees es la tabla izquierda
FULL OUTER JOIN Invoices ON Employees.ID = Invoices.EmployeeID; -- Alias a tabla B, tabla derecha


/*
                CROSS JOIN
Devuelve el producto cartesiano de las dos tablas, lo que significa que devolverá todas las combinaciones posibles 
de filas de ambas tablas.
*/

SELECT Employees.Name, Invoices.TotalEdits
FROM Employees -- Employees es la tabla izquierda
CROSS JOIN Invoices ON Employees.ID = Invoices.EmployeeID; -- Invoices es la tabla derecha

/*
                SELF JOIN
Es una unión normal, pero la tabla se une consigo misma. Esto es útil para comparar filas dentro de la misma tabla.
*/
SELECT A.Name AS EmployeeName, B.Supervisor AS EmployeeSupervisor  -- Alias a campos de una una tabla
FROM Employees A      -- Alias a tabla A, tabla izquierda
INNER JOIN Employees B ON A.ID = B.ID; -- Alias a tabla B, tabla derecha