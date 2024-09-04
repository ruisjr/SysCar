unit uCadMensalista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDefault, Vcl.ExtCtrls, AeroButtons, JvExExtCtrls,
  JvExtComponent, JvPanel,Vcl.StdCtrls, Data.DB, Vcl.WinXCtrls,
  AdvEdit, Vcl.Mask, Vcl.ComCtrls, AdvDateTimePicker, AdvCombo, AdvGlowButton,
  {classes de negocio}
  SimpleInterface, SimpleDao, SimpleAttributes, uPessoa;


type
  TfrmCadMensalista = class(TfrmFormDefault)
    [Bind('id')]
    edtCodigo: TAdvEdit;
    [Bind('nome')]
    edtNome: TAdvEdit;
    [Bind('cpf_cnpj')]
    edtCPF: TAdvMaskEdit;
    [Bind('dt_cadastro')]
    edtDataCadastro: TAdvDateTimePicker;
    [Bind('rg')]
    edtRG: TAdvMaskEdit;
    [Bind('sexo')]
    cbxSexo: TAdvComboBox;
    [Bind('telefone')]
    edtTelefone: TAdvMaskEdit;
    [Bind('celular')]
    edtCelular: TAdvMaskEdit;
    [Bind('logradouro')]
    edtLogradouro: TAdvEdit;
    [Bind('numero')]
    edtNumero: TAdvEdit;
    [Bind('cep')]
    edtCep: TAdvMaskEdit;
    [Bind('bairro')]
    edtBairro: TAdvEdit;
    [Bind('cidade')]
    edtMunicipio: TAdvEdit;
    [Bind('estado')]
    cbxUF: TAdvComboBox;
    [Bind('complemento')]
    edtComplemento: TAdvEdit;
    [Bind('ativo')]
    tglAtivo: TToggleSwitch;
    [Bind('email')]
    edtEmail: TAdvEdit;
    [Bind('pais')]
    edtPais: TAdvEdit;

    btnCep: TAdvGlowButton;
    gbxEndereco: TGroupBox;
    lblLogradouro: TLabel;
    lblNumero: TLabel;
    lblCep: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblUF: TLabel;
    lblComplemento: TLabel;
    lblCelular: TLabel;
    lblTelefone: TLabel;
    lblSexo: TLabel;
    lblNome: TLabel;
    lblCPF: TLabel;
    lblRG: TLabel;
    lblDataCadastro: TLabel;
    lblCodigo: TLabel;
    lblEmail: TLabel;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnMunicipioClick(Sender: TObject);
    procedure btnPaisClick(Sender: TObject);
  private
    { Private declarations }
    DAO: iSimpleDAO<TPessoa>;
    FPessoa: TPessoa;
  public
    { métodos de sobrescrita }
    procedure Insert; override;
    procedure Update; override;
    procedure Delete; override;

    { Public declarations }
  end;

var
  frmCadMensalista: TfrmCadMensalista;

implementation

{$R *.dfm}

uses
    uUtil, uDataModule, uFiltroPessoa, uCallForm, uMunicipio, uPais;


procedure TfrmCadMensalista.btnLocalizarClick(Sender: TObject);
var
    aRetorno: Integer;
begin
    TCallForm.CallFormPesq('TfrmFiltroPessoa', 'Mensalista', aRetorno);
    inherited;
    if aRetorno > 0 then
    begin
        FPessoa := DAO.Find(aRetorno);
        FPessoa.Loads(Self, FPessoa);
        self.ID := FPessoa.Id;
    end;
end;

procedure TfrmCadMensalista.btnMunicipioClick(Sender: TObject);
var
    aRetorno: Integer;
    oMunicipio: TMunicipio;
    DaoMunicipio: iSimpleDao<TMunicipio>;
begin
    TCallForm.CallFormPesq('TFrmFiltroMunicipio', 'Município', aRetorno);
    inherited;

    if aRetorno > 0 then
    begin
        DaoMunicipio := TSimpleDao<TMunicipio>.New(DM.GetConn);
        oMunicipio := DAOMunicipio.Find(aRetorno);
        try
            edtMunicipio.Text := oMunicipio.Nome;
        finally
            oMunicipio.Free;
        end;
    end;
end;

procedure TfrmCadMensalista.btnPaisClick(Sender: TObject);
var
    aRetorno: Integer;
    oPais: TPais;
    DaoPais: iSimpleDao<TPais>;
begin
    TCallForm.CallFormPesq('TFrmFiltroPais', 'Pais', aRetorno);
    inherited;

    if aRetorno > 0 then
    begin
        DaoPais := TSimpleDao<TPais>.New(DM.GetConn);
        oPais := DaoPais.Find(aRetorno);
        try
            edtPais.Text := oPais.Nome;
        finally
            oPais.Free;
        end;
    end;
end;

procedure TfrmCadMensalista.Delete;
begin
    inherited;
    DAO.Delete('id', IntToStr(self.ID));
end;

procedure TfrmCadMensalista.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
    oPessoa: TPessoa;
begin
  inherited;
    if (key = VK_RETURN) and (not edtCodigo.Text.IsEmpty) and (edtCodigo.Text.ToInteger > 0) then
    begin
        oPessoa := DAO.Find(edtCodigo.Text.ToInteger);
        try
            oPessoa.Loads(self, oPessoa);
            self.ID := oPessoa.ID;
        finally
            oPessoa.Free
        end;
    end;
end;

procedure TfrmCadMensalista.FormCreate(Sender: TObject);
begin
  inherited;
    DAO := TSimpleDAO<TPessoa>.New(DM.GetConn).DataSource(self.dsDados);
    try
        FPessoa := DAO.Find(0);
        FPessoa.Loads(Self, FPessoa);

        if self.InModeEditing then
            FPessoa := DAO.Find(self.ID);
    except
        on E: Exception do
            ErrorMessage(self.Caption, 'Ocorreu um erro: ' + #13+#10 + E.Message);
    end;
end;

procedure TfrmCadMensalista.FormShow(Sender: TObject);
begin
  inherited;
    if InModeInserting then
        edtDataCadastro.Date := getDataAtual;
end;

procedure TfrmCadMensalista.Insert;
begin
    inherited;
    FPessoa.Parse(self);
    FPessoa.Mensalista := True;
    DAO.Insert(FPessoa);
end;

procedure TfrmCadMensalista.Update;
begin
    inherited;
    FPessoa.Parse(self);
    FPessoa.Mensalista := True;
    DAO.Update(FPessoa);
end;

initialization
  RegisterClass(TfrmCadMensalista);

finalization
  UnRegisterClass(TfrmCadMensalista);

end.
