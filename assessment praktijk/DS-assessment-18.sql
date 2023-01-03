SELECT employee.FirstName, employee.LastName , customer.FirstName, customer.LastName
FROM employee
INNER JOIN customer;

-- Antwoord:
SELECT FirstName, LastName
FROM Employee
UNION
	SELECT FirstName, LastName
	FROM Customer
ORDER BY LastName DESC;