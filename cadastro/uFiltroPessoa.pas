unit uFiltroPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFiltroDefault, Data.DB, Vcl.StdCtrls, AdvEdit, AdvCombo, JvExStdCtrls, JvGroupBox, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls,AdvUtil, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  { Classes de Neg�cio}
  SimpleDao, SimpleInterface, uPessoa;

type
  TfrmFiltroPessoa = class(TFrmFiltroDefault)
    procedure FormCreate(Sender: TObject);
    procedure cbxFiltroChange(Sender: TObject);
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    DAO: iSimpleDao<TPessoa>;
    FRetorno: Integer;
  public
    { Public declarations }
  end;

var
  frmFiltroPessoa: TfrmFiltroPessoa;

implementation

uses uDataModule, uUtil;


{$R *.dfm}


procedure TfrmFiltroPessoa.btnConfirmarClick(Sender: TObject);
begin
    inherited;
    FRetorno := grdFiltro.DataSource.DataSet.FieldByName('id').AsInteger;
end;

procedure TfrmFiltroPessoa.cbxFiltroChange(Sender: TObject);
begin
  inherited;
    edtPesquisa.EditType := etString;
    if cbxFiltro.ItemIndex = cPESQ_CODIGO then
    begin
        edtPesquisa.EditType := etNumeric;
        edtPesquisa.SetFocus;
    end
    else if cbxFiltro.ItemIndex = cPESQ_NOME then
    begin
        if edtPesquisa.Text <> '' then
        begin
            edtPesquisa.Text := '';
            edtPesquisa.SetFocus;
        end;
    end;
end;

procedure TfrmFiltroPessoa.edtPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
    if edtPesquisa.Text.IsEmpty then
    begin
        DAO.SQL.Fields(self.Fields)
          .Where('mensalista = True')
          .OrderBy('id').Limit(edtLimite.Text)
          .&end
        .find;
    end
    else
    begin
        if cbxFiltro.ItemIndex = cPESQ_CODIGO then
        begin
            DAO.SQL.Fields(self.Fields)
              .Where(getWhere('id', edtPesquisa.Text) + ' AND mensalista = True')
              .OrderBy('id').Limit(edtLimite.Text)
              .&end
            .find;
        end
        else
        begin
            DAO.SQL
                .Fields(self.Fields)
                    .Where(getWhere('nome', edtPesquisa.Text, cPESQ_NOME) + ' AND mensalista = True')
                    .OrderBy('nome').Limit(edtLimite.Text)
                .&end
            .find;
        end;
    end;
end;

procedure TfrmFiltroPessoa.FormCreate(Sender: TObject);
begin
  inherited;
    self.Fields := 'id, nome, cpf_cnpj';
    DAO := TSimpleDao<TPessoa>.New(DM.GetConn).DataSource(self.DSDados);
    DAO.SQL
        .Fields(self.Fields)
            .Where('nome ilike ' + QuotedStr('%'+edtPesquisa.Text+'%') + ' AND mensalista = True')
            .OrderBy('id').Limit(edtLimite.Text)
        .&end
    .find;
end;

initialization
  RegisterClass(TfrmFiltroPessoa);

finalization
  UnRegisterClass(TfrmFiltroPessoa);

end.
