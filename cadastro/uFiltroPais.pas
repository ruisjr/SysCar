unit uFiltroPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFiltroDefault, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.StdCtrls, AdvEdit, AdvCombo,
  JvExStdCtrls, JvGroupBox, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls,
  {Classes de negócio}
  uPais, SimpleInterface, SimpleDao;

type
  TFrmFiltroPais = class(TFrmFiltroDefault)
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    DAO: iSimpleDao<TPais>;
  public
    { Public declarations }
  end;

var
  FrmFiltroPais: TFrmFiltroPais;

implementation

{$R *.dfm}

uses uDataModule, uUtil;


procedure TFrmFiltroPais.edtPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TFrmFiltroPais.FormCreate(Sender: TObject);
begin
  inherited;
    DAO := TSimpleDao<TPais>.New(DM.GetConn).DataSource(self.DSDados);
    grdFiltro.DataSource := self.DSDados;
    DAO.SQL.Fields('id, nome').OrderBy('id').Limit(edtLimite.Text).&end.find;
end;

initialization
  RegisterClass(TFrmFiltroPais);

finalization
  UnRegisterClass(TFrmFiltroPais);

end.
