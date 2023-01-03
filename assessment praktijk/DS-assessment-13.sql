SELECT Name 
FROM track 
LEFT JOIN album ON track.AlbumId = album.AlbumId 
WHERE  track.AlbumId = 'Californication';