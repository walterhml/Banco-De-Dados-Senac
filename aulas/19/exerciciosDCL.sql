# Criar Usuário e Atribuir Permissões
-- Crie um usuário chamado 'usuario_vendas' com a senha 'senha*123'
-- Conceda a esse usuário todas as permissões no banco de dados 'compras'
SELECT User, Host FROM mysql.user;

create user 'usuario_vendas'@'%'
identified by 'senha*123';

GRANT ALL PRIVILEGES ON compras.* TO 'usuario_vendas'@'%';

# Ajustar Permissões Específicas
-- Cire um usuário chamado 'usuario_marketing' com a senha 'Senha_456'
-- Conceda a esse usuário a permissão SELECT apenas na tabela 'Produto' do bd 'compras'

CREATE USER 'usuario_marketing'@'%'
IDENTIFIED BY 'Senha_456';

GRANT select ON compras.produto TO 'usuario_marketing'@'%';

# Gerenciar Acesso ao ItensPedido
-- Crie um usuário chaamdo 'usuario_consulta' com a senha 'consultA#123'
-- Conceda a esse usuário permissões de consulta em todas as tabelas do bd 'compras'
-- Verifique as permissões conceidades ao usuário e exiba as informações

CREATE USER 'usuario_consulta'@'%'
IDENTIFIED BY 'consultA#123';

GRANT select on compras to 'usuario_consulta'@'%';

SHOW GRANTS FOR 'usuario_consulta'@'%';


# Revogar Permissões
-- Crie um usuário chamado 'usuario_limitado' com a senha 'Limite%123'
-- Conceda a esse usuário permissão SELECT apenas na tabela 'cliente' do bd 'compras'
-- Revogue a permissão delete para esse usuário na tabela 'cliente'

CREATE USER 'usuario_limitado'@'%'
identified by 'Limite%123';

GRANT select on compras.cliente;