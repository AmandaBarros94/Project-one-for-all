SELECT COUNT(c.collection_id) as cancoes,
COUNT(DISTINCT a.artist_id) as artistas,
COUNT(DISTINCT c.collection_id) as albuns
FROM musics
JOIN albuns as c
ON musics.collection_id = c.collection_id
JOIN  artists as a
ON c.artist_id = a.artist_id;