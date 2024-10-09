unit uCadPerfilUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDefault, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.StdCtrls,
  AdvEdit, System.Generics.Collections,
  {Classes de negócio}
  uUsuario, SimpleInterface, SimpleDao, SimpleAttributes, Vcl.ComCtrls;

type
  TfrmCadPerfilUsuario = class(TfrmFormDefault)
    [Bind('codigo')]
    edtCodigo: TAdvEdit;
    [Bind('nome')]
    edtNome: TAdvEdit;
    [Bind('ativo')]
    tglAtivo: TToggleSwitch;

    lblCodigo: TLabel;
    lblNome: TLabel;
    tvPerfil: TTreeView;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tvPerfilDblClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    FPerfil: TPerfilUsuario;
    DAOPerfil: iSimpleDao<TPerfilUsuario>;

    procedure FillPerfil;
  public
    { Public declarations }
    procedure Insert; override;
    procedure Update; override;
    procedure Delete; override;
  end;

var
  frmCadPerfilUsuario: TfrmCadPerfilUsuario;

implementation

{$R *.dfm}

uses uDataModule, uUtil;

{ TfrmCadPerfilUsuario }

procedure TfrmCadPerfilUsuario.btnExcluirClick(Sender: TObject);
begin
  inherited;
    Self.FillPerfil;
end;

procedure TfrmCadPerfilUsuario.btnInserirClick(Sender: TObject);
begin
  inherited;
    edtNome.SetFocus;
end;

procedure TfrmCadPerfilUsuario.btnSalvarClick(Sender: TObject);
begin
  inherited;
    Self.FillPerfil;
end;

procedure TfrmCadPerfilUsuario.Delete;
begin
  inherited;
    DAOPerfil.Delete('id', self.ID.ToString);
end;

procedure TfrmCadPerfilUsuario.FillPerfil;
var
    ix: Integer;
    oLista: TObjectList<TPerfilUsuario>;
begin
  inherited;
    tvPerfil.Items.Clear;

    oLista := TObjectList<TPerfilUsuario>.Create;
    try
        DAOPerfil.SQL.Fields('id, nome').OrderBy('nome ASC').&End.Find(oLista);
        for ix := 0 to oLista.count -1 do
        begin
            tvPerfil.Items.Add(Nil, oLista[ix].ID.ToString + ' - ' + oLista[ix].Nome)
        end;
    finally
        oLista.Free;
    end;
end;

procedure TfrmCadPerfilUsuario.FormCreate(Sender: TObject);
begin
  inherited;
    DAOPerfil := TSimpleDao<TPerfilUsuario>.New(DM.GetConn);

    Self.FillPerfil;
end;

procedure TfrmCadPerfilUsuario.FormDestroy(Sender: TObject);
begin
    FPerfil.Free;
  inherited;
end;

procedure TfrmCadPerfilUsuario.FormShow(Sender: TObject);
begin
  inherited;
    try
        FPerfil := DAOPerfil.Find(self.ID);
        FPerfil.Loads(Self, FPerfil);

        if self.InModeEditing then
            FPerfil := DAOPerfil.Find(self.ID);

        if self.InModeInserting then
            tglAtivo.State := tssOn;
    except
        on E: Exception do
            ErrorMessage(self.Caption, 'Ocorreu um erro: ' + #13+#10 + E.Message);
    end;
end;

procedure TfrmCadPerfilUsuario.Insert;
begin
  inherited;
    FPerfil.Parse(self);
    DAOPerfil.Insert(FPerfil);
end;

procedure TfrmCadPerfilUsuario.tvPerfilDblClick(Sender: TObject);
begin
  inherited;
    edtCodigo.Value := Split('-', tvPerfil.Selected.Text);
    edtNome.Value := Split('-', tvPerfil.Selected.Text, False);
    tglAtivo.State := tssOn;
end;

procedure TfrmCadPerfilUsuario.Update;
begin
  inherited;
    FPerfil.Parse(self);
    DAOPerfil.Update(FPerfil)
end;

initialization
  RegisterClass(TfrmCadPerfilUsuario);

finalization
  UnRegisterClass(TfrmCadPerfilUsuario);

end.
