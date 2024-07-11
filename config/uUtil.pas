unit uUtil;

interface

Uses
    FireDac.Comp.Client, dataModule, System.SysUtils, System.Classes;

    function getQuery: TFDQuery;
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


implementation

function getQuery: TFDQuery;
var
    Qry: TFDQuery;
begin
    Qry := TFDQuery.Create(nil);
    Qry.Connection := DM.dbconn;
    Result := Qry;
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

end.
