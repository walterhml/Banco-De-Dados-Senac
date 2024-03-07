-- Encontrar produtos com o preco entre 50 e 150 reais

select *
from produto
where preco >= 50 and preco <= 150;

SELECT *
FROM PRODUTO
WHERE PRECO BETWEEN 50 AND 150;


-- MOSTRE OS PRODUTOS COM ID 1, 5 E 7
SELECT *
FROM PRODUTO
where ID = 1 or ID = 5 or ID = 7;

SELECT *
FROM PRODUTO
WHERE ID IN (1, 5, 7);


-- mostre todos os clientes termine com "a".
select *
from cliente
where sobrenome like "%a";


-- mostre os 5 produtos mais caros da loja
select *
from produto
order by preco desc
limit 5;

-- listando os produtos por pagina, cada pagina cabendo 2 produtos, me mostre a pagina 3
select *
from produto
limit 2 offset 2;


-- consultar os pedidos feitos em 2024-03-01 e 2024-03-05
select *
from pedido
where dataPedido between "2024-03-01" and "2024-03-05"
limit 5