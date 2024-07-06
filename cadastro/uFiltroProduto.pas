unit uFiltroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFiltroDefault, Data.DB, Vcl.StdCtrls, AdvEdit, AdvCombo, JvExStdCtrls, JvGroupBox, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls,
  { Classes de negócio }
  uProduto, SimpleInterface, SimpleDao, AdvUtil, AdvObj, BaseGrid, AdvGrid, DBAdvGrid;

type
  TfrmFiltroProduto = class(TFrmFiltroDefault)
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    DaoProduto: iSimpleDao<TProduto>;
  public
    { Public declarations }
  end;

var
  frmFiltroProduto: TfrmFiltroProduto;

implementation

{$R *.dfm}

uses uDataModule;

procedure TfrmFiltroProduto.btnConfirmarClick(Sender: TObject);
begin
  inherited;
    self.Return := grdFiltro.DataSource.DataSet.FieldByName('id').AsInteger;
end;

procedure TfrmFiltroProduto.edtPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
    if edtPesquisa.Text.IsEmpty then
    begin
        DaoProduto.SQL.Fields(self.Fields)
          .OrderBy('id').Limit(edtLimite.Text)
          .&end
        .find;
    end
    else
    begin
        if cbxFiltro.ItemIndex = cPESQ_CODIGO then
        begin
            DaoProduto.SQL.Fields(self.Fields)
              .Where(getWhere('id', edtPesquisa.Text))
              .OrderBy('id').Limit(edtLimite.Text)
              .&end
            .find;
        end
        else
        begin
            DaoProduto.SQL
                .Fields(self.Fields)
                    .Where(getWhere('nome', edtPesquisa.Text, cPESQ_NOME))
                    .OrderBy('nome').Limit(edtLimite.Text)
                .&end
            .find;
        end;
    end;

end;

procedure TfrmFiltroProduto.FormCreate(Sender: TObject);
begin
  inherited;
    self.Fields := self.Fields + ', codigo_barra, preco_unit';

    DaoProduto := TSimpleDao<TProduto>.New(DM.GetConn).DataSource(self.DSDados);
    grdFiltro.DataSource := self.DSDados;
    DaoProduto.SQL.Fields(self.Fields).OrderBy('id').Limit(edtLimite.Text).&end.find;
end;

initialization
  RegisterClass(TfrmFiltroProduto);

finalization
  UnRegisterClass(TfrmFiltroProduto);

end.
