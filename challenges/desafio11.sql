SELECT COUNT(fav.id_cancao) AS favoritadas, alb.album AS album FROM SpotifyClone.cancoes_favoritas AS fav
INNER JOIN SpotifyClone.cancoes AS songs ON fav.id_cancao = songs.id_cancao
INNER JOIN SpotifyClone.albums AS alb ON songs.id_album = alb.id_album
GROUP BY alb.album
ORDER BY favoritadas DESC, album LIMIT 3;