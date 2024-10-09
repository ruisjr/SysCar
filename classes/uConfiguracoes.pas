unit uConfiguracoes;

interface

uses
    Data.DB, System.Classes,
    //classes de neg�cio
    SimpleAttributes, SimpleEntity;

Type
  [Table('config')]
  TConfiguracoes = class(TSimpleEntity)
  private
    FId: Integer;
    FTipoPesquisa: integer;
    FFiltrarPor: Integer;
    FArredondamento: Integer;
  public
    constructor Create;
    destructor Destroy; override;
  published
    [DBField('id'), PK, AutoInc, NotNull]
    property Id: Integer read FId write FId;
    [DBField('tipo_pesquisa'), NotNull]
    property TipoPesquisa: Integer read FTipoPesquisa write FTipoPesquisa;
    [DBField('filtrar_por'), NotNull]
    property FiltrarPor: Integer read FFiltrarPor write FFiltrarPor;
    [DBField('arredondamento')]
    property Arredondamento: Integer read FArredondamento write FArredondamento;
  end;

const
    ARRD_ROUNDED = 0;
    ARRD_TRUNCATE = 1;

implementation

{ TConfiguracoes }

constructor TConfiguracoes.Create;
begin
    inherited;
end;

destructor TConfiguracoes.Destroy;
begin

  inherited;
end;

end.
