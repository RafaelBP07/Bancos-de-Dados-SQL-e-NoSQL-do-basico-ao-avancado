# DML
USE secao04;

-- Insert
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Notebook', 1200, 1);
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Mackbook Pro', 7200, 1);

INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Mackbook air', 5200, 3); # fk não existe
INSERT INTO tipos_produto(descricao) VALUES ('Apple');
INSERT INTO produtos VALUES (NULL, 'Mackbook air', 5200, 3); # segue sequencia e AI na pk

SELECT * FROM produtos;
SELECT * FROM tipos_produto;

-- Update
UPDATE produtos SET codigo_tipo = 3 WHERE codigo = 6;

UPDATE produtos SET descricao = 'Impressora Laser', preco = '700' WHERE codigo = 4;
# CUIDADO PARA NAO ESQUECER O WHERE

SELECT * FROM produtos;
SELECT * FROM tipos_produto;

-- Delete
DELETE FROM produtos WHERE codigo = 4;
# CUIDADO PARA NAO ESQUECER O WHERE
 
SELECT * FROM produtos;
SELECT * FROM tipos_produto;