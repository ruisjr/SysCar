unit uFinalizaVendaFormaPagto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls,
  Vcl.StdCtrls, AdvEdit, AdvCombo, System.Generics.Collections, Data.DB,
  {Classes de negócios}
  uFormaPagamento, SimpleInterface, SimpleDao;

type
  TfrmFinalizaVendaFormaPagto = class(TForm)
    pnlFundo: TPanel;
    pnlTitulo: TJvPanel;
    btnClose: TAeroSpeedButton;
    pnlBotoes: TJvPanel;
    btnInserir: TAeroSpeedButton;
    lblFormaPagamento: TLabel;
    edtValorRecebido: TAdvEdit;
    cbxFormaPagamento: TAdvComboBox;
    procedure btnCloseClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    DSDados: TDataSource;
    DAO: iSimpleDao<TFormaPagamento>;
    FFormaPagamento: String;
  public
    { Public declarations }
    Valor: Currency;
    FormaPagtoId: Integer;
    FormaPagtoNome: String;

    constructor Create(AOwner: TComponent; aFormaPagamento: String; aValor: Currency);
  end;

var
  frmFinalizaVendaFormaPagto: TfrmFinalizaVendaFormaPagto;

implementation

{$R *.dfm}

uses uUtil, uDataModule;

procedure TfrmFinalizaVendaFormaPagto.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmFinalizaVendaFormaPagto.btnInserirClick(Sender: TObject);
begin
    if StrToFloat(edtValorRecebido.Text) = 0 then
    begin
        InfoMessage('Finaliza Venda', 'Valor Recebido deve ser maior que zero');
        Abort;
    end;

    Valor := StrToFloat(edtValorRecebido.Text);
    FormaPagtoId := cbxFormaPagamento.ItemIndex;
    FormaPagtoNome := cbxFormaPagamento.Text;
    Close;
end;

constructor TfrmFinalizaVendaFormaPagto.Create(AOwner: TComponent; aFormaPagamento: String; aValor: Currency);
begin
  inherited Create(AOwner);
    FFormaPagamento := aFormaPagamento;
    edtValorRecebido.Text := FloatToStr(aValor);
end;

procedure TfrmFinalizaVendaFormaPagto.FormCreate(Sender: TObject);
var
    ix: Integer;
    aName: String;
    oLista: TObjectList<TFormaPagamento>;
begin
    oLista := TObjectList<TFormaPagamento>.Create;
    try
        DSDados := TDataSource.Create(self);
        DAO := TSimpleDao<TFormaPagamento>.New(DM.GetConn).DataSource(DSDados);

        DAO.SQL.Fields('id, nome').Where('ativo = True').OrderBy('id ASC').&End.Find(oLista);
        for ix := 0 to oLista.Count -1 do
        begin
            if ix = 0 then
                cbxFormaPagamento.Items.Append('');

            with cbxFormaPagamento.Items do
            begin
                aName := oLista[ix].ID.ToString + ' - ' + oLista[ix].Nome;
                Append(aName);
            end;
        end;
        cbxFormaPagamento.SelectItem(FFormaPagamento);
        cbxFormaPagamento.Enabled := False;
    finally
        FreeAndNil(oLista);
    end;
end;

procedure TfrmFinalizaVendaFormaPagto.FormShow(Sender: TObject);
begin
    if FFormaPagamento.IsEmpty then
        cbxFormaPagamento.Enabled := True;
end;

end.
