unit uCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDefault, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.StdCtrls, AdvEdit,
  Vcl.WinXCtrls, AdvCombo, System.Generics.Collections,
  {Classes de negócio}
  uUsuario, SimpleInterface, SimpleDao, SimpleAttributes;

type
  TfrmCadUsuario = class(TfrmFormDefault)
    [Bind('id')]
    edtCodigo: TAdvEdit;
    [Bind('nome')]
    edtNome: TAdvEdit;
    [Bind('login')]
    edtLogin: TAdvEdit;
    [Bind('email')]
    edtEmail: TAdvEdit;
    [Bind('ativo')]
    tglAtivo: TToggleSwitch;
    [Bind('perfil')]
    cbxPerfil: TAdvComboBox;

    lblCodigo: TLabel;
    lblNome: TLabel;
    lblLogin: TLabel;
    lblEmail: TLabel;
    lblPerfil: TLabel;
    imgFoto: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    DAOUsuario: iSimpleDAO<TUsuario>;
    FUsuario: TUsuario;

    procedure FillPerfil;
  public
    { Public declarations }
    procedure Insert; override;
    procedure Update; override;
    procedure Delete; override;
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}

uses uDataModule, uUtil;


{ TfrmCadUsuario }

procedure TfrmCadUsuario.Delete;
begin
  inherited;
    DAOUsuario.Delete('id', IntToStr(self.ID));
end;

procedure TfrmCadUsuario.FillPerfil;
var
    ix: Integer;
    DAOPerfil: iSimpleDao<TPerfilUsuario>;
    aName: String;
    oLista: TObjectList<TPerfilUsuario>;
begin
    oLista := TObjectList<TPerfilUsuario>.Create;
    try
        DAOPerfil := TSimpleDao<TPerfilUsuario>.New(DM.GetConn);

        DAOPerfil.SQL.Fields('id, nome').Where('ativo = True').OrderBy('id ASC').&End.Find(oLista);
        for ix := 0 to oLista.Count -1 do
        begin
            if ix = 0 then
                cbxPerfil.Items.Append('');

            with cbxPerfil.Items do
            begin
                aName := oLista[ix].ID.ToString + ' - ' + oLista[ix].Nome;
                Append(aName);
            end;
        end;
    finally
        FreeAndNil(oLista);
    end;
end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
    DAOUsuario := TSimpleDAO<TUsuario>.New(DM.GetConn).DataSource(self.dsDados);
    Self.FillPerfil;
end;

procedure TfrmCadUsuario.FormDestroy(Sender: TObject);
begin
    FUsuario.Free;
  inherited;
end;

procedure TfrmCadUsuario.FormShow(Sender: TObject);
begin
  inherited;
    try
        FUsuario := DAOUsuario.Find(self.ID);
        FUsuario.Loads(Self, FUsuario);

        if self.InModeEditing then
            FUsuario := DAOUsuario.Find(self.ID);

        if self.InModeInserting then
            tglAtivo.State := tssOn;
    except
        on E: Exception do
            ErrorMessage(self.Caption, 'Ocorreu um erro: ' + #13+#10 + E.Message);
    end;
end;

procedure TfrmCadUsuario.Insert;
begin
  inherited;
    FUsuario.Parse(self);
    DAOUsuario.Insert(FUsuario);
end;

procedure TfrmCadUsuario.Update;
begin
  inherited;
    FUsuario.Parse(self);
    DAOUsuario.Update(FUsuario)
end;

initialization
  RegisterClass(TfrmCadUsuario);

finalization
  UnRegisterClass(TfrmCadUsuario);

end.
