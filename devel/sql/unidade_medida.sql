DROP TABLE IF EXISTS unidade_medida;

DROP SEQUENCE IF EXISTS unidade_medida_seq;

CREATE SEQUENCE unidade_medida_seq
	START 1 
	INCREMENT 1 
	NO MAXVALUE CACHE 1;

CREATE TABLE unidade_medida (
	   id BIGINT NOT NULL DEFAULT nextval('unidade_medida_seq')
	  ,nome VARCHAR(100) NOT NULL
	  ,sigla VARCHAR(4) NOT NULL);

ALTER TABLE unidade_medida ADD CONSTRAINT pk_unidade_medida UNIQUE (id);

--Medidas de Comprimento
INSERT INTO unidade_medida (nome, sigla) values ('Quilômetro', 'KM');
INSERT INTO unidade_medida (nome, sigla) values ('Hectômetro', 'HM');
INSERT INTO unidade_medida (nome, sigla) values ('Decâmetro', 'DAM');
INSERT INTO unidade_medida (nome, sigla) values ('Metro', 'M');
INSERT INTO unidade_medida (nome, sigla) values ('Decímetro', 'DM');
INSERT INTO unidade_medida (nome, sigla) values ('Centímetro', 'CM');
INSERT INTO unidade_medida (nome, sigla) values ('Milímetro', 'MM');

--Medidas de Capacidade
INSERT INTO unidade_medida (nome, sigla) values ('Quilolitro', 'KL');
INSERT INTO unidade_medida (nome, sigla) values ('Hectolitro', 'HL');
INSERT INTO unidade_medida (nome, sigla) values ('Decalitro', 'DAL');
INSERT INTO unidade_medida (nome, sigla) values ('Litro', 'M');
INSERT INTO unidade_medida (nome, sigla) values ('Decilitro', 'DM');
INSERT INTO unidade_medida (nome, sigla) values ('Centilitro', 'CM');
INSERT INTO unidade_medida (nome, sigla) values ('Mililitro', 'MM');

--Medidas de Massa
INSERT INTO unidade_medida (nome, sigla) values ('Quilograma', 'KG');
INSERT INTO unidade_medida (nome, sigla) values ('Hectograma', 'HG');
INSERT INTO unidade_medida (nome, sigla) values ('Decagrama', 'DAG');
INSERT INTO unidade_medida (nome, sigla) values ('Grama', 'G');
INSERT INTO unidade_medida (nome, sigla) values ('Decigrama', 'DG');
INSERT INTO unidade_medida (nome, sigla) values ('Centigrama', 'CG');
INSERT INTO unidade_medida (nome, sigla) values ('Miligrama', 'MG');

--Medidas de Tempo
INSERT INTO unidade_medida (nome, sigla) values ('Hora', 'H');
INSERT INTO unidade_medida (nome, sigla) values ('Minuto', 'MIN');
INSERT INTO unidade_medida (nome, sigla) values ('Dia', 'DIA');

SELECT * FROM unidade_medida;