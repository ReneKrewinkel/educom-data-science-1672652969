SELECT customer.FirstName, customer.LastName, customer.City, invoice.BillingCity
FROM customer
JOIN  invoice ON customer.CustomerId = invoice.CustomerId
WHERE customer.City <> invoice.BillingCity;