unit uUtil;

interface

uses
    System.SysUtils, Vcl.Controls, System.DateUtils, System.Types, Vcl.Forms, AdvMenus, System.Classes, System.Win.Registry, Winapi.Windows,
    System.NetEncoding, System.Math,
    { Classes de n�g�cio }
    uLogs, uMessages;

    { Messages }
    function InfoMessage(aCaption: String; aMessage: String): Integer;
    function ErrorMessage(aCaption: String; aMessage: String): Integer;
    function WarningMessage(aCaption: String; aMessage: String): Integer;
    function QuestionMessage(aCaption: String; aMessage: String): Integer;
    function getProcessReturn(aReturn: TMessageReturn): Integer;

    { Date Functions }
    function getDataAtual: TDate;

    { SO Functions }
    function GetWindowsVersion: string;
    function GetEnvironmentVar(const cVarName: String): String;
    function GetSOVersion: String;

    { Text Functions }
    function Split(aDelimiter: Char; aValue: String; aLeft: Boolean = True): String;

    { Number Functions}
    function IsNumber(const aValue: String): Boolean;
    function OnlyNymbers(const aValue: String): Integer;

    { Criptografia }
    function getEncodeBase64(aValue: String): String;
    function getDecodeBase64(aValue: String): String;

    { Senha di�ria }
    function getSenhaDiaria: Integer;

    { Procedures }
    procedure SubMenuPopUp(Sender: TObject; var advMenu: TAdvPopupMenu);

    { Matem�ticas }
    function GetRoundTo(const Value: Extended; const digits: Integer): Extended;


const
    RET_OK = 1;
    RET_YES = 2;
    RET_NO = 3;
    RET_CANCEL = 4;

const
    cPESQ_CODIGO = 0;
    cPESQ_NOME = 1;

const
    cKey = 'RuiGiovannaNat�201019821987';

implementation

uses
    uDataModule, uConfiguracoes;

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
    else if aListString.Count > 1 then
        Result := aListString[1].Trim
    else
        Result := aListString[0].Trim;
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

function GetEnvironmentVar(const cVarName: String): String;
begin
    Result := GetEnvironmentVariable(PChar(cVarName));
end;

function GetSOVersion: String;
var
    vNome, vVersao, vCurrentBuild: String;
    Reg: TRegistry;
begin
    Result := '';

    Reg := TRegistry.Create; // Criando um Registro na Mem�ria
    try
        Reg.Access := KEY_READ; // Colocando nosso Registro em modo Leitura
        Reg.RootKey := HKEY_LOCAL_MACHINE; // Definindo a Raiz

        // Abrindo a chave desejada
        if Reg.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\', false) then
        begin
            // Obtendo os Par�metros desejados
            vNome := Reg.ReadString('ProductName');
            vVersao := Reg.ReadString('CurrentVersion');
            vCurrentBuild := Reg.ReadString('CurrentBuild');

            // Montando uma String com a vers�o e detalhes
            Result := vNome + ' - ' + vVersao + ' - ' + vCurrentBuild;
        end
        else
            Result := 'Erro ao abrir a chave do Registro.';
    finally
        Reg.Free;
    end;
end;

function getEncodeBase64(aValue: String): String;
var
    aBase64: TBase64Encoding;
begin
    aBase64 := TBase64Encoding.Create(0);
    Result := aBase64.Encode(aValue + ' || ' + cKey);
end;

function getDecodeBase64(aValue: String): String;
var
    aBase64: TNetEncoding;
    aDecode: String;
    aArray: TStringList;
begin
    aBase64 := TNetEncoding.Create;
    aDecode := TNetEncoding.Base64.Decode(avalue);
    Result := Split('|', aDecode);
end;

function getSenhaDiaria: Integer;
var
    myDate : TDateTime;
    myYear, myMonth, myDay : Word;
    myHour, myMin, mySec, myMilli : Word;
    aSenha: Integer;
begin
    myDate := Now;
    DecodeDateTime(myDate, myYear, myMonth, myDay, myHour, myMin, mySec, myMilli);

    aSenha := myYear - 1000;
    aSenha := aSenha + (myMonth + myYear);
    aSenha := aSenha + (myMonth * myDay);
    aSenha := aSenha + (myDay + myMonth + myYear);
    aSenha := aSenha + (myDay * myDay) + myMonth;

    Result := aSenha;
end;

function IsNumber(const aValue: String): Boolean;
begin
    Result := True;
    if StrToIntDef(aValue, 0) = 0 then
        Result := False;
end;

function OnlyNymbers(const aValue: String): Integer;
var
    aText: PChar;
    aTextResult: String;
begin
    aText := PChar(aValue);
    Result := 0;

    while (aText^ <> #0) do
    begin
        {$IFDEF UNICODE}
        if CharInSet(aText^, ['0'..'9']) then
        {$ELSE}
        if vText^ in ['0'..'9'] then
        {$ENDIF}
          aTextResult := aTextResult + aText^;

        Inc(aText);
    end;
    Result := StrToInt(aTextResult);
end;

function GetRoundTo(const Value: Extended; const digits: Integer): Extended;
var
    sFrac, sInt, Valor: String;
begin
    Result := RoundTo(Value, digits);

    if DM.ModoArredondamento = ARRD_TRUNCATE then
    begin
        Result := Trunc(Value * 100) / 100;
    end;
end;


end.
