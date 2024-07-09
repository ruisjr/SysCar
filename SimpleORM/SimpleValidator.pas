unit SimpleValidator;


interface

uses
  System.Classes, RTTI, SimpleAttributes, System.SysUtils, SimpleRTTIHelper;

type
    ESimpleValidator = class(Exception);

    TSimpleValidator = class
    private
        class procedure ValidateNotNull(const aErrros: TStrings; const aObject: TObject; const aProperty: TRttiProperty; aValidateNumber: Boolean = False); static;
        class procedure ValidateNumberNotNull(const aErrros: TStrings; const aObject: TObject; const aProperty: TRttiProperty);
    public
        class procedure Validate(const aObject: TObject); overload; static;
        class procedure Validate(const aObject: TObject; const aErrors: TStrings); overload; static;
        class function IsClassRtti(const aObject: TObject): Boolean; static;
    end;

implementation

const
  sMSG_NOT_NULL = 'O campo %s não foi informado!';
  sMSG_NUMBER_NOT_NULL = 'O campo %s não pode ser Zero!';
  sMSG_TIME_NOT_NULL = 'É obrigatório informar uma hora válida para %s';
  sMSG_DATE_NOT_NULL = 'É obrigatório informar uma data válida para %s';

class procedure TSimpleValidator.Validate(const aObject: TObject; const aErrors: TStrings);
var
    ctxRttiEntity: TRttiContext;
    typRttiEntity: TRttiType;
    prpRtti: TRttiProperty;
    Value: TValue;
begin
    ctxRttiEntity := TRttiContext.Create;
    try
        typRttiEntity := ctxRttiEntity.GetType(aObject.ClassType);

        for prpRtti in typRttiEntity.GetProperties do
        begin
            if aErrors.Count > 0 then
                Exit;

            if prpRtti.IsIgnore then
                Continue;

            if prpRtti.IsAutoInc then
                Continue;

            Value := prpRtti.GetValue(aObject);
            if Value.IsObject then
                Validate(Value.AsObject, aErrors);

            if prpRtti.IsNotNull then
                ValidateNotNull(aErrors, aObject, prpRtti);

            if prpRtti.IsNumberNotNull then
                ValidateNumberNotNull(aErrors, aObject, prpRtti);
        end;
    finally
        ctxRttiEntity.Free;
    end;
end;

class function TSimpleValidator.IsClassRtti(const aObject: TObject): Boolean;
var
  ctxRttiEntity: TRttiContext;
  typRttiEntity: TRttiType;
begin
    ctxRttiEntity := TRttiContext.Create;
    try
        typRttiEntity := ctxRttiEntity.GetType(aObject.ClassType);
        Exit(typRttiEntity.GetAttributes <> nil);
    finally
        ctxRttiEntity.Free;
    end;
end;

class procedure TSimpleValidator.Validate(const aObject: TObject);
var
    sErrors: TStringList;
begin
    sErrors := TStringList.Create;
    try
        TSimpleValidator.Validate(aObject, sErrors);
        if sErrors.Count > 0 then
            raise ESimpleValidator.Create(sErrors.Text);
    finally
        FreeAndNil(sErrors);
    end;
end;

class procedure TSimpleValidator.ValidateNotNull(const aErrros: TStrings; const aObject: TObject; const aProperty: TRttiProperty; aValidateNumber: Boolean = False);
var
    Value: TValue;
    aMsg: String;
begin
    Value := aProperty.GetValue(aObject);
    case Value.Kind of
        tkUString:
        begin
            if string.IsNullOrWhiteSpace(Value.AsString) then
            begin
                aErrros.Add(Format(sMSG_NOT_NULL, [aProperty.DisplayName]));
                Exit;
            end;
        end;
        tkInteger:
        begin
            if (Value.AsInteger = 0) then
            begin
                aMsg := sMSG_NOT_NULL;
                if aValidateNumber then
                    aMsg := sMSG_NUMBER_NOT_NULL;

                aErrros.Add(Format(aMsg, [aProperty.DisplayName]));
                Exit;
            end
        end;
        tkFloat:
        begin
            if (Value.AsExtended <> 0) then
                Exit;

            if (Value.TypeInfo = TypeInfo(Real)) or (Value.TypeInfo = TypeInfo(Double)) then
            begin
                aMsg := sMSG_NOT_NULL;
                if aValidateNumber then
                    aMsg := sMSG_NUMBER_NOT_NULL;

                aErrros.Add(Format(aMsg, [aProperty.DisplayName]));
                Exit;
            end;

            if Value.TypeInfo = TypeInfo(TTime) then
            begin
                aErrros.Add(Format(sMSG_TIME_NOT_NULL, [aProperty.DisplayName]));
                Exit;
            end;

            if (Value.TypeInfo = TypeInfo(TDate)) or (Value.TypeInfo = TypeInfo(TDateTime)) then
            begin
                aErrros.Add(Format(sMSG_DATE_NOT_NULL, [aProperty.DisplayName]));
                Exit;
            end;
        end;
    else
        if Value.IsEmpty then
        begin
            aErrros.Add(Format(sMSG_NOT_NULL, [aProperty.DisplayName]));
            Exit;
        end;
    end;
end;

class procedure TSimpleValidator.ValidateNumberNotNull(const aErrros: TStrings; const aObject: TObject; const aProperty: TRttiProperty);
begin
    TSimpleValidator.ValidateNotNull(aErrros, aObject, aProperty, True);
end;

end.

