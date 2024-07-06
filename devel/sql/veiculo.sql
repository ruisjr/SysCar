DROP TABLE  IF EXISTS veiculo;

DROP SEQUENCE IF EXISTS veiculo_seq;

CREATE SEQUENCE veiculo_seq
	start 1
	increment 1
	NO MAXVALUE
	CACHE 1;

CREATE TABLE veiculo (
	id BIGINT NOT NULL DEFAULT nextval('veiculo_seq')
	,nome VARCHAR(100) NOT NULL
	,tipo INTEGER NOT NULL DEFAULT 0
	);

ALTER TABLE veiculo ADD CONSTRAINT pk_veiculo UNIQUE (id);

SELECT *
FROM veiculo;
