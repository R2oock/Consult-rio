CREATE DATABASE db_loja_de_cd;
use  db_loja_de_cd;

-- Criação da tabela Cliente
CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereço VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(100)
);

-- Criação da tabela Categoria
CREATE TABLE Categoria (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100)
);

-- Criação da tabela Filme
CREATE TABLE Filme (
    ID_Filme INT AUTO_INCREMENT PRIMARY KEY,
    Título VARCHAR(255),
    Ano INT,
    Diretor VARCHAR(100),
    ID_Categoria INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria)
);

-- Criação da tabela CD
CREATE TABLE CD (
    ID_CD INT AUTO_INCREMENT PRIMARY KEY,
    Código_Barras VARCHAR(50),
    ID_Filme INT,
    Preço DECIMAL(10, 2),
    FOREIGN KEY (ID_Filme) REFERENCES Filme(ID_Filme)
);

-- Criação da tabela Pedido
CREATE TABLE Pedido (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Criação da tabela ItemPedido
CREATE TABLE ItemPedido (
    ID_ItemPedido INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT,
    ID_CD INT,
    Quantidade INT,
    Preço_Unitário DECIMAL(10, 2),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_CD) REFERENCES CD(ID_CD)
);

-- Inserção de dados na tabela Cliente
INSERT INTO Cliente (Nome, Endereço, Telefone, Email) VALUES
('João Silva', 'Rua A, 123', '1111-1111', 'joao@example.com'),
('Maria Souza', 'Rua B, 456', '2222-2222', 'maria@example.com');

-- Inserção de dados na tabela Categoria
INSERT INTO Categoria (Nome) VALUES
('Ação'),
('Comédia');

-- Inserção de dados na tabela Filme
INSERT INTO Filme (Título, Ano, Diretor, ID_Categoria) VALUES
('Filme Ação 1', 2020, 'Diretor A', 1),
('Filme Comédia 1', 2019, 'Diretor B', 2);

-- Inserção de dados na tabela CD
INSERT INTO CD (Código_Barras, ID_Filme, Preço) VALUES
('1234567890123', 1, 29.90),
('9876543210987', 2, 19.90);

-- Inserção de dados na tabela Pedido
INSERT INTO Pedido (Data, ID_Cliente) VALUES
('2024-06-27', 1),
('2024-06-28', 2);

-- Inserção de dados na tabela ItemPedido
INSERT INTO ItemPedido (ID_Pedido, ID_CD, Quantidade, Preço_Unitário) VALUES
(1, 1, 1, 29.90),
(2, 2, 2, 19.90);

SELECT
    Pedido.ID_Pedido,
    Pedido.Data,
    Cliente.Nome AS Nome_Cliente,
    Cliente.Email
FROM
    Pedido
INNER JOIN
    Cliente ON Pedido.ID_Cliente = Cliente.ID_Cliente;
    
SELECT
    Pedido.ID_Pedido,
    Pedido.Data,
    ItemPedido.Quantidade,
    ItemPedido.Preço_Unitário,
    CD.Código_Barras,
    CD.Preço AS Preço_CD
FROM
    ItemPedido
INNER JOIN
    Pedido ON ItemPedido.ID_Pedido = Pedido.ID_Pedido
INNER JOIN
    CD ON ItemPedido.ID_CD = CD.ID_CD;



