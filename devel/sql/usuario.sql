DROP TABLE  IF EXISTS usuario;

DROP SEQUENCE IF EXISTS usuario_seq;

CREATE SEQUENCE usuario_seq
	start 1
	increment 1
	NO MAXVALUE
	CACHE 1;

CREATE TABLE usuario (
	id			bigint NOT NULL DEFAULT nextval('usuario_seq'),
	nome 		varchar(100) not null,
	login   	varchar(30),
	ativo		boolean not null default True,
	email       varchar(150),
	perfil 		integer
);

alter table usuario add constraint pk_usuario primary key (id);

select * from usuario;