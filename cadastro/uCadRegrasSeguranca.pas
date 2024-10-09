unit uCadRegrasSeguranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDefault, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Samples.Spin, Vcl.StdCtrls, AdvGroupBox, AdvOfficeButtons,
  {Classes de negócio}
  uRegrasSeguranca, SimpleInterface, SimpleDao, SimpleAttributes;

type
  TfrmCadRegrasSeguranca = class(TfrmFormDefault)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;

    [Bind('habilita_regra_bloqueio')]
    grpRegrasBloqueio: TAdvGroupBox;
    [Bind('habilita_regra_senha')]
    grpRegrasSenha: TAdvGroupBox;

    [Bind('qtd_minima_caracter')]
    spMinimoCaracter: TSpinEdit;
    [Bind('qtd_maxima_caracter')]
    spMaximoCaracter: TSpinEdit;
    [Bind('qtd_minima_numerico')]
    spMinimoNumerico: TSpinEdit;
    [Bind('qtd_minima_maiuscula')]
    spMinimoMaisculo: TSpinEdit;
    [Bind('qtd_minima_minuscula')]
    spMinimoMinusculo: TSpinEdit;
    [Bind('qtd_minima_especial')]
    spMinimoEspecial: TSpinEdit;
    [Bind('qtd_retentativas')]
    spRetentativa: TSpinEdit;
    [Bind('periodo_maximo_inatividade')]
    spInatividade: TSpinEdit;
    [Bind('periodo_expiracao')]
    spExpiracao: TSpinEdit;
    [Bind('qtd_senha_historico')]
    spHistorico: TSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grpRegrasBloqueioCheckBoxClick(Sender: TObject);
  private
    { Private declarations }
    FRegra: TRegraSeguranca;
    DAORegra: iSimpleDao<TRegraSeguranca>;
  public
    { Public declarations }
    procedure Update; override;
  end;

var
  frmCadRegrasSeguranca: TfrmCadRegrasSeguranca;

implementation

{$R *.dfm}

uses uDataModule;

procedure TfrmCadRegrasSeguranca.FormDestroy(Sender: TObject);
begin
    FRegra.Free;
  inherited;
end;

procedure TfrmCadRegrasSeguranca.FormShow(Sender: TObject);
begin
  inherited;
    DAORegra := TSimpleDao<TRegraSeguranca>.New(DM.GetConn);
    FRegra := DAORegra.SQL.OrderBy('id').&End.Find(self.ID);
    FRegra.Loads(Self, FRegra);
end;

procedure TfrmCadRegrasSeguranca.grpRegrasBloqueioCheckBoxClick(Sender: TObject);
var
    nIndex: Integer;
begin
  inherited;
    if grpRegrasBloqueio.CheckBox.Checked then
    begin
        for nIndex := 0 to grpRegrasBloqueio.ControlCount -1 do
        begin
            if grpRegrasBloqueio.Controls[nIndex] is TSpinEdit then
            begin
                TSpinEdit(grpRegrasBloqueio.Controls[nIndex]).Refresh;
                if TSpinEdit(grpRegrasBloqueio.Controls[nIndex]).Value = Null then
                    TSpinEdit(grpRegrasBloqueio.Controls[nIndex]).Value := (grpRegrasBloqueio.Controls[nIndex] as TSpinEdit).MinValue;
            end;
        end;
    end;
end;

procedure TfrmCadRegrasSeguranca.Update;
begin
  inherited;
    FRegra.Parse(self);
    FRegra.ID := Self.ID;
    DAORegra.Update(FRegra);
end;

initialization
  RegisterClass(TfrmCadRegrasSeguranca);

finalization
  UnRegisterClass(TfrmCadRegrasSeguranca);

end.
