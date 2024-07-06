unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, 
  {classes de negócio}
  SimpleQueryFiredac, SimpleInterface;

type
  TDM = class(TDataModule)
  private
    { Private declarations }
    FConn: iSimpleQuery;
  public
    { Public declarations }
    function GetConn: iSimpleQuery;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Uses uLogs, uPrincipal;

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
