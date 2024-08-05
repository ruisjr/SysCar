DROP TABLE IF EXISTS municipio;
DROP SEQUENCE IF EXISTS municipio_seq;

CREATE SEQUENCE municipio_seq
	start 1 
	increment 1 
	NO MAXVALUE CACHE 1;

CREATE TABLE municipio (
	id 				INTEGER NOT NULL DEFAULT nextval('municipio_seq')
	,codigo 	  	INTEGER NOT NULL
	,macro_regiao 	INTEGER NOT NULL
	,nome 			VARCHAR(100) NOT NULL);
	
ALTER TABLE municipio ADD CONSTRAINT pk_municipio PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_municipio ON municipio (codigo);

SELECT * FROM municipio;