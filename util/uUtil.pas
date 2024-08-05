unit uUtil;

interface

uses
    System.SysUtils, Vcl.Controls, System.Types, Vcl.Forms, AdvMenus, System.Classes, System.Win.Registry, Winapi.Windows,
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
    function GetWindowsVersion: string;
    function GetSOVersion: String;

    { Procedures }
    procedure SubMenuPopUp(Sender: TObject; var advMenu: TAdvPopupMenu);


const
    RET_OK = 1;
    RET_YES = 2;
    RET_NO = 3;
    RET_CANCEL = 4;

const
    cPESQ_CODIGO = 0;
    cPESQ_NOME = 1;

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

function GetWindowsVersion: string;
begin
  case System.SysUtils.Win32MajorVersion of
    5:
      case System.SysUtils.Win32MinorVersion of
        1: result := 'Windows XP';
      end;
    6:
      case System.SysUtils.Win32MinorVersion of
        0: result := 'Windows Vista';
        1: result := 'Windows 7';
        2: result := 'Windows 8';
        3: result := 'Windows 8.1';
      end;
    10:
      case System.SysUtils.Win32MinorVersion of
        0: result := 'Windows 10';
      end;
  end;
end;

function GetSOVersion: String;
var
    vNome, vVersao, vCurrentBuild: String;
    Reg: TRegistry;
begin
    Result := '';

    Reg := TRegistry.Create; // Criando um Registro na Memória
    try
        Reg.Access := KEY_READ; // Colocando nosso Registro em modo Leitura
        Reg.RootKey := HKEY_LOCAL_MACHINE; // Definindo a Raiz

        // Abrindo a chave desejada
        if Reg.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\', false) then
        begin
            // Obtendo os Parâmetros desejados
            vNome := Reg.ReadString('ProductName');
            vVersao := Reg.ReadString('CurrentVersion');
            vCurrentBuild := Reg.ReadString('CurrentBuild');

            // Montando uma String com a versão e detalhes
            Result := vNome + ' - ' + vVersao + ' - ' + vCurrentBuild;
        end
        else
            Result := 'Erro ao abrir a chave do Registro.';
    finally
        Reg.Free;
    end;
end;

end.
