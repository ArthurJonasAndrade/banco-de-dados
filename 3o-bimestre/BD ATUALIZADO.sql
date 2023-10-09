-- Criação do banco de dados "MundoVirtual"
CREATE DATABASE MundoVirtual;
USE MundoVirtual;

-- Tabela para armazenar informações dos clientes
CREATE TABLE Clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL
);

-- Tabela para armazenar informações dos técnicos
CREATE TABLE Tecnicos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    Endereco VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL
);

-- Tabela para agendamento de atendimentos
CREATE TABLE Agendamentos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataHora DATETIME NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

-- Tabela para adicionar informações de localização
CREATE TABLE Localizacoes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    CEP VARCHAR(10),
    Bairro VARCHAR(255),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

-- Tabela para pré-atendimentos
CREATE TABLE PreAtendimentos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    TecnicoID INT,
    Problema VARCHAR(255),
    Valor DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID),
    FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(ID)
);

-- Tabela para avaliações
CREATE TABLE Avaliacoes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    TecnicoID INT,
    Nota INT,
    Comentario TEXT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID),
    FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(ID)
);
