show databases;
USE chinook;

SELECT CustomerId FROM customer;

SELECT * FROM chinook.track WHERE COUNT(AlbumId) =2;

SELECT COUNT(InvoiceID), CustomerId FROM invoice GROUP BY CustomerId;

-- 4
SELECT * FROM Track WHERE Milliseconds >= 5000000;

-- 5
SELECT * FROM Invoice WHERE Total BETWEEN 5 AND 15;

-- 6
SELECT * FROM Customer WHERE State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY');

-- 7 
SELECT * FROM Invoice WHERE CustomerId IN (56, 58) AND Total BETWEEN 1 AND 5;

-- 8
SELECT * FROM Track WHERE Name LIKE 'All%';

-- 9
SELECT * FROM Customer WHERE Email LIKE 'j%@gmail.com';

-- 10
SELECT * FROM Invoice WHERE BillingCity IN ('Brasilia', 'Edmonton', 'Vancouver') ORDER BY InvoiceID DESC;

-- 11
SELECT CustomerId, COUNT(InvoiceId) FROM Invoice GROUP BY CustomerId ORDER BY COUNT(InvoiceId) DESC;

-- 12
SELECT AlbumId, COUNT(TrackId) FROM Track GROUP BY AlbumId HAVING COUNT(TrackId) >= 12;

-- 13
