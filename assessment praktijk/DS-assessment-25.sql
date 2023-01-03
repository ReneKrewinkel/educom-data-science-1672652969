SELECT CONCAT(C.FirstName, C.LastName, I.InvoiceId) as id
FROM invoice I
LEFT JOIN customer C ON I.CustomerId = C.CustomerId
WHERE CONCAT(C.FirstName, C.LastName, I.InvoiceId) LIKE "AstridGruber%"
AND  I.InvoiceId IN(273, 296, 354, 370, 408, 456)
ORDER BY  I.InvoiceId;