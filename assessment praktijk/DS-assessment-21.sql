SELECT LOWER(CONCAT(LEFT(FirstName,4), LEFT(LastName,2))) user_id
FROM Customer
WHERE FirstName = "Robert";

-- Antwoord
SELECT LOWER(CONCAT(SUBSTR(E.FirstName, 1, 4), SUBSTR(E.LastName, 1, 2)))
FROM Employee E;