unit SimpleRTTIHelper;

interface

uses
  RTTI, SimpleAttributes;

type
  TCustomAttributeClass = class of TCustomAttribute;

  TRttiPropertyHelper = class helper for TRttiProperty
  public
    function Tem<T: TCustomAttribute>: Boolean;
    function GetAttribute<T: TCustomAttribute>: T;
    function IsNotNull: Boolean;
    function IsNumberNotNull: Boolean;
    function IsIgnore: Boolean;
    function IsEnum: Boolean;
    function IsAutoInc: Boolean;
    function IsDBField: Boolean;
    function IsPrimaryKey: Boolean;
    function IsForeignKey: Boolean;
    function EhSomenteNumeros: Boolean;
    function EhPermitidoNulo: Boolean;
    function DisplayName: string;
    function FieldName: string;
    function EnumName: string;
//    function IsForeignKey: Boolean;
    function GetFKField(aInstance: TObject): TRttiProperty;
  end;

  TRttiTypeHelper = class helper for TRttiType
  public
    function Tem<T: TCustomAttribute>: Boolean;
    function GetAttribute<T: TCustomAttribute>: T;
    function GetPropertyFromAttribute<T: TCustomAttribute>: TRttiProperty; overload;
    function GetPropertyFromAttribute<T: DBField>(const aFieldName: string): TRttiProperty; overload;
    function GetPKField: TRttiProperty;
    function isTable: Boolean;
  end;

  TRttiFieldHelper = class helper for TRttiField
  public
    function Tem<T: TCustomAttribute>: Boolean;
    function GetAttribute<T: TCustomAttribute>: T;
  end;

  TValueHelper = record helper for TValue
  public
    function AsStringNumberOnly: String;
  end;

implementation

uses
  System.SysUtils;

{ TRttiPropertyMelhorado }

function TRttiPropertyHelper.GetAttribute<T>: T;
var
  oAtributo: TCustomAttribute;
begin
  Result := nil;
  for oAtributo in GetAttributes do
    if oAtributo is T then
      Exit((oAtributo as T));
end;

function TRttiPropertyHelper.GetFKField(aInstance: TObject): TRttiProperty;
var
    ctx: TRttiContext;
    typRtti: TRttiType;
    prpRtti: TRttiProperty;
begin
    Result := nil;
    ctx := TRttiContext.Create;
    try
        typRtti := ctx.GetType(aInstance.ClassInfo);
        for prpRtti in typRtti.GetProperties do
        begin
            if prpRtti.IsPrimaryKey then
                Result := prpRtti;
                Exit(prpRtti);
        end;
    finally
        ctx.Free;
    end;
end;

function TRttiPropertyHelper.DisplayName: string;
begin
  Result := Name;

  if Tem<Display> then
    Result := GetAttribute<Display>.Name
end;

function TRttiPropertyHelper.IsDBField: Boolean;
begin
  Result := Tem<DBField>
end;

function TRttiPropertyHelper.IsForeignKey: Boolean;
begin
  Result := Tem<FK>
end;

function TRttiPropertyHelper.IsPrimaryKey: Boolean;
begin
  Result := Tem<PK>
end;

function TRttiPropertyHelper.IsNotNull: Boolean;
begin
  Result := Tem<NotNull>
end;

function TRttiPropertyHelper.IsNumberNotNull: Boolean;
begin
  Result := Tem<NumberNotNull>
end;

function TRttiPropertyHelper.IsIgnore: Boolean;
begin
  Result := Tem<Ignore>
end;

function TRttiPropertyHelper.IsEnum: Boolean;
begin
  Result := Tem<Enumerator>
end;

function TRttiPropertyHelper.IsAutoInc: Boolean;
begin
  Result := Tem<AutoInc>
end;

function TRttiPropertyHelper.EhPermitidoNulo: Boolean;
begin
  Result := not IsNotNull;
end;

function TRttiPropertyHelper.EhSomenteNumeros: Boolean;
begin
  Result := Tem<NumberOnly>
end;

function TRttiPropertyHelper.FieldName: string;
begin
  Result := Name;
  if IsDBField then
    Result := GetAttribute<DBField>.Name;
end;

function TRttiPropertyHelper.EnumName: string;
begin
  Result := Name;
  if IsEnum then
    Result := GetAttribute<Enumerator>.Tipo;
end;
function TRttiPropertyHelper.Tem<T>: Boolean;
begin
  Result := GetAttribute<T> <> nil
end;

{ TRttiTypeMelhorado }

function TRttiTypeHelper.GetAttribute<T>: T;
var
  oAtributo: TCustomAttribute;
begin
  Result := nil;
  for oAtributo in GetAttributes do
    if oAtributo is T then
      Exit((oAtributo as T));
end;

function TRttiTypeHelper.GetPKField: TRttiProperty;
begin
  Result := GetPropertyFromAttribute<PK>;
end;

function TRttiTypeHelper.GetPropertyFromAttribute<T>(
  const aFieldName: string): TRttiProperty;
var
  RttiProp: TRttiProperty;
begin
  Result := nil;
  for RttiProp in GetProperties do
  begin
    if RttiProp.GetAttribute<T> = nil then
      Continue;

    if RttiProp.GetAttribute<DBField>.Name = aFieldName then
      Exit(RttiProp);
  end;
end;

function TRttiTypeHelper.GetPropertyFromAttribute<T>: TRttiProperty;
var
  RttiProp: TRttiProperty;
begin
  Result := nil;
  for RttiProp in GetProperties do
    if RttiProp.GetAttribute<T> <> nil then
      Exit(RttiProp);
end;

function TRttiTypeHelper.isTable: Boolean;
begin
  Result := Tem<Table>
end;

function TRttiTypeHelper.Tem<T>: Boolean;
begin
  Result := GetAttribute<T> <> nil
end;

{ TRttiFieldHelper }

function TRttiFieldHelper.GetAttribute<T>: T;
var
  oAtributo: TCustomAttribute;
begin
  Result := nil;
  for oAtributo in GetAttributes do
    if oAtributo is T then
      Exit((oAtributo as T));
end;

function TRttiFieldHelper.Tem<T>: Boolean;
begin
  Result := GetAttribute<T> <> nil
end;

{ TValueHelper.NumberOnly }

function TValueHelper.AsStringNumberOnly: String;
var
  sContent: string;
  nIndex: Integer;
begin
  Result := '';
  sContent := Trim(AsString);

  for nIndex := 1 to Length(sContent) do
    if CharInSet(sContent[nIndex], ['0'..'9']) then
      Result := Result + sContent[nIndex];
end;

end.

