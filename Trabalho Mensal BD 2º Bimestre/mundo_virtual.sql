CREATE DATABASE mundo_virtual;
USE mundo_virtual;
CREATE TABLE tecnico (
  id_tecnico INT PRIMARY KEY,
  nome VARCHAR(100),
  senha VARCHAR(100),
  telefone VARCHAR(20),
  endereco VARCHAR(200),
  email VARCHAR(100),
  cpf VARCHAR(14)
);
CREATE TABLE cliente (
  id_cliente INT PRIMARY KEY,
  nome VARCHAR(100),
  telefone VARCHAR(20),
  email VARCHAR(100)
);
CREATE TABLE tecnico_cliente (
	FK_id_tecnico INT,
	FK_cpf VARCHAR(14),
	FK_id_cliente INT, 
    PRIMARY KEY (FK_id_cliente, FK_cpf, FK_id_tecnico)
);

INSERT INTO tecnico (id_tecnico, nome, senha, telefone, endereco, email, cpf)

VALUES (123, 'Matheus Máximo', 'nessa', '4002-8922', 'Rua Das Lágrimas', 'matheusmáximo29@gmail.com', '123.456.789-01'),
	   (643, 'Irineu Abreu', 'nossa', '2402-2354', 'Rua Do Amor', 'irineu35@gmail.com', '153.643.342-01'),
       (532, 'Orn Uivu', 'nisso', '5452-6657', 'Rua Da Lealdade', 'orn99@gmail.com', '231.546.754-01');

INSERT INTO cliente (id_cliente, nome, telefone, email)

VALUES (982, 'Arthur Jonas', '8345-0190', 'arthur82@gmail.com'),
	   (213, 'Uilmo Aine', '4321-2532', 'uilmo53@gmail.com'),
       (432, 'None Jaime', '1234-5322', 'none235@gmail.com');
       
INSERT INTO tecnico_cliente (FK_id_tecnico, FK_cpf, FK_id_cliente) 

VALUES (643, '153.643.342-01', 432);
