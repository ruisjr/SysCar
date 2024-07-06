DROP TABLE  IF EXISTS marca;

DROP SEQUENCE IF EXISTS marca_seq;

CREATE SEQUENCE marca_seq
	start 1
	increment 1
	NO MAXVALUE
	CACHE 1;

CREATE TABLE marca (
	id				bigint NOT NULL DEFAULT nextval('marca_seq'),
	nome 			varchar(100) not null,
	tipo			integer not null default 0
);

alter table marca add constraint pk_marca unique (id);

select * from marca;