# Inserindo dados de teste - DML

# Comecar sempre pelas tabelas que não dependem de outras

-- Tipos Produtos
INSERT INTO tipos_produtos (tipo) VALUES ('Remedios');
INSERT INTO tipos_produtos (tipo) VALUES ('Cosmeticos');
INSERT INTO tipos_produtos (tipo) VALUES ('Diversos');
INSERT INTO tipos_produtos (tipo) VALUES ('Outros');

-- Fabricantes
INSERT INTO fabricantes (fabricante) VALUES ('Roche');
INSERT INTO fabricantes (fabricante) VALUES ('Vitalis');
INSERT INTO fabricantes (fabricante) VALUES ('Palmolive');

-- Medicos
INSERT INTO medicos (nome, crm) VALUES ('Alfredo Muniz', '123123SP');
INSERT INTO medicos (nome, crm) VALUES ('Fernanda Ailva', '3423423MG');
INSERT INTO medicos (nome, crm) VALUES ('Julieta Santana', '56546SC');

-- Clientes
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf) 
	VALUES ('Felicity Jones','Rua da Paz, 34', '(11) 2345-8899', '34.567-098', 'Santos', '234.789.433-98');
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf) 
	VALUES ('Angelina Jolie','Rua do Ipiranga, 456', '(21) 7544-3234', '56.654-567', 'Rio de Janeiro', '345.678.234-12');
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf) 
	VALUES ('Ricardo Chavez','Rua Certa, 678', '(21) 2678-3984', '12.4569-223', 'Planaltina', '786.123.445-31');
    
-- Produtos
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante) 
	VALUES ('Dipirona', 'Dores em geral', 'Metilpropileno', '12.44', 1, 1);
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante) 
	VALUES ('Sabonete', 'Limpeza', 'Sei lah', '3.56', 2, 2);
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante) 
	VALUES ('Protetor Solar', 'Protetor Solar', 'Soro de abacate', '98.12', 2, 1);

-- Compras
 INSERT INTO compras (id_cliente, data) VALUES (1, '2019-03-10');
 INSERT INTO compras (id_cliente, data) VALUES (2, '2019-04-15');
 INSERT INTO compras (id_cliente, data) VALUES (1, '2019-05-18');
 
-- Produtos Compra
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (1, 1, 2);
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (1, 2, 3);
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (2, 3, 1);

-- Receitas Medicas
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (1, 1, 'receita1.pdf');
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (3, 2, 'receita2.pdf');



# Realizando consultas simples
-- Tipos Produtos
SELECT * FROM tipos_produtos;
SELECT id, tipo FROM tipos_produtos;
SELECT tipo, id FROM tipos_produtos;
SELECT id, tipo FROM tipos_produtos 
	ORDER BY tipo DESC;

-- Fabricantes
SELECT * FROM fabricantes;

-- Medicos
SELECT * FROM medicos;

-- Clientes
SELECT * FROM clientes;

-- Compras
SELECT * FROM compras;

-- Produtos Compra
SELECT * FROM produtos_compra;
SELECT * FROM produtos_compra WHERE quantidade > 2;

-- Receitas Medica
SELECT * FROM receitas_medica;



# Consulta complexa
-- compras

-- Passo 1 - Trazer as compras
SELECT * FROM compras;

-- Passo 2 - Colocar o nome dos clientes nas compras
SELECT com.id AS 'ID Compra', cli.nome AS 'Cliente', com.data AS 'Data Compra' 
	FROM compras AS com, clientes AS cli 
    WHERE com.id_cliente = cli.id;
    
-- Passo 3 - Produtos Compra
SELECT * FROM produtos_compra;

-- Passo 4 - Valor Total Compra
SELECT  com.id AS 'Compra', 
    cli.nome AS 'Cliente',
    SUM(prod.preco_venda * proc.quantidade) AS 'Total',
    com.data AS 'Data da Compra'
    FROM produtos_compra AS proc, produtos AS prod, compras AS com, clientes AS cli
    WHERE com.id = proc.id_compra AND prod.id = proc.id_produto AND cli.id = com.id_cliente
    GROUP BY com.id;



-- Atualziando dados
SELECT * FROM tipos_produtos;

UPDATE tipos_produtos Set tipo = 'Bijuterias' WHERE id = 4;

SELECT * FROM produtos;

UPDATE produtos SET preco_venda = '4.16', id_tipo_produto = 1, id_fabricante = 1 WHERE id = 2;



-- Excluindo dados
SELECT * FROM produtos_compra;

SELECT * FROM receitas_medica;

DELETE FROM receitas_medica WHERE id_produto_compra = 3;

DELETE FROM produtos_compra WHERE id = 3; # Não é possivel remover caso o id estiver dependencias(erro de fk)