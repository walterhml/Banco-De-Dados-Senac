-- SELECT COM CONTAGEM TOTAL DE REGISTROS
SELECT COUNT(*) AS Total_Pedidos
FROM pedido;

-- SELECT TUDO DA TABELA X
SELECT * FROM pedido;
 
SELECT DISTINCT ClienteID, dataPedido
FROM pedido;

-- SELECT QUANTOS PEDIDOS CADA CLIENTE FEZ

SELECT ClienteID, COUNT(*)
FROM pedido
GROUP BY ClienteID;

-- SELECIONAR O TOTAL DE PRODUTOS POR PEDIDO
SELECT pedidoid, count(*) as produtoPorPedido
from itenspedido
group by pedidoid;


-- SELECIONAR PRODUTOS MAIS VENDIDOS
SELECT produtoid, SUM(quantidade) as MaisVendidos
FROM ITENSPEDIDO
group by produtoid
order by MaisVendidos desc;

-- liste os clientes informando: 
-- total gasto, media de produtos, data do primeiro e ultimo pedido

SELECT pedido.clienteId, COUNT(*) AS NumPedidos,
 SUM(produto.preco * itenspedido.quantidade) AS TotalGasto,
 AVG(itenspedido.quantidade) AS MediaProdutosPorPedido,
 MIN(pedido.dataPedido) AS PRIMEIRO_PEDIDO,
 MAX(pedido.dataPedido) AS ULTIMO_PEDIDO
FROM pedido
JOIN itenspedido ON pedido.id = itenspedido.pedidoId
JOIN produto ON itenspedido.produtoId = produto.id

GROUP BY pedido.clienteId;





