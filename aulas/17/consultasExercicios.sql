# Consultas sem JOINS
-- Consulte todos os clientes de São Paulo (SP)
SELECT *
FROM CLIENTE
where estadoCliente = 'SP';


-- Selecionar hospedagens com mais de 3 pessoas e desconto igual a 0
SELECT *
FROM Hospedagem
WHERE qtdPessoas >= 3 and desconto = 0;


-- Selecionar telefones de clientes com ID 1 ou 2, limitando a 2 resultados
SELECT *
FROM TELEFONE
WHERE codcliente in (1, 2) 
limit 2;

-- Selecionar chalés com capacidades entre 4 e 6, ordenaos por valor em alta estação
select *
from chale
where capacidade in (4, 6)
order by valorBaixaEstacao;

-- Selecione todos os itens que contenham "de" na descrição, pulando os 2 primeiros resultados
select *
from item
where descricaoitem like '%de%'
limit 13 offset 2;

# Consultas com JOINS
-- Selecioar detalhes da hospedagem, incluindo informações do cliente
select *
from hospedagem
join cliente on hospedagem.codcliente = cliente.codcliente;

-- Selecionar chalés com os itens associados
select *
from chale
join chale_item on chale_item.codchale = chale.codchale
join item on chale_item.nomeItem = item.nomeItem;


select * from item
select * from chale_item
select * from chale
-- Selecionar serviços utilizados em uma hospedagem
select * from servico


select *
from hospedagem
join hospedagem_sevico on hospedagem_sevico.codhospedagem = hospedagem.codhospedagem
join servico on hospedagem.codhospedagem = sevico.codservico;

-- Consultar os clientes com seus telefones
select * from cliente;
select * from telefone;

select * 
from cliente
join telefone on cliente.codcliente = telefone.codcliente;

-- Selecionar chalés ocupados em uma data específica

select *
from chale
join hospedagem on hospedagem.codchale = chale.codchale
where datainicio between "2024-03-07" and "2024-03-14";
