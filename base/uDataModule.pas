unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, 
  {classes de negócio}
  uUsuario, uRegrasSeguranca, uConfiguracoes, SimpleQueryFiredac, SimpleInterface, SimpleDao;

type
  TDM = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FConn: iSimpleQuery;
  public
    Usuario: TUsuario;
    RegraSeguranca: TRegraSeguranca;
    DAOUsuario: iSimpleDao<TUsuario>;
    DAOSeguranca: iSimpledao<TRegraSeguranca>;

    ModoArredondamento: Integer;
    { Public declarations }
    function GetConn: iSimpleQuery;
    function GetConfig: TConfiguracoes;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Uses uLogs, login, uUtil;

procedure TDM.DataModuleCreate(Sender: TObject);
var
    FRM: TfrmLogin;
    oConfig: TConfiguracoes;
begin
    DAOUsuario := TSimpleDao<TUsuario>.New(GetConn);
    DAOSeguranca := TSimpleDao<TRegraSeguranca>.New(GetConn);

    RegraSeguranca := DAOSeguranca.Find('id = 1');
    try
        if GetEnvironmentVar('SC_LOGIN') = 'True' then
        begin
            FRM := TFrmLogin.Create(nil);
            try
                FRM.ShowModal();
            finally
                FreeAndNil(FRM);
            end;
        end;
    except
        on E: Exception do
            TLog.New().info(E.ClassName +': '+ E.Message);
    end;

    oConfig := self.GetConfig;
    try
        ModoArredondamento := oConfig.Arredondamento;
    finally
        oConfig.Free;
    end;
end;

function TDM.GetConfig: TConfiguracoes;
var
    DAO: iSimpleDao<TConfiguracoes>;
begin
    DAO := TSimpleDao<TConfiguracoes>.New(self.GetConn);
    Result := DAO.Find(1);
end;

function TDM.GetConn: iSimpleQuery;
begin
    if not Assigned(FConn) then
    begin
        try
            FConn := TSimpleQueryFiredac.Create('SYSCAR');
        except
            on E: Exception do
                TLog.New().info(E.ClassName +': '+ E.Message);
        end;
    end;

    Result := FConn;
end;

end.
