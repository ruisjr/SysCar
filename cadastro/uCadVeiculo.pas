unit uCadVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDefault, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.StdCtrls, AdvEdit,
  AdvCombo, Data.DB, JvRadioGroup, AdvGlowButton, AdvPanel, Vcl.Menus, AdvMenus, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid,
  { classes de negócio }
  SimpleInterface, SimpleDao, SimpleAttributes, uVeiculo;

type
  TfrmCadVeiculo = class(TfrmFormDefault)
    [Bind('id')]
    edtCodigo: TAdvEdit;
    [Bind('nome')]
    edtNome: TAdvEdit;
    [Bind('modelo')]
    [Bind('tipo')]
    grpTipo: TJvRadioGroup;

    lblCodigo: TLabel;
    lblNome: TLabel;
    imgLogo: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    btnMenuContato: TAdvGlowButton;
    ppmMenuLateral: TAdvPopupMenu;
    InserirModelo1: TMenuItem;
    Excluir1: TMenuItem;
    grdModelo: TJvDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure grpTipoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnMenuContatoClick(Sender: TObject);
  private
    { Private declarations }
    DAO: iSimpleDAO<TVeiculo>;
    DAOModelo: iSimpleDao<TModelo>;
    DSModelo: TDataSource;
    FVeiculo: TVeiculo;

    procedure setModelo(aVeiculo: String);
    procedure SetVeiculoLogo(aVeiculo: String);
  public
    { métodos de sobrescrita }
    procedure Insert; override;
    procedure Update; override;
    procedure Delete; override;

    { Public declarations }
  end;

var
  frmCadVeiculo: TfrmCadVeiculo;

implementation

{$R *.dfm}

uses uDataModule, uUtil, System.Contnrs, System.Generics.Collections, uCallForm;


{ TfrmCadVeiculo }

procedure TfrmCadVeiculo.btnLocalizarClick(Sender: TObject);
var
    aRetorno: Integer;
begin
    TCallForm.CallFormPesq('TFrmFiltroVeiculo', 'Veículos', aRetorno);
  inherited;
    if aRetorno > 0 then
    begin
        FVeiculo := DAO.Find(aRetorno);
        FVeiculo.Loads(Self, FVeiculo);
        self.ID := FVeiculo.Id;

        setModelo(edtNome.Text);
        SetVeiculoLogo(edtNome.Text);
    end;
end;

procedure TfrmCadVeiculo.SetVeiculoLogo(aVeiculo: String);
var
    aFileName: String;
begin
  inherited;
    try
        aFileName := ExtractFilePath(Application.ExeName) + 'img\veiculos\' + Lowercase(aVeiculo) + '.png';
        if FileExists(aFileName) then
            imgLogo.Picture.LoadFromFile(aFileName)
        else
            imgLogo.Picture.LoadFromFile('')
    except
        on E: Exception do
            InfoMessage(self.Caption, 'Não foi possível carregar a imagem do veículo');
    end;

    setModelo(edtNome.Text);
end;

procedure TfrmCadVeiculo.btnMenuContatoClick(Sender: TObject);
begin
  inherited;
    SubMenuPopUp(Sender, ppmMenuLateral);
end;

procedure TfrmCadVeiculo.Delete;
begin
    inherited;
    DAO.Delete('id', IntToStr(self.ID));
end;

procedure TfrmCadVeiculo.FormCreate(Sender: TObject);
begin
    inherited;
    DSModelo := TDataSource.Create(nil);
    grdModelo.DataSource := DSModelo;

    DAO := TSimpleDAO<TVeiculo>.New(DM.GetConn).DataSource(self.dsDados);
    DAOModelo := TSimpleDao<TModelo>.New(DM.GetConn).DataSource(DSModelo);
    try
        FVeiculo := DAO.Find(0);
        FVeiculo.Loads(Self, FVeiculo);

        if self.InModeEditing then
            FVeiculo := DAO.Find(self.ID);
    except
        on E: Exception do
            ErrorMessage(self.Caption, 'Ocorreu um erro: ' + #13+#10 + E.Message);
    end;
    grpTipoClick(nil);
end;

procedure TfrmCadVeiculo.FormDestroy(Sender: TObject);
begin
    FreeAndNil(DSModelo);

  inherited;
end;

procedure TfrmCadVeiculo.Insert;
begin
inherited;
    FVeiculo.Parse(self);
    DAO.Insert(FVeiculo);
end;

procedure TfrmCadVeiculo.setModelo(aVeiculo: String);
var
    sWhere: String;
    oLista: TObjectList<TModelo>;
begin
    try
        oLista := TObjectList<TModelo>.Create;
        try
            sWhere := 'veiculo = (SELECT id FROM veiculo WHERE nome = ' + QuotedStr(aVeiculo)+')';
            DAOModelo.SQL.Where(sWhere).OrderBy('nome').&End.Find(oLista);
        finally
            oLista.Free;
        end;
    except
        on E: Exception do
            ErrorMessage(self.Caption, 'Não foi possível carregar a lista de modelos do veículo '+aVeiculo+'. Motivo: ' + #13+#10 + E.Message);
    end;
end;

procedure TfrmCadVeiculo.grpTipoClick(Sender: TObject);
begin
  inherited;
    setModelo(edtNome.Text)
end;

procedure TfrmCadVeiculo.Update;
begin
  inherited;
    FVeiculo.Parse(self);
    DAO.Update(FVeiculo);
end;

initialization
  RegisterClass(TfrmCadVeiculo);

finalization
  UnRegisterClass(TfrmCadVeiculo);

end.
