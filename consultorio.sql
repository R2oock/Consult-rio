/* criar Banco de dados */
create database db_consultorio;
use db_consultorio;

-- Criação da tabela Aluno
CREATE TABLE Aluno (
    ID_Aluno INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Data_de_Nascimento DATE,
    Endereço VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(100)
);

-- Criação da tabela Professor
CREATE TABLE Professor (
    ID_Professor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Especialidade VARCHAR(100),
    Telefone VARCHAR(20),
    Email VARCHAR(100)
);

-- Criação da tabela Curso
CREATE TABLE Curso (
    ID_Curso INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Descrição TEXT,
    Carga_Horária INT
);

-- Criação da tabela Turma
CREATE TABLE Turma (
    ID_Turma INT AUTO_INCREMENT PRIMARY KEY,
    ID_Curso INT,
    ID_Professor INT,
    Data_Início DATE,
    Data_Término DATE,
    Horário VARCHAR(50),
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso),
    FOREIGN KEY (ID_Professor) REFERENCES Professor(ID_Professor)
);

-- Criação da tabela Matricula
CREATE TABLE Matricula (
    ID_Aluno INT,
    ID_Turma INT,
    Data_Matricula DATE,
    PRIMARY KEY (ID_Aluno, ID_Turma),
    FOREIGN KEY (ID_Aluno) REFERENCES Aluno(ID_Aluno),
    FOREIGN KEY (ID_Turma) REFERENCES Turma(ID_Turma)
);

-- Inserindo dados na tabela Aluno
INSERT INTO Aluno (Nome, Data_de_Nascimento, Endereço, Telefone, Email) VALUES
('Maria Silva', '1995-05-20', 'Rua A, 123', '123456789', 'maria@example.com'),
('João Pereira', '1990-02-15', 'Rua B, 456', '987654321', 'joao@example.com'),
('Ana Souza', '1988-11-30', 'Rua C, 789', '456789123', 'ana@example.com'),
('Carlos Lima', '1992-08-25', 'Rua D, 101', '789123456', 'carlos@example.com'),
('Beatriz Santos', '1997-12-10', 'Rua E, 202', '321654987', 'beatriz@example.com');

-- Inserindo dados na tabela Professor
INSERT INTO Professor (Nome, Especialidade, Telefone, Email) VALUES
('Fernanda Costa', 'Inglês', '123123123', 'fernanda@example.com'),
('Ricardo Oliveira', 'Espanhol', '321321321', 'ricardo@example.com'),
('Patrícia Almeida', 'Francês', '456456456', 'patricia@example.com'),
('Marcos Gonçalves', 'Alemão', '654654654', 'marcos@example.com'),
('Juliana Ribeiro', 'Italiano', '789789789', 'juliana@example.com');

-- Inserindo dados na tabela Curso
INSERT INTO Curso (Nome, Descrição, Carga_Horária) VALUES
('Inglês Básico', 'Curso de Inglês para iniciantes', 40),
('Espanhol Intermediário', 'Curso de Espanhol nível intermediário', 60),
('Francês Avançado', 'Curso de Francês avançado', 80),
('Alemão para Negócios', 'Curso de Alemão focado em negócios', 50),
('Italiano Conversação', 'Curso de conversação em Italiano', 45);

-- Inserindo dados na tabela Turma
INSERT INTO Turma (ID_Curso, ID_Professor, Data_Início, Data_Término, Horário) VALUES
(1, 1, '2023-07-01', '2023-09-01', '18:00-20:00'),
(2, 2, '2023-07-15', '2023-10-15', '19:00-21:00'),
(3, 3, '2023-08-01', '2023-11-01', '17:00-19:00'),
(4, 4, '2023-09-01', '2023-12-01', '20:00-22:00'),
(5, 5, '2023-09-15', '2023-12-15', '18:30-20:30');

-- Inserindo dados na tabela Matricula
INSERT INTO Matricula (ID_Aluno, ID_Turma, Data_Matricula) VALUES
(1, 1, '2023-06-01'),
(2, 2, '2023-06-15'),
(3, 3, '2023-07-01'),
(4, 4, '2023-07-15'),
(5, 5, '2023-08-01');


SELECT 
    Aluno.Nome AS Nome_Aluno, 
    Curso.Nome AS Nome_Curso, 
    Turma.Horário AS Horário_Turma, 
    Matricula.Data_Matricula
FROM 
    Matricula
JOIN 
    Aluno ON Matricula.ID_Aluno = Aluno.ID_Aluno
JOIN 
    Turma ON Matricula.ID_Turma = Turma.ID_Turma
JOIN 
    Curso ON Turma.ID_Curso = Curso.ID_Curso;
    
    








