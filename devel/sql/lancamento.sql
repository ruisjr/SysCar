DROP TABLE IF EXISTS lancamento;

DROP SEQUENCE IF EXISTS lancamento_seq;

CREATE SEQUENCE lancamento_seq
	start 1 
	increment 1 
	NO MAXVALUE CACHE 1;

CREATE TABLE lancamento (
	id BIGINT NOT NULL DEFAULT nextval('lancamento_seq')
	,data timestamp NOT NULL
	,valor numeric(18,2) not null
	,documento integer not null
	,movimento integer
	,produto integer
	);

ALTER TABLE lancamento ADD CONSTRAINT pk_lancamento UNIQUE (id);
ALTER TABLE lancamento ADD CONSTRAINT fk_lanc_movimento FOREIGN KEY (movimento) REFERENCES movimento(id);
ALTER TABLE lancamento ADD CONSTRAINT fk_lanc_produto FOREIGN KEY (produto) REFERENCES produto(id);

SELECT * FROM lancamento;