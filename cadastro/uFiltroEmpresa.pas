unit uFiltroEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFiltroDefault, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.StdCtrls, AdvEdit, AdvCombo,
  JvExStdCtrls, JvGroupBox, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls,
  {Classes de negócio}
  uPessoa, SimpleInterface, SimpleDao;

type
  TFrmFiltroEmpresa = class(TFrmFiltroDefault)
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Fields: String;
    DAO: iSimpleDao<TPessoa>;
  public
    { Public declarations }
  end;

var
  FrmFiltroEmpresa: TFrmFiltroEmpresa;

implementation

{$R *.dfm}

uses uDataModule, uUtil;


procedure TFrmFiltroEmpresa.edtPesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    inherited;
    if edtPesquisa.Text.IsEmpty then
    begin
        DAO.SQL.Fields(self.Fields)
          .Where('empresa=True')
          .OrderBy('id').Limit(edtLimite.Text)
          .&end
        .find;
    end
    else
    begin
        if cbxFiltro.ItemIndex = cPESQ_CODIGO then
        begin
            DAO.SQL.Fields(self.Fields)
              .Where(getWhere('id', edtPesquisa.Text) + ' AND empresa=True')
              .OrderBy('id').Limit(edtLimite.Text)
              .&end
            .find;
        end
        else
        begin
            DAO.SQL
                .Fields(self.Fields)
                    .Where(getWhere('nome', edtPesquisa.Text, cPESQ_NOME) + ' AND empresa=True')
                    .OrderBy('nome').Limit(edtLimite.Text)
                .&end
            .find;
        end;
    end;
end;

procedure TFrmFiltroEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
    self.Fields := 'id, nome, nome_reduzido, cpf_cnpj';
    DAO := TSimpleDao<TPessoa>.New(DM.GetConn).DataSource(self.DSDados);
    grdFiltro.DataSource := self.DSDados;
    DAO.SQL.Fields(self.fields).OrderBy('id').Limit(edtLimite.Text).&end.find;
end;

initialization
  RegisterClass(TFrmFiltroEmpresa);

finalization
  UnRegisterClass(TFrmFiltroEmpresa);

end.
