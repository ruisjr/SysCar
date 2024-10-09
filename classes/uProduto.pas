unit uProduto;

interface


Uses
    SimpleAttributes, SimpleEntity;

Type
    [Table('unidade_medida')]
    TUnidadeMedida = class(TSimpleEntity)
    private
        FID: Integer;
        FSigla: String;
        FNome: String;
    public
        { Construtores e Destrutores }
        constructor Create;
        destructor Destroy; override;
    published
        [DBField('id'), PK, NotNull, AutoInc]
        property ID: Integer read FID write FID;
        [DBField('nome'), NotNull]
        property Nome: String read FNome write FNome;
        [DBField('sigla'), NotNull]
        property Sigla: String read FSigla write FSigla;
    end;

    [Table('produto')]
    TProduto = class(TSimpleEntity)
    private
        FID: Integer;
        FNome: String;
        FNomeReduzido: String;
        FCodigoBarra: String;
        FDataCadastro: TDateTime;
        FAtivo: Boolean;
        FTipo: Integer;
        FPrecoUnitario: Currency;
        FPrecoPrazo: Currency;
        FPrecoAnterior: Currency;
        FUnidadeMedida: String;
        FTolerancia: Integer;
    public
        { Construtores e Destrutores }
        constructor Create;
        destructor Destroy;

    published
        [DBField('id'), PK, NotNull, AutoInc]
        property ID: Integer read FID write FID;
        [DBField('nome'), NotNull]
        property Nome: String read FNome write FNome;
        [DBField('nome_reduzido')]
        property NomeReduzido: String read FNomeReduzido write FNomeReduzido;
        [DBField('codigo_barra'), NotNull]
        property CodigoBarra: String read FCodigoBarra write FCodigoBarra;
        [DBField('dt_cadastro')]
        property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
        [DBField('ativo'), NotNull]
        property Ativo: Boolean read FAtivo write FAtivo;
        [DBField('tipo'), NotNull, Ignore]
        property Tipo: Integer read FTipo write FTipo;
        [DBField('preco_unit'), NotNull]
        property PrecoUnitario: Currency read FPrecoUnitario write FPrecoUnitario;
        [DBField('preco_prazo')]
        property PrecoPrazo: Currency read FPrecoPrazo write FPrecoPrazo;
        [DBField('preco_anterior')]
        property PrecoAnterior: Currency read FPrecoAnterior write FPrecoAnterior;
        [DBField('unidade_medida')]
        property UnidadeMedida: String read FUnidadeMedida write FUnidadeMedida;
        [DBField('tolerancia')]
        property Tolerancia: Integer read FTolerancia write FTolerancia;
    end;

implementation

{ TProduto }

constructor TProduto.Create;
begin
    inherited Create;
end;

destructor TProduto.Destroy;
begin
    inherited Destroy;
end;

{ TUnidadeMedida }

constructor TUnidadeMedida.Create;
begin
    inherited Create;
end;

destructor TUnidadeMedida.Destroy;
begin

  inherited Destroy;
end;

end.
