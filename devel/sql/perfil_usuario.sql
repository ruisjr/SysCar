DROP TABLE  IF EXISTS perfil_usuario;

DROP SEQUENCE IF EXISTS perfil_usuario_seq;

CREATE SEQUENCE perfil_usuario_seq
	start 1
	increment 1
	NO MAXVALUE
	CACHE 1;

CREATE TABLE perfil_usuario (
	id			bigint NOT NULL DEFAULT nextval('perfil_usuario_seq'),
	nome 		varchar(100) not null,
	ativo		boolean not null default True
);

alter table perfil_usuario add constraint pk_perfil_usuario primary key (id);

select * from perfil_usuario;