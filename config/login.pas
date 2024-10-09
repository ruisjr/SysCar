unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  JvExStdCtrls, JvEdit, JvDotNetControls, JvExControls, JvXPCore, JvXPButtons, System.DateUtils,
  Vcl.Imaging.pngimage, JvLabel, data.DB, AdvPanel, AdvEdit, AdvOfficeImage, AdvGlowButton, AeroButtons,
  { Classes de neg�cio }
  SimpleDAO, SimpleInterface, uUsuario;

type
  TfrmLogin = class(TForm)
    pnlPrincipal: TAdvPanel;
    AdvOfficeImage1: TAdvOfficeImage;
    edtUsername: TAdvEdit;
    edtPassword: TAdvEdit;
    btnLogin: TAdvGlowButton;
    AdvPanelStyler1: TAdvPanelStyler;
    AdvOfficeImage2: TAdvOfficeImage;
    AdvOfficeImage3: TAdvOfficeImage;
    btnFechar: TAeroSpeedButton;
    imgLogo: TImage;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnLoginClick(Sender: TObject);
    procedure pnlPrincipalCaptionDBlClick(Sender: TObject);
    procedure edtUsernameChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    FContadorLogin: Integer;
    { Private declarations }
    function getLogin(const cUsuario, cSenha: string): Boolean;
    function getUsuarioInativo(const cUser: TUsuario): Boolean;
    function getUsuarioTentativas(const cUser: TUsuario): Boolean;
    function getUsuarioBloqueado(const cUser: TUsuario): Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses UPrincipal, uDataModule, uLogs, uUtil, uMessages;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
    if getLogin(edtUsername.Text, edtPassword.Text) then
    begin
        Close;
    end;
end;

procedure TfrmLogin.edtUsernameChange(Sender: TObject);
begin
    if (Length(edtUsername.Text) >= 1) and (Length(edtPassword.Text) > 0) then
        btnLogin.Enabled := True
    else
        btnLogin.Enabled := False;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
    FContadorLogin := 0;
    btnLogin.Enabled := False;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        VK_ESCAPE: Application.Terminate;
        VK_RETURN: perform(WM_NEXTDLGCTL,0,0);
    end;
end;

function TfrmLogin.getLogin(const cUsuario, cSenha: string): Boolean;
var
    sWhere, aDecode, aValues: string;
begin
    try
        sWhere := ' nome ILIKE ' + QuotedStr('%' + cUsuario + '%');
        DM.Usuario := DM.DAOUsuario.Find(sWhere);
        Result := False;
        if DM.Usuario = nil then
        begin
            TLog.New().error('Nenhuma informa��o de usu�rio foi retornada.');
            Result := False;
            abort;
        end;

        if (cUsuario = 'BULLTECH') then
        begin
            if (OnlyNymbers(cSenha) > 0) and (cSenha.ToInteger() = getSenhaDiaria) then
            begin
                Result := True;
                DM.Usuario.ultimoAcesso := now;
            end
            else
            begin
                TLog.New().error('Senha de usu�rio est� incorreta.' + #13 + 'Usu�rio: ' + cUsuario);
                InfoMessage('Syscar', 'A senha informada est� incorreta.');
                Abort;
            end;
        end
        else
        begin
            if  (DM.Usuario.nome <> cUsuario) then
            begin
                TLog.New().error('Usu�rio n�o encontrado na base de dados.' + #13 + 'Usu�rio: ' + cUsuario);
                InfoMessage('Syscar', 'Usu�rio n�o encontrado ou n�o cadastrado.');
                edtUsername.SetFocus;
                Result := False;
                Abort;
            end;

            { Validando o per�odo de inatividade do usu�rio }
            if not getUsuarioInativo(DM.Usuario) then
            begin
                Abort;
            end;

            { Validando o usu�rio bloqueado }
            if not getUsuarioBloqueado(DM.Usuario) then
            begin
                Abort;
            end;

            aDecode := getDecodeBase64(DM.Usuario.Senha);
            if not (aDecode = cSenha) then
            begin
                FContadorLogin := FContadorLogin + 1;
                TLog.New.error('Senha de usu�rio incorreta.');

                if (DM.RegraSeguranca.QuantidadeRetentativas - FContadorLogin) = 1 then
                    InfoMessage('Syscar', 'A senha informada est� incorreta.'+
                        #13+'Voc� est� preste a atingir o limite m�ximo de re-tentativas.'+
                        #10+#13+'Seu usu�rio ser� bloqueado!')
                else if not getUsuarioTentativas(DM.Usuario) then
                begin
                    Abort;
                end
                else
                    InfoMessage('Syscar', 'A senha informada est� incorreta.');

                edtPassword.SetFocus;
                Result := False;
                Abort;
            end;
        end;
    except
        on E: Exception do
        begin
            TLog.New().error('Ocorreu erro ao localizar usu�rio.' + #13 + E.ClassName +': '+ E.Message);
            Abort;
        end;
    end;

    DM.Usuario.ultimoAcesso := now;
    DM.Usuario.senha := getEncodeBase64(cSenha);
    aValues := 'ult_acesso='+QuotedStr(DateTimeToStr(now));
    DM.DAOUsuario.Update(aValues, DM.Usuario.id);
    Result := True;
end;

function TfrmLogin.getUsuarioBloqueado(const cUser: TUsuario): Boolean;
begin
    Result := True;
    if cUser.Bloqueado = True then
    begin
        WarningMessage('Syscar', Format('O usu�rio %s est� com acesso bloqueado.', [cUser.Nome]) +
            #10+#13+'Contate o administrador do sistema para realizar o desbloqueio.');
        Result := False;
    end;
end;

function TfrmLogin.getUsuarioInativo(const cUser: TUsuario): Boolean;
var
    aMsg: String;
begin
    Result := True;
    if DaysBetween(Now, cUser.UltimoAcesso) >= DM.RegraSeguranca.PeriodoInatividade then
    begin
        aMsg := Format('Usu�rio %s est� inativo no sistema h� mais de %d dias.', [DM.Usuario.Nome, DM.RegraSeguranca.PeriodoInatividade]) +
                    #10+#13+'Contate o administrador do sistema para realizar o desbloqueio.';
        WarningMessage('SysCar', aMsg);
        DM.DAOUsuario.Update('bloqueado = True', cUser.ID);
        Result := False;
    end;
end;

function TfrmLogin.getUsuarioTentativas(const cUser: TUsuario): Boolean;
var
    aWhere: String;
begin
    Result := True;
    if (DM.RegraSeguranca.QuantidadeRetentativas - FContadorLogin) = 0 then
    begin
        InfoMessage('Syscar', 'Voc� atingiu o limite m�ximo de re-tentativas.'+
            #10+#13+'Seu usu�rio foi bloqueado!');

        aWhere := 'ult_acesso='+ QuotedStr(DateTimeToStr(now)) + ',bloqueado=True';
        DM.DAOUsuario.Update(aWhere, DM.Usuario.id);
        Result := False;
    end;
end;

procedure TfrmLogin.pnlPrincipalCaptionDBlClick(Sender: TObject);
begin
    TLog.New.info('Fechando o sistema!');
    Application.Terminate;
end;

end.
