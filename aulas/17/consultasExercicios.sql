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
where capacidade BETWEEN 4 AND 6
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
join cliente on hospedagem.codcliente = cliente.codcliente;item

-- Selecionar chalés com os itens associados
select *
from chale
join chale_item on chale_item.codchale = chale.codchale
join item on chale_item.nomeItem = item.nomeItem;
-- my version

-- versao professor
select *
from chale 
left join chale_item on chale.codChale = chale_item.codChale
left join item on chale_item.nomeItem = item.nomeItem;




-- Selecionar serviços utilizados em uma hospedagemservico
select * from hospedagem_servico;

select *
from hospedagem
join hospedagem_servico on hospedagem.codHospedagem = hospedagem_servico.codHospedagem
join servico on hospedagem.codhospedagem = hospedagem_servico.codHospedagem;


-- Consultar os clientes com seus telefones
select cliente.nomeCliente, telefone.codCliente, tipotelefone
from cliente
join telefone on cliente.codcliente = telefone.codcliente
where cliente.codcliente = telefone.codcliente;


-- Selecionar chalés ocupados em uma data específica
select *
from chale
join hospedagem on hospedagem.codchale = chale.codchale
where datainicio between "2024-03-07" and "2024-03-14";


-- version professor
select chale.*, hospedagem.dataInicio, hospedagem.dataFim
from chale
join hospedagem on chale.codChale = hospedagem.codChale
where '2024-03-2025' between hospedagem.dataInicio and hospedagem.dataFim;






