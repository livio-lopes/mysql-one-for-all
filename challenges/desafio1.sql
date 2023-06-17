DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

-- Creating Table Planos
CREATE TABLE SpotifyClone.planos(
    id_plano INT AUTO_INCREMENT,
    plano VARCHAR(20) NOT NULL,
    valor_plano DOUBLE NOT NULL,
    CONSTRAINT PRIMARY KEY (id_plano)
) engine = InnoDB;

-- Inserting data on Planos
  INSERT INTO SpotifyClone.planos(plano, valor_plano)
  VALUES
  ('gratuito', 0),
  ('universitário', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);
    
-- Creating table artistas
CREATE TABLE SpotifyClone.artistas(
    id_artista INT AUTO_INCREMENT,
    artista VARCHAR(50),
    CONSTRAINT PRIMARY KEY (id_artista)
) engine = InnoDB;

-- Inserting data on artistas
  INSERT INTO SpotifyClone.artistas(artista)
  VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');
  
  -- Creating table albums
CREATE TABLE SpotifyClone.albums(
    id_album INT AUTO_INCREMENT,
    album VARCHAR(50),	
	id_artista INT NOT NULL,
    ano_lancamento YEAR,
	FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artistas (id_artista),
    CONSTRAINT PRIMARY KEY (id_album)
) engine = InnoDB;

-- Inserting data on albums
 INSERT INTO SpotifyClone.albums(album, id_artista, ano_lancamento)
 VALUES
('Renaissance', 1,2022),
('Jazz', 2, 1978),
('Hot Space', 2, 1982),
('Falso Brilhante', 3, 1998),
('Vento de Maio', 3, 2001),
('QVVJFA?', 4, 2003),
('Somewhere Far Beyond', 5, 2007),
('I Put A Spell On You', 6, 2012);

-- Creating table usuarios
CREATE TABLE SpotifyClone.usuarios(
	id_pessoa_usuaria INT AUTO_INCREMENT,
    nome_pessoa_usuaria VARCHAR(50) NOT NULL,
    idade TINYINT NOT NULL,
    id_plano INT NOT NULL,
    data_assinatura DATE NOT NULL,
    CONSTRAINT PRIMARY KEY (id_pessoa_usuaria),
    FOREIGN KEY (id_plano) REFERENCES planos (id_plano)

) engine = InnoDB;

-- Inserting data on usuarios
INSERT INTO SpotifyClone.usuarios(nome_pessoa_usuaria, idade, id_plano, data_assinatura)
VALUES
('Barbara Liskov', 82, 1, '2019-10-20'),
('Robert Cecil Martin', 58, 1, '2017-01-06'),
('Ada Lovelace', 37, 4, '2017-12-30'),
('Martin Fowler', 46, 4, '2017-01-17'),
('Sandi Metz',58, 4, '2018-04-29'),
('Paulo Freire', 19, 2, '2018-02-14'),
('Bell Hooks', 26, 2, '2018-01-05'),
('Christopher Alexander', 85, 3, '2019-06-05'),
('Judith Butler', 45, 3, '2020-05-13'),
('Jorge Amado', 58	, 3, '2017-02-17');
    
-- Creating table cancoes
CREATE TABLE SpotifyClone.cancoes(
	id_cancao INT AUTO_INCREMENT,
	id_album INT NOT NULL,
    cancao VARCHAR(100) NOT NULL,
    duracao_segundos INT NOT NULL,
	CONSTRAINT PRIMARY KEY (id_cancao),
    FOREIGN KEY (id_album) REFERENCES SpotifyClone.albums (id_album)
) engine = InnoDB;

-- Inserting data on cancoes
INSERT INTO SpotifyClone.cancoes(id_album, cancao, duracao_segundos)
VALUES
(1,'BREAK MY SOUL',279),
(1,"VIRGOR'S GROOVE", 369),
(1,'ALIEN SUPERSTAR',116),
(2,"Don't Stop Me Now",203),
(3,'Under Pressure',152),
(4, 'Como Nossos Pais',105),
(5, "O Medo de Amar é o Medo de Ser Livre",207),
(6, 'Samba em Paris', 267),
(7, "The Bard's Song", 244),
(8, 'Feeling Good', 100);

-- Creating table seguidores
CREATE TABLE SpotifyClone.seguidores(
	id_artista INT NOT NULL,
    id_pessoa_usuaria INT NOT NULL,
	CONSTRAINT PRIMARY KEY(id_pessoa_usuaria, id_artista),
	FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artistas (id_artista),
    FOREIGN KEY (id_pessoa_usuaria) REFERENCES SpotifyClone.usuarios (id_pessoa_usuaria)

) engine = InnoDB;

INSERT INTO SpotifyClone.seguidores(id_pessoa_usuaria, id_artista)
VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,3),
(3,2),
(4,4),
(5,5),
(5,6),
(6,6),
(6,1),
(7,6),
(9,3),
(10,2);

-- Creating table reproducoes
CREATE TABLE SpotifyClone.reproducoes(
id_pessoa_usuaria INT NOT NULL,
id_cancao INT NOT NULL,
data_reproducao DATETIME NOT NULL,
CONSTRAINT PRIMARY KEY (id_pessoa_usuaria, id_cancao),
FOREIGN KEY (id_cancao) REFERENCES SpotifyClone.cancoes (id_cancao),
FOREIGN KEY (id_pessoa_usuaria) REFERENCES SpotifyClone.usuarios (id_pessoa_usuaria)
) engine = InnoDB;
-- Inserting data on reproducoes
INSERT INTO SpotifyClone.reproducoes(id_pessoa_usuaria, id_cancao, data_reproducao)
VALUES
(1, 8,"2022-02-28 10:45:55"),
(1, 2,"2020-05-02 05:30:35"),
(1, 10,"2020-03-06 11:22:33"),
(2, 10,"2022-08-05 08:05:17"),
(2, 7,"2020-01-02 07:40:33"),
(3, 10, "2020-11-13 16:55:13"),
(3, 2, "2020-12-05 18:38:30"),
(4, 8, "2021-08-15 17:10:10"),
(5, 8, "2022-01-09 01:44:33"),
(5, 5, "2020-08-06 15:23:43"),
(6, 7, "2017-01-24 00:31:17"),
(6, 1 , "2017-10-12 12:35:20"),
(7,4, "2011-12-15 22:30:49"),
(8,4, "2012-03-17 14:56:41"),
(9,9, "2022-02-24 21:14:22"),
(10,3, "2015-12-13 08:30:22");