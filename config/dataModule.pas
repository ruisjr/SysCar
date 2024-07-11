unit dataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, VCL.Forms;

type
  TDM = class(TDataModule)
    dbconn: TFDConnection;
    Command: TFDCommand;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FLink: TFDPhysPGDriverLink;
    FAppName: String;
  public
    ConnDataBase: TFDConnection;

    procedure SetConnectionDataBase;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uUtil;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
    FAppName := Application.Name;
    SetConnectionDataBase;
end;

procedure TDM.SetConnectionDataBase;
var
    Qry: TFDQuery;
begin
    FLink := TFDPhysPGDriverLink.Create(nil);
    FLink.Release;
    FLink.VendorLib := ExtractFilePath(Application.ExeName) + 'lib\libpq.dll';

    Qry := getQuery;
    Qry.SQL.Text := 'SELECT * FROM database';
    Qry.Prepare;
    Qry.Open;

    ConnDataBase := TFDConnection.Create(nil);
    ConnDataBase.DriverName := Split('-', Qry.FieldByName('database').AsString);
    ConnDataBase.ConnectionName := FAppName;
    ConnDataBase.ConnectionDefName := FAppName;
    ConnDataBase.LoginPrompt := False;
    ConnDataBase.Name := 'conn' + Qry.FieldByName('dbname').AsString;

    with ConnDataBase.Params as TFDPhysPGConnectionDefParams do
    begin
        Server := Qry.FieldByName('hostname').AsString;
        DriverID := Split('-', Qry.FieldByName('database').AsString);
        Database := Qry.FieldByName('dbname').AsString.ToLower;
        Password := Qry.FieldByName('senha').AsString;
        UserName := Qry.FieldByName('usuario').AsString;
        ApplicationName := FAppName;
        Port := Qry.FieldByName('porta').AsInteger;
        LoginTimeout := Qry.FieldByName('timeout').AsInteger;
        CharacterSet := csUTF8;
    end;

    ConnDataBase.Params.UserName := Qry.FieldByName('usuario').AsString;
    ConnDataBase.Params.Password := Qry.FieldByName('senha').AsString;

    ConnDataBase.Connected := True;
end;

end.
