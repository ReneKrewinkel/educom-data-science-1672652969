SELECT track.TrackId, track.Name, album.Title, artist.Name 
FROM track 
LEFT JOIN album ON track.AlbumId = album.AlbumId 
LEFT JOIN artist ON album.artistId = artist.artistId;