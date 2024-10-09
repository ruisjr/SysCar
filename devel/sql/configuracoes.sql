DROP TABLE  IF EXISTS config;
DROP SEQUENCE IF EXISTS config_seq;

CREATE SEQUENCE config_seq
	start 1
	increment 1
	NO MAXVALUE
	CACHE 1;

CREATE TABLE config (
	id				bigint NOT NULL DEFAULT nextval('config_seq'),
	tipo_pesquisa	integer,
	filtrar_por		integer,
	arredondamento integer default 0
);

alter table config add constraint pk_config primary key (id);

select * from config;