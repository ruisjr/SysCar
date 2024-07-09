unit ucMovimento;

interface

uses
    SimpleEntity, SimpleAttributes, uVeiculo;

type
    [Table('movimento')]
    TMovimento = class(TSimpleEntity)
    private
        FHoraSaida: TTime;
        FHoraEntrada: TTime;
        FID: Integer;
        FTicket: Integer;
        FDataSaida: TDate;
        FDataEntrada: TDate;
        FPlaca: String;
        FMensalista: Integer;
        FModelo: Integer;
        FVeiculo: Integer;
        FSituacao: String;

    public
        { Construtores e Destrutores }
        constructor Create;
        destructor Destroy; override;

    published
        { Propriedades }
        [DBField('id'), PK, NotNull, AutoInc]
        property ID: Integer read FID write FID;
        [DBField('ticket'), NotNull]
        property Ticket: Integer read FTicket write FTicket;
        [DBField('placa'), NotNull]
        property Placa: String read FPlaca write FPlaca;
        [DBField('veiculo'), FK, NotNull]
        property Veiculo: Integer read FVeiculo write FVeiculo;
        [DBField('modelo'), FK, NotNull]
        property Modelo: Integer read FModelo write FModelo;
        [DBField('dt_entrada'), NotNull]
        property DataEntrada: TDate read FDataEntrada write FDataEntrada;
        [DBField('hr_entrada'), NotNull]
        property HoraEntrada: TTime read FHoraEntrada write FHoraEntrada;
        [DBField('dt_saida')]
        property DataSaida: TDate read FDataSaida write FDataSaida;
        [DBField('hr_saida')]
        property HoraSaida: TTime read FHoraSaida write FHoraSaida;
        [DBField('mensalista'), FK]
        property Mensalista: Integer read FMensalista write FMensalista;
        [DBField('situacao')]
        property Situacao: String read FSituacao write FSituacao;
    end;

implementation

{ TMovimento }

constructor TMovimento.Create;
begin
    inherited Create;
end;

destructor TMovimento.Destroy;
begin
  inherited Destroy;
end;

end.
