unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, AdvPanel, JvExExtCtrls, JvExtComponent, JvPanel,
  Vcl.Imaging.pngimage, AeroButtons, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, Vcl.AppEvnts,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.WinXCtrls, JvExControls, JvSpeedButton,
  { Classes de negócio }
  uMovimento, uLogs;

type
  TfrmPrincipal = class(TForm)
    JvPanel1: TJvPanel;
    btnClose: TAeroSpeedButton;
    pnlEsquerda: TPanel;
    stsBar: TJvStatusBar;
    pnlDireita: TPanel;
    ApplicationEvents1: TApplicationEvents;
    pnllogo: TPanel;
    pnlMenuCadastro: TPanel;
    btnCadastroVeiculo: TJvSpeedButton;
    btnCadastroEmpresa: TJvSpeedButton;
    btnCadastroFormaPagto: TJvSpeedButton;
    btnCadastroProduto: TJvSpeedButton;
    btnCadastroMensalista: TJvSpeedButton;
    pnlMenuConfiguracoes: TPanel;
    JvSpeedButton10: TJvSpeedButton;
    svMenuLateral: TSplitView;
    btnMenuGeral: TJvSpeedButton;
    btnMenuCadastro: TJvSpeedButton;
    btnMenuMovimento: TJvSpeedButton;
    btnMenuConfiguracoes: TJvSpeedButton;
    Timer1: TTimer;
    imgLogo: TImage;
    btnMenuSair: TJvSpeedButton;
    procedure btnCloseMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure FormShow(Sender: TObject);
    procedure JvPanel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnConfigClick(Sender: TObject);
    procedure JvPanel1DblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnMenuCadastroClick(Sender: TObject);
    procedure btnCadastroMensalistaClick(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure btnCadastroFormaPagtoClick(Sender: TObject);
    procedure btnCadastroProdutoClick(Sender: TObject);
    procedure btnCadastroVeiculoClick(Sender: TObject);
    procedure btnMenuMovimentoClick(Sender: TObject);
    procedure btnMenuConfiguracoesClick(Sender: TObject);
    procedure btnMenuGeralClick(Sender: TObject);
    procedure btnCadastroEmpresaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMenuSairClick(Sender: TObject);
  private
    { Private declarations }
    FFormMov: TFrmMovimento;
    bMenuAberto: Boolean;
    bMenuCadastro: Boolean;
    bMenuConfiguracao: Boolean;

    procedure LoadMenuFlutuante(const oPanel: TPanel; const cWidth: Integer; const cTop: Integer; var bMenuAberto: Boolean);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

const
  cMenuAbertoWidth = 245;
  cMenuFechadoWidth = 50;
  cPanelDireitaInWidth = 1080;
  cPanelDireitaOutWidth = 1663;

implementation

{$R *.dfm}

uses
    uUtil, uCallForm, uTicket;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    TLog.New.info('Finalizando a aplicação');
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
    svMenuLateral.OpenedWidth := cMenuAbertoWidth;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
    stsBar.Panels[0].Width := Round((Screen.Width * 40) /100);
    stsBar.Panels[1].Width := Round((Screen.Width * 30) /100);
    stsBar.Panels[2].Width := Round((Screen.Width * 30) /100);

    svMenuLateral.OpenedWidth := cMenuFechadoWidth;
    pnlEsquerda.Width := cMenuFechadoWidth;
    bMenuAberto := False;
    bMenuCadastro := False;

    imgLogo.Width := 45;
    imgLogo.Height := 45;
    imgLogo.Top := 6;
    imgLogo.Left := 0;
end;

procedure TfrmPrincipal.JvPanel1DblClick(Sender: TObject);
begin
    self.WindowState := wsMaximized;
end;

procedure TfrmPrincipal.JvPanel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
    ReleaseCapture;
    Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TfrmPrincipal.btnMenuMovimentoClick(Sender: TObject);
var
    component: TComponent;
begin
    if (FFormMov <> nil) then
        if FFormMov.bFormFechado then
            FFormMov := nil;

    FFormMov := TFrmMovimento.Create(pnlDireita);
    FFormMov.Parent := pnlDireita;

    FFormMov.Top := 0;
    FFormMov.Left := 0;

    FFormMov.BorderStyle := bsNone;
    FFormMov.WindowState := TWindowState.wsMaximized;

    FFormMov.Show;
    FFormMov.SetFocus;
end;

procedure TfrmPrincipal.btnMenuSairClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmPrincipal.btnCadastroVeiculoClick(Sender: TObject);
begin
    TCallForm.CallFormCad('TFrmCadVeiculo', 0);
end;

procedure TfrmPrincipal.btnClick(Sender: TObject);
begin
    TCallForm.CallFormCad('TfrmGerenciamentoUsuario', 0);
end;

procedure TfrmPrincipal.btnCadastroEmpresaClick(Sender: TObject);
begin
    TCallForm.CallFormCad('TFrmCadEmpresa', 0);
end;

procedure TfrmPrincipal.btnCadastroFormaPagtoClick(Sender: TObject);
begin
    TCallForm.CallFormCad('TFrmCadFormaPagto', 0);
end;

procedure TfrmPrincipal.btnCadastroProdutoClick(Sender: TObject);
begin
    TCallForm.CallFormCad('TFrmCadProduto', 0);
end;

procedure TfrmPrincipal.btnCadastroMensalistaClick(Sender: TObject);
begin
    TCallForm.CallFormCad('TfrmCadMensalista', 0);
end;

procedure TfrmPrincipal.LoadMenuFlutuante(const oPanel: TPanel; const cWidth, cTop: Integer; var bMenuAberto: Boolean);
begin
    if not bMenuAberto then
    begin
        oPanel.Width := cWidth;
        oPanel.parent := svMenuLateral;
        oPanel.top := cTop;
        oPanel.Align := alTop;
        oPanel.Visible := True;
        bMenuAberto := True;
    end
    else
    begin
        bMenuAberto := False;
        oPanel.Visible := False;
    end;
end;

procedure TfrmPrincipal.btnMenuCadastroClick(Sender: TObject);
var
    iTop: Integer;
begin
    iTop := btnMenuCadastro.Top + btnMenuCadastro.Height+5;
    LoadMenuFlutuante(pnlMenuCadastro, 242, iTop, bMenuCadastro);
end;

procedure TfrmPrincipal.btnMenuConfiguracoesClick(Sender: TObject);
var
    iTop: Integer;
begin
    iTop := btnMenuConfiguracoes.Top + btnMenuConfiguracoes.Height+5;
    LoadMenuFlutuante(pnlMenuConfiguracoes, 242, iTop, bMenuConfiguracao);
end;

procedure TfrmPrincipal.btnMenuGeralClick(Sender: TObject);
begin
    Timer1.Enabled := True;

    if bMenuAberto then
    begin
        bMenuCadastro := False;
        pnlMenuCadastro.Visible := False;
    end
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
var
    novoTamanhoLogo: Integer;

    procedure collapsedMenu;
    begin
        if not bMenuAberto then
        begin
            svMenuLateral.OpenedWidth := cMenuAbertoWidth;
            pnlEsquerda.Width := cMenuAbertoWidth;
            pnlDireita.Width := cPanelDireitaInWidth;
        end
        else
        begin
            svMenuLateral.OpenedWidth := cMenuFechadoWidth;
            pnlEsquerda.Width := cMenuFechadoWidth;
            pnlDireita.Width := cPanelDireitaInWidth - cMenuFechadoWidth;
        end;
    end;

    procedure collapsedLogo;
    begin
        if not bMenuAberto then
        begin
            imgLogo.Width := 105;
            imgLogo.Height := 105;
            imgLogo.Top := 6;
            imgLogo.Left := 40;

            if pnllogo.Width = cMenuAbertoWidth then
            begin
                Timer1.Enabled := False;
                bMenuAberto := True;
                pnlDireita.Width := pnlDireita.Width - cMenuAbertoWidth;
                if (FFormMov <> nil) and not (FFormMov.bFormFechado) then
                    FFormMov.width := FFormMov.width - cMenuAbertoWidth + 50;
                Exit;
            end;
        end
        else
        begin
            imgLogo.Width := 45;
            imgLogo.Height := 45;
            imgLogo.Top := 6;
            imgLogo.Left := 0;

            if pnllogo.Width = cMenuFechadoWidth then
            begin
                Timer1.Enabled := False;
                bMenuAberto := False;
                pnlDireita.Width := pnlDireita.Width + cMenuAbertoWidth;
                if (FFormMov <> nil) and not (FFormMov.bFormFechado) then
                    FFormMov.width := FFormMov.Width + cMenuAbertoWidth - 50;

                Exit;
            end;
        end;
    end;
begin
    collapsedMenu;
    collapsedLogo;
end;

procedure TfrmPrincipal.ApplicationEvents1Exception(Sender: TObject; E: Exception);
var
    aFilePath: String;
    LogFile: TextFile;
    DataHora: String;
begin
    aFilePath := ExtractFilePath(Application.ExeName) + 'log\LogExceptions.log';
    AssignFile(LogFile, AFilePath);

    if FileExists(aFilePath) then
        Append(LogFile)
    else
        Rewrite(LogFile);

    DataHora := FormatDateTime('dd-mm-yyyy_hh-nn-ss', Now);

    Writeln(LogFile, '---------------------------------------------------------------------------');
    Writeln(LogFile, 'Data/Hora........: ' + DataHora);
    Writeln(LogFile, 'Mensagem.........: ' + E.Message);
    Writeln(LogFile, 'Classe...........: ' + E.ClassName);
    Writeln(LogFile, 'Formulário.......: ' + Screen.ActiveForm.Name);
    Writeln(LogFile, 'Unit.............: ' + Sender.UnitName);
    Writeln(LogFile, 'Controle Visual..: ' + Screen.ActiveControl.Name);
    Writeln(LogFile, 'Versão Windows...: ' + GetSOVersion);
    Writeln(LogFile, '---------------------------------------------------------------------------');
    CloseFile(LogFile);
    TLog.New.error(E.Message);
    InfoMessage(Application.ExeName, E.Message);
end;

procedure TfrmPrincipal.btnCloseClick(Sender: TObject);
begin
    application.Terminate;
end;

procedure TfrmPrincipal.btnCloseMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnClose.Cursor := crHandPoint;
end;

procedure TfrmPrincipal.btnConfigClick(Sender: TObject);
begin
    Application.Terminate;
end;

initialization
  RegisterClass(TfrmPrincipal);

finalization
  UnRegisterClass(TfrmPrincipal);

end.
