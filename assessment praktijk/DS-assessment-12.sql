SELECT * FROM chinook.track WHERE COUNT(AlbumId) >=12;

-- Antwoord:
SELECT AlbumId, COUNT(TrackId) FROM Track GROUP BY AlbumId HAVING COUNT(TrackId) >= 12;