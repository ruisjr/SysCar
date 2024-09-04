unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, AdvPanel, JvExExtCtrls, JvExtComponent, JvPanel,
  Vcl.Imaging.pngimage, AeroButtons,
  { Classes de negócio }
  uLogs, SimpleInterface, SimpleQueryFiredac, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, Vcl.AppEvnts, ACBrBase, ACBrSocket, ACBrCEP;

type
  TfrmPrincipal = class(TForm)
    JvPanel1: TJvPanel;
    btnClose: TAeroSpeedButton;
    pnlEsquerda: TPanel;
    btnVeiculos: TAeroSpeedButton;
    btnMensalista: TAeroSpeedButton;
    btnMovimento: TAeroSpeedButton;
    pnlSubmenu: TPanel;
    btnConfig: TAeroSpeedButton;
    btnFormaPagamento: TAeroSpeedButton;
    stsBar: TJvStatusBar;
    pnlDireita: TPanel;
    btnProdutos: TAeroSpeedButton;
    ApplicationEvents1: TApplicationEvents;
    btnFormasPagamento: TAeroSpeedButton;
    btnEmpresa: TAeroSpeedButton;
    btnUsuarios: TAeroSpeedButton;
    procedure btnCloseMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure btnVeiculosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnMensalistaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnMovimentoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnMensalistaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVeiculosClick(Sender: TObject);
    procedure btnMovimentoClick(Sender: TObject);
    procedure btnProdutosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnProdutosClick(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure btnFormasPagamentoClick(Sender: TObject);
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnEmpresaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure JvPanel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnConfigClick(Sender: TObject);
    procedure JvPanel1DblClick(Sender: TObject);
    procedure btnFormaPagamentoClick(Sender: TObject);
    procedure btnUsuariosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnUsuariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
    uUtil, uCallForm, uMovimento, uTicket;

procedure TfrmPrincipal.btnVeiculosClick(Sender: TObject);
begin
    TCallForm.CallFormCad('TFrmCadVeiculo', 0);
end;

procedure TfrmPrincipal.btnVeiculosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnVeiculos.Cursor := crHandPoint;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    TLog.New.info('Finalizando a aplicação');
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
    stsBar.Panels[0].Width := Round((Screen.Width * 40) /100);
    stsBar.Panels[1].Width := Round((Screen.Width * 30) /100);
    stsBar.Panels[2].Width := Round((Screen.Width * 30) /100);
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

procedure TfrmPrincipal.btnProdutosClick(Sender: TObject);
begin
    TCallForm.CallFormCad('TFrmCadProduto', 0);
end;

procedure TfrmPrincipal.btnProdutosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnProdutos.Cursor := crHandPoint;
end;

procedure TfrmPrincipal.btnUsuariosClick(Sender: TObject);
begin
    TCallForm.CallFormCad('TfrmGerenciamentoUsuario', 0);
end;

procedure TfrmPrincipal.btnUsuariosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnUsuarios.Cursor := crHandPoint;
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
    TCallForm.CallFormCad('TfrmConfiguracoes', 1);
end;

procedure TfrmPrincipal.btnEmpresaClick(Sender: TObject);
begin
    TCallForm.CallFormCad('TFrmCadEmpresa', 0);
end;

procedure TfrmPrincipal.btnEmpresaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnEmpresa.Cursor := crHandPoint;
end;

procedure TfrmPrincipal.btnFormaPagamentoClick(Sender: TObject);
var
    iRetorno: integer;
begin
    iRetorno := TTicket.getTicket;
    if iRetorno = 0 then
    Application.MessageBox( 'Erro de Comunicação !', 'Erro',MB_IconError + MB_OK);

  If iRetorno = -1 Then
    Application.MessageBox( 'Erro de Execução na Função. Verifique!', 'Erro', MB_IconError + MB_OK);

  if iRetorno = -2  then
    Application.MessageBox( 'Parâmetro Inválido !', 'Erro',MB_IconError + MB_OK);

  if iRetorno = -3  then
    Application.MessageBox( 'Alíquota não programada !', 'Atenção',MB_IconInformation + MB_OK);

  If iRetorno = -4 Then
    Application.MessageBox( 'Arquivo BemaFI32.INI não encontrado. Verifique!', 'Atenção',
                                MB_IconInformation + MB_OK);

  If iRetorno = -5 Then
    Application.MessageBox( 'Erro ao Abrir a Porta de Comunicação', 'Erro',
                                MB_IconError + MB_OK);

  If iRetorno = -6 Then
    Application.MessageBox( 'Impressora Desligada ou Desconectada', 'Atenção',
                                MB_IconInformation + MB_OK);

  If iRetorno = -7 Then
    Application.MessageBox( 'Banco Não Cadastrado no Arquivo BemaFI32.ini', 'Atenção',
                                MB_IconInformation + MB_OK);

  If iRetorno = -8 Then
    Application.MessageBox( 'Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt', 'Erro',
                                MB_IconError + MB_OK);

  if iRetorno = -18 then
    Application.MessageBox( 'Não foi possível abrir arquivo INTPOS.001 !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if iRetorno = -19 then
    Application.MessageBox( 'Parâmetro diferentes !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if iRetorno = -20 then
    Application.MessageBox( 'Transação cancelada pelo Operador !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if iRetorno = -21 then
    Application.MessageBox( 'A Transação não foi aprovada !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if iRetorno = -22 then
    Application.MessageBox( 'Não foi possível terminal a Impressão !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if iRetorno = -23 then
    Application.MessageBox( 'Não foi possível terminal a Operação !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if iRetorno = -24 then
    Application.MessageBox( 'Forma de pagamento não programada.', 'Atenção',
                                MB_IconInformation + MB_OK);

  if iRetorno = -25 then
    Application.MessageBox( 'Totalizador não fiscal não programado.', 'Atenção',
                                MB_IconInformation + MB_OK);

  if iRetorno = -26 then
    Application.MessageBox( 'Transação já Efetuada !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if iRetorno = -28 then
    Application.MessageBox( 'Não há Informações para serem Impressas !', 'Atenção',
                                MB_IconInformation + MB_OK);
end;

procedure TfrmPrincipal.btnFormasPagamentoClick(Sender: TObject);
begin
    TCallForm.CallFormCad('TFrmCadFormaPagto', 0);
end;

procedure TfrmPrincipal.btnMensalistaClick(Sender: TObject);
begin
    TCallForm.CallFormCad('TfrmCadMensalista', 0);
end;

procedure TfrmPrincipal.btnMensalistaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnMensalista.Cursor := crHandPoint;
end;

procedure TfrmPrincipal.btnMovimentoClick(Sender: TObject);
var
  vForm : TFrmMovimento;
begin
    vForm := TFrmMovimento.Create(pnlDireita);
    vForm.Parent := pnlDireita;

    vForm.Top := 0;
    vForm.Left := 0;

    vForm.BorderStyle := bsNone;
    vForm.WindowState := TWindowState.wsMaximized;

    vForm.Show;
    VForm.SetFocus;
end;

procedure TfrmPrincipal.btnMovimentoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnMovimento.Cursor := crHandPoint;
end;

end.
