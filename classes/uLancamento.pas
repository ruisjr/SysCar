unit uLancamento;

interface

uses
    SimpleEntity, SimpleAttributes;

type
    [Table('lancamento')]
    TLancamento = class(TSimpleEntity)
    private
        FDocumento: String;
        FID: Integer;
        FData: TDateTime;
        FMovimento: Integer;
        FValor: Currency;
        FTipo: String;
    public
        { Construtores e destrutores }
        constructor Create;
        destructor Destroy; override;
    published
        [DBField('id'), PK, NotNull, AutoInc]
        property ID: Integer read FID write FID;
        [DBField('data'), , NotNull]
        property Data: TDateTime read FData write FData;
        [DBField('valor'), NotNull]
        property Valor: Currency read FValor write FValor;
        [DBField('documento'), NotNull]
        property Documento: String read FDocumento write FDocumento;
        [DBField('movimento'), FK, NotNull]
        property Movimento: Integer read FMovimento write FMovimento;
        [DBField('tipo'), NotNull]
        property Tipo: String read FTipo write FTipo;
    end;

    [Table('lancamento_produto')]
    TLancamentoProduto = class(TSimpleEntity)
    private
        FID: Integer;
        FProduto: Integer;
        FDesconto: Currency;
        FPrecoUnitario: Currency;
        FLancamento: Integer;
        FValor: Currency;
    public
        { Construtores e destrutores }
        constructor Create;
        destructor Destroy; override;
    published
        [DBField('id'), PK, NotNull, AutoInc]
        property ID: Integer read FID write FID;
        [DBField('produto'), FK, NotNull]
        property Produto: Integer read FProduto write FProduto;
        [DBField('valor'), NotNull]
        property Valor: Currency read FValor write FValor;
        [DBField('preco_unit'), NotNull]
        property PrecoUnitario: Currency read FPrecoUnitario write FPrecoUnitario;
        [DBField('desconto'), NotNull]
        property Desconto: Currency read FDesconto write FDesconto;
        [DBField('lancamento'), NotNull]
        property Lancamento: Integer read FLancamento write FLancamento;
    end;

CONST
    LANC_TIPO_SAIDA = 'S';
    LANC_TIPO_ENTRADA = 'E';

implementation

{ TLancamento }

constructor TLancamento.Create;
begin
    inherited Create;
end;

destructor TLancamento.Destroy;
begin

  inherited Destroy;
end;

{ TLancamentoProduto }

constructor TLancamentoProduto.Create;
begin
    inherited Create;
end;

destructor TLancamentoProduto.Destroy;
begin

  inherited Destroy;
end;

end.
