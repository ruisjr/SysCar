unit SimpleSQL;
interface
uses
  SimpleInterface;
Type
  TSimpleSQL<T: class, constructor> = class(TInterfacedObject, iSimpleSQL<T>)
    private
      FInstance: T;
      FFields: String;
      FWhere: String;
      FOrderBy: String;
      FGroupBy: String;
      FLimit: String;
      FJoin: String;
    public
      {Construtores e Destrutores}
      constructor Create(aInstance: T);
      destructor Destroy; override;

      {Fun��es de classes}
      class function New(aInstance: T): iSimpleSQL<T>;

      {Fun��es}
      function Insert(var aSQL: String): iSimpleSQL<T>; overload;
      function Insert(aInstance: T; var aSQL: String): iSimpleSQL<T>; overload;
      function Update(var aSQL: String): iSimpleSQL<T>; overload;
      function Update(aValues: String; aId: Integer; var aSQL: String): iSimpleSQL<T>; overload;
      function Delete(var aSQL: String): iSimpleSQL<T>;
      function Select(var aSQL: String): iSimpleSQL<T>;
      function SelectId(var aSQL: String): iSimpleSQL<T>;
      function Fields(aSQL: String): iSimpleSQL<T>;
      function Where(aSQL: String): iSimpleSQL<T>;
      function OrderBy(aSQL: String): iSimpleSQL<T>;
      function GroupBy(aSQL: String): iSimpleSQL<T>;
      function Limit(aSQL: String): iSimpleSQL<T>;
      function Join (aSQL: String): iSimpleSQL<T>;
      function LastID(var aSQL: String): iSimpleSQL<T>;
      function LastRecord(var aSQL: String): iSimpleSQL<T>;
  end;

implementation

uses
  SimpleRTTI, System.Generics.Collections, System.SysUtils;
{ TSimpleSQL<T> }

constructor TSimpleSQL<T>.Create(aInstance : T);
begin
    FInstance := aInstance;
    FLimit := '';
end;

function TSimpleSQL<T>.Delete(var aSQL: String): iSimpleSQL<T>;
var
  aClassName, aWhere : String;
begin
    Result := Self;
    TSimpleRTTI<T>.New(FInstance).TableName(aClassName).Where(aWhere);
    aSQL := aSQL + 'DELETE FROM ' + aClassName;
    aSQL := aSQL + ' WHERE ' + aWhere;
end;

destructor TSimpleSQL<T>.Destroy;
begin
  inherited;
end;

function TSimpleSQL<T>.Fields(aSQL: String): iSimpleSQL<T>;
begin
    Result := Self;
    if Trim(aSQL) <> '' then
        FFields := aSQL;
end;

function TSimpleSQL<T>.GroupBy(aSQL: String): iSimpleSQL<T>;
begin
    Result := Self;
    if Trim(aSQL) <> '' then
        FGroupBy := aSQL;
end;

function TSimpleSQL<T>.Insert(var aSQL: String): iSimpleSQL<T>;
var
    aClassName, aFields, aParam : String;
begin
    Result := Self;
    TSimpleRTTI<T>.New(FInstance)
        .TableName(aClassName)
        .FieldsInsert(aFields)
        .Param(aParam);

    aSQL := aSQL + 'INSERT INTO ' + aClassName;
    aSQL := aSQL + ' (' + aFields + ') ';
    aSQL := aSQL + ' VALUES (' + aParam + ');';
end;

function TSimpleSQL<T>.Insert(aInstance: T; var aSQL: String): iSimpleSQL<T>;
var
    aClassName, aFields, aValues : String;
begin
    Result := Self;
    TSimpleRTTI<T>.New(aInstance)
        .TableName(aClassName)
        .FieldsInsert(aFields)
        .Values(aInstance, aValues);

    aSQL := aSQL + 'INSERT INTO ' + aClassName;
    aSQL := aSQL + ' (' + aFields + ') ';
    aSQL := aSQL + ' VALUES (' + aValues + ');';
end;

function TSimpleSQL<T>.Join(aSQL: String): iSimpleSQL<T>;
begin
    Result := Self;
    FJoin := aSQL;
end;

function TSimpleSQL<T>.LastID(var aSQL: String): iSimpleSQL<T>;
var
    aClassName, aPK: String;
begin
    Result := Self;
    TSimpleRTTI<T>.New(FInstance)
        .TableName(aClassName)
        .PrimaryKey(aPK);

    aSQL := aSQL + 'select first(1) ' + aPK;
    aSQL := aSQL + ' from '+ aClassName;
    aSQL := aSQL + ' order by ' + aPK + ' desc';
end;

function TSimpleSQL<T>.LastRecord(var aSQL: String): iSimpleSQL<T>;
var
    aClassName, aPK, aFields : String;
begin
    Result := Self;
    TSimpleRTTI<T>.New(FInstance)
        .TableName(aClassName)
        .Fields(aFields)
        .PrimaryKey(aPK);

    aSQL := aSQL + 'select first(1) '+aFields;
    aSQL := aSQL + ' from '+ aClassName;
    aSQL := aSQL + ' order by ' + aPK + ' desc';
end;

function TSimpleSQL<T>.Limit(aSQL: String): iSimpleSQL<T>;
begin
    Result := Self;
    if not Trim(aSQL).IsEmpty then
        FLimit := aSQL;
end;

class function TSimpleSQL<T>.New(aInstance: T): iSimpleSQL<T>;
begin
    Result := Self.Create(aInstance);
end;

function TSimpleSQL<T>.OrderBy(aSQL: String): iSimpleSQL<T>;
begin
    Result := Self;
    if not Trim(aSQL).IsEmpty then
        FOrderBy := aSQL;
end;

function TSimpleSQL<T>.Select(var aSQL: String): iSimpleSQL<T>;
var
    aFields, aClassName : String;
begin
    Result := Self;
    TSimpleRTTI<T>.New(nil)
        .Fields(aFields)
        .TableName(aClassName);

    if Trim(FFields) <> '' then
        aSQL := aSQL + ' SELECT ' + FFields
    else
        aSQL := aSQL + ' SELECT ' + aFields;

    aSQL := aSQL + ' FROM ' + aClassName;

    if Trim(FJoin) <> '' then
        aSQL := aSQL + ' ' + FJoin + ' ';
    if Trim(FWhere) <> '' then
        aSQL := aSQL + ' WHERE ' + FWhere;
    if Trim(FGroupBy) <> '' then
        aSQL := aSQL + ' GROUP BY ' + FGroupBy;
    if Trim(FOrderBy) <> '' then
        aSQL := aSQL + ' ORDER BY ' + FOrderBy;
    if not Trim(FLimit).IsEmpty then
        aSQL := aSQL + ' LIMIT ' + FLimit;
end;

function TSimpleSQL<T>.SelectId(var aSQL: String): iSimpleSQL<T>;
var
  aFields, aClassName, aWhere : String;
begin
    Result := Self;
    TSimpleRTTI<T>.New(FInstance)
        .Fields(aFields)
        .TableName(aClassName)
        .Where(aWhere);

    if not Trim(FWhere).IsEmpty then
        aSQL := aSQL + ' WHERE ' + FWhere;

    aSQL := aSQL + ' SELECT ' + aFields;
    aSQL := aSQL + ' FROM ' + aClassName;
    aSQL := aSQL + ' WHERE ' + aWhere;
end;

function TSimpleSQL<T>.Update(var aSQL: String): iSimpleSQL<T>;
var
    ClassName, aUpdate, aWhere : String;
begin
    Result := Self;
    TSimpleRTTI<T>.New(FInstance)
        .TableName(ClassName)
        .Update(aUpdate)
        .Where(aWhere);

    aSQL := aSQL + 'UPDATE ' + ClassName;
    aSQL := aSQL + ' SET ' + aUpdate;
    aSQL := aSQL + ' WHERE ' + aWhere;
end;

function TSimpleSQL<T>.Update(aValues: String; aId: Integer; var aSQL: String): iSimpleSQL<T>;
var
  ClassName, aUpdate, aWhere : String;
begin
    Result := Self;
    TSimpleRTTI<T>.New(FInstance)
        .TableName(ClassName)
        .Where(aWhere);

    aSQL := aSQL + 'UPDATE ' + ClassName;
    aSQL := aSQL + ' SET ' + aValues;
    aSQL := aSQL + ' WHERE ' + aWhere;
end;

function TSimpleSQL<T>.Where(aSQL: String): iSimpleSQL<T>;
begin
    Result := Self;
    FWhere := aSQL;
end;

end.
