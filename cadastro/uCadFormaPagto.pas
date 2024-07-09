unit uCadFormaPagto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDefault, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls,
  AdvEdit, AdvCombo, AdvOfficeButtons, JvExStdCtrls, JvGroupBox,
  { Classes de negocio }
  uFormaPagamento, SimpleInterface, SimpleDao, SimpleAttributes;

type
  TFrmCadFormaPagto = class(TfrmFormDefault)
    [Bind('id')]
    edtCodigo: TAdvEdit;
    [Bind('ativo')]
    tglAtivo: TToggleSwitch;
    [Bind('nome')]
    edtNome: TAdvEdit;
    [Bind('tipo')]
    cbxTipoFormaPagto: TAdvComboBox;
    [Bind('tipo_recebimento')]
    cbxTipoRecebimento: TAdvComboBox;
    [Bind('moeda')]
    cbxMoeda: TAdvComboBox;
    [Bind('utilizar_cp')]
    chkContasPagar: TAdvOfficeCheckBox;
    [Bind('utilizar_cr')]
    chkContasReceber: TAdvOfficeCheckBox;
    [Bind('dia_primeira_parcela')]
    edtDiaVencimento: TAdvEdit;
    [Bind('parcelas')]
    edtParcelas: TAdvEdit;
    [Bind('permite_troco')]
    chkPermiteTroco: TAdvOfficeCheckBox;

    lblCodigo: TLabel;
    lblNome: TLabel;
    lblTipoFormaPagto: TLabel;
    lblTipoRecebimento: TLabel;
    lblMoeda: TLabel;
    grpUtilizacao: TJvGroupBox;
    grpVencimento: TJvGroupBox;
    lblDiaVencimento: TLabel;
    lblParcelas: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbxTipoRecebimentoChange(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FFormaPagto: TFormaPagamento;
    DAO: iSimpleDAO<TFormaPagamento>;
  public
    { métodos de sobrescrita }
    procedure Insert; override;
    procedure Update; override;
    procedure Delete; override;

    { Public declarations }
  end;

var
  FrmCadFormaPagto: TFrmCadFormaPagto;

implementation

{$R *.dfm}

uses uUtil, uDataModule, uCallForm;

procedure TFrmCadFormaPagto.btnLocalizarClick(Sender: TObject);
var
    aRetorno: Integer;
begin
    TCallForm.CallFormPesq('TFrmFiltroFormaPagto', 'Forma de Pagamento', aRetorno);
  inherited;
    if aRetorno > 0 then
    begin
        FFormaPagto := DAO.Find(aRetorno);
        FFormaPagto.Loads(Self, FFormaPagto);
        self.ID := FFormaPagto.Id;
        cbxTipoRecebimentoChange(self);
    end;
end;

procedure TFrmCadFormaPagto.cbxTipoRecebimentoChange(Sender: TObject);
begin
  inherited;
    with cbxTipoRecebimento do
    begin
        grpVencimento.Enabled := (ItemIndex = 1);
        if ItemIndex > 0 then
        begin
            edtDiaVencimento.Clear;
            edtParcelas.Clear;
            grpVencimento.Enabled := False;
        end;
    end;
end;

procedure TFrmCadFormaPagto.Delete;
begin
  inherited;
    DAO.Delete('id', IntToStr(self.ID));
end;

procedure TFrmCadFormaPagto.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
    oFormaPagto: TFormaPagamento;
begin
  inherited;
    if (key = VK_RETURN) and (not edtCodigo.Text.IsEmpty) and (edtCodigo.Text.ToInteger > 0) then
    begin
        oFormaPagto := DAO.Find(edtCodigo.Text.ToInteger);
        try
            oFormaPagto.Loads(self, oFormaPagto);
            self.ID := oFormaPagto.ID;
        finally
            oFormaPagto.Free
        end;
    end;
end;

procedure TFrmCadFormaPagto.FormCreate(Sender: TObject);
begin
  inherited;
    DAO := TSimpleDAO<TFormaPagamento>.New(DM.GetConn).DataSource(self.dsDados);
    try
        FFormaPagto := DAO.Find(0);
        FFormaPagto.Loads(Self, FFormaPagto);

        if self.InModeEditing then
            FFormaPagto := DAO.Find(self.ID);

        if self.InModeInserting then
            tglAtivo.State := tssOn;
    except
        on E: Exception do
            ErrorMessage(self.Caption, 'Ocorreu um erro: ' + #13+#10 + E.Message);
    end;
end;

procedure TFrmCadFormaPagto.Insert;
begin
  inherited;
    FFormaPagto.Parse(self);
    DAO.Insert(FFormaPagto);
end;

procedure TFrmCadFormaPagto.Update;
begin
  inherited;
    FFormaPagto.Parse(self);
    DAO.Update(FFormaPagto);
end;

initialization
  RegisterClass(TFrmCadFormaPagto);

finalization
  UnRegisterClass(TFrmCadFormaPagto);

end.
