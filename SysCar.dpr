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
  uFormSingleDefault in 'base\uFormSingleDefault.pas' {frmSingleFormDefault},
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
  uLancamento in 'classes\uLancamento.pas',
  uCadEmpresa in 'cadastro\uCadEmpresa.pas' {frmCadEmpresa},
  uFiltroPais in 'cadastro\uFiltroPais.pas' {FrmFiltroPais},
  uPais in 'classes\uPais.pas',
  uMunicipio in 'classes\uMunicipio.pas',
  uFiltroEmpresa in 'cadastro\uFiltroEmpresa.pas' {FrmFiltroEmpresa},
  uFiltroMunicipio in 'cadastro\uFiltroMunicipio.pas' {FrmFiltroMunicipio},
  uCadConfiguracoes in 'cadastro\uCadConfiguracoes.pas' {frmConfiguracoes},
  uConfiguracoes in 'classes\uConfiguracoes.pas',
  uTicket in 'classes\uTicket.pas',
  uCep in 'classes\uCep.pas',
  uCadUsuario in 'cadastro\uCadUsuario.pas' {frmCadUsuario},
  uUsuario in 'classes\uUsuario.pas',
  uGerenciamentoUsuarios in 'cadastro\uGerenciamentoUsuarios.pas' {frmGerenciamentoUsuario},
  uCadPerfilUsuario in 'cadastro\uCadPerfilUsuario.pas' {frmCadPerfilUsuario},
  uCadRegrasSeguranca in 'cadastro\uCadRegrasSeguranca.pas' {frmCadRegrasSeguranca},
  uRegrasSeguranca in 'cadastro\uRegrasSeguranca.pas',
  login in 'config\login.pas' {frmLogin},
  uFormDefault in 'base\uFormDefault.pas' {frmFormDefault},
  uVendaProduto in 'movimento\uVendaProduto.pas' {frmVendaProduto},
  uFinalizaVendaPagamento in 'movimento\uFinalizaVendaPagamento.pas' {frmFinalizaVendaPagamento};

{$R *.res}

begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmFormDefault, frmFormDefault);
  Application.CreateForm(TfrmVendaProduto, frmVendaProduto);
  Application.CreateForm(TfrmFinalizaVendaPagamento, frmFinalizaVendaPagamento);
  TLog.New.info('Inicializando a aplicação');

    Application.Run;
end.
