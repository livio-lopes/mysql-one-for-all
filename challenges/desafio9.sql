SELECT COUNT(play.id_cancao) AS musicas_no_historico FROM SpotifyClone.reproducoes AS play
INNER JOIN SpotifyClone.usuarios AS users ON play.id_pessoa_usuaria = users.id_pessoa_usuaria
WHERE users.nome_pessoa_usuaria = "Barbara Liskov";