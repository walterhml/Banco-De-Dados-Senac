-- 0 INICIANDO A TRASAÇÃO
START TRANSACTION;

-- 1 INSERINDO UM NOVO PEDIDO
INSERT INTO pedido (clienteid, dataPedido) VALUES (1, '2024-03-12');
SET @novoPedidoID = last_insert_id();

-- 2 inserindo os itens do pedido
INSERT INTO itenspedido (pedidoId, produtoId, quantidade) VALUES (13, 4, 6);

-- 3 atualizando a quantidade do produto no estoque
UPDATE produto SET quantidade = quantidade - 6 WHERE ID = 4;

-- DESFAZENDO A TRANSAÇÃO
COMMIT;