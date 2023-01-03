SELECT LOWER(CONCAT(LEFT(FirstName,4), LEFT(LastName,2))) user_id
FROM Customer
WHERE FirstName = "Robert";