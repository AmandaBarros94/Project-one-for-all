SELECT
  artists.artist_name as artista,
  albuns.album_name as album,
  COUNT(following_artist.artist_id) as seguidores
FROM
  following_artist
  INNER JOIN albuns ON following_artist.artist_id = albuns.artist_id
  INNER JOIN artists  ON following_artist.artist_id = artists.artist_id
GROUP BY
  artista,
  album
ORDER BY
  seguidores DESC,
  artista,
  album;