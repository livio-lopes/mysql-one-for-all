SELECT 
	cancao,
    (SELECT COUNT(id_cancao) FROM SpotifyClone.reproducoes AS play
		WHERE play.id_cancao = songs.id_cancao
    ) AS reproducoes
FROM SpotifyClone.cancoes AS songs
ORDER BY reproducoes DESC, cancao LIMIT 2;