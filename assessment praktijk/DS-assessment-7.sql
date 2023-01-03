SELECT * FROM Invoices WHERE (Klanten = 56 OR 58) AND (Total = BETWEEN 1 AND 5)

-- Antwoord:
SELECT * FROM Invoice WHERE CustomerId IN (56, 58) AND Total BETWEEN 1 AND 5