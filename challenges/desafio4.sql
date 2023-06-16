SELECT
	users.nome_pessoa_usuaria AS pessoa_usuaria,
    IF(YEAR(MAX(play.data_reproducao)) >= 2021, 'Ativa', 'Inativa' ) AS status_pessoa_usuaria
FROM SpotifyClone.usuarios AS users
INNER JOIN SpotifyClone.reproducoes AS play ON users.id_pessoa_usuaria = play.id_pessoa_usuaria
GROUP BY users.nome_pessoa_usuaria
ORDER BY users.nome_pessoa_usuaria;