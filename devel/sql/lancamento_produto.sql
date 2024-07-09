DROP TABLE IF EXISTS lancamento_produto;
DROP SEQUENCE IF EXISTS lancamento_produto_seq;

CREATE SEQUENCE lancamento_produto_seq
	start 1 
	increment 1 
	NO MAXVALUE CACHE 1;

CREATE TABLE lancamento_produto (
	id BIGINT NOT NULL DEFAULT nextval('lancamento_produto_seq')
	,valor numeric(18,2) not null
	,preco_unit numeric(18,2) not null
	,desconto numeric(18,2) not null
	,lancamento integer not null
	,produto integer not null
	);
	
ALTER TABLE lancamento_produto ADD CONSTRAINT pk_lancamento_produto UNIQUE (id);
ALTER TABLE lancamento_produto ADD CONSTRAINT fk_lanc_prod_lancamento FOREIGN KEY (lancamento) REFERENCES lancamento(id);
ALTER TABLE lancamento_produto ADD CONSTRAINT fk_lanc_prod_produto FOREIGN KEY (produto) REFERENCES produto(id);

SELECT * FROM lancamento_produto;