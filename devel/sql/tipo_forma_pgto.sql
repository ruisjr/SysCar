DROP TABLE IF EXISTS tipo_forma_pgto;

DROP SEQUENCE IF EXISTS tipo_forma_pgto_seq;

CREATE SEQUENCE tipo_forma_pgto_seq
	start 1 
	increment 1 
	NO MAXVALUE CACHE 1;

CREATE TABLE tipo_forma_pgto (
	id BIGINT NOT NULL DEFAULT nextval('tipo_forma_pgto_seq')
	,nome VARCHAR(100) NOT NULL);

ALTER TABLE tipo_forma_pgto ADD CONSTRAINT pk_tipo_forma_pgto UNIQUE (id);

INSERT INTO tipo_forma_pgto (id, nome) VALUES (0, 'DINHEIRO');
INSERT INTO tipo_forma_pgto (id, nome) VALUES (1, 'BOLETO');
INSERT INTO tipo_forma_pgto (id, nome) VALUES (2, 'C. DEBITO');
INSERT INTO tipo_forma_pgto (id, nome) VALUES (3, 'C. CREDITO');
INSERT INTO tipo_forma_pgto (id, nome) VALUES (4, 'PIX');
INSERT INTO tipo_forma_pgto (id, nome) VALUES (5, 'TED');
INSERT INTO tipo_forma_pgto (id, nome) VALUES (6, 'DOC');
INSERT INTO tipo_forma_pgto (id, nome) VALUES (7, 'TRANSF. ELETRONICA');
INSERT INTO tipo_forma_pgto (id, nome) VALUES (8, 'CREDITO LOJA');
INSERT INTO tipo_forma_pgto (id, nome) VALUES (9, 'VALE ALIMENTACAO'); 

SELECT *
FROM tipo_forma_pgto;