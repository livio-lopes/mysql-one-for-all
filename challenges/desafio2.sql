SELECT 
	COUNT(DISTINCT cancao) AS cancoes,
	COUNT(DISTINCT artista) AS artistas,
    COUNT(DISTINCT album) AS albuns

FROM
	SpotifyClone.cancoes,
    SpotifyClone.albums,
    SpotifyClone.artistas;