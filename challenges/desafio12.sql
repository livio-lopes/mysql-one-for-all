SELECT art.artista,
	CASE
		WHEN COUNT(fav.id_cancao) >= 5 THEN "A"
        WHEN COUNT(fav.id_cancao) BETWEEN 3 AND 4 THEN 'B'
        WHEN COUNT(fav.id_cancao) BETWEEN 1 AND 2 THEN 'C'
		ELSE '-'
	END AS ranking
FROM SpotifyClone.cancoes_favoritas AS fav
INNER JOIN SpotifyClone.cancoes AS songs ON fav.id_cancao = songs.id_cancao
INNER JOIN SpotifyClone.albums AS alb ON alb.id_album = songs.id_album
RIGHT JOIN SpotifyClone.artistas AS art ON alb.id_artista = art.id_artista
GROUP BY art.artista
ORDER BY IF(ranking = '-', 'z', ranking), artista;