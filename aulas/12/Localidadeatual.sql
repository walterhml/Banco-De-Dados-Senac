-- CRIAÇÃO E USO DO SCHEMA (BD)
CREATE SCHEMA IF NOT EXISTS LOCALIDADES;
USE LOCALIDADES;

-- CRIAÇÃO DAS TABELAS
CREATE TABLE IF NOT EXISTS ESTADO (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sigla VARCHAR(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS CIDADE (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Estado_Id INT,
    FOREIGN KEY (Estado_ID) REFERENCES ESTADO(Id)
);

 USE localidades;
CREATE TABLE IF NOT EXISTS PREFEITO (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nome VARCHAR(50) NOT NULL,
DataPosse DATE
);

SELECT * FROM CIDADE;
SELECT * FROM ESTADO;

-- INSERÇÃO DE DADOS REAIS
INSERT INTO ESTADO (Nome, Sigla) VALUES
	('São Paulo', 'SP'),
    ('Rio de Janeiro', 'RJ'),
    ('Bahia', 'BA');

INSERT INTO CIDADE (Nome, Estado_ID) VALUES 
	('São Paulo', 1),
    ('Campinas', 1),
    ('Rio de Janeiro', 2),
    ('Niterói', 2),
    ('Salvador', 3),
    ('Fira de Santana', 3);
    
-- Inserção de Cidades Fictícias sem Estado
INSERT INTO CIDADE (Nome, Estado_ID) VALUES
	('Gotham City', NULL),
    ('Metropolis', NULL),
    ('Wonderland', NULL),
    ('Neverland', NULL);


ALTER TABLE CIDADE
ADD Prefeito_ID INT,
ADD FOREIGN KEY (Prefeito_ID) REFERENCES PREFEITO(id);




INSERT INTO PREFEITO (Nome, DataPosse) VALUES
	('Lula', '2001-01-01'),
    ('Luis Bolsonario', '2001-02-01'),
    ('Donald Trump', '2001-04-03'),
    ('barack obama', '2001-06-05'),
    ('João Doria', '2001-02-04'),
	('Waltinho souza', '2001-01-04'),
	('michel temer', '2001-07-06'),
	('Dilma Rousseff', '2001-01-02');


SELECT PREFEITO.Nome, CIDADE.Nome, ESTADO.Nome
FROM PREFEITO
INNER JOIN CIDADE ON CIDADE.Prefeito_ID = Prefeito.ID;


UPDATE CIDADE
SET Prefeito_ID = 9
WHERE Id = 2;

SELECT PREFEITO.Nome , CIDADE.Nome, Estado.Sigla
FROM CIDADE
INNER JOIN PREFEITO ON CIDADE.Prefeito_ID = PREFEITO.Id
INNER JOIN ESTADO ON CIDADE.estado_id = Estado.Id ;



-- -----------------------
-- Consultas SQL com JOINs
-- -----------------------














