unit uUtil;

interface

Uses
    FireDac.Comp.Client, dataModule, System.SysUtils, System.Classes;

    function getQuery: TFDQuery;
    function getCommandDataBase: TFDCommand;
    function getQueryDatabase: TFDQuery;
    function getTableTabelas: String;
    function getTableFields: String;
    function getTableConstraints: String;
    function getTableDataBase: String;
    function getSelectFields(aIdTabela: Integer): String;
    function getSelectConstraints(aIdTabela: Integer): String;
    function getScriptCreateTable(aTabela: String): String;
    function getScriptFields(aFields: Array of string): String;
    function Split(aDelimiter: Char; aValue: String; aLeft: Boolean = True): String;
    function getNotNull(aNotNull: Boolean): String;
    function getDefault(aValue: String): String;
    function getStringField(aTamanho: String): String;
    function getNumericField(aTamanho, aPrecisao: String): String;
    function FieldExists(aTable, aField: String): Boolean;
    procedure AdicionarEditarCampos(aTable, aField, aTipo, aTamanho, aPrecisao: String; aAlter: Boolean = False);
    procedure AplicarNotNull(aTable, aField: String; aNotNull: Boolean);
    procedure AplicarDefault(aTable, aField, aDefault: String);


implementation

uses uLogs;

function getQuery: TFDQuery;
var
    Qry: TFDQuery;
begin
    Qry := TFDQuery.Create(nil);
    Qry.Connection := DM.dbconn;
    Qry.Close;
    Qry.SQL.Clear;
    Result := Qry;
end;

function getCommandDataBase: TFDCommand;
var
    Com: TFDCommand;
begin
    Com := FireDAC.Comp.Client.TFDCommand.Create(nil);
    Com.Connection := DM.dbconn;
    Com.Name := 'commandDatabase';
    Result := Com;
end;

function getQueryDatabase: TFDQuery;
var
    Qry: TFDQuery;
begin
    Qry := TFDQuery.Create(nil);
    Qry.Connection := DM.ConnDataBase;
    Result := Qry;
end;

function getTableTabelas: String;
begin
    Result := 'CREATE TABLE IF NOT EXISTS tabelas ('+
                    ' id INTEGER NOT NULL CONSTRAINT PK_ID PRIMARY KEY AUTOINCREMENT '+
                    ',nome VARCHAR(100) NOT NULL)';
end;

function getTableFields: String;
begin
    Result := 'CREATE TABLE IF NOT EXISTS fields ('+
                     ' id INTEGER NOT NULL CONSTRAINT PK_ID PRIMARY KEY AUTOINCREMENT '+
                     ',tabela INTEGER'+
                     ',nome VARCHAR(100)'+
                     ',tipo VARCHAR(30)'+
                     ',tamanho INTEGER'+
                     ',precisao INTEGER'+
                     ',nao_nulo BOOLEAN'+
                     ',valor_padrao VARCHAR(100)'+
                     ',FOREIGN KEY(tabela) REFERENCES tabelas(id))';
end;

function getTableConstraints: String;
begin
    Result := 'CREATE TABLE IF NOT EXISTS constraints (' +
                    ' id INTEGER NOT NULL CONSTRAINT PK_ID PRIMARY KEY AUTOINCREMENT '+
                    ',tabela INTEGER NOT NULL ' +
                    ',nome VARCHAR(100) ' +
                    ',tipo VARCHAR(50) '+
                    ',campo_fk VARCHAR(100) '+
                    ',tabela_fk VARCHAR(100) '+
                    ',campo_tabela_fk VARCHAR(100) '+
                    ',FOREIGN KEY (tabela) REFERENCES tabelas(id))';
end;

function getTableDataBase: String;
begin
    Result := 'CREATE TABLE IF NOT EXISTS database (' +
                    ' id INTEGER NOT NULL CONSTRAINT PK_ID PRIMARY KEY AUTOINCREMENT ' +
                    ',database VARCHAR(50) NOT NULL '+
                    ',porta INTEGER NOT NULL '+
                    ',usuario VARCHAR(100) NOT NULL '+
                    ',senha VARCHAR(100) NOT NULL '+
                    ',hostname VARCHAR(100) NOT NULL '+
                    ',dbname VARCHAR(100) NOT NULL ' +
                    ',timeout INTEGER NOT NULL)';
end;

function getSelectFields(aIdTabela: Integer): String;
begin
    Result := Format('SELECT * FROM fields WHERE tabela = %d', [aIdTabela]);
end;

function getSelectConstraints(aIdTabela: Integer): String;
begin
    Result := Format('SELECT * FROM constraints WHERE tabela = %d', [aIdTabela]);
end;

function getScriptCreateTable(aTabela: String): String;
begin
    Result := Format('CREATE TABLE %s (', [aTabela]);
end;

function getScriptFields(aFields: Array of string): String;
var
    ix: Integer;
begin
    Result := '';
    for ix := 0 to High(aFields) do
    begin
        Result := Result + ', ' + aFields[ix];
    end;
   Result := Copy(Result, 2, Length(Result)) + ' ';
end;

function Split(aDelimiter: Char; aValue: String; aLeft: Boolean = True): String;
var
    aListString: TStringList;
begin
    aListString := TStringList.Create;
    aListString.Clear;
    aListString.Delimiter       := aDelimiter;
    aListString.StrictDelimiter := True; // Requires D2006 or newer.
    aListString.DelimitedText   := aValue;
    if aLeft then
        Result := aListString[0].Trim
    else
        Result := aListString[1].Trim;
end;

function getNotNull(aNotNull: Boolean): String;
begin
    Result := '';
    if aNotNull then
    begin
        Result := ' NOT NULL ';
    end;
end;

function getDefault(aValue: String): String;
begin
    Result := ' ';
    if not aValue.IsEmpty then
        Result := ' DEFAULT ' + aValue;
end;

function getStringField(aTamanho: String): String;
begin
    Result := '';
    if not aTamanho.IsEmpty then
    begin
        Result := Format(' VARCHAR(%s) ', [aTamanho]);
    end;
end;

function getNumericField(aTamanho, aPrecisao: String): String;
begin
    Result := '';
    if not aTamanho.IsEmpty and not aPrecisao.IsEmpty then
        Result := Format(' NUMERIC(%s, %s) ', [aTamanho, aPrecisao])
    else if not aTamanho.IsEmpty and aPrecisao.IsEmpty then
        Result := Format(' NUMERIC(%s) ', [aTamanho]);
end;

function FieldExists(aTable, aField: String): Boolean;
begin
    with getQueryDatabase do
    begin
        Close;
        SQL.Clear;
        SQL.Text := Format('SELECT column_name FROM information_schema.columns WHERE table_name = %s AND column_name = %s', [QuotedStr(aTable), QuotedStr(aField)]);
        TLog.New.debug(getQueryDatabase.SQL.Text);
        Prepare;
        Open;

        Result := RecordCount > 0;
    end;
end;

procedure AdicionarEditarCampos(aTable, aField, aTipo, aTamanho, aPrecisao: String; aAlter: Boolean = False);
var
    aQuery, aTipoAcao, aType: String;
begin
    aType := '';
    aTipoAcao := 'ADD';
    if aAlter then
    begin
        aType := 'TYPE';
        aTipoAcao:= 'ALTER';
    end;

    if aTipo = 'INTEGER' then
        aQuery := Format('ALTER TABLE %s %s COLUMN %s %s %s', [aTable, aTipoAcao, aField, aType, aTipo])

    else if aTipo = 'STRING' then
        aQuery := Format('ALTER TABLE %s %s COLUMN %s %s %s', [aTable, aTipoAcao, aField, aType, getStringField(aTamanho)])

    else if aTipo = 'NUMERIC' then
        aQuery := Format('ALTER TABLE %s %s COLUMN %s %s %s', [aTable, aTipoAcao, aField, aType, getNumericField(aTamanho, aPrecisao)])
    else
        aQuery := Format('ALTER TABLE %s %s COLUMN %s %s %s', [aTable, aTipoAcao, aField, aType, aTipo]);

    TLog.New.debug(aQuery);

    with getQueryDatabase do
    begin
        Close;
        SQL.Clear;
        SQL.Text := aQuery;
        Prepare;
        ExecSQL;
        Free;
    end;
end;

procedure AplicarNotNull(aTable, aField: String; aNotNull: Boolean);
var
    aQuery: String;
begin
    if not aNotNull then
        Exit;

    aQuery := Format('ALTER TABLE %s ALTER COLUMN %s SET NOT NULL', [aTable, aField]);

    TLog.New.debug(aQuery);

    with getQueryDatabase do
    begin
        Close;
        SQL.Clear;
        SQL.Text := aQuery;
        Prepare;
        ExecSQL;
        Free;
    end;
end;

procedure AplicarDefault(aTable, aField, aDefault: String);
var
    aQuery, aTipoAcao: String;
begin
    aTipoAcao := 'SET';
    if aDefault.IsEmpty then
        aTipoAcao := 'DROP';

    aQuery := Format('ALTER TABLE %s ALTER COLUMN %s %s DEFAULT %s', [aTable, aField, aTipoAcao, aDefault]);

    TLog.New.debug(aQuery);

    with getQueryDatabase do
    begin
        Close;
        SQL.Clear;
        SQL.Text := aQuery;
        Prepare;
        ExecSQL;
        Free;
    end;
end;

end.
