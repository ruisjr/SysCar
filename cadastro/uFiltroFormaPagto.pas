unit uFiltroFormaPagto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFiltroDefault, Data.DB, Vcl.StdCtrls, AdvEdit, AdvCombo, JvExStdCtrls, JvGroupBox,
  AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, AdvUtil, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.Grids,
  { Classes de negpócio }
  SimpleInterface, SimpleDao, uFormaPagamento;


type
  TFrmFiltroFormaPagto = class(TFrmFiltroDefault)
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    DAO: iSimpleDao<TFormaPagamento>;
  public
    { Public declarations }
  end;

var
  FrmFiltroFormaPagto: TFrmFiltroFormaPagto;

implementation

{$R *.dfm}

uses uDataModule, uUtil;

procedure TFrmFiltroFormaPagto.btnConfirmarClick(Sender: TObject);
begin
  inherited;
    self.Return := grdFiltro.DataSource.DataSet.FieldByName('id').AsInteger;
end;

procedure TFrmFiltroFormaPagto.edtPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TFrmFiltroFormaPagto.FormCreate(Sender: TObject);
begin
  inherited;
    DAO := TSimpleDao<TFormaPagamento>.New(DM.GetConn).DataSource(self.DSDados);
    grdFiltro.DataSource := self.DSDados;
    DAO.SQL.Fields('id, nome').OrderBy('id').Limit(edtLimite.Text).&end.find;
end;

initialization
  RegisterClass(TFrmFiltroFormaPagto);

finalization
  UnRegisterClass(TFrmFiltroFormaPagto);

end.
