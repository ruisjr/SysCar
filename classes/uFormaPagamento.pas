unit uFormaPagamento;

interface

uses
    Data.DB,
    //classes de negócio
    SimpleAttributes, SimpleEntity;

Type
    [Table('forma_pagamento')]
    TFormaPagamento = class(TSimpleEntity)
    private
        FDiaPrimeiraParcela: Integer;
        FAtivo: Boolean;
        FMoeda: Integer;
        FId: Integer;
        FUtilizaCR: Boolean;
        FUtilizaCP: Boolean;
        FPermiteTroca: Boolean;
        FParcelas: Integer;
        FTipoRecebimento: Integer;
        FNome: String;
        FTipo: Integer;

    public
        { Construtores e Destrutores }
        constructor Create;
        destructor Destroy; override;
    published
        [DBField('id'), PK, AutoInc, NotNull]
        property ID: Integer read FId write FId;
        [DBField('nome'), NotNull]
        property Nome: String read FNome write FNome;
        [DBField('ativo'), NotNull]
        property Ativo: Boolean read FAtivo write FAtivo;
        [DBField('utilizar_cr')]
        property UtilizaEmCR: Boolean read FUtilizaCR write FUtilizaCR;
        [DBField('utilizar_cp')]
        property UtilizaEmCP: Boolean read FUtilizaCP write FUtilizaCP;
        [DBField('tipo'), NotNull]
        property Tipo: Integer read FTipo write FTipo;
        [DBField('tipo_recebimento'), NotNull]
        property TipoRecebimento: Integer read FTipoRecebimento write FTipoRecebimento;
        [DBField('moeda')]
        property Moeda: Integer read FMoeda write FMoeda;
        [DBField('permite_troco')]
        property PermiteTroco: Boolean read FPermiteTroca write FPermiteTroca;
        [DBField('parcelas'), NotNull]
        property Parcelas: Integer read FParcelas write FParcelas;
        [DBField('dia_primeira_parcela')]
        property DiaPrimeiraParcela: Integer read FDiaPrimeiraParcela write FDiaPrimeiraParcela;

    end;

implementation

{ TFormaPagamento }

constructor TFormaPagamento.Create;
begin
    inherited Create;
end;

destructor TFormaPagamento.Destroy;
begin
    inherited Destroy;
end;

end.
