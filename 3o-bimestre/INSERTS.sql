-- Inserir dados de clientes
INSERT INTO Clientes (Nome, Email, Senha) VALUES
    ('William Jonas de Andrade Silva', 'willjonas@gmail.com', 'senha123'),
    ('Carla Maria da Sila Peixoto', 'carlamaria@gmail.com', 'senha456'),
    ('Ana Beatriz Magdalena', 'anabeatriz@gmail.com', 'senha789');

-- Inserir dados de técnicos
INSERT INTO Tecnicos (Nome, Telefone, CPF, Endereco, Email, Senha) VALUES
    ('Ricardo Ribeiro', '9999-9999', '123.456.789-01', 'Rio Largo, 123', 'ricardoribeiro@gmail.com', 'tec123'),
    ('Ana Souza', '1919-1919', '987.654.321-02', 'Avenida Principal, 456', 'ana@gmail.com', 'tec456');

-- Inserir dados de agendamentos
INSERT INTO Agendamentos (ClienteID, DataHora) VALUES
    (1, '2023-10-15 10:00:00'),
    (2, '2023-10-16 15:30:00'),
    (1, '2023-10-18 14:00:00');

-- Inserir dados de localizações
INSERT INTO Localizacoes (ClienteID, CEP, Bairro) VALUES
    (1, '12345-678', 'Centro'),
    (2, '98765-432', 'Bairro A'),
    (3, '54321-678', 'Bairro B');

-- Inserir dados de pré-atendimentos
INSERT INTO PreAtendimentos (ClienteID, TecnicoID, Problema, Valor) VALUES
    (1, 1, 'Formatação no computador Intel', 150.00),
    (2, 2, 'Formatação no notebook HP', 80.00),
    (3, 1, 'Problema no notebook Dell', 120.00);

-- Inserir dados de avaliações
INSERT INTO Avaliacoes (ClienteID, TecnicoID, Nota, Comentario) VALUES
    (1, 1, 5, 'Vocês estão de parabénes, foram além das minhas expectivas.'),
    (2, 2, 5, 'Melhor serviço que existe :)'),
    (3, 1, 5, 'Ótimo atendimento, funcionários prestativos e atenciosos, parabéns!');