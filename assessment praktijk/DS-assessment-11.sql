SELECT COUNT(InvoiceID), CustomerId FROM invoice GROUP BY CustomerId;

--antwoord:

SELECT CustomerId, COUNT(InvoiceId) FROM Invoice GROUP BY CustomerId ORDER BY COUNT(InvoiceId) DESC