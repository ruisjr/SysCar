{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}

{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit SimpleRTTI;

interface

uses
  SimpleInterface,
  System.Generics.Collections,
  System.RTTI,
  Data.DB,
  TypInfo,
  {$IFNDEF CONSOLE}
    {$IFDEF FMX}
      FMX.Types,FMX.Forms, FMX.Edit, FMX.ListBox, FMX.StdCtrls, FMX.DateTimeCtrls,
    {$ELSE}
        Vcl.ComCtrls, Vcl.Graphics, Vcl.Forms, VCL.StdCtrls, Vcl.ExtCtrls,
    {$ENDIF}
  {$ENDIF}
  System.Classes,
  System.SysUtils, AdvEdit, AdvCombo, AdvOfficeButtons, AdvDateTimePicker;

Type
  ESimpleRTTI = Exception;

  TSimpleRTTI<T : class, constructor> = class(TInterfacedObject, iSimpleRTTI<T>)
    private
      FInstance : T;
//      function __findRTTIField(ctxRtti : TRttiContext; classe: TClass; const Field: String): TRttiField;
      function __FloatFormat( aValue : String ) : Currency;
      {$IFNDEF CONSOLE}
      function __BindValueToComponent( aComponent : TComponent; aValue : Variant) : iSimpleRTTI<T>;
      function __GetComponentToValue( aComponent : TComponent) : TValue;
      function __BindValueToProperty( aEntity : T; aProperty : TRttiProperty; aValue : TValue) : iSimpleRTTI<T>;
      function __GetRTTIPropertyValue(aEntity : T; aPropertyName : String) : Variant;
      function __GetRTTIProperty(aEntity : T; aPropertyName : String) : TRttiProperty;
      function ClassName(var aClassName: String): iSimpleRTTI<T>;
      function ListFields(var List: TList<String>): iSimpleRTTI<T>;
      {$ENDIF}
    public
      constructor Create( aInstance : T );
      destructor Destroy; override;
      class function New( aInstance : T ) : iSimpleRTTI<T>;
      function TableName(var aTableName: String): ISimpleRTTI<T>;

      function Fields (var aFields: String): iSimpleRTTI<T>;
      function FieldsInsert (var aFields: String) : iSimpleRTTI<T>;
      function Param (var aParam: String): iSimpleRTTI<T>;
      function Values(aInstance: T; var aValues: String): iSimpleRTTI<T>;
      function Where (var aWhere: String): iSimpleRTTI<T>;
      function Update(var aUpdate: String): iSimpleRTTI<T>;
      function DictionaryFields(var aDictionary : TDictionary<string, variant>) : iSimpleRTTI<T>;
      function DictionaryTypeFields(var aDictionary: TDictionary<string, TFieldType>): iSimpleRTTI<T>;
      class function DictionaryFieldClass(var aDictionary: TDictionary<String, String>): iSimpleRTTI<T>;
      function DataSetToEntityList (aDataSet : TDataSet; var aList : TObjectList<T>) : iSimpleRTTI<T>;
      function DataSetToEntity (aDataSet : TDataSet; var aEntity : T) : iSimpleRTTI<T>;
      function PrimaryKey(var aPK : String) : iSimpleRTTI<T>;
      {$IFNDEF CONSOLE}
      function BindClassToForm (aForm : TForm; const aEntity : T): iSimpleRTTI<T>;
      function BindFormToClass (aForm : TForm; var aEntity : T) : iSimpleRTTI<T>;
      {$ENDIF}
  end;

implementation

uses
  SimpleAttributes,
  Variants,
  SimpleRTTIHelper,
  System.UITypes, uLogs;

{ TSimpleRTTI }

{$IFNDEF CONSOLE}
function TSimpleRTTI<T>.__BindValueToComponent(aComponent: TComponent; aValue: Variant): iSimpleRTTI<T>;
begin
    if VarIsNull(aValue) then
        exit;

    if aComponent is TAdvEdit then
        (aComponent as TAdvEdit).Text := aValue;

    if aComponent is TAdvComboBox then
        (aComponent as TAdvComboBox).ItemIndex := (aComponent as TAdvComboBox).Items.IndexOf(aValue);

    {$IFDEF VCL}
    if aComponent is TRadioGroup then
        (aComponent as TRadioGroup).ItemIndex := (aComponent as TRadioGroup).Items.IndexOf(aValue);

    if aComponent is TShape then
        (aComponent as TShape).Brush.Color := aValue;
    {$ENDIF}

    //DateControls
    {$IFDEF VCL}
    if aComponent is TAdvDateTimePicker then
        (aComponent as TAdvDateTimePicker).Date := aValue;
    {$ENDIF}
    {$IFDEF FMX}
    if aComponent is TDateEdit then
        (aComponent as TDateEdit).Date := aValue;
    {$ENDIF}

    if aComponent is TAdvOfficeCheckBox then
    {$IFDEF VCL}
        (aComponent as TAdvOfficeCheckBox).Checked := aValue;
    {$ELSEIF IFDEF FMX}
        (aComponent as TAdvOfficeCheckBox).IsChecked := aValue;
    {$ENDIF}

    if aComponent is TTrackBar then
    {$IFDEF VCL}
        (aComponent as TTrackBar).Position := aValue;
    {$ENDIF}
end;


function TSimpleRTTI<T>.__BindValueToProperty(aEntity : T; aProperty: TRttiProperty; aValue: TValue): iSimpleRTTI<T>;
begin
    case aProperty.PropertyType.TypeKind of
        tkUnknown: ;
        tkInteger:
            aProperty.SetValue(Pointer(aEntity), StrToInt(aValue.ToString));
        tkChar: ;
        tkEnumeration: ;
        tkFloat:
        begin
            if (aValue.TypeInfo = TypeInfo(TDate)) or
               (aValue.TypeInfo = TypeInfo(TTime)) or
               (aValue.TypeInfo = TypeInfo(TDateTime)) then
                aProperty.SetValue(Pointer(aEntity), StrToDateTime(aValue.ToString))
            else
                aProperty.SetValue(Pointer(aEntity), StrToFloat(aValue.ToString));
        end;
        tkSet: ;
        tkClass: ;
        tkMethod: ;
        tkString, tkWChar, tkLString, tkWString, tkVariant, tkUString:
            aProperty.SetValue(Pointer(aEntity), aValue);
        tkArray: ;
        tkRecord: ;
        tkInterface: ;
        tkInt64:
            aProperty.SetValue(Pointer(aEntity), aValue.Cast<Int64>);
        tkDynArray: ;
        tkClassRef: ;
        tkPointer: ;
        tkProcedure: ;
        {$IF RTLVERSION > 31.0}
        tkMRecord: ;
        {$ENDIF}
    else
        aProperty.SetValue(Pointer(aEntity), aValue);
    end;

end;
{$ENDIF}

//function TSimpleRTTI<T>.__findRTTIField(ctxRtti: TRttiContext; classe: TClass;
//  const Field: String): TRttiField;
//var
//  typRtti : TRttiType;
//begin
//  typRtti := ctxRtti.GetType(classe.ClassInfo);
//  Result  := typRtti.GetField(Field);
//end;

function TSimpleRTTI<T>.__FloatFormat( aValue : String ) : Currency;
begin
    while Pos('.', aValue) > 0 do
        delete(aValue,Pos('.', aValue),1);

    Result := StrToCurr(aValue);
end;

{$IFNDEF CONSOLE}
function TSimpleRTTI<T>.__GetComponentToValue(aComponent: TComponent): TValue;
var
    a: string;
begin
  if aComponent is TAdvEdit then
    Result := TValue.FromVariant((aComponent as TAdvEdit).Text);

  if aComponent is TAdvComboBox then
    Result := TValue.FromVariant((aComponent as TAdvComboBox).Items[(aComponent as TAdvComboBox).ItemIndex]);

  {$IFDEF VCL}
  if aComponent is TRadioGroup then
    Result := TValue.FromVariant((aComponent as TRadioGroup).Items[(aComponent as TRadioGroup).ItemIndex]);

  if aComponent is TShape then
    Result := TValue.FromVariant((aComponent as TShape).Brush.Color);
  {$ENDIF}

  if aComponent is TAdvOfficeCheckBox then
  {$IFDEF VCL}
    Result := TValue.FromVariant((aComponent as TAdvOfficeCheckBox).Checked);
  {$ELSEIF IFDEF FMX}
      Result := TValue.FromVariant((aComponent as TAdvOfficeCheckBox).IsChecked);
  {$ENDIF}

  {$IFDEF VCL}
  if aComponent is TTrackBar then
    Result := TValue.FromVariant((aComponent as TTrackBar).Position);
  {$ENDIF}

  {$IFDEF VCL}
  if aComponent is TAdvDateTimePicker then
    Result := TValue.FromVariant((aComponent as TAdvDateTimePicker).DateTime);
  {$ENDIF}
  {$IFDEF FMX}
  if aComponent is TDateEdit then
    Result := TValue.FromVariant((aComponent as TDateEdit).DateTime);
  {$ENDIF}


  a := Result.TOString;
end;

function TSimpleRTTI<T>.__GetRTTIProperty(aEntity: T; aPropertyName: String): TRttiProperty;
var
    typRttiEntity : TRttiType;
    ctxRttiEntity : TRttiContext;
begin
    ctxRttiEntity := TRttiContext.Create;
    try
        typRttiEntity := ctxRttiEntity.GetType(aEntity.ClassInfo);
        Result := typRttiEntity.GetProperty(aPropertyName);
        if not Assigned(Result) then
            Result := typRttiEntity.GetPropertyFromAttribute<DBField>(aPropertyName);

        if not Assigned(Result) then
            raise ESimpleRTTI.Create('Property ' + aPropertyName + ' not found!');
    finally
        ctxRttiEntity.Free;
    end;
end;

function TSimpleRTTI<T>.__GetRTTIPropertyValue(aEntity: T; aPropertyName: String): Variant;
begin
    Result := __GetRTTIProperty(aEntity, aPropertyName).GetValue(Pointer(aEntity)).AsVariant;
end;

function TSimpleRTTI<T>.BindClassToForm(aForm: TForm; const aEntity: T): iSimpleRTTI<T>;
var
    typRtti: TRttiType;
    prpRtti: TRttiField;
    ctxRtti: TRttiContext;
begin
    Result := Self;
    ctxRtti := TRttiContext.Create;
    try
        typRtti := ctxRtti.GetType(aForm.ClassInfo);
        for prpRtti in typRtti.GetFields do
        begin
            if prpRtti.Tem<Bind> then
            begin
            __BindValueToComponent(aForm.FindComponent(prpRtti.Name), __GetRTTIPropertyValue(aEntity, prpRtti.GetAttribute<Bind>.Field));
            end;
        end;
    finally
        ctxRtti.Free;
    end;
end;

function TSimpleRTTI<T>.BindFormToClass(aForm: TForm; var aEntity: T): iSimpleRTTI<T>;
var
  typRtti: TRttiType;
  prpRtti: TRttiField;
  ctxRtti: TRttiContext;
begin
    Result := Self;
    ctxRtti := TRttiContext.Create;
    try
        typRtti := ctxRtti.GetType(aForm.ClassInfo);
        for prpRtti in typRtti.GetFields do
        begin
            if prpRtti.Tem<Bind> then
            begin
                __BindValueToProperty(aEntity, __GetRTTIProperty(aEntity, prpRtti.GetAttribute<Bind>.Field), __GetComponentToValue(aForm.FindComponent(prpRtti.Name)));
            end;
        end;
    finally
        ctxRtti.Free;
    end;
end;
{$ENDIF}

function TSimpleRTTI<T>.ClassName(var aClassName : String): iSimpleRTTI<T>;
var
  Info: PTypeInfo;
  typRtti: TRttiType;
  ctxRtti: TRttiContext;
begin
    Result := Self;
    Info := System.TypeInfo(T);
    ctxRtti := TRttiContext.Create;
    try
        typRtti := ctxRtti.GetType(Info);
        aClassName := Copy(typRtti.Name, 2, Length(typRtti.Name));
    finally
        ctxRtti.Free;
    end;
end;

constructor TSimpleRTTI<T>.Create( aInstance : T );
begin
  FInstance := aInstance;
end;

function TSimpleRTTI<T>.DataSetToEntity(aDataSet: TDataSet; var aEntity: T): iSimpleRTTI<T>;
var
    aObj: TObject;
    Info: PTypeInfo;
    Value: TValue;
    Field : TField;
    ctxRtti: TRttiContext;
    typRtti: TRttiType;

    prpRtti, prpFKType: TRttiProperty;
begin
    Result := Self;
    aDataSet.First;
    while not aDataSet.Eof do
    begin
        Info := System.TypeInfo(T);
        ctxRtti := TRttiContext.Create;
        try
            for Field in aDataSet.Fields do
            begin
                typRtti := ctxRtti.GetType(Info);
                for prpRtti in typRtti.GetProperties do
                begin
                    if LowerCase(prpRtti.FieldName) = LowerCase(Field.DisplayName) then
                    begin
                        case prpRtti.PropertyType.TypeKind of
                            tkUnknown, tkString, tkWChar, tkLString, tkWString, tkUString:
                                Value := Field.AsString;
                            tkInteger, tkInt64:
                                Value := Field.AsInteger;
                            tkChar: ;
                            tkEnumeration:
                            begin
                                if (prpRtti.GetValue(Pointer(aEntity)).TypeInfo.Name = 'Boolean') then
                                    Value := Field.AsBoolean
                                else
                                    Value := Field.AsString;
                            end;
                            tkFloat: Value := Field.AsFloat;
                            tkSet: ;
                            tkClass:
                            begin
                                if prpRtti.IsForeignKey then
                                begin
                                    aObj := prpRtti.GetValue(Pointer(aEntity)).AsObject;
                                    prpFKType := prpRtti.GetFKField(aObj);
                                    if prpFKType <> nil then
                                        Value := aObj;
                                end;
                            end;
                            tkMethod: ;
                            tkVariant: ;
                            tkArray: ;
                            tkRecord: ;
                            tkInterface: ;
                            tkDynArray: ;
                            tkClassRef: ;
                            tkPointer: ;
                            tkProcedure: ;
                        end;
                        prpRtti.SetValue(Pointer(aEntity), Value);
                    end;
                end;
            end;
        finally
            ctxRtti.Free;
        end;
        aDataSet.Next;
    end;
    aDataSet.First;
end;

function TSimpleRTTI<T>.DataSetToEntityList(aDataSet: TDataSet; var aList: TObjectList<T>): iSimpleRTTI<T>;
var
    aObj, aObjAux: TObject;
    Info: PTypeInfo;
    Value: TValue;
    Field: TField;
    ctxFK,
    ctxRtti: TRttiContext;
    typRtti, typRttiFK: TRttiType;
    prpRtti,
    prpIDTyp,
    prpFKType: TRttiProperty;
    RttiInstanceType: TRttiInstanceType;
    RttiMethod: TRttiMethod;
    Instance: TValue;

    Classe: TClass;
begin
    Result := Self;
    aList.Clear;
    while not aDataSet.Eof do
    begin
        aList.Add(T.Create);
        Info := System.TypeInfo(T);
        ctxRtti := TRttiContext.Create;
        try
            for Field in aDataSet.Fields do
            begin
                typRtti := ctxRtti.GetType(Info);
                for prpRtti in typRtti.GetProperties do
                begin
                    if LowerCase(prpRtti.FieldName) = LowerCase(Field.FieldName) then
                    begin
                        Field.DisplayLabel := prpRtti.DisplayName;
                        case prpRtti.PropertyType.TypeKind of
                            tkUnknown, tkString, tkWChar, tkLString, tkWString, tkUString:
                                Value := Field.AsString;
                            tkInteger, tkInt64:
                                Value := Field.AsInteger;
                            tkChar: ;
                            tkEnumeration:
                            begin
                                if (prpRtti.GetValue(Info).TypeInfo.Name = 'Boolean') then
                                    Value := Field.AsBoolean
                                else
                                    Value := Field.AsString;
                            end;
                            tkFloat:
                                Value := Field.AsFloat;
                            tkSet: ;
                            tkClass:
                            begin
//                                if prpRtti.IsForeignKey then
//                                begin
//                                    ctxFK := TRttiContext.Create;
//                                    try
//                                        typRttiFK := ctxFK.GetType(Info);
//                                        Classe := FindClass(prpRtti.PropertyType.name);
//                                        RttiInstanceType := ctxRtti.FindType(Classe.UnitName+'.'+Classe.ClassName).AsInstance;
//                                        RttiMethod := RttiInstanceType.GetMethod('Create');
//                                        Instance := RttiMethod.Invoke(RttiInstanceType.MetaclassType,[]);
////                                        prpIDTyp := prpRtti.GetFKField(Instance.AsObject);
////                                        prpIDTyp.SetValue(Pointer(typRttiFK), Field.AsInteger);
//                                        prpIDTyp := RttiInstanceType.GetProperty('ID');
//                                        prpIDTyp.SetValue(Instance.AsClass.ClassInfo, Field.AsInteger);
//                                        Value := Instance.AsObject;
//                                    finally
//                                        ctxFK.Free;
//                                    end;
//                                end;
                            end;
                            tkMethod: ;
                            tkVariant: ;
                            tkArray: ;
                            tkRecord: ;
                            tkInterface: ;
                            tkDynArray: ;
                            tkClassRef: ;
                            tkPointer: ;
                            tkProcedure: ;
                        end;
                        if prpRtti.PropertyType.TypeKind <> tkClass then
                            prpRtti.SetValue(Pointer(aList[Pred(aList.Count)]), Value);
                    end;
                end;
            end;
        finally
          ctxRtti.Free;
        end;
        aDataSet.Next;
    end;
    aDataSet.First;
end;

destructor TSimpleRTTI<T>.Destroy;
begin

  inherited;
end;

class function TSimpleRTTI<T>.DictionaryFieldClass(var aDictionary: TDictionary<String, String>): iSimpleRTTI<T>;
begin
//
end;

function TSimpleRTTI<T>.DictionaryFields(var aDictionary : TDictionary<string, variant>) : iSimpleRTTI<T>;
var
  aObj: TObject;
  Info: PTypeInfo;
  typRtti: TRttiType;
  ctxRtti: TRttiContext;
  prpRtti,
  prpFKType: TRttiProperty;
begin
    Result := Self;
    Info := System.TypeInfo(T);
    ctxRtti := TRttiContext.Create;
    try
        typRtti := ctxRtti.GetType(Info);
        for prpRtti in typRtti.GetProperties do
        begin
            if not prpRtti.IsNotNull and prpRtti.IsIgnore then
                Continue;

            case prpRtti.PropertyType.TypeKind of
                tkInteger, tkInt64:
                begin
                    if prpRtti.IsPrimaryKey or prpRtti.IsForeignKey then
                    begin
                        if prpRtti.GetValue(Pointer(FInstance)).AsInteger = 0 then
                            continue
                        else
                            aDictionary.Add(prpRtti.FieldName, prpRtti.GetValue(Pointer(FInstance)).AsInteger);
                    end
                    else
                        aDictionary.Add(prpRtti.FieldName, prpRtti.GetValue(Pointer(FInstance)).AsInteger);
                  end;
                tkFloat:
                begin
                    if (prpRtti.GetValue(Pointer(FInstance)).TypeInfo = TypeInfo(TDateTime)) or
                       (prpRtti.GetValue(Pointer(FInstance)).TypeInfo = TypeInfo(TDate)) or
                       (prpRtti.GetValue(Pointer(FInstance)).TypeInfo = TypeInfo(TTime)) then
                    begin
                        if prpRtti.GetValue(Pointer(FInstance)).AsExtended = 0 then
                            aDictionary.Add(prpRtti.FieldName, Null)
                        else
                        begin
                            if prpRtti.GetValue(Pointer(FInstance)).TypeInfo = TypeInfo(TDate) then
                                aDictionary.Add(prpRtti.FieldName, StrToDate(prpRtti.GetValue(Pointer(FInstance)).ToString))
                            else if prpRtti.GetValue(Pointer(FInstance)).TypeInfo = TypeInfo(TTime) then
                                aDictionary.Add(prpRtti.FieldName, StrToTime(prpRtti.GetValue(Pointer(FInstance)).ToString))
                            else
                                aDictionary.Add(prpRtti.FieldName, StrToDateTime(prpRtti.GetValue(Pointer(FInstance)).ToString ));
                        end;
                    end
                    else
                        aDictionary.Add(prpRtti.FieldName, __FloatFormat(prpRtti.GetValue(Pointer(FInstance)).ToString));
                end;
                tkWChar,
                tkLString,
                tkWString,
                tkUString,
                tkString:
                    aDictionary.Add(prpRtti.FieldName, prpRtti.GetValue(Pointer(FInstance)).AsString);
                tkVariant:
                    aDictionary.Add(prpRtti.FieldName, prpRtti.GetValue(Pointer(FInstance)).AsVariant);
                tkClass:
                begin
                    if prpRtti.IsForeignKey then
                    begin
                        if prpRtti.GetValue(Pointer(FInstance)).AsInteger = 0 then
                            Continue;

                        aObj := prpRtti.GetValue(Pointer(FInstance)).AsObject;
                        prpFKType := prpRtti.GetFKField(aObj);

                        if (prpFKType <> nil) and (prpFKType.getValue(aObj).asInteger = 0) then
                            Continue;

                        if (prpFKType <> nil) then
                            aDictionary.Add(prpRtti.fieldname, prpFKType.getValue(aObj).asinteger)
                    end;
                end;
                tkEnumeration:
                    if (prpRtti.GetValue(Pointer(FInstance)).TypeInfo.Name = 'Boolean') then
                        aDictionary.Add(prpRtti.fieldname, prpRtti.GetValue(Pointer(FInstance)).AsBoolean)
            else
                aDictionary.Add(prpRtti.FieldName, prpRtti.GetValue(Pointer(FInstance)).AsString);
            end;
        end;
    finally
        ctxRtti.Free;
    end;
end;

function TSimpleRTTI<T>.DictionaryTypeFields(var aDictionary : TDictionary<string, TFieldType>) : iSimpleRTTI<T>;
var
  ctxRtti   : TRttiContext;
  typRtti   : TRttiType;
  prpRtti   : TRttiProperty;
  Info     : PTypeInfo;
begin
    Result := Self;
    Info := System.TypeInfo(T);
    ctxRtti := TRttiContext.Create;
    try
        typRtti := ctxRtti.GetType(Info);
        for prpRtti in typRtti.GetProperties do
        begin
            if not prpRtti.IsNotNull and prpRtti.IsIgnore then
                Continue;

            case prpRtti.PropertyType.TypeKind of
                tkInteger, tkInt64:
                    aDictionary.Add(prpRtti.FieldName, TFieldType.ftInteger);
                tkFloat:
                begin
                    if prpRtti.GetValue(Pointer(FInstance)).TypeInfo.name = 'TDateTime' then //TypeInfo(TDateTime) then
                        aDictionary.Add(prpRtti.FieldName, TFieldType.ftDateTime)
                    else if prpRtti.GetValue(Pointer(FInstance)).TypeInfo.name = 'TDate' then //TypeInfo(TDate) then
                        aDictionary.Add(prpRtti.FieldName, TFieldType.ftDate)
                    else if prpRtti.GetValue(Pointer(FInstance)).TypeInfo.Name = 'TTime' then//TypeInfo(TTime) then
                        aDictionary.Add(prpRtti.FieldName, TFieldType.ftTime)
                    else
                        aDictionary.Add(prpRtti.FieldName, TFieldType.ftFloat)
                end;
                tkWChar,
                tkLString,
                tkWString,
                tkUString:
                    aDictionary.Add(prpRtti.FieldName, TFieldType.ftString);
                tkEnumeration:
                    if (prpRtti.GetValue(Pointer(FInstance)).TypeInfo.Name = 'Boolean') then
                        aDictionary.Add(prpRtti.FieldName, TFieldType.ftBoolean);
            end;
        end;
    finally
        ctxRtti.Free;
    end;
end;

function TSimpleRTTI<T>.Fields (var aFields : String) : iSimpleRTTI<T>;
var
  ctxRtti   : TRttiContext;
  typRtti   : TRttiType;
  prpRtti   : TRttiProperty;
  Info     : PTypeInfo;
begin
    Result := Self;
    Info := System.TypeInfo(T);
    ctxRtti := TRttiContext.Create;
    try
        typRtti := ctxRtti.GetType(Info);
        for prpRtti in typRtti.GetProperties do
        begin
            if not prpRtti.IsIgnore then
                aFields := aFields + prpRtti.FieldName + ', ';
        end;
    finally
        aFields := Copy(aFields, 0, Length(aFields) - 2) + ' ';
        ctxRtti.Free;
    end;
end;

function TSimpleRTTI<T>.FieldsInsert(var aFields: String): iSimpleRTTI<T>;
var
    aObj: TObject;
    Info: PTypeInfo;
    ctxRtti: TRttiContext;
    typRtti: TRttiType;
    prpRtti,
    prpFKType: TRttiProperty;
begin
    Result := Self;
    Info := System.TypeInfo(T);
    ctxRtti := TRttiContext.Create;
    try
        typRtti := ctxRtti.GetType(Info);
        for prpRtti in typRtti.GetProperties do
        begin
            if prpRtti.IsAutoInc then
                Continue;

            if not prpRtti.IsNotNull and prpRtti.IsIgnore then
                Continue;

            if prpRtti.IsForeignKey then
            begin
                begin
                    if prpRtti.GetValue(Pointer(FInstance)).isobject then
                    begin
                        aObj := prpRtti.GetValue(Pointer(FInstance)).AsObject;
                        prpFKType := prpRtti.GetFKField(aObj);
                        if prpFKType.getValue(aObj).asinteger = 0 then
                            Continue;
                    end
                    else
                        if prpRtti.GetValue(Pointer(FInstance)).AsInteger = 0 then
                            Continue;
                end;
            end;

            aFields := aFields + prpRtti.FieldName + ', ';
        end;
    finally
        aFields := Copy(aFields, 0, Length(aFields) - 2) + ' ';
        ctxRtti.Free;
    end;
end;

function TSimpleRTTI<T>.ListFields(var List: TList<String>): iSimpleRTTI<T>;
var
  ctxRtti   : TRttiContext;
  typRtti   : TRttiType;
  prpRtti   : TRttiProperty;
  Info     : PTypeInfo;
begin
  Result := Self;
  if not Assigned(List) then
    List := TList<string>.Create;
  Info := System.TypeInfo(T);
  ctxRtti := TRttiContext.Create;
  try
    typRtti := ctxRtti.GetType(Info);
    for prpRtti in typRtti.GetProperties do
    begin
        List.Add(prpRtti.Name);
    end;
  finally
    ctxRtti.Free;
  end;

end;

class function TSimpleRTTI<T>.New( aInstance : T ): iSimpleRTTI<T>;
begin
    Result := Self.Create(aInstance);
end;

function TSimpleRTTI<T>.Param (var aParam: String): iSimpleRTTI<T>;
var
    aObj: TObject;
    Info: PTypeInfo;
    ctxRtti: TRttiContext;
    typRtti: TRttiType;
    prpRtti,
    prpFKType: TRttiProperty;
begin
    Result := Self;
    Info := System.TypeInfo(T);
    ctxRtti := TRttiContext.Create;
    try
        typRtti := ctxRtti.GetType(Info);
        for prpRtti in typRtti.GetProperties do
        begin
            if not prpRtti.IsNotNull and prpRtti.IsIgnore then
                Continue;

            if prpRtti.IsAutoInc then
                Continue;

            if prpRtti.IsEnum then
            begin
                aParam := aParam + ':' + prpRtti.FieldName + '::' + prpRtti.EnumName + ', ';
                Continue;
            end;

            if prpRtti.IsForeignKey then
            begin
                begin
                    if prpRtti.GetValue(Pointer(FInstance)).isobject then
                    begin
                        aObj := prpRtti.GetValue(Pointer(FInstance)).AsObject;
                        prpFKType := prpRtti.GetFKField(aObj);
                        if prpFKType.getValue(aObj).asinteger = 0 then
                            Continue;
                    end
                    else
                        if prpRtti.GetValue(Pointer(FInstance)).AsInteger = 0 then
                            Continue;
                end;
            end;

            aParam  := aParam + ':' + prpRtti.FieldName + ', ';
        end;
    finally
        aParam := Copy(aParam, 0, Length(aParam) - 2) + ' ';
        ctxRtti.Free;
    end;
end;

function TSimpleRTTI<T>.Values(aInstance: T; var aValues: String) : iSimpleRTTI<T>;
var
    Info: PTypeInfo;
    ctxRtti: TRttiContext;
    typRtti: TRttiType;
    prpRtti: TRttiProperty;
begin
    Result := Self;
    Info := System.TypeInfo(T);
    ctxRtti := TRttiContext.Create;
    try
        typRtti := ctxRtti.GetType(Info);
        for prpRtti in typRtti.GetProperties do
        begin
            if prpRtti.IsIgnore then
            Continue;

            if prpRtti.IsAutoInc then
                Continue;

            //      if prpRtti.IsEnum then
            //      begin
            //        aValues := aValues + prpRtti.FieldName + '=' + prpRtti.EnumName + ', ';
            //        Continue;
            //      end;

            aValues  := aValues + prpRtti.FieldName + '=' + prpRtti.GetValue(Pointer(aInstance)).AsString + ', ';
        end;
    finally
        aValues := Copy(aValues, 0, Length(aValues) - 2) + ' ';
        ctxRtti.Free;
    end;
end;

function TSimpleRTTI<T>.PrimaryKey(var aPK: String): iSimpleRTTI<T>;
var
    Info: PTypeInfo;
    typRtti: TRttiType;
    ctxRtti: TRttiContext;
    prpRtti: TRttiProperty;
begin
    Result := Self;
    Info := System.TypeInfo(T);
    ctxRtti := TRttiContext.Create;
    try
        typRtti := ctxRtti.GetType(Info);
        for prpRtti in typRtti.GetProperties do
        begin
            if prpRtti.IsPrimaryKey then
                aPK := prpRtti.FieldName;
        end;
    finally
        ctxRtti.Free;
    end;
end;

function TSimpleRTTI<T>.TableName(var aTableName: String): ISimpleRTTI<T>;
var
    vInfo: PTypeInfo;
    vTypRtti: TRttiType;
    vCtxRtti: TRttiContext;
begin
    Result := Self;
    vInfo := System.TypeInfo(T);
    vCtxRtti := TRttiContext.Create;
    try
        vTypRtti := vCtxRtti.GetType(vInfo);
        if vTypRtti.Tem<Table> then
            aTableName := vTypRtti.GetAttribute<Table>.Name;
    finally
        vCtxRtti.Free;
    end;
end;

function TSimpleRTTI<T>.Update(var aUpdate : String) : iSimpleRTTI<T>;
var
  Info: PTypeInfo;
  typRtti: TRttiType;
  ctxRtti: TRttiContext;
  prpRtti: TRttiProperty;
begin
    Result := Self;
    Info := System.TypeInfo(T);
    ctxRtti := TRttiContext.Create;
    try
        typRtti := ctxRtti.GetType(Info);
        for prpRtti in typRtti.GetProperties do
        begin
            if prpRtti.IsIgnore then
                Continue;

            if prpRtti.IsAutoInc then
                Continue;

            if prpRtti.IsForeignKey then
                if prpRtti.GetValue(Pointer(FInstance)).AsInteger = 0 then
                    Continue;

            if prpRtti.IsEnum then
            begin
                aUpdate := aUpdate + prpRtti.FieldName + ' = :' + prpRtti.FieldName + '::' + prpRtti.EnumName + ', ';
                Continue;
            end;

            aUpdate := aUpdate + prpRtti.FieldName + ' = :' + prpRtti.FieldName + ', ';
        end;
    finally
        aUpdate := Copy(aUpdate, 0, Length(aUpdate) - 2) + ' ';
        ctxRtti.Free;
    end;
end;

function TSimpleRTTI<T>.Where(var aWhere: String): iSimpleRTTI<T>;
var
    Info: PTypeInfo;
    typRtti: TRttiType;
    ctxRtti: TRttiContext;
    prpRtti: TRttiProperty;
begin
    Result := Self;
    Info := System.TypeInfo(T);
    ctxRtti := TRttiContext.Create;
    try
        typRtti := ctxRtti.GetType(Info);
        for prpRtti in typRtti.GetProperties do
        begin
          if prpRtti.IsPrimaryKey then
            if (prpRtti.IsEnum) then
                aWhere := aWhere + prpRtti.FieldName + ' = :' + prpRtti.FieldName + '::' + prpRtti.EnumName + ' AND '
            else
                aWhere := aWhere + prpRtti.FieldName + ' = :' + prpRtti.FieldName + ' AND ';
        end;
    finally
        aWhere := Copy(aWhere, 0, Length(aWhere) - 4) + ' ';
        ctxRtti.Free;
    end;
end;

end.
