################## DDL
-- 1. Crie uma tabela chamada Fornecedor para armazenar informações sobre os fornecedores do sistema.
-- id, nome, endereço, telefone, email e uma observação (text)
CREATE TABLE IF NOT EXISTS Fornecedor (
Id INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(50) NOT NULL,
Telefone INT(20) NOT NULL,
Email VARCHAR(100) NOT NULL,
Observacao TEXT
);

-- 2. Adicione uma coluna chamada CNPJ à tabela Fornecedor para armazenar os números de CNPJ dos fornecedores.
ALTER TABLE fornecedor
ADD COLUMN CNPJ INT(50);

-- 3. Adicione uma chave estrangeira à tabela Fornecedor para relacioná-la à tabela Categoria, representando a categoria do fornecedor.
ALTER TABLE fornecedor
ADD COLUMN categoriaId INT(11),
ADD FOREIGN KEY (categoriaId) REFERENCES categoria(Id);

-- 4. Modifique o tipo da coluna Telefone na tabela Fornecedor para armazenar números de telefone com no máximo 15 caracteres.
ALTER TABLE fornecedor
MODIFY column Telefone INT(15);


-- 5. Remova a coluna Observacao da tabela Fornecedor, pois não é mais necessária.
ALTER TABLE fornecedor
DROP COLUMN Observacao;

-- 6. Remova a tabela Fornecedor do banco de dados, se existir.
DROP TABLE fornecedor;

#################### DML
-- 0. Crie ao menos 5 registros para cada tabela, ignorando o gerneciamento de usuários. Um dos clientes deverá ter o seu nome
INSERT INTO Categoria (nome, descricao, UsuarioAtualizacao)
VALUES ('Tecnologia', 'Produtos e inovações tecnológicas', 1),
('Tecnologia', 'Produtos e inovações tecnológicas', 2),
('Esportes', 'Tudo sobre esportes variados', 3),
('Música', 'Gêneros, instrumentos e notícias sobre música', 4),
('Viagem', 'Dicas, destinos e experiências de viagens', 5);

INSERT INTO FormaPagamento (Nome, descricao, UsuarioAtualizacao) VALUES 
('Cartão de Crédito', 'Pagamento realizado por meio de cartões de crédito das principais bandeiras', 1),
('Boleto Bancário', 'Pagamento realizado por meio de boleto bancário emitido pelo vendedor', 2),
('PIX', 'Pagamento instantâneo utilizando chave PIX', 3),
('Transferência Bancária', 'Pagamento realizado por transferência entre contas bancárias', 4),
('Dinheiro', 'Pagamento realizado em espécie', 5);

INSERT INTO produto (Nome, descricao, Preco, CategoriaID, UsuarioAtualizacao)
VALUES ('Smartphone XYZ', 'Smartphone com 128GB de memória e câmera de 48MP', 2500.00, 1 , 1),
('O Apanhador no Campo de Centeio', 'Livro clássico da literatura americana', 59.90, 2, 2),
('Bicicleta Montanheira', 'Bicicleta ideal para trilhas e terrenos irregulares', 1200.00, 3, 3),
('Guitarra Elétrica Fender', 'Guitarra elétrica modelo Stratocaster', 7800.00, 4, 4),
 ('Mochila de Viagem 70L', 'Mochila resistente e espaçosa para longas viagens', 450.00, 5, 5);


INSERT INTO cliente (Nome,email,telefone,usuarioAtualizacao) VALUES
('Luis Gustavo','luis@gmail.com','11978918311',1),
('Walter Souza','Waltinho@gmail.com','11123456789',2),
('Marcela Texeira','marcela@gmail.com','11123456798',3),
('Carlos Souza','carlos@gmail.com','11123456987',4),
('Karen Pereira','Karen@gmail.com','11123459876',5);

INSERT INTO Pedido (ClienteId, DataPedido, FormaPagamentoId, status, UsuarioAtualizacao)
VALUES 
(1, CURRENT_DATE(), 1, 'Processando', 1),
(2, CURRENT_DATE(), 2, 'Enviado', 2),
(3, '2024-03-14 10:00:00', 3, 'Entregue', 3),
(4, '2024-03-15 15:30:00', 4, 'Cancelado', 4),
(5, '2024-03-16 20:00:00', 5, 'Aguardando Pagamento', 5);

INSERT INTO ItemPedido (PedidoId, ProdutoId, Quantidade, UsuarioAtualizacao)
VALUES (1, 1, 2, 1),
(1, 2, 1, 1),
(2, 3, 3, 2),
(3, 4, 1, 3),
(4, 5, 2, 4);

-- 1. Atualizar o nome de um cliente:
UPDATE cliente
SET Nome = 'mike tyson'
WHERE ID = 5;

select * from cliente;

-- 2. Deletar um produto:
DELETE FROM produto WHERE Id = 6;

INSERT INTO Produto (Nome, Descricao, Preco, CategoriaID, UsuarioAtualizacao) VALUES 
('Camiseta', 'Camiseta de algodão branca', 29.99, null, 1);

SELECT * FROM PRODUTO;

-- 3. Alterar a categoria de um produto:
UPDATE categoria
SET Nome = 'Automotivo'
WHERE Id = 2;


SELECT * FROM CATEGORIA;
-- 4. Inserir um novo cliente:

INSERT INTO cliente (Nome, Email, Telefone, ativo) VALUES 
('lula', 'lula@gmail.com', 11953348399, 1);


SELECT * FROM cliente;

-- 5. Inserir um novo pedido:
INSERT INTO Pedido (ClienteId, DataPedido, FormaPagamentoId, status, UsuarioAtualizacao)
VALUES 
(6, '2024-03-25 10:00:00', 5, 'Aguardando Pagamento', 6);

SELECT * FROM PEDIDO;

-- 6. Atualizar o preço de um produto:
UPDATE produto
SET preco = '7777'
WHERE ID = 2;

SELECT * FROM produto;


############## DQL - Sem Joins
-- 1. Selecione todos os registros da tabela Produto:
SELECT *
FROM produto;

-- 2. Selecione apenas o nome e o preço dos produtos da tabela Produto:
SELECT produto.nome, produto.preco
FROM produto;

-- 3. Selecione os produtos da tabela Produto ordenados por preço, do mais barato para o mais caro:
SELECT *
FROM produto
ORDER BY preco;

-- 4. Selecione os produtos da tabela Produto ordenados por preço, do mais caro para o mais barato:
SELECT *
FROM produto
ORDER BY preco DESC;


-- 5. Selecione os nomes distintos das categorias da tabela Categoria:
SELECT DISTINCT categoria.nome
FROM categoria;

-- 6. Selecione os produtos da tabela Produto cujo preço esteja entre $10 e $50:
SELECT *
FROM produto
where Preco between 10 AND 50;

-- 7. Selecione os produtos da tabela Produto, mostrando o nome como "Nome do Produto" e o preço como "Preço Unitário":
SELECT produto.nome AS Nome_do_Produto, produto.Preco AS Preco_Unitario
FROM produto;

-- 8. Selecione os produtos da tabela Produto, adicionando uma coluna calculada "Preço Total" multiplicando a quantidade pelo preço:


-- 9. Selecione os produtos da tabela Produto, mostrando apenas os 10 primeiros registros:

-- 10. Selecione os produtos da tabela Produto, pulando os primeiros 5 registros e mostrando os 10 seguintes:


############# DQL - Joins
-- 1. Selecione o nome do produto e sua categoria:


-- 2. Selecione o nome do cliente e o nome do produto que ele comprou:


-- 3. Selecione todos os produtos, mesmo aqueles que não têm uma categoria associada:


-- 4. Selecione todos os clientes, mesmo aqueles que não fizeram nenhum pedido:


-- 5. Selecione todas as categorias, mesmo aquelas que não têm produtos associados:


-- 6. Selecione todos os produtos, mesmo aqueles que não foram pedidos:



############### DQL com joins e demais filtros
-- 1. Selecione o nome da categoria e o número de produtos nessa categoria, apenas para categorias com mais de 5 produtos:


-- 2. Selecione o nome do cliente e o total de pedidos feitos por cada cliente:


-- 3. Selecione o nome do produto, o nome da categoria e a quantidade total de vendas para cada produto:


-- 4. Selecione o nome da categoria, o número total de produtos nessa categoria e o número de pedidos para cada categoria:


-- 5. Selecione o nome do cliente, o número total de pedidos feitos por esse cliente e a média de produtos por pedido, apenas para clientes que tenham feito mais de 3 pedidos:


##### Crie uma View qualquer para qualquer um dos joins desenvolvidos

##### Crie uma transaction que cadastra um cliente e faça uma venda
-- Início da transação

-- Inserir um novo cliente


-- Inserir um novo pedido para o cliente


-- Inserir itens no pedido


-- Commit da transação (confirmação das alterações)