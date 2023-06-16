SELECT
	users.nome_pessoa_usuaria AS pessoa_usuaria,
    COUNT(play.id_cancao) AS musicas_ouvidas,
    ROUND(SUM(songs.duracao_segundos)/60,2) AS total_minutos
FROM SpotifyClone.usuarios AS users
INNER JOIN SpotifyClone.reproducoes AS play ON users.id_pessoa_usuaria = play.id_pessoa_usuaria
INNER JOIN SpotifyClone.cancoes AS songs ON songs.id_cancao = play.id_cancao
GROUP BY users.nome_pessoa_usuaria
ORDER BY users.nome_pessoa_usuaria;
 