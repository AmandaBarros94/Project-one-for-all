SELECT
  artists.artist_name as artista,
  albuns.album_name as album
FROM
  artists
  INNER JOIN albuns on artists.artist_id = albuns.artist_id
WHERE
  artists.artist_name = 'Walter Phoenix';