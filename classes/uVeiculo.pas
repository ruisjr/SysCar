unit uVeiculo;

interface

Uses
    SimpleAttributes, SimpleEntity, System.Classes;

Type
  [Table('veiculo')]
  TVeiculo = class(TSimpleEntity)
  private
    FID: Integer;
    FNome: String;
    FTipo: Integer;
  public
    constructor Create;
    destructor Destroy; override;
  published
    [DBField('id'), PK, NotNull, AutoInc]
    property ID: Integer read FID write FID;
    [DBField('nome'), NotNull]
    property Nome: String read FNome write FNome;
    [DBField('tipo'), NotNull]
    property tipo: Integer read FTipo write FTipo;
  end;

  [Table('modelo')]
  TModelo = class(TSimpleEntity)
  private
    FID: Integer;
    FNome: String;
//    FVeiculo: TVeiculo;
  public
    constructor Create;
    destructor Destroy; override;
  published
    [DBField('id'), PK, NotNull, AutoInc]
    property ID: Integer read FID write FID;
    [DBField('nome'), NotNull]
    property Nome: String read FNome write FNome;
//    [DBField('veiculo'), FK, NotNull]
//    property Veiculo: TVeiculo read FVeiculo write FVeiculo;
  end;


implementation

{ TVeiculo }

constructor TVeiculo.Create;
begin
    inherited Create;
end;

destructor TVeiculo.Destroy;
begin
    inherited Destroy;
end;

{ TModelo }

constructor TModelo.Create;
begin
    inherited Create;
//    FVeiculo := TVeiculo.Create;
end;

destructor TModelo.Destroy;
begin
    inherited Destroy;
end;

Initialization
    RegisterClass(TVeiculo);
    RegisterClass(TModelo);

finalization
  UnRegisterClass(TVeiculo);
  UnRegisterClass(TModelo);

end.
