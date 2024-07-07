DROP TABLE IF EXISTS produto;

DROP SEQUENCE IF EXISTS produto_seq;

CREATE SEQUENCE produto_seq
	start 1 
	increment 1 
	NO MAXVALUE CACHE 1;

CREATE TABLE produto (
	id BIGINT NOT NULL DEFAULT nextval('produto_seq')
	,nome VARCHAR(100) NOT NULL
	,nome_reduzido varchar(50)
	,codigo_barra boolean not null default True
	,dt_cadastro boolean
	,ativo boolean not null default true
	,tipo integer not null --0 - MERCADORIA, 1 - SERVIÇO
	,preco_unit numeric(18,2) not null
	,preco_prazo numeric(18,2)
	,preco_anterior numeric(18,2)
	,unidade_medida varchar(4)
	,tolerancia integer default 0
	);

ALTER TABLE produto ADD CONSTRAINT pk_produto UNIQUE (id);

SELECT *
FROM produto;