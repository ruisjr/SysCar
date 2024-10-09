unit uVendaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormSingleDefault, Vcl.StdCtrls, AdvEdit, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls,
  AdvGlowButton;

type
  TfrmVendaProduto = class(TfrmSingleFormDefault)
    lblProduto: TLabel;
    edtCodigoProduto: TAdvEdit;
    pnlNomeProduto: TPanel;
    Label1: TLabel;
    edtQuantidade: TAdvEdit;
    edtPrecoUnit: TAdvEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edtPercentualDesconto: TAdvEdit;
    edtValorDesconto: TAdvEdit;
    Label4: TLabel;
    edtTotal: TAdvEdit;
    Label5: TLabel;
    btnConsultaCliente: TAdvGlowButton;
    procedure edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure btnConsultaClienteClick(Sender: TObject);
    procedure edtPercentualDescontoExit(Sender: TObject);
    procedure edtValorDescontoExit(Sender: TObject);
    procedure edtCodigoProdutoEnter(Sender: TObject);
    procedure edtCodigoProdutoExit(Sender: TObject);
  private
    oldCodProduto: Integer;
    { Private declarations }
    procedure consultaProduto(const CodProduto: Integer);
    procedure calculaValores(percent: Boolean = True);
  public
    { Public declarations }
  end;

var
  frmVendaProduto: TfrmVendaProduto;

implementation

{$R *.dfm}

uses uCallForm, uProduto, uDataModule, SimpleInterface, SimpleDao, uUtil;

procedure TfrmVendaProduto.btnConsultaClienteClick(Sender: TObject);
var
    aCodProduto: Integer;
begin
  inherited;
    TCallForm.CallFormPesq('TfrmFiltroProduto', 'Consulta de Produto', aCodProduto);
    self.consultaProduto(aCodProduto);
end;

procedure TfrmVendaProduto.calculaValores(percent: Boolean);
var
    aValor: Currency;
begin
    aValor := edtQuantidade.Value * edtPrecoUnit.Value;

    if percent then
        edtValorDesconto.Value := GetRoundTo((aValor * edtPercentualDesconto.Value) / 100, -2)
    else
        edtPercentualDesconto.Value := GetRoundTo((edtValorDesconto.Value / aValor) * 100, -2);

    { Valor total menos descontos }
    edtTotal.Value := GetRoundTo(aValor - edtValorDesconto.Value, -2);
end;

procedure TfrmVendaProduto.consultaProduto(const CodProduto: Integer);
var
    oProduto: TProduto;
    DAO: iSimpleDao<TProduto>;
begin
  inherited;
    if CodProduto <= 0 then
        Exit;

    DAO := TSimpleDao<TProduto>.New(DM.GetConn);
    oProduto := DAO.Find(CodProduto);
    try
        edtCodigoProduto.Text := oProduto.ID.ToString;
        pnlNomeProduto.Caption := oProduto.Nome;
        edtPrecoUnit.Value := oProduto.PrecoUnitario;
        edtQuantidade.Value := 1;

        self.calculaValores;
    finally
        oProduto.Free;
    end;
end;

procedure TfrmVendaProduto.edtCodigoProdutoEnter(Sender: TObject);
begin
  inherited;
    oldCodProduto := edtCodigoProduto.Value;
end;

procedure TfrmVendaProduto.edtCodigoProdutoExit(Sender: TObject);
begin
  inherited;
    if oldCodProduto <> edtCodigoProduto.Value then
        self.consultaProduto(edtCodigoProduto.Value)
end;

procedure TfrmVendaProduto.edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
    aCodProduto: Integer;
begin
  inherited;
    if key = VK_RETURN then
    begin
        TCallForm.CallFormPesq('TfrmFiltroProduto', 'Consulta de Produto', aCodProduto);
        self.consultaProduto(aCodProduto);
    end
end;

procedure TfrmVendaProduto.edtPercentualDescontoExit(Sender: TObject);
begin
  inherited;
    self.calculaValores(True);
end;

procedure TfrmVendaProduto.edtQuantidadeChange(Sender: TObject);
begin
  inherited;
    self.calculaValores;
end;


procedure TfrmVendaProduto.edtValorDescontoExit(Sender: TObject);
begin
  inherited;
    self.calculaValores(False);
end;

initialization
  RegisterClass(TfrmVendaProduto);

finalization
  UnRegisterClass(TfrmVendaProduto);

end.
