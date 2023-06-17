CREATE TABLE SpotifyClone.cancoes_favoritas(
	id_pessoa_usuaria INT NOT NULL,
    id_cancao INT NOT NULL,
    CONSTRAINT PRIMARY KEY(id_pessoa_usuaria, id_cancao),
    FOREIGN KEY (id_pessoa_usuaria) REFERENCES SpotifyClone.usuarios(id_pessoa_usuaria),
    FOREIGN KEY (id_cancao) REFERENCES SpotifyClone.cancoes(id_cancao)
) engine = InnoDB;
-- Inserting data on cancoes_favoritas
INSERT INTO SpotifyClone.cancoes_favoritas (id_pessoa_usuaria,id_cancao) VALUES
(1,3),
(1,6),
(1,10),
(2,4),
(3,1),
(3,3),
(4,7),
(4,4),
(5,10),
(5,2),
(8,4),
(9,7),
(10,3);