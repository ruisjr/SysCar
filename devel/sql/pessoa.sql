DROP TABLE  IF EXISTS pessoa;

DROP SEQUENCE IF EXISTS pessoa_seq;

CREATE SEQUENCE pessoa_seq
	start 1
	increment 1
	NO MAXVALUE
	CACHE 1;

CREATE TABLE pessoa (
	id				bigint NOT NULL DEFAULT nextval('pessoa_seq'),
	nome 			varchar(100) not null,
	nome_reduzido   varchar(50),
	dt_cadastro 	date not null default now(),
	ativo			boolean not null default True,
	email       	varchar(150),
	dt_nascimento 	date,
	cpf_cnpj    	varchar(18),
	inscr_est		varchar(15),
	inscr_municipal varchar(20),
	sexo			varchar(9),
	telefone		varchar(16),
	celular			varchar(16),
	cep				varchar(10),
	logradouro  	varchar(200),
	numero			integer,
	bairro			varchar(100),
	complemento 	varchar(100),
	cidade			varchar(150),
	estado			varchar(2),
	pais			varchar(100),
	mensalista		boolean default False,
	empresa			boolean default False,
	funcionario 	boolean default False
);

alter table pessoa add constraint pk_pessoa primary key (id);

select * from pessoa;