SELECT
	art.artista,
    alb.album,
    COUNT(follow.id_artista) AS pessoas_seguidoras
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.albums AS alb ON art.id_artista = alb.id_artista
INNER JOIN SpotifyClone.seguidores AS follow ON art.id_artista = follow.id_artista
GROUP BY art.artista, alb.album
ORDER BY pessoas_seguidoras DESC, art.artista, alb.album;