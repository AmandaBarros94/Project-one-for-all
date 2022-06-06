SELECT
  musics.music_name AS nome_musica,
  CASE
    WHEN musics.music_name LIKE '%Streets%' THEN REPLACE(musics.music_name, "Streets", "Code Review")
    WHEN musics.music_name LIKE '%Her Own%' THEN REPLACE(musics.music_name, "Her Own", "Trybe")
    WHEN musics.music_name LIKE '%Inner Fire%' THEN REPLACE(musics.music_name, "Inner Fire", "Project")
    WHEN musics.music_name LIKE '%Silly%' THEN REPLACE(musics.music_name, "Silly", "Nice")
    WHEN musics.music_name LIKE '%Circus%' THEN REPLACE(musics.music_name, "Circus", "Pull Request")
    ELSE musics.music_name
  END AS novo_nome
FROM
  musics
WHERE
  musics.music_name LIKE '%Streets%'
  OR musics.music_name LIKE '%Her Own%'
  OR musics.music_name LIKE '%Inner Fire%'
  OR musics.music_name LIKE '%Silly%'
  OR musics.music_name LIKE '%Circus%'
ORDER BY
  musics.music_name;