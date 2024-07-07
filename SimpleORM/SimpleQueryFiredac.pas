unit SimpleQueryFiredac;

interface

uses
  SimpleInterface, FireDAC.Comp.Client, System.Classes, Data.DB, FireDAC.Stan.Def,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.PG, FireDAC.Phys.PGDef,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, System.IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, System.SysUtils,
  { Classes internas }
  uUtil;

Type
    ESimpleQueryException = class(Exception);

    TSimpleQueryFiredac = class(TInterfacedObject, iSimpleQuery)
    private
        FConnection : TFDConnection;
        FLink: TFDPhysPGDriverLink;
        FAppName: String;
        FQuery : TFDQuery;
        FParams : TParams;

        { Procedures }
        procedure loadConfig(aConfigFile: String);
        function _AddRef: Integer;
        function _Release: Integer;
    public
        { Construtores e destrutores }
        constructor Create(aApplicationName: String);
        destructor Destroy; override;

        { Funções de classes }
        class function New(aApplicationName: String): iSimpleQuery;

        { Funções }
        function SQL : TStrings;
        function Params : TParams;
        function ExecSQL : iSimpleQuery;
        function DataSet : TDataSet;
        function Open(aSQL : String) : iSimpleQuery; overload;
        function Open : iSimpleQuery; overload;
  end;

implementation

uses
  Vcl.Forms, uLogs;

{ TSimpleQuery<T> }

constructor TSimpleQueryFiredac.Create(aApplicationName: String);
begin
    FAppName := aApplicationName;

    Self.loadConfig('drivers\FDConnectionDefs.ini');

    FQuery := TFDQuery.Create(nil);
    FQuery.Connection := self.FConnection;
end;

function TSimpleQueryFiredac.DataSet: TDataSet;
begin
    Result := TDataSet(FQuery);
end;

function TSimpleQueryFiredac._AddRef: Integer;
begin
    Result := -1;
end;

function TSimpleQueryFiredac._Release: Integer;
begin
    Result := -1;
end;

destructor TSimpleQueryFiredac.Destroy;
begin
    FreeAndNil(FQuery);
    if Assigned(FParams) then
        FreeAndNil(FParams);

    FreeAndNil(FConnection);
    FreeAndNil(FLink);
  inherited;
end;

function TSimpleQueryFiredac.ExecSQL: iSimpleQuery;
var
    aMsg: String;
begin
    Result := Self;
    if Assigned(FParams) then
        FQuery.Params.Assign(FParams);

    try
        FQuery.Prepare;
        FQuery.ExecSQL;
    except
        on E: Exception do
        begin
            aMsg := 'ERROR: ' + Split(':', E.Message, False);
            TLog.New.error(aMsg);
            raise ESimpleQueryException.Create(aMsg);
        end;
    end;

    if Assigned(FParams) then
        FreeAndNil(FParams);
end;

procedure TSimpleQueryFiredac.loadConfig(aConfigFile: String);
var
    path: String;
    arqIni: TIniFile;
begin
    path := ExtractFilePath(Application.ExeName) + aConfigFile;
    arqIni := TIniFile.Create(path);

    FLink := TFDPhysPGDriverLink.Create(nil);
    FLink.Release;
    FLink.VendorLib := ExtractFilePath(Application.ExeName) + 'lib\libpq.dll';

    FConnection := TFDConnection.Create(nil);
    FConnection.DriverName := arqIni.ReadString(FAppName, 'DriverID', 'PG');
    FConnection.ConnectionName := FAppName;
    FConnection.ConnectionDefName := FAppName;
    FConnection.LoginPrompt := False;
    FConnection.Name := 'conn' + FAppName;

    with FConnection.Params as TFDPhysPGConnectionDefParams do
    begin
        Server := arqIni.ReadString(FAppName, 'Server', 'localhost');
        DriverID := arqIni.ReadString(FAppName, 'DriverID', '');
        Database := arqIni.ReadString(FAppName, 'Database', '');
        Password := arqIni.ReadString(FAppName, 'Password', 'postgres');
        UserName := arqIni.ReadString(FAppName, 'User_Name', 'postgres');
        ApplicationName := FAppName;
        Port := arqIni.ReadInteger(FAppName, 'Port', 5432);
        LoginTimeout := arqIni.ReadInteger(FAppName, 'Timeout', 30);
        CharacterSet := csUTF8;
    end;

    FConnection.Params.UserName := arqIni.ReadString(FAppName, 'User_Name', 'postgres');
    FConnection.Params.Password := arqIni.ReadString(FAppName, 'Password', 'postgres');

    FConnection.Connected := True;
end;

class function TSimpleQueryFiredac.New(aApplicationName: String): iSimpleQuery;
begin
     Result := Self.Create(aApplicationName);
end;

function TSimpleQueryFiredac.Open: iSimpleQuery;
var
    aMsg: String;
begin
    Result := Self;
    FQuery.Close;

    if Assigned(FParams) then
        FQuery.Params.Assign(FParams);

    try
        FQuery.Prepare;
        FQuery.Open;
    except
        on E: Exception do
        begin
            aMsg := 'ERROR: ' + Split(':', E.Message, False);
            TLog.New.error(aMsg);
            raise ESimpleQueryException.Create(aMsg);
        end;
    end;

    if Assigned(FParams) then
        FreeAndNil(FParams);
end;

function TSimpleQueryFiredac.Open(aSQL: String): iSimpleQuery;
begin
  Result := Self;
  FQuery.Close;
  FQuery.Open(aSQL);
end;

function TSimpleQueryFiredac.Params: TParams;
begin
  if not Assigned(FParams) then
  begin
    FParams := TParams.Create(nil);
    FParams.Assign(FQuery.Params);
  end;
  Result := FParams;
end;

function TSimpleQueryFiredac.SQL: TStrings;
begin
  Result := FQuery.SQL;
end;

end.
