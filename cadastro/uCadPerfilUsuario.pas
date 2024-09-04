unit uCadPerfilUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDefault, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.StdCtrls,
  AdvEdit,
  {Classes de negócio}
  uUsuario, SimpleInterface, SimpleDao, SimpleAttributes;

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

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FPerfil: TPerfilUsuario;
    DAOPerfil: iSimpleDao<TPerfilUsuario>;
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

procedure TfrmCadPerfilUsuario.Delete;
begin
  inherited;
    DAOPerfil.Delete('id', self.ID.ToString);
end;

procedure TfrmCadPerfilUsuario.FormCreate(Sender: TObject);
begin
  inherited;
    DAOPerfil := TSimpleDAO<TPerfilUsuario>.New(DM.GetConn);
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
