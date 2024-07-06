DROP TABLE IF EXISTS forma_pagamento;

DROP SEQUENCE IF EXISTS forma_pagamento_seq;

CREATE SEQUENCE forma_pagamento_seq
	start 1 
	increment 1 
	NO MAXVALUE CACHE 1;

CREATE TABLE forma_pagamento (
	id BIGINT NOT NULL DEFAULT nextval('forma_pagamento_seq')
	,nome VARCHAR(100) NOT NULL
	,ativo boolean not null default True
	,utilizar_cr boolean
	,utilizar_cp boolean
	,tipo integer not null --DEBITO, CREDITO, DINHEIRO, BOLETO, PIX, CREDITO LOJA, VALE ALIMENTACAO
	,tipo_recebimento integer --A PRAZO, A VISTA
	,moeda integer not null default 0
	,permite_troco boolean
	,parcelas integer not null default 0
	,dia_primeira_parcela integer default 0
	
	);

ALTER TABLE forma_pagamento ADD CONSTRAINT pk_forma_pagamento UNIQUE (id);

SELECT *
FROM forma_pagamento;