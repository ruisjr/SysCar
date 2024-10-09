unit uCadConfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDefault, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.ComCtrls, AdvPageControl,
  Vcl.StdCtrls, AdvCombo,
  { Classes de negocio }
  uConfiguracoes, SimpleInterface, SimpleDao, SimpleAttributes;

type
  TfrmConfiguracoes = class(TfrmFormDefault)
    [Bind('tipo_pesquisa')]
    cbxTipoPesquisa: TAdvComboBox;
    [Bind('filtrar_por')]
    cbxFiltrarPor: TAdvComboBox;

    pgcPrincipal: TAdvPageControl;
    tbsGeral: TAdvTabSheet;
    grpPesquisa: TGroupBox;
    lblTipoPesquisa: TLabel;
    lblFiltrarPor: TLabel;
    GroupBox1: TGroupBox;
    rgArredondamento: TRadioGroup;

    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    DAO: iSimpleDao<TConfiguracoes>;
    FConfiguracoes: TConfiguracoes;
  public
    { métodos de sobrescrita }
    procedure Insert; override;
    procedure Update; override;
    procedure Delete; override;
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.dfm}

uses uDataModule, uUtil;

{ TfrmConfiguracoes }

procedure TfrmConfiguracoes.Delete;
begin
  inherited;
    DAO.Delete('id', IntToStr(self.ID));
end;

procedure TfrmConfiguracoes.FormCreate(Sender: TObject);
begin
  inherited;
    DAO:= TSimpleDAO<TConfiguracoes>.New(DM.GetConn).DataSource(self.dsDados);
    try
        FConfiguracoes := DAO.Find(1);
        FConfiguracoes.Loads(Self, FConfiguracoes);

        if FConfiguracoes.Id = 1 then
            self.ID := 1;
    except
        on E: Exception do
            ErrorMessage(self.Caption, 'Ocorreu um erro: ' + #13+#10 + E.Message);
    end;
end;

procedure TfrmConfiguracoes.Insert;
begin
  inherited;
    FConfiguracoes.Parse(self);
    DAO.Insert(FConfiguracoes);
end;

procedure TfrmConfiguracoes.Update;
begin
  inherited;
    FConfiguracoes.Parse(self);
    DAO.Update(FConfiguracoes);
end;

initialization
  RegisterClass(TfrmConfiguracoes);

finalization
  UnRegisterClass(TfrmConfiguracoes);

end.
