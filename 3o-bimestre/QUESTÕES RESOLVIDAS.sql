# Liste todos os técnicos que são especialistas em notebooks

SELECT Nome
FROM Tecnicos
WHERE ID IN (
    SELECT TecnicoID
    FROM PreAtendimentos
    WHERE Problema LIKE '%notebook%'
);

# Liste todos os serviços que um usuário já fez

SELECT p.Problema, p.Valor
FROM PreAtendimentos p
WHERE p.ClienteID = <ID_DO_CLIENTE>; # O <ID_DO_CLIENTE> DEVE SER ALTERADO DE ACORDO COM OS DADOS DO BANCO! 

# Liste todos os técnicos na região de rio largo

SELECT Nome
FROM Tecnicos
WHERE Endereco LIKE '%Rio Largo%';

# Ordene os técnicos que realizam formatação pelo valor do serviço em ordem ascendente

SELECT T.Nome, P.Valor
FROM Tecnicos T
JOIN PreAtendimentos P ON T.ID = P.TecnicoID
WHERE P.Problema LIKE '%formatação%'
ORDER BY P.Valor ASC;

# Liste todos os serviços e valores oferecidos por um técnico especifico

SELECT Problema, Valor
FROM PreAtendimentos
WHERE TecnicoID = <ID_DO_TECNICO>; # O <ID_DO_TECNICO> DEVE SER ALTERADO DE ACORDO COM OS DADOS DO BANCO! 