unit uUtil;

interface

Uses
    FireDac.Comp.Client, dataModule, System.SysUtils;

    function getQuery: TFDQuery;
    function getTableTabelas: String;
    function getTableFields: String;
    function getSelectFields(aIdTabela: Integer): String;


implementation

function getQuery: TFDQuery;
var
    Qry: TFDQuery;
begin
    Qry := TFDQuery.Create(nil);
    Qry.Connection := DM.dbconn;
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

function getSelectFields(aIdTabela: Integer): String;
begin
    Result := Format('SELECT * FROM fields WHERE tabela = %d', [aIdTabela]);
end;

end.
