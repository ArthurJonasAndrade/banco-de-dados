# Recupera os detalhes do técnico para um determinado ID do técnico:
SELECT * FROM tecnico WHERE id_tecnico = 123;
-------------------------------------------------------------------------------
# Recupera os detalhes do cliente para um determinado ID do cliente:
SELECT * FROM cliente WHERE id_cliente = 982;
-------------------------------------------------------------------------------
# Recupere o técnico atribuído a um cliente específico:
SELECT t.* FROM tecnico t
JOIN tecnico_cliente tc ON t.id_tecnico = tc.FK_id_tecnico
WHERE tc.FK_id_cliente = 982;
-------------------------------------------------------------------------------
# Recupere todos os clientes associados a um técnico específico:
SELECT c.* FROM cliente c
JOIN tecnico_cliente tc ON c.id_cliente = tc.FK_id_cliente
WHERE tc.FK_id_tecnico = 643;
---------------------------------------------------------------------------------
# Recupere a contagem de técnicos:
SELECT COUNT(*) AS technician_count FROM tecnico;
---------------------------------------------------------------------------------
# Recupere a contagem de clientes:
SELECT COUNT(*) AS client_count FROM cliente;
---------------------------------------------------------------------------------
# Recupere o número médio de clientes por técnico:
SELECT AVG(client_count) AS average_clients_per_technician
FROM (
  SELECT COUNT(FK_id_cliente) AS client_count
  FROM tecnico_cliente
  GROUP BY FK_id_tecnico
) AS subquery;
---------------------------------------------------------------------------------
# Recupera os técnicos com nomes começando com 'M':
SELECT * FROM tecnico WHERE nome LIKE 'M%';
----------------------------------------------------------------------------------
# Recupere os clientes com nomes contendo 'a' e 'r':
SELECT * FROM cliente WHERE nome LIKE '%a%' AND nome LIKE '%r%';
-------------------------------------------------------------------------------------
# Recupere os técnicos e seus clientes em ordem alfabética:
SELECT t.nome AS technician_name, c.nome AS client_name
FROM tecnico t
JOIN tecnico_cliente tc ON t.id_tecnico = tc.FK_id_tecnico
JOIN cliente c ON tc.FK_id_cliente = c.id_cliente
ORDER BY t.nome, c.nome;
-------------------------------------------------------------------------------------
# Recupera os técnicos e o número de clientes atribuídos a eles:
SELECT t.nome AS technician_name, COUNT(tc.FK_id_cliente) AS client_count
FROM tecnico t
LEFT JOIN tecnico_cliente tc ON t.id_tecnico = tc.FK_id_tecnico
GROUP BY t.nome;
--------------------------------------------------------------------------------------
# Recupera os clientes que têm técnicos atribuídos a eles:
SELECT c.nome AS client_name, t.nome AS technician_name
FROM cliente c
JOIN tecnico_cliente tc ON c.id_cliente = tc.FK_id_cliente
JOIN tecnico t ON tc.FK_id_tecnico = t.id_tecnico;
---------------------------------------------------------------------------------------
# Recupera os clientes que não têm nenhum técnico atribuído a eles:
SELECT c.nome AS client_name
FROM cliente c
LEFT JOIN tecnico_cliente tc ON c.id_cliente = tc.FK_id_cliente
WHERE tc.FK_id_cliente IS NULL;
-------------------------------------------------------------------------------------------
# Recupera os clientes e seus técnicos que possuem o mesmo endereço:
SELECT c.nome AS client_name, c.endereco AS client_address, t.nome AS technician_name, t.endereco AS technician_address
FROM cliente c
JOIN tecnico_cliente tc ON c.id_cliente = tc.FK_id_cliente
JOIN tecnico t ON tc.FK_id_tecnico = t.id_tecnico
WHERE c.endereco = t.endereco;