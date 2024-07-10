DROP TABLE IF EXISTS movimento;

DROP SEQUENCE IF EXISTS movimento_seq;

CREATE SEQUENCE movimento_seq
	start 1 
	increment 1 
	NO MAXVALUE CACHE 1;

CREATE TABLE movimento (
	id BIGINT NOT NULL DEFAULT nextval('movimento_seq')
	,ticket bigint NOT NULL
	,placa varchar(50)
	,veiculo integer not null
	,modelo integer not null
	,dt_entrada date not null
	,hr_entrada time not null
	,dt_saida date
	,hr_saida date
	,mensalista integer
	,situacao varchar(1)
	);

ALTER TABLE movimento ADD CONSTRAINT pk_movimento UNIQUE (id);
ALTER TABLE movimento ADD CONSTRAINT fk_movimento_mensalista  FOREIGN KEY (mensalista) REFERENCES pessoa (id);
ALTER TABLE movimento ADD CONSTRAINT fk_movimento_veiculo  FOREIGN KEY (veiculo) REFERENCES veiculo (id);
ALTER TABLE movimento ADD CONSTRAINT fk_movimento_modelo  FOREIGN KEY (modelo) REFERENCES modelo (id);

SELECT * FROM movimento;