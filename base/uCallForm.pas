unit uCallForm;

interface

Uses
    Vcl.Forms, System.SysUtils, System.Classes, uFormDefault, uFiltroDefault;

type
    TCallForm = class
    private

    public
        class procedure CallFormCad(const aForm: String; aId: Integer = 0);
        class procedure CallFormPesq(const aForm: String; aCaption: String; var aRetorno: Integer);
    end;

implementation

{ TCallForm }

class procedure TCallForm.CallFormCad(const aForm: String; aId: Integer = 0);
var
    oForm: TfrmFormDefault;
    oFormClass: TFormClass;
begin
    oFormClass := TFormClass(FindClass(aForm));
    oForm := TfrmFormDefault(oFormClass.Create(Application));
    try
        oForm.setID(aId);
        oForm.ShowModal();
    finally
        FreeAndNil(oForm);
    end;
end;

class procedure TCallForm.CallFormPesq(const aForm: String; aCaption: String; var aRetorno: Integer);
var
    oForm: TFrmFiltroDefault;
    oFormClass: TFormClass;
begin
    oFormClass := TFormClass(FindClass(aForm));
    oForm := TFrmFiltroDefault(oFormClass.Create(Application));
    try
        oForm.setCaption(aCaption);
        oForm.ShowModal();
        aRetorno := oForm.Return;
    finally
        FreeAndNil(oForm);
    end;
end;


end.
