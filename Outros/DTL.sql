# DTL

-- Transaction
START TRANSACTION;
	INSERT INTO tipos_produto (descricao) VALUES ('Acessorios');
    INSERT INTO tipos_produto (descricao) VALUES ('Equipamentos');

-- Commit
COMMIT;
SELECT * FROM tipos_produto;

-- Rollback
START TRANSACTION;
	INSERT INTO tipos_produto (descricao) VALUES ('Farmacia');
    INSERT INTO tipos_produto (descricao) VALUES ('Escritorio');
    
SELECT * FROM tipos_produto;
ROLLBACK;
SELECT * FROM tipos_produto;
# ao fazer o rollback descartamos valores na pk