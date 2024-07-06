unit uFiltroVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFiltroDefault, Data.DB, Vcl.StdCtrls, AdvEdit, AdvCombo, JvExStdCtrls, JvGroupBox, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls,
  { Classes de negócio}
  SimpleInterface, SimpleDao, uVeiculo;

type
  TFrmFiltroVeiculo = class(TFrmFiltroDefault)
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    DAO: iSimpleDao<TVeiculo>;
  public
    { Public declarations }
  end;

var
  FrmFiltroVeiculo: TFrmFiltroVeiculo;

implementation

{$R *.dfm}

uses uDataModule;


procedure TFrmFiltroVeiculo.btnConfirmarClick(Sender: TObject);
begin
  inherited;
    self.Return := grdFiltro.DataSource.DataSet.FieldByName('id').AsInteger;
end;

procedure TFrmFiltroVeiculo.edtPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
    if edtPesquisa.Text.IsEmpty then
    begin
        DAO.SQL.Fields('id, nome')
          .OrderBy('id').Limit(edtLimite.Text)
          .&end
        .find;
    end
    else
    begin
        if cbxFiltro.ItemIndex = cPESQ_CODIGO then
        begin
            DAO.SQL.Fields('id, nome')
              .Where(getWhere('id', edtPesquisa.Text))
              .OrderBy('id').Limit(edtLimite.Text)
              .&end
            .find;
        end
        else
        begin
            DAO.SQL
                .Fields('id, nome')
                    .Where(getWhere('nome', edtPesquisa.Text, cPESQ_NOME))
                    .OrderBy('nome').Limit(edtLimite.Text)
                .&end
            .find;
        end;
    end;
end;

procedure TFrmFiltroVeiculo.FormCreate(Sender: TObject);
begin
  inherited;
    DAO := TSimpleDao<TVeiculo>.New(DM.GetConn).DataSource(self.DSDados);
    grdFiltro.DataSource := self.DSDados;
    DAO.SQL.Fields('id, nome').OrderBy('id').Limit(edtLimite.Text).&end.find;
end;

initialization
  RegisterClass(TFrmFiltroVeiculo);

finalization
  UnRegisterClass(TFrmFiltroVeiculo);

end.
