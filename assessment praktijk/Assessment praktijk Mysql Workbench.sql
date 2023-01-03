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
SELECT track.Name 
FROM track LEFT JOIN album ON track.AlbumId = album.AlbumId
WHERE  album.Title = 'Californication';

-- 14
SELECT COUNT(InvoiceId), customer.FirstName, customer.LastName, customer.City, customer.Email 
FROM invoice LEFT JOIN customer ON invoice.CustomerId = customer.CustomerId 
GROUP BY invoice.CustomerId;

-- 15
SELECT track.TrackId, track.Name, album.Title, artist.Name 
FROM track 
LEFT JOIN album ON track.AlbumId = album.AlbumId 
LEFT JOIN artist ON album.artistId = artist.artistId;

-- 16
SELECT M.LastName, E.LastName
FROM Employee E
JOIN Employee M ON E.ReportsTo = M.EmployeeId;


-- 17
SELECT A.Name, A.ArtistId
FROM Artist A
WHERE A.ArtistId NOT IN (
SELECT ArtistId FROM Album);

-- 18
SELECT FirstName, LastName
FROM Employee
UNION
	SELECT FirstName, LastName
	FROM Customer
ORDER BY LastName DESC;

-- 19
SELECT customer.FirstName, customer.LastName, customer.City, invoice.BillingCity
FROM customer
JOIN  invoice ON customer.CustomerId = invoice.CustomerId
WHERE customer.City <> invoice.BillingCity;

-- 20
SELECT CustomerId, FirstName, LastName, Address, UPPER(CONCAT(City, ' ',Country))
FROM Customer;

SELECT C.CustomerId, C.FirstName, C.LastName, C.Address, UPPER(C.City || ' ' || C.Country)
FROM Customer C;

-- 21
SELECT LOWER(CONCAT(LEFT(FirstName,4), LEFT(LastName,2))) user_id
FROM Customer
WHERE FirstName = "Robert";

-- 22
SELECT E.FirstName, E.LastName
FROM Employee E
ORDER BY E.LastName ASC;

-- 24
SELECT City, COUNT(CustomerId)
FROM customer
GROUP BY City
ORDER BY 2 DESC;

-- 25
SELECT CONCAT(C.FirstName, C.LastName, I.InvoiceId) as id
FROM invoice I
LEFT JOIN customer C ON I.CustomerId = C.CustomerId
WHERE CONCAT(C.FirstName, C.LastName, I.InvoiceId) LIKE "AstridGruber%"
AND  I.InvoiceId IN(273, 296, 354, 370, 408, 456)
ORDER BY  I.InvoiceId;