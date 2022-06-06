SELECT user_name AS usuario,
COUNT(musics.history_id) AS qtde_musicas_ouvidas,
ROUND((SUM(seconds_amount)/60),2) AS total_minutos
from users
INNER JOIN history_music
ON users.user_id = history_music.user_id
INNER JOIN  musics
ON history_music.history_id = musics.history_id
GROUP BY user_name
ORDER BY user_name;