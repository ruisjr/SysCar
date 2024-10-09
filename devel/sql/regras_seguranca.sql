DROP TABLE  IF EXISTS regras_seguranca;

DROP SEQUENCE IF EXISTS regras_seguranca_seq;

CREATE SEQUENCE regras_seguranca_seq
	start 1
	increment 1
	NO MAXVALUE
	CACHE 1;

CREATE TABLE regras_seguranca (
	id							bigint NOT NULL DEFAULT nextval('regras_seguranca_seq'),
	habilita_regra_bloqueio		boolean default False,
	habilita_regra_senha		boolean default False,
	qtd_retentativas			integer, 
	qtd_senha_historico   		integer,
	qtd_minima_caracter			integer,
	qtd_maxima_caracter     	integer,
	qtd_minima_numerico 		integer,
	qtd_minima_maiuscula		integer,
	qtd_minima_minuscula		integer,
	qtd_minima_especial			integer,
	periodo_maximo_inatividade	integer,
	periodo_expiracao			integer
);

alter table regras_seguranca add constraint pk_regras_seguranca primary key (id);

insert into regras_seguranca (id) values (1);
select * from regras_seguranca
