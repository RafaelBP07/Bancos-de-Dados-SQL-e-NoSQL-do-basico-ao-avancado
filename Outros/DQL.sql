# Criando base de dados(DDL)
CREATE DATABASE secao04;
USE secao04;

CREATE TABLE tipos_produto(
	codigo INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE produtos(
	codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    descricao VARCHAR(30) NOT NULL,
	preco DECIMAL(8,2) NOT NULL,
    codigo_tipo INT NOT NULL,
    FOREIGN KEY (codigo_tipo) REFERENCES tipos_produto(codigo)
);

# Inserindo dados(DML)
INSERT INTO tipos_produto(descricao) VALUES ('Computadores');
INSERT INTO tipos_produto(descricao) VALUES ('Impressoras');

INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Desktop', 1200, 1);
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Laptop', 1800, 1);
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Impr. Jato de Tinta', 300, 2);
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Impr. Laser', 500, 2);

# Conferindo base de dados
SELECT * FROM produtos;
SELECT * FROM tipos_produto;

#DQL
SELECT * FROM tipos_produto;
SELECT codigo, descricao FROM tipos_produto;
SELECT p.codigo AS cod, p.descricao AS descri, p.preco AS pre, p.codigo_tipo AS ctp FROM produtos AS p
