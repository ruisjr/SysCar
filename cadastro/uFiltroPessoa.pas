unit uFiltroPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFiltroDefault, Data.DB, Vcl.StdCtrls, AdvEdit, AdvCombo, JvExStdCtrls, JvGroupBox, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls,
  { Classes de Negócio}
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
    FPessoa: TPessoa;
    FRetorno: Integer;
    FCaption: String;
  public
    { Public declarations }
  end;

var
  frmFiltroPessoa: TfrmFiltroPessoa;

implementation

uses uDataModule;


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
                    .Where(getWhere('nome', edtPesquisa.Text))
                    .OrderBy('nome').Limit(edtLimite.Text)
                .&end
            .find;
        end;
    end;
end;

procedure TfrmFiltroPessoa.FormCreate(Sender: TObject);
begin
  inherited;
    DAO := TSimpleDao<TPessoa>.New(DM.GetConn).DataSource(self.DSDados);
    DAO.SQL
        .Fields('id, nome')
            .Where('nome ilike ' + QuotedStr('%'+edtPesquisa.Text+'%'))
            .OrderBy('id').Limit(edtLimite.Text)
        .&end
    .find;
end;

initialization
  RegisterClass(TfrmFiltroPessoa);

finalization
  UnRegisterClass(TfrmFiltroPessoa);

end.
