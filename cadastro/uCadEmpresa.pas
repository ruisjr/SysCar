unit uCadEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDefault, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.ComCtrls,
  AdvDateTimePicker, Vcl.WinXCtrls, Vcl.StdCtrls, AdvEdit, Vcl.Mask, AdvCombo, AdvGlowButton, AdvPageControl,
  IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  { Classes de negocio }
  uPessoa, SimpleInterface, SimpleDao, SimpleAttributes, uMunicipio, uPais;

type
  TfrmCadEmpresa = class(TfrmFormDefault)
    [Bind('id')]
    edtCodigo: TAdvEdit;
    [Bind('ativo')]
    tglAtivo: TToggleSwitch;
    [Bind('dt_cadastro')]
    edtDataCadastro: TAdvDateTimePicker;
    [Bind('nome_reduzido')]
    edtNomeFantasia: TAdvEdit;
    [Bind('nome')]
    edtNome: TAdvEdit;
    [Bind('inscr_est')]
    edtInscricaoEstadual: TAdvEdit;
    [Bind('telefone')]
    edtTelefone: TAdvMaskEdit;
    [Bind('celular')]
    edtCelular: TAdvMaskEdit;
    [Bind('email')]
    edtEmail: TAdvEdit;
    [Bind('cpf_cnpj')]
    edtCnpj: TAdvMaskEdit;
    [Bind('inscr_municipal')]
    edtInscricaoMunicipal: TAdvEdit;
    [Bind('logradouro'), BindCep('logradouro')]
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
    [Bind('pais')]
    edtPais: TAdvEdit;

    lblDataCadastro: TLabel;
    lblNome: TLabel;
    lblNomeFantasia: TLabel;
    lblCodigo: TLabel;
    lblCnpj: TLabel;
    lblInscrEstadual: TLabel;
    lblTelefone: TLabel;
    lblCelular: TLabel;
    lblEmail: TLabel;
    lblInscrMunicipal: TLabel;
    lblCep: TLabel;
    lblLogradouro: TLabel;
    lblNumero: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblUF: TLabel;
    lblComplemento: TLabel;
    lblPais: TLabel;
    pgcDadosEmpresa: TAdvPageControl;
    pgEnderecos: TAdvTabSheet;
    gbxEndereco: TGroupBox;
    btnCep: TAdvGlowButton;
    btnPais: TAdvGlowButton;
    btnMunicipio: TAdvGlowButton;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    procedure btnInserirClick(Sender: TObject);
    procedure btnMunicipioClick(Sender: TObject);
    procedure btnPaisClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCepClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    DAOEmpresa: iSimpleDAO<TPessoa>;
    FPessoa: TPessoa;
  public
    { métodos de sobrescrita }
    procedure Insert; override;
    procedure Update; override;
    procedure Delete; override;
  end;

var
  frmCadEmpresa: TfrmCadEmpresa;

implementation

{$R *.dfm}

uses uCallForm, uDataModule, uUtil, uCep, System.JSON;


{ TfrmCadEmpresa }

procedure TfrmCadEmpresa.btnCepClick(Sender: TObject);
var
    oCep: TCep;
    aCep: String;
    LJsonObj: TJSONObject;
begin
  inherited;
    oCep := TCep.Create;
    try
        aCep := StringReplace(edtCep.Text, '-', '', [rfReplaceAll]);
        LJsonObj := oCep.GetCep(aCep);
        edtLogradouro.Text := LJsonObj.Get('logradouro').JsonValue.Value;
    finally
        oCep.Free;
    end;

end;

procedure TfrmCadEmpresa.btnInserirClick(Sender: TObject);
begin
  inherited;
    tglAtivo.State := tssOn;
end;

procedure TfrmCadEmpresa.btnLocalizarClick(Sender: TObject);
var
    aRetorno: Integer;
begin
    TCallForm.CallFormPesq('TFrmFiltroEmpresa', 'Empresa', aRetorno);
  inherited;
    if aRetorno > 0 then
    begin
        FPessoa := DAOEmpresa.Find(aRetorno);
        FPessoa.Loads(Self, FPessoa);
        self.ID := FPessoa.Id;
    end;
end;

procedure TfrmCadEmpresa.btnMunicipioClick(Sender: TObject);
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

procedure TfrmCadEmpresa.btnPaisClick(Sender: TObject);
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

procedure TfrmCadEmpresa.Delete;
begin
    inherited;
    DAOEmpresa.Delete('id', IntToStr(self.ID));
end;

procedure TfrmCadEmpresa.FormCreate(Sender: TObject);
begin
    inherited;
    DAOEmpresa := TSimpleDAO<TPessoa>.New(DM.GetConn).DataSource(self.dsDados);
    try
        FPessoa := DAOEmpresa.Find(0);
        FPessoa.Loads(Self, FPessoa);

        if self.InModeEditing then
            FPessoa := DAOEmpresa.Find(self.ID);

        if self.InModeInserting then
            tglAtivo.State := tssOn;
    except
        on E: Exception do
            ErrorMessage(self.Caption, 'Ocorreu um erro: ' + #13+#10 + E.Message);
    end;
end;

procedure TfrmCadEmpresa.FormDestroy(Sender: TObject);
begin
    FPessoa.Free;
  inherited;
end;

procedure TfrmCadEmpresa.Insert;
begin
    inherited;
    FPessoa.Parse(self);
    FPessoa.Empresa := True;
    DAOEmpresa.Insert(FPessoa);
end;

procedure TfrmCadEmpresa.Update;
begin
    inherited;
    FPessoa.Parse(self);
    FPessoa.Empresa := True;
    DAOEmpresa.Update(FPessoa);
end;

initialization
  RegisterClass(TfrmCadEmpresa);

finalization
  UnRegisterClass(TfrmCadEmpresa);

end.
