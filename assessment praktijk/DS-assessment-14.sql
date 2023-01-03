SELECT COUNT(InvoiceId), customer.FirstName, customer.LastName, customer.City, customer.Email 
FROM invoice LEFT JOIN customer ON invoice.CustomerId = customer.CustomerId 
GROUP BY invoice.CustomerId;