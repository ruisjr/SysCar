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
	,documento varchar(30) not null
	,movimento integer
	,tipo varchar(1) not null default 'E'
	);

ALTER TABLE lancamento ADD CONSTRAINT pk_lancamento PRIMARY KEY (id);
ALTER TABLE lancamento ADD CONSTRAINT fk_lanc_movimento FOREIGN KEY (movimento) REFERENCES movimento(id);

SELECT * FROM lancamento;