unit uIniciaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDefault, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.StdCtrls, AdvCombo,
  AdvGlowButton, Vcl.Mask, AdvEdit, System.Generics.Collections, Data.DB,
  { Classes de Negocio }
  SimpleDao, SimpleInterface, uVeiculo, ucMovimento;

type
  TfrmIniciaVenda = class(TfrmFormDefault)
    Label1: TLabel;
    cbxVeiculo: TAdvComboBox;
    btnConsultaCliente: TAdvGlowButton;
    cbxModelo: TAdvComboBox;
    Label2: TLabel;
    Label4: TLabel;
    edtPlaca: TAdvEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure cbxVeiculoChange(Sender: TObject);
  private
    { Private declarations }
    DAOVeiculo: iSimpleDao<TVeiculo>;
    DAOModelo: iSimpleDao<TModelo>;
    DAOMovimento: iSimpleDao<TMovimento>;
  public
    { Public declarations }
  end;

var
  frmIniciaVenda: TfrmIniciaVenda;

implementation

{$R *.dfm}

uses uUtil, uDataModule;


procedure TfrmIniciaVenda.btnLocalizarClick(Sender: TObject);
var
    oMovimento: TMovimento;
    oVeiculo: TVeiculo;
    oModelo: TModelo;
begin
  inherited;
    oMovimento := TMovimento.Create;
    try
        try
            oVeiculo := DAOVeiculo.Find('nome = '+QuotedStr(cbxVeiculo.Text));
            oModelo := DAOModelo.Find('nome = ' + QuotedStr(cbxModelo.Text));

            oMovimento.Ticket := Round(DateTimeToTimeStamp(Now).Time / 10000);
            oMovimento.Placa := edtPlaca.Text;
            oMovimento.DataEntrada := Now;
            oMovimento.HoraEntrada := Now;
            oMovimento.Veiculo := oVeiculo.ID;
            oMovimento.Modelo := oModelo.ID;
            oMovimento.Situacao := 'A';

            DAOMovimento.Insert(oMovimento);
        except
            on E: Exception do
            begin
                ErrorMessage('Iniciar Venda', 'Nâo foi possível iniciar a venda!'+#13+#10+'Motivo: '+E.Message);
            end;
        end;
    finally
        oMovimento.Free;
    end;
    Close;
end;

procedure TfrmIniciaVenda.cbxVeiculoChange(Sender: TObject);
var
    oLista: TObjectList<TModelo>;
    ix: Integer;
begin
  inherited;
    olista := TObjectList<TModelo>.Create;
    DAOModelo := TSimpleDao<TModelo>.New(DM.GetConn);
    try
        DAOModelo.SQL.Fields('id, nome').Where('veiculo = (SELECT id FROM veiculo WHERE nome = ' + QuotedStr(cbxVeiculo.Text)+')').OrderBy('nome ASC').&End.Find(oLista);
        cbxModelo.Items.Append('');

        for ix := 0 to oLista.Count -1 do
            begin
                with cbxModelo do
                begin
                    Items.Append(oLista[ix].Nome);
                end;
            end;
    finally
        oLista.Free;
    end;
end;

procedure TfrmIniciaVenda.FormCreate(Sender: TObject);
var
    ix: Integer;
    oLista: TObjectList<TVeiculo>;
begin
  inherited;
    btnSalvar.Enabled := False;
    btnInserir.Enabled := False;
    btnExcluir.Enabled := False;
    pnlDivisor.Enabled := False;

    btnLocalizar.width := 235;
    btnLocalizar.Caption := 'Confirmar';
    btnLocalizar.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\Checked_50px.bmp');

    oLista := TObjectList<TVeiculo>.Create;
    try
        DAOVeiculo := TSimpleDao<TVeiculo>.New(DM.GetConn);
        DAOMovimento := TSimpleDao<TMovimento>.New(DM.GetConn);

        DAOVeiculo.SQL.Fields('nome').OrderBy('nome').&End.Find(oLista);
        cbxVeiculo.Items.Append('');
        for ix := 0 to oLista.Count -1 do
        begin
            with cbxVeiculo do
            begin
                cbxVeiculo.Items.Append(oLista[ix].Nome);
            end;
        end;
    finally
        oLista.Free;
    end;
end;

end.
