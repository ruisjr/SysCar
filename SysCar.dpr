program SysCar;

uses
  Vcl.Forms,
  System.SysUtils,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uCadMensalista in 'cadastro\uCadMensalista.pas' {frmCadMensalista},
  uPessoa in 'classes\uPessoa.pas',
  uLogs in 'util\uLogs.pas',
  uMessages in 'util\uMessages.pas' {FrmMessage},
  uUtil in 'util\uUtil.pas',
  uDataModule in 'base\uDataModule.pas' {DM: TDataModule},
  uFiltroDefault in 'base\uFiltroDefault.pas' {FrmFiltroDefault},
  uFiltroPessoa in 'cadastro\uFiltroPessoa.pas' {frmFiltroPessoa},
  uFormDefault in 'base\uFormDefault.pas' {frmFormDefault},
  uCadVeiculo in 'cadastro\uCadVeiculo.pas' {frmCadVeiculo},
  uCallForm in 'base\uCallForm.pas',
  uVeiculo in 'classes\uVeiculo.pas',
  uFiltroVeiculo in 'cadastro\uFiltroVeiculo.pas' {FrmFiltroVeiculo},
  uCadFormaPagto in 'cadastro\uCadFormaPagto.pas' {FrmCadFormaPagto},
  uFormaPagamento in 'classes\uFormaPagamento.pas',
  uFiltroFormaPagto in 'cadastro\uFiltroFormaPagto.pas' {FrmFiltroFormaPagto},
  uMovimento in 'movimento\uMovimento.pas' {FrmMovimento},
  uFinalizaVenda in 'movimento\uFinalizaVenda.pas' {FrmFinalizaVenda},
  uFinalizaVendaFormaPagto in 'movimento\uFinalizaVendaFormaPagto.pas' {frmFinalizaVendaFormaPagto},
  uIniciaVenda in 'movimento\uIniciaVenda.pas' {frmIniciaVenda},
  ucMovimento in 'classes\ucMovimento.pas',
  uCadProduto in 'cadastro\uCadProduto.pas' {frmCadProduto},
  uProduto in 'classes\uProduto.pas',
  uFiltroProduto in 'cadastro\uFiltroProduto.pas' {frmFiltroProduto},
  uLancamento in 'classes\uLancamento.pas';

{$R *.res}

begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  Application.CreateForm(TfrmFiltroProduto, frmFiltroProduto);
  TLog.New.info('Inicializando a aplicação');

    Application.Run;
end.
