SELECT
  musics.music_name as nome,
  COUNT(history_music.history_id) as reproducoes
FROM
 history_music
  INNER JOIN users ON history_music.user_id = users.user_id
  INNER JOIN musics ON history_music.history_id = musics.history_id
  INNER JOIN plans ON users.plan_id = plans.plan_id
WHERE
  plans.plan_name = 'gratuito'
  or plans.plan_name = 'pessoal'
GROUP BY
  musics.history_id
ORDER BY
  nome;