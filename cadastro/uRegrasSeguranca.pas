unit uRegrasSeguranca;

interface

uses
    Data.DB, System.Classes,
    //classes de negócio
    SimpleAttributes, SimpleEntity;

Type
  [Table('regras_seguranca')]
  TRegraSeguranca = class(TSimpleEntity)
  private
    FID: Integer;
    FPeriodoExpiracao: Integer;
    FQuantidadeMinEspecial: Integer;
    FQuantidadeRetentativas: Integer;
    FPeriodoInatividade: Integer;
    FQuantidadeMaxCaracter: Integer;
    FQuantidadeMinMinuscula: Integer;
    FQuantidadeHistorico: Integer;
    FQuantidadeMinNumerico: Integer;
    FQuantidadeMinMaiuscula: Integer;
    FQuantidadeMinCaracter: Integer;
    FHabilitaRegraSenha: Boolean;
    FHabilitaRegraBloqueio: Boolean;

  public
    constructor Create;
    destructor Destroy; override;
  published
    [DBField('id'), PK, AutoInc, NotNull]
    property ID: Integer read FID write FID;
    [DBField('habilita_regra_bloqueio'), NotNull]
    property HabilitaRegraBloqueio: Boolean read FHabilitaRegraBloqueio write FHabilitaRegraBloqueio;
    [DBField('habilita_regra_senha'), NotNull]
    property HabilitaRegraSenha: Boolean read FHabilitaRegraSenha write FHabilitaRegraSenha;
    [DBField('qtd_retentativas')]
    property QuantidadeRetentativas: Integer read FQuantidadeRetentativas write FQuantidadeRetentativas;
    [DBField('qtd_senha_historico')]
    property QuantidadeHistorico: Integer read FQuantidadeHistorico write FQuantidadeHistorico;
    [DBField('qtd_minima_caracter')]
    property QuantidadeMinCaracter: Integer read FQuantidadeMinCaracter write FQuantidadeMinCaracter;
    [DBField('qtd_maxima_caracter')]
    property QuantidadeMaxCaracter: Integer read FQuantidadeMaxCaracter write FQuantidadeMaxCaracter;
    [DBField('qtd_minima_numerico')]
    property QuantidadeMinNumerico: Integer read FQuantidadeMinNumerico write FQuantidadeMinNumerico;
    [DBField('qtd_minima_maiuscula')]
    property QuantidadeMinMaiuscula: Integer read FQuantidadeMinMaiuscula write FQuantidadeMinMaiuscula;
    [DBField('qtd_minima_minuscula')]
    property QuantidadeMinMinuscula: Integer read FQuantidadeMinMinuscula write FQuantidadeMinMinuscula;
    [DBField('qtd_minima_especial')]
    property QuantidadeMinEspecial: Integer read FQuantidadeMinEspecial write FQuantidadeMinEspecial;
    [DBField('periodo_maximo_inatividade')]
    property PeriodoInatividade: Integer read FPeriodoInatividade write FPeriodoInatividade;
    [DBField('periodo_expiracao')]
    property PeriodoExpiracao: Integer read FPeriodoExpiracao write FPeriodoExpiracao;
  end;

implementation

{ TRegraSeguranca }

constructor TRegraSeguranca.Create;
begin
    inherited Create;
end;

destructor TRegraSeguranca.Destroy;
begin
    inherited Destroy;
end;

end.
