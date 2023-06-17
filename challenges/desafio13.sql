SELECT 
	CASE
		WHEN users.idade <=30  THEN "Até 30 anos"
        WHEN users.idade BETWEEN 31 AND 60 THEN "Entre 31 e 60 anos"
        WHEN users.idade > 60 THEN "Maior de 60 anos"
	END AS faixa_etaria,
    COUNT(DISTINCT users.id_pessoa_usuaria) AS total_pessoas_usuarias,
    COUNT(fav.id_cancao) AS total_favoritadas
FROM SpotifyClone.usuarios AS users
LEFT JOIN SpotifyClone.cancoes_favoritas AS fav ON users.id_pessoa_usuaria = fav.id_pessoa_usuaria
GROUP BY faixa_etaria
ORDER BY faixa_etaria;