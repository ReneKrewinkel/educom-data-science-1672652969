SELECT FirstName, LastName, Address, UPPER(City), Country
FROM customer;

-- Antwoord:
SELECT C.CustomerId, C.FirstName, C.LastName, C.Address, UPPER(C.City || ' ' || C.Country)
FROM Customer C