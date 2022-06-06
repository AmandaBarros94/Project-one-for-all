SELECT users.user_name AS usuario,
(CASE 
 WHEN MAX(YEAR(history_music.date_listenned)) = 2021 
 THEN 'Usuário ativo' 
 ELSE 'Usuário inativo' 
 END
) AS condicao_usuario
FROM users
INNER JOIN history_music
ON history_music.user_id = users.user_id
GROUP BY users.user_name
ORDER BY users.user_name;