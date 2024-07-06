DROP TABLE IF EXISTS modelo;

DROP SEQUENCE IF EXISTS modelo_seq;

CREATE SEQUENCE modelo_seq
	start 1 
	increment 1 
	NO MAXVALUE CACHE 1;

CREATE TABLE modelo (
	id BIGINT NOT NULL DEFAULT nextval('modelo_seq')
	,nome VARCHAR(100) NOT NULL
	,veiculo INTEGER NOT NULL
	);

ALTER TABLE modelo ADD CONSTRAINT pk_modelo UNIQUE (id);
ALTER TABLE modelo ADD CONSTRAINT fk_modelo_veiculo FOREIGN KEY (veiculo) REFERENCES veiculo (id);

SELECT *
FROM modelo;

