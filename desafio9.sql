SELECT
  COUNT(history_music.history_id) as quantidade_musicas_no_historico
FROM
  users
  INNER JOIN history_music on users.user_id = history_music.user_id
WHERE
  users.user_name = 'Bill';