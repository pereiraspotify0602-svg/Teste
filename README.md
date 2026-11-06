# Teste
O meu teste

1.Identifique as entidades presentes no sistema.

2. Identifique os atributos de cada entidade.
   
3. Identifique os relacionamentos e respetivas cardinalidades.
   
4. Identifique:
   a. Chaves primárias
   b. Chaves estrangeiras

5. Desenhe o esquema relacional no MySQL Workbench, garantindo:
   a. A representação de todas as tabelas. 
   b. A definição correta das chaves primárias e estrangeiras. 
   c. A representação dos relacionamentos e respetivas cardinalidades. 
   d. A escolha adequada dos tipos de dados. 

6. Execute o seguinte script SQL no MySQL Workbench para criar a base de dados gestao_torneios.

CREATE DATABASE IF NOT EXISTS gestao_torneios; 
USE gestao_torneios; 

-- Tabela Equipas 
CREATE TABLE Equipas ( 
  ID_Equipa INT AUTO_INCREMENT PRIMARY KEY, 
  Nome_Equipa VARCHAR(100) NOT NULL, 
  Data_Criacao DATE NOT NULL 
); 

-- Tabela Jogadores 
CREATE TABLE Jogadores ( 
  ID_Jogador INT AUTO_INCREMENT PRIMARY KEY, 
  Nome VARCHAR(100) NOT NULL, 
  Nickname VARCHAR(50) NOT NULL, 
  Data_Nascimento DATE NOT NULL, 
  ID_Equipa INT NOT NULL, 
  FOREIGN KEY (ID_Equipa) 
    REFERENCES Equipas(ID_Equipa) 
);

-- Tabela Torneios 
CREATE TABLE Torneios ( 
  ID_Torneio INT AUTO_INCREMENT PRIMARY KEY, 
  Nome VARCHAR(100) NOT NULL, 
  Data_Inicio DATE NOT NULL, 
  Premio_Monetario DECIMAL(10,2) NOT NULL, 
  CHECK (Premio_Monetario >= 0) 
); 

-- Tabela Participacoes 
CREATE TABLE Participacoes ( 
  ID_Equipa INT NOT NULL, 
  ID_Torneio INT NOT NULL, 
  PRIMARY KEY (ID_Equipa, ID_Torneio), 
  FOREIGN KEY (ID_Equipa) 
    REFERENCES Equipas(ID_Equipa), 
  FOREIGN KEY (ID_Torneio) 
    REFERENCES Torneios(ID_Torneio) 
); 

7.  Insira:
   a. 2 equipas; 
   b. 2 jogadores; 
   c. 3 torneios; 
   d. 4 participações.

 
8. Escreva as seguintes consultas SQL: 
   a. Listar todos os jogadores por ordem alfabética sem nomes repetidos.
   b. Apresentar o nome dos jogadores e a equipa a que pertencem.
   c. Listar todas as equipas que participam num determinado torneio (Exemplo: Liga Nacional).
   d. Apresente o número de jogadores existentes em cada equipa, considerando apenas as equipas com mais de 1 jogador.
   e. Apresente o nome de todas as equipas e o respetivo nº de jogadores, incluindo as equipas que ainda não possuem jogadores. Ordene os resultados por ordem decrescente do número de jogadores.
   f. Apresente o nome de cada torneio, o respetivo prémio monetário e o número de equipas participantes. Considere apenas os torneios com pelo menos uma equipa inscrita.
