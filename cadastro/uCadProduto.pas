unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDefault, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.StdCtrls, AdvEdit,
  Vcl.WinXCtrls, Vcl.ComCtrls, AdvDateTimePicker, AdvCombo, System.Generics.Collections,
  { Classes de Negócio }
  uProduto, SimpleInterface, SimpleDao, SimpleAttributes, JvRadioGroup, Vcl.Mask, AdvSpin, uFormSingleDefault;

type
  TfrmCadProduto = class(TfrmSingleFormDefault)

    [Bind('id')]
    edtCodigo: TAdvEdit;
    [Bind('ativo')]
    tglAtivo: TToggleSwitch;
    [Bind('nome')]
    edtNome: TAdvEdit;
    [Bind('nome_reduzido')]
    edtNomeReduzido: TAdvEdit;
    [Bind('dt_cadastro')]
    edtDataCadastro: TAdvDateTimePicker;
    [Bind('codigo_barra')]
    edtCodigoBarra: TAdvEdit;
    [Bind('tipo')]
    rdgTipoMercadoria: TJvRadioGroup;
    [Bind('unidade_medida')]
    cbxUnidMed: TAdvComboBox;
    [Bind('preco_unit')]
    edtPrecoUnit: TAdvEdit;
    [Bind('preco_prazo')]
    edtPrecoPrazo: TAdvEdit;
    [Bind('preco_anterior')]
    edtPrecoAnterior: TAdvEdit;

    lblCodigo: TLabel;
    lblNome: TLabel;
    lblEmail: TLabel;
    lblDataCadastro: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    grpPrecos: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    edtTolerancia: TAdvSpinEdit;
    lblToleranciaMinutos: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rdgTipoMercadoriaClick(Sender: TObject);
    procedure cbxUnidMedChange(Sender: TObject);
  private
    { Private declarations }
    FProduto: TProduto;
    DAOProduto: iSimpleDao<TProduto>;

    procedure LoadUnidadeMedida;
    procedure HabilitaTolerancia;
  public
    { Public declarations }

    { métodos de sobrescrita }
    procedure Insert; override;
    procedure Update; override;
    procedure Delete; override;
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses uDataModule, uUtil, uCallForm;


procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
    DAOProduto := TSimpleDAO<TProduto>.New(DM.GetConn);
    try
        FProduto := DAOProduto.Find(0);
        FProduto.Loads(Self, FProduto);

        if self.InModeEditing then
            FProduto := DAOProduto.Find(self.ID);

        LoadUnidadeMedida;
    except
        on E: Exception do
            ErrorMessage(self.Caption, 'Ocorreu um erro: ' + #13+#10 + E.Message);
    end;
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
    if InModeInserting then
        edtDataCadastro.Date := getDataAtual;
end;

procedure TfrmCadProduto.HabilitaTolerancia;
begin
    if (rdgTipoMercadoria.ItemIndex = 1) and (cbxUnidMed.Text = 'H') then
    begin
        edtTolerancia.Enabled := True;
        lblToleranciaMinutos.Enabled := True;
        edtTolerancia.Value := 0;
    end
    else
    begin
        edtTolerancia.Enabled := False;
        lblToleranciaMinutos.Enabled := False;
    end;
end;

procedure TfrmCadProduto.Insert;
begin
    inherited;
    FProduto.Parse(self);
    DAOProduto.Insert(FProduto);
end;

procedure TfrmCadProduto.LoadUnidadeMedida;
var
    ix: Integer;
    Dao: iSimpleDao<TUnidadeMedida>;
    oLista: TObjectList<TUnidadeMedida>;
begin
    DAO := TSimpleDao<TUnidadeMedida>.New(DM.GetConn);
    oLista := TObjectList<TUnidadeMedida>.Create;
    try
        DAO.Find(OLista);

        cbxUnidMed.Clear;
        cbxUnidMed.Items.Append('');
        for ix := 0 to oLista.Count -1 do
        begin
            cbxUnidMed.Items.Insert(ix, oLista[ix].Sigla);
        end;
    finally
        oLista.Free;
    end;
end;

procedure TfrmCadProduto.rdgTipoMercadoriaClick(Sender: TObject);
begin
  inherited;
    HabilitaTolerancia;
end;

procedure TfrmCadProduto.Update;
begin
    inherited;
    FProduto.Parse(self);
    DAOProduto.Update(FProduto);
end;

procedure TfrmCadProduto.btnLocalizarClick(Sender: TObject);
var
    aRetorno: Integer;
begin
    TCallForm.CallFormPesq('TfrmFiltroProduto', 'Produto', aRetorno);
    inherited;
    if aRetorno > 0 then
    begin
        FProduto := DAOProduto.Find(aRetorno);
        FProduto.Loads(Self, FProduto);
        self.ID := FProduto.Id;
    end;
end;

procedure TfrmCadProduto.cbxUnidMedChange(Sender: TObject);
begin
  inherited;
    HabilitaTolerancia;
end;

procedure TfrmCadProduto.Delete;
begin
    inherited;
    DAOProduto.Delete('id', IntToStr(self.ID));
end;

procedure TfrmCadProduto.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
    oProduto: TProduto;
begin
  inherited;
    if (key = VK_RETURN) and (not edtCodigo.Text.IsEmpty) and (edtCodigo.Text.ToInteger > 0) then
    begin
        oProduto := DAOProduto.Find(edtCodigo.Text.ToInteger);
        try
            oProduto.Loads(self, oProduto);
            self.ID := oProduto.ID;
        finally
            oProduto.Free
        end;
    end;
end;

initialization
  RegisterClass(TfrmCadProduto);

finalization
  UnRegisterClass(TfrmCadProduto);

end.
