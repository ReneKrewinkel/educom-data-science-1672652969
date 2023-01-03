SELECT artist.ArtistId, artist.Name
FROM artist 
LEFT JOIN album ON artist.ArtistId = album.ArtistId
WHERE album.AlbumId = NULL;

-- Antwoord: 
SELECT A.Name, A.ArtistId
FROM Artist A
WHERE A.ArtistId NOT IN (
SELECT ArtistId FROM Album);