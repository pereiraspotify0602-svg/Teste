CREATE DATABASE IF NOT EXISTS gestao_torneios;
USE gestao_torneios;

CREATE TABLE Equipas (
	ID_Equipa INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Equipa VARCHAR(100) NOT NULL,
    Data_Criacao DATE NOT NULL
);

CREATE TABLE Jogadores (
	ID_Jogador INT AUTO_INCREMENT PRIMARY KEY,
	Nome VARCHAR(100) NOT NULL,
	Nickname VARCHAR(50) NOT NULL,
	Data_Nascimento DATE NOT NULL,
	ID_Equipa INT NOT NULL,
	FOREIGN KEY (ID_Equipa)
		REFERENCES Equipas(ID_Equipa)
);

CREATE TABLE Torneios (
	ID_Torneio INT AUTO_INCREMENT PRIMARY KEY,
	Nome VARCHAR(100) NOT NULL,
	Data_Inicio DATE NOT NULL,
	Premio_Monetario DECIMAL(10,2)NOT NULL,
	CHECK (Premio_Monetario >= 0)
);

CREATE TABLE Participacoes (
	ID_Equipa INT NOT NULL,
	ID_Torneio INT NOT NULL,
	PRIMARY KEY (ID_Equipa, ID_Torneio),
	FOREIGN KEY (ID_Equipa)
	REFERENCES Equipas(ID_Equipa),
	FOREIGN KEY (ID_Torneio)
	REFERENCES Torneios(ID_Torneio)
);

INSERT INTO Equipas (ID_Equipa, Nome_Equipa, Data_Criacao) VALUES  
('1', 'Tots Time', '2000-12-13'),
('2', 'GDC Time', '2000-12-13');

INSERT INTO Jogadores (Nome, Nickname, Data_Nascimento, ID_Equipa) VALUES
('Rodrigo', 'Pereirots', '2008-12-13', '1'),
('Tomas', 'Tomazoto', '2008-09-24', '2');

INSERT INTO Torneios (ID_Torneio, Nome, Data_Inicio, Premio_Monetario) VALUES
('1', 'Torneio Campo', '2026-11-07', '67'),
('2', 'FNCS Fortnite', '2026-11-08', '670'),
('3', 'Major CS', '2026-11-09', '76');

SELECT * FROM Jogadores ORDER BY Nome ASC;

SELECT j.Nome AS Nome_Jogador, e.Nome_Equipa FROM Jogadores j JOIN Equipas e ON j.ID_Equipa = e.ID_Equipa;

SELECT e.Nome_Equipa FROM Equipas e JOIN Participacoes p ON e.ID_Equipa = p.ID_Equipa JOIN Torneios t ON p.ID_Torneio = t.ID_Torneio WHERE t.Nome = 'Torneio Campo';

SELECT e.Nome_Equipa, COUNT(j.ID_Jogador) AS Total_Jogadores FROM Equipas e JOIN Jogadores j ON e.ID_Equipa = j.ID_Equipa GROUP BY e.ID_Equipa, e.Nome_Equipa HAVING COUNT(j.ID_Jogador) > 1;

SELECT e.Nome_Equipa, COUNT(j.ID_Jogador) AS Total_Jogadores FROM Equipas e LEFT JOIN Jogadores j ON e.ID_Equipa = j.ID_Equipa GROUP BY e.ID_Equipa, e.Nome_Equipa ORDER BY Total_Jogadores DESC;

SELECT t.Nome AS Nome_Torneio, t.Premio_Monetario, COUNT(p.ID_Equipa) AS Total_Equipas FROM Torneios t JOIN Participacoes p ON t.ID_Torneio = p.ID_Torneio GROUP BY t.ID_Torneio, t.Nome, t.Premio_Monetario;