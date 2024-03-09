USE hotel;
 
-- Selecionar chales com media de capacidade superior a 3
SELECT codChale, AVG(capacidade) AS capacidade_media
FROM chale
GROUP BY codChale
HAVING capacidade_media > 3;
 
-- Selecione os clientes com ao menos uma hospedagem registrada
SELECT * FROM servico;  
 
SELECT codCliente, COUNT(*) AS qtd_hospedagens
FROM hospedagem
GROUP BY codCliente
HAVING qtd_hospedagens > 0; -- HAVING é sempre utilizado com GROUP BY
 
-- Selecionar serviços com valor total superior a 100
SELECT *
FROM servico
GROUP BY valorServico
HAVING valorServico > '20.00';

-- selecionar servicos com valor total superior a 40
SELECT hospedagem_servico.codHospedagem, SUM(servico.valorServico) AS total_valor
FROM hospedagem_servico
JOIN servico ON hospedagem_servico.codServico = servico.codServico
GROUP BY hospedagem_servico.codHospedagem
having total_valor > 40;


-- criar uma view
create view ViewMediaCapacidade as
select codchale, avg(capacidade) as media_capacidade
from chale
group by codChale;

-- crie uma view que informe aos dados da hospedagem, com os dados do cliente, incluindo o telefone

CREATE VIEW Viewhospedes AS
SELECT hospedagem.*, cliente.nomeCliente,telefone.telefone,telefone.tipoTelefone FROM hospedagem 
JOIN CLIENTE ON hospedagem.codCLiente = cliente.codCliente
JOIN TELEFONE ON telefone.codCliente = cliente.codCliente;
 
SELECT * FROM hospedes;

-- criar um indice na coluna codcliente da tabela telefone
CREATE INDEX idx_codcliente on telefone(codcliente);

select *
from telefone
order by codcliente desc



