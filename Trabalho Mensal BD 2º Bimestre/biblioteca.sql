create database biblioteca;
use biblioteca;
CREATE TABLE Autores (
    id_autor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento VARCHAR(50),
    nacionalidade VARCHAR(50)
);

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_autor INT,
    id_categoria INT,
    ano_publicacao INT,
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

INSERT INTO Autores (id_autor, nome, data_nascimento, nacionalidade)

VALUES (321, 'Lautaro Real', '21/02/1940', 'frânces'),
	   (532, 'Harry Kane', '02/11/1945', 'inglês'),
       (987, 'Luca Changretta', '14/06/1943', 'italiano');
 
 
 INSERT INTO Categorias (id_categoria, nome)

VALUES (865, 'Romance'),
	   (658, 'Mistério'),
       (736, 'Aventura');


INSERT INTO Livros (id_livro, titulo, id_autor, id_categoria, ano_publicacao)

VALUES (634, 'Adoremecida', 321, 865, 1999),
	   (264, 'Beija-flor', 532, 736, 1980),
       (900, 'Uma Noite', 987, 658, 1979),
       (805, 'A Rua da casa espelhada', 321, 658, 2000),
	   (679, 'Do outro lado', 532, 736, 1982),
       (404, 'Coração em chamas', 987, 865, 2001);
       
ALTER TABLE Livros
ADD COLUMN editora VARCHAR (100); 

ALTER TABLE Livros
DROP COLUMN ano_publicacao;

UPDATE Livros
Set id_autor = 532

Where id_autor = 321;


ALTER TABLE Livros
ADD COLUMN ano_publicacao INT;


UPDATE Livros
SET ano_publicacao = 2023
WHERE id_categoria = 865;


DELETE FROM Livros
WHERE id_livro = 805;
