SELECT
  musics.music_name as cancao,
  COUNT(history_music.history_id) as reproducoes
FROM
  musics
  INNER JOIN history_music ON musics.history_id = history_music.history_id
GROUP BY
  musics.music_name
ORDER BY
  reproducoes desc,
  cancao
LIMIT
  2;