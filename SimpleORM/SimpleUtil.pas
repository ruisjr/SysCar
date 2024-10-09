unit SimpleUtil;

interface

uses
  System.Classes, Data.DB, System.Generics.Collections, System.TypInfo, System.Variants,
  {$IFNDEF CONSOLE}
    {$IFDEF FMX}
      FMX.Forms, FMX.StdCtrls, FMX.DateTimeCtrls,
    {$ELSE}
      Vcl.Forms, Vcl.StdCtrls, Vcl.ComCtrls, AdvLabel, AdvEdit, AdvCombo, AdvDateTimePicker,
      AdvToggle, System.Rtti, Vcl.WinXCtrls, JvRadioGroup, AdvOfficeButtons, AdvGroupBox, Vcl.ExtCtrls,
      Vcl.Samples.Spin,
    {$ENDIF}
  {$ENDIF}
  SimpleEntity;

type
  TSimpleUtil = class
  private
    {$IFNDEF CONSOLE}
    class function GetTextFromComponent(aComponent: TComponent): String;
    class function GetIntegerFromComponent(aComponent: TComponent): Integer;
    class function GetBooleanFromComponent(aComponent: TComponent): Boolean;
    {$ENDIF}
  public
    class procedure DataSetToObjectList<T: class, constructor>(const poDataSet: TDataSet; const poLista: TObjectList<T>); overload;
    class procedure DataSetToObjectList<T: TSimpleEntity, constructor>(const poDataSet: TDataSet; const poLista: TSimpleEntityList<T>); overload;
    class procedure GetValuesFromDataset(const poDataset: TDataSet; const poClasse: TObject);
    {$IFNDEF CONSOLE}
    class procedure GetObjectFromForm(const aForm: TForm; const aObject: TObject);
    class procedure SetFormFromObject(const aForm: TForm; const aObject: TObject);
    {$ENDIF}
  end;

implementation

{ TcdRTTIUtils }

uses
  System.SysUtils, FireDAC.Comp.Client, SimpleRTTIHelper, SimpleAttributes;

class procedure TSimpleUtil.DataSetToObjectList<T>(const poDataSet: TDataSet; const poLista: TObjectList<T>);
var
  oObjeto: T;
begin
    poDataSet.DisableControls;
    poDataSet.First;
    while not poDataSet.Eof do
    begin
        oObjeto := T.Create;
        GetValuesFromDataset(poDataSet, oObjeto);
        poLista.Add(oObjeto);
        poDataSet.Next;
    end;
    poDataSet.EnableControls;
end;

class procedure TSimpleUtil.DataSetToObjectList<T>(const poDataSet: TDataSet; const poLista: TSimpleEntityList<T>);
var
  oObjeto: T;
begin
    poDataSet.DisableControls;
    poDataSet.First;
    while not poDataSet.Eof do
    begin
        oObjeto := T.Create;
        oObjeto.Parse(poDataSet);
        poLista.Add(oObjeto);
        poDataSet.Next;
    end;
    poDataSet.EnableControls;
end;

class procedure TSimpleUtil.GetValuesFromDataset(const poDataset: TDataSet; const poClasse: TObject);
var
  oContexto: TRttiContext;
  oTipo: TRttiType;
  oPropriedade: TRttiProperty;
  Value: TValue;

  function Campo: TField;
  begin
    Result := poDataset.FindField(oPropriedade.FieldName);
  end;

begin
  oTipo := oContexto.GetType(poClasse.classType);
  for oPropriedade in oTipo.GetProperties do
  begin
    Value := oPropriedade.GetValue(poClasse);
    if (Campo = nil) then
      Continue;

    case Value.Kind of
      tkString, tkWChar, tkLString, tkWString, tkVariant, tkUString:
        Value := Campo.AsString;
      tkInteger:
        Value := StrToIntDef(Campo.AsString, 0);
      tkInt64:
        Value := StrToInt64Def(Campo.AsString, 0);
      tkFloat:
        begin
          if Value.TypeInfo = TypeInfo(TDate) then
            Value := Campo.AsDateTime
          else
            Value := Campo.AsExtended;
        end;
      tkClass:
        if oPropriedade.Tem<HasOne> then
        begin
          if Value.AsObject is TSimpleEntity then
            TSimpleEntity(Value.AsObject).Parse(poDataSet)
          else
            GetValuesFromDataset(poDataSet, Value.AsObject);
        end;
    end;

    if (Campo <> nil) then
      oPropriedade.SetValue(poClasse, Value);
  end;
end;

{$IFNDEF CONSOLE}

class procedure TSimpleUtil.GetObjectFromForm(const aForm: TForm; const aObject: TObject);
var
  ctxRttiEntity: TRttiContext;
  typRttiEntity: TRttiType;
  typRttiForm: TRttiType;
  fldRtti: TRttiField;
  prpRtti: TRttiProperty;
  Value: TValue;
  Component: TComponent;
  vFieldName: string;
begin
    ctxRttiEntity := TRttiContext.Create;
    typRttiEntity := ctxRttiEntity.GetType(aObject.ClassType);
    typRttiForm := ctxRttiEntity.GetType(aForm.ClassInfo);

    for prpRtti in typRttiEntity.GetProperties do
    begin
        for fldRtti in typRttiForm.GetFields do
        begin
            if not fldRtti.Tem<Bind> or fldRtti.Tem<FK> then
                Continue;

            vFieldName := LowerCase(fldRtti.GetAttribute<Bind>.Field);
            if not (vFieldName.Equals(LowerCase(prpRtti.FieldName)) or
               vFieldName.Equals(LowerCase(prpRtti.Name))) then
                Continue;

            Component := (fldRtti.GetValue(aForm).AsObject as TComponent);
            case prpRtti.GetValue(aObject).Kind of
                tkString, tkWChar, tkLString, tkWString, tkVariant, tkUString:
                    Value := GetTextFromComponent(Component);
                tkInteger:
                    Value := GetIntegerFromComponent(Component);
                tkFloat:
                    Value := StrToFloat(GetTextFromComponent(Component));
                tkEnumeration:
                    if (prpRtti.GetValue(aObject).TypeInfo.Name = 'Boolean') then
                        Value := GetBooleanFromComponent(Component);
            end;

            prpRtti.SetValue(aObject, Value);
        end;
    end;
end;

class function TSimpleUtil.GetTextFromComponent(aComponent: TComponent): String;
begin
    if aComponent is TAdvEdit then
    begin
        if ((aComponent as TAdvEdit).EditType = etNumeric) and ((aComponent as TAdvEdit).Text = '') then
            Exit('0')
        else
            Exit((aComponent as TAdvEdit).Text);
    end;

    if aComponent is TAdvComboBox then
        Exit((aComponent as TAdvComboBox).Text);

    if aComponent is TAdvDateTimePicker then
        Exit(FloatToStr((aComponent as TAdvDateTimePicker).Date));

    if aComponent is TAdvLabel then
        Exit((aComponent as TAdvLabel).Text);

    if aComponent is TAdvMaskEdit then
    begin
        if ((aComponent as TAdvMaskEdit).Text = '') then
            Exit('')
        else
            Exit((aComponent as TAdvMaskEdit).Text);
    end;

    if aComponent is TAdvToggleSwitch then
        Exit((aComponent as TAdvToggleSwitch).On.ToString());

    if aComponent is TToggleSwitch then
        Exit(((aComponent as TToggleSwitch).State = tssOn).ToString());
end;

class function TSimpleUtil.GetIntegerFromComponent(aComponent: TComponent): Integer;
begin
    if aComponent is TAdvComboBox then
        Exit((aComponent as TAdvComboBox).ItemIndex)
    else if aComponent is TAdvEdit then
        Exit((aComponent as TAdvEdit).Text.ToInteger)
    else if aComponent is TAdvLabel then
        Exit((aComponent as TAdvLabel).Text.ToInteger)
    else if (aComponent is TRadioGroup) then
        Exit((aComponent as TRadioGroup).ItemIndex)
    else if (aComponent is TJvRadioGroup) then
        Exit((aComponent as TJvRadioGroup).ItemIndex)
    else if (aComponent is TSpinEdit) then
        Exit(TSpinEdit(aComponent).Value)
end;

class function TSimpleUtil.GetBooleanFromComponent(aComponent: TComponent): Boolean;
begin
    if aComponent is TAdvOfficeCheckBox then
        Exit((aComponent as TAdvOfficeCheckBox).Checked);
    if aComponent is TToggleSwitch then
        Exit((aComponent as TToggleSwitch).State = tssOn);
     if aComponent is TToggleSwitch then
        Exit(((aComponent as TToggleSwitch).State = tssOn));
     if aComponent is TAdvGroupBox then
        Exit(TAdvGroupBox(aComponent).CheckBox.Checked);
end;

class procedure TSimpleUtil.SetFormFromObject(const aForm: TForm; const aObject: TObject);
var
    Info: PTypeInfo;
    fldRtti: TRttiField;
    prpRtti: TRttiProperty;
    Component: TComponent;
    typRttiForm: TRttiType;
    ctxRttiEntity: TRttiContext;
    typRttiEntity: TRttiType;
    vFieldName, vFieldNameForm: string;
    oAtributo: TCustomAttribute;
    fieldForm: String;
begin
    ctxRttiEntity := TRttiContext.Create;
    try
        typRttiEntity := ctxRttiEntity.GetType(aObject.ClassInfo);
        typRttiForm := ctxRttiEntity.GetType(aForm.ClassInfo);

        for prpRtti in typRttiEntity.GetProperties do
        begin
            vFieldName := LowerCase(prpRtti.Name);
            if prpRtti.IsDBField then
                vFieldName := LowerCase(prpRtti.GetAttribute<DBField>.Name);

            for fldRtti in typRttiForm.GetFields do
            begin
                if not fldRtti.Tem<Bind> then
                    Continue;

                vFieldNameForm := LowerCase(fldRtti.GetAttribute<Bind>.Field);
                if not vFieldNameForm.Equals(vFieldName) then
                    Continue;

                Component := (fldRtti.GetValue(aForm).AsObject as TComponent);

                if Component is TAdvLabel then
                    (Component as TAdvLabel).Text := prpRtti.GetValue(aObject).AsVariant;
                if Component is TAdvEdit then
                    (Component as TAdvEdit).Text := prpRtti.GetValue(aObject).AsVariant;
                if Component is TSpinEdit then
                    TSpinEdit(Component).Value := prpRtti.GetValue(aObject).AsInteger;
                if Component is TAdvComboBox then
                begin
                    if not prpRtti.GetValue(aObject).IsEmpty then
                    begin
                        case prpRtti.GetValue(aObject).typeinfo.kind of
                            tkString, tkUString:
                                (Component as TAdvComboBox).SelectItem(prpRtti.GetValue(aObject).AsString);
                            tkInteger, tkInt64:
                                (Component as TAdvComboBox).ItemIndex := prpRtti.GetValue(aObject).AsInteger;
                        end;
                    end
                end;
                if Component is TAdvDateTimePicker then
                    (Component as TAdvDateTimePicker).DateTime := VarToDateTime(prpRtti.GetValue(aObject).asvariant);
                if Component is TAdvMaskEdit then
                    (Component as TAdvMaskEdit).Text := prpRtti.GetValue(aObject).asvariant;
                if Component is TAdvToggleSwitch then
                    (Component as TAdvToggleSwitch).On := prpRtti.GetValue(aObject).AsBoolean;
				if Component is TToggleSwitch then
                begin
                    if prpRtti.GetValue(aObject).AsBoolean = True then
						(Component as TToggleSwitch).State := tssOn
					else
						(Component as TToggleSwitch).State := tssOff
                end;
                if Component is TJvRadioGroup then
                    (Component as TJvRadioGroup).ItemIndex := prpRtti.GetValue(aObject).AsInteger;
                if Component is TRadioGroup then
                    (Component as TRadioGroup).ItemIndex := prpRtti.GetValue(aObject).AsInteger;
                if Component is TAdvOfficeCheckBox then
                    (Component as TAdvOfficeCheckBox).Checked := prpRtti.GetValue(aObject).AsBoolean;
                if Component is TAdvGroupBox then
                    TAdvGroupBox(Component).CheckBox.Checked := prpRtti.GetValue(aObject).AsBoolean;

            end;
        end;
    finally
        ctxRttiEntity.Free;
    end;
end;

{$ENDIF}

end.

