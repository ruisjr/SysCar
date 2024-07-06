unit uUtil;

interface

uses
    System.SysUtils, Vcl.Controls, System.Types, Vcl.Forms, AdvMenus, System.Classes,
    { Classes de négócio }
    uLogs, uMessages;

    { Functions }
    function InfoMessage(aCaption: String; aMessage: String): Integer;
    function ErrorMessage(aCaption: String; aMessage: String): Integer;
    function WarningMessage(aCaption: String; aMessage: String): Integer;
    function QuestionMessage(aCaption: String; aMessage: String): Integer;
    function getProcessReturn(aReturn: TMessageReturn): Integer;
    function getDataAtual: TDate;
    function Split(aDelimiter: Char; aValue: String; aLeft: Boolean = True): String;

    { Procedures }
    procedure SubMenuPopUp(Sender: TObject; var advMenu: TAdvPopupMenu);


const
    RET_OK = 1;
    RET_YES = 2;
    RET_NO = 3;
    RET_CANCEL = 4;

implementation


function getDataAtual: TDate;
begin
    Result := Now;
end;

function InfoMessage(aCaption: String; aMessage: String): Integer;
var
    FrmMessage: TFrmMessage;
begin
    try
        FrmMessage := TFrmMessage.Create(nil, aCaption, aMessage, mtInfo);
        FrmMessage.showModal;

        Result := getProcessReturn(FrmMessage.MessageReturn);
        TLog.New.info('InfoMesage.Return: ' + Result.ToString);
    finally
        FreeAndNil(FrmMessage);
    end;
end;

function ErrorMessage(aCaption: String; aMessage: String): Integer;
var
    FrmMessage: TFrmMessage;
begin
    try
        FrmMessage := TFrmMessage.Create(nil, aCaption, aMessage, mtError);
        FrmMessage.showModal;

        Result := getProcessReturn(FrmMessage.MessageReturn);
        TLog.New.info('ErrorMesage.Return: ' + Result.ToString);
    finally
        FreeAndNil(FrmMessage);
    end;
end;

function WarningMessage(aCaption: String; aMessage: String): Integer;
var
    FrmMessage: TFrmMessage;
begin
    try
        FrmMessage := TFrmMessage.Create(nil, aCaption, aMessage, mtWarning);
        FrmMessage.showModal;

        Result := getProcessReturn(FrmMessage.MessageReturn);
        TLog.New.info('WarningMesage.Return: ' + Result.ToString);
    finally
        FreeAndNil(FrmMessage);
    end;
end;

function QuestionMessage(aCaption: String; aMessage: String): Integer;
var
    FrmMessage: TFrmMessage;
begin
    try
        FrmMessage := TFrmMessage.Create(nil, aCaption, aMessage, mtQuestion);
        FrmMessage.showModal;

        Result := getProcessReturn(FrmMessage.MessageReturn);
        TLog.New.info('QuestionMesage.Return: ' + Result.ToString);
    finally
        FreeAndNil(FrmMessage);
    end;
end;

function getProcessReturn(aReturn: TMessageReturn): Integer;
begin
    case aReturn of
        mrOK:
            Result := RET_OK;
        mrYes:
            Result := RET_YES;
        mrNo:
            Result := RET_NO;
        mrCancel:
            Result := RET_CANCEL;
    end;
    TLog.New.debug('Retorno da messagem: ' + IntToStr(Result));
end;

procedure SubMenuPopUp(Sender: TObject; var advMenu: TAdvPopupMenu);
var
  button: TControl;
  lowerLeft: TPoint;

begin
    if Sender is TControl then
    begin
        button := TControl(Sender);
        lowerLeft := Point(0, button.Height);
        lowerLeft := button.ClientToScreen(lowerLeft);
        advMenu.Popup(lowerLeft.X, lowerLeft.Y);
    end;

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
