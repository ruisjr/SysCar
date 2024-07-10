unit configdb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Menus, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Samples.Spin,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Datasnap.DBClient, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  JvExDBGrids, JvDBGrid, AdvUtil, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmConfigDB = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    MainMenu1: TMainMenu;
    Operaes1: TMenuItem;
    ppmTabelas: TPopupMenu;
    NovaTabela1: TMenuItem;
    RemoverTabela1: TMenuItem;
    grdTabelas: TJvDBGrid;
    dsTabelas: TDataSource;
    edtNomeTabela: TEdit;
    pnlDadosTabela: TPanel;
    pgObjects: TPageControl;
    btnCriarTabela: TButton;
    lblNomeTabela: TLabel;
    tbsFields: TTabSheet;
    tbPrimaryKey: TTabSheet;
    dsFields: TDataSource;
    grdFields: TDBAdvGrid;
    btnInserir: TSpeedButton;
    QueryFields: TFDQuery;
    DroparTabelasdeControle1: TMenuItem;
    InserirTabelasdeControle1: TMenuItem;
    btnDeletar: TSpeedButton;
    lblCodigoTabela: TLabel;
    edtIdTabela: TEdit;
    lblNomeField: TLabel;
    edtNomeField: TEdit;
    lblTipoField: TLabel;
    cbxTipoField: TComboBox;
    lblTamanhoField: TLabel;
    edtTamanhoField: TSpinEdit;
    lblPrecisaoField: TLabel;
    edtPrecisaoField: TSpinEdit;
    chkNotNullField: TCheckBox;
    edtCampoPadrao: TEdit;
    lblCampoPadrao: TLabel;
    QueryFieldsid: TFDAutoIncField;
    QueryFieldstabela: TIntegerField;
    QueryFieldsnome: TStringField;
    QueryFieldstipo: TStringField;
    QueryFieldstamanho: TIntegerField;
    QueryFieldsprecisao: TIntegerField;
    QueryFieldsnao_nulo: TBooleanField;
    QueryFieldsvalor_padrao: TStringField;
    lblNomeIndice: TLabel;
    edtPrimaryKey: TEdit;
    btnConstraintsInserir: TSpeedButton;
    btnConstraintsExcluir: TSpeedButton;
    DBAdvGrid1: TDBAdvGrid;
    cbxTipoConstraint: TComboBox;
    Label1: TLabel;
    dsConstraints: TDataSource;
    QueryConstraints: TFDQuery;
    lblTabelaForeignKey: TLabel;
    edtTabelaForeignKey: TEdit;
    edtCampoForeignKey: TEdit;
    lblCampoForeignKey: TLabel;
    lblCampoFK: TLabel;
    cbxCampoFK: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure NovaTabela1Click(Sender: TObject);
    procedure btnCriarTabelaClick(Sender: TObject);
    procedure grdTabelasDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdFieldsGetEditorProp(Sender: TObject; ACol, ARow: Integer; AEditLink: TEditLink);
    procedure grdFieldsGetEditorType(Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
    procedure btnInserirClick(Sender: TObject);
    procedure DroparTabelasdeControle1Click(Sender: TObject);
    procedure InserirTabelasdeControle1Click(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure cbxTipoConstraintChange(Sender: TObject);
    procedure tbPrimaryKeyShow(Sender: TObject);
  private
    { Private declarations }
    QueryTables: TFDQuery;
    procedure RefreshControles;
    procedure LimparFields;
  public
    { Public declarations }
  end;

var
  frmConfigDB: TfrmConfigDB;

implementation

{$R *.dfm}

uses dataModule, uUtil;

procedure TfrmConfigDB.btnCriarTabelaClick(Sender: TObject);
var
    oQuery: TFDQuery;
begin
    oQuery := getQuery;
    try
        oQuery.SQL.Text := 'INSERT INTO tabelas (nome) VALUES (' + QuotedStr(edtNomeTabela.Text) + ')';
        oQuery.Prepare;
        oQuery.ExecSQL;
        pnlDadosTabela.Enabled := False;
        QueryTables.Close;
        QueryTables.Open;
    finally
        oQuery.Free;
    end;
end;

procedure TfrmConfigDB.grdFieldsGetEditorProp(Sender: TObject; ACol, ARow: Integer; AEditLink: TEditLink);
begin
    if ACol = 3 then
    begin
        with grdFields do
        begin
            Combobox.Items.Clear;
            Combobox.Items.Add('STRING');
            Combobox.Items.Add('INTEGER');
            Combobox.Items.Add('BOOLEAN');
            Combobox.Items.Add('NUMERIC');
            Combobox.Items.Add('DATE');
            Combobox.Items.Add('TIME');
            Combobox.Items.Add('TIMESTAMP');
            Combobox.Items.Add('BLOB');
        end;
    end;
end;

procedure TfrmConfigDB.grdFieldsGetEditorType(Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
begin
    case ACol of
        4,5: AEditor:= edSpinEdit;
        3: AEditor := edComboEdit;
    end;
end;

procedure TfrmConfigDB.DroparTabelasdeControle1Click(Sender: TObject);
begin
    DM.Command.Execute('DROP TABLE tabelas');
    DM.Command.Execute('DROP TABLE fields');
    RefreshControles;
end;

procedure TfrmConfigDB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QueryTables.Free;
end;

procedure TfrmConfigDB.FormCreate(Sender: TObject);
begin
    QueryTables := getQuery;
    QueryFields := getQuery;

    dsTabelas.DataSet := QueryTables;
    dsFields.DataSet := QueryFields;

    pgObjects.ActivePageIndex := 0;
    pnlDadosTabela.Enabled := False;
    try
        QueryTables.SQL.Clear;
        QueryTables.SQL.Text := 'SELECT * FROM tabelas';
        QueryTables.Prepare;
        QueryTables.Open;
    except
        on E: Exception do
        begin
            DM.Command.Execute(getTableTabelas);
            DM.Command.Execute(getTableFields);

            QueryTables.SQL.Text := 'SELECT * FROM tabelas';
            QueryTables.Prepare;
            QueryTables.Open;
        end;
    end;
end;

procedure TfrmConfigDB.grdTabelasDblClick(Sender: TObject);
begin
    edtIdTabela.Text := QueryTables.FieldByName('id').AsString;
    edtNomeTabela.Text := QueryTables.FieldByName('nome').AsString;
    btnCriarTabela.Enabled := False;

    try
        With QueryFields do
        begin
            Close;
            SQL.Clear;
            SQL.Text := getSelectFields(StrToInt(edtIdTabela.Text));
            Prepare;
            Active := True;
        end;
    except

    end;
end;

procedure TfrmConfigDB.InserirTabelasdeControle1Click(Sender: TObject);
begin
    DM.Command.Execute(getTableTabelas);
    DM.Command.Execute(getTableFields);
    RefreshControles;
end;

procedure TfrmConfigDB.LimparFields;
begin
    edtNomeField.Clear;
    cbxTipoField.ItemIndex := -1;
    edtTamanhoField.Clear;
    edtPrecisaoField.Clear;
    chkNotNullField.Checked := False;
    edtCampoPadrao.Clear;
end;

procedure TfrmConfigDB.NovaTabela1Click(Sender: TObject);
begin
    pnlDadosTabela.Enabled := True;
    btnCriarTabela.Enabled := True;

    QueryFields.Close;
    edtIdTabela.Clear;
    edtNomeTabela.Clear;
end;

procedure TfrmConfigDB.RefreshControles;
begin
    try
        QueryTables.Refresh;
        QueryFields.Refresh;
    except

    end;
end;

procedure TfrmConfigDB.tbPrimaryKeyShow(Sender: TObject);
var
    Qry: TFDQuery;
begin
    Qry := getQuery;
    try
        with Qry do
        begin
            Close;
            SQL.Clear;
            SQL.Text := 'SELECT nome FROM fields WHERE tabela = :tabela';
            ParamByName('tabela').AsInteger := StrToInt(edtIdTabela.Text);
            Prepare;
            Open;

            cbxCampoFK.Items.Clear;
            while not Eof do
            begin
                cbxCampoFK.Items.Append(FieldByName('nome').AsString);
                Next;
            end;
        end;
    finally
        Qry.Free;
    end;
end;

procedure TfrmConfigDB.btnInserirClick(Sender: TObject);
var
    qry: TFDQuery;
begin
    qry := getQuery;
    try
        With qry do
        begin
            Close;
            SQL.Clear;
            SQL.Text := 'INSERT INTO fields (nome, tipo, tamanho, precisao, nao_nulo, valor_padrao, tabela) '+
                        'VALUES (:nome, :tipo, :tamanho, :precisao, :nao_nulo, :valor_padrao, :tabela)';
            ParamByName('nome').AsString := edtNomeField.Text;
            ParamByName('tipo').AsString := cbxTipoField.Text;
            ParamByName('tamanho').AsInteger := edtTamanhoField.Value;
            ParamByName('precisao').AsInteger := edtPrecisaoField.Value;
            ParamByName('nao_nulo').AsBoolean := chkNotNullField.Checked;
            ParamByName('valor_padrao').AsString := edtCampoPadrao.Text;
            ParamByName('tabela').AsInteger := StrToInt(edtIdTabela.Text);
            Prepare;
            ExecSQL;
        end;

        QueryFields.Refresh;
        LimparFields;
    finally
        qry.Free;
    end;
end;

procedure TfrmConfigDB.cbxTipoConstraintChange(Sender: TObject);
begin
    if (cbxTipoConstraint.ItemIndex = 1) then
    begin
        lblTabelaForeignKey.Enabled := True;
        edtTabelaForeignKey.Enabled := True;
        lblCampoForeignKey.Enabled := True;
        edtCampoForeignKey.Enabled := True;
    end
    else if cbxTipoConstraint.ItemIndex in [0, 2] then
    begin
        lblTabelaForeignKey.Enabled := False;
        edtTabelaForeignKey.Enabled := False;
        lblCampoForeignKey.Enabled := True;
        edtCampoForeignKey.Enabled := True;
    end
    else
    begin
        lblTabelaForeignKey.Enabled := False;
        edtTabelaForeignKey.Enabled := False;
        lblCampoForeignKey.Enabled := False;
        edtCampoForeignKey.Enabled := False;

        edtTabelaForeignKey.Clear;
        edtCampoForeignKey.Clear;
    end;
end;

procedure TfrmConfigDB.btnDeletarClick(Sender: TObject);
var
    qry: TFDQuery;
begin
    if QueryFields.FieldCount > 0 then
    begin
        qry := getQuery;
        try
            with qry do
            begin
                Close;
                SQL.Clear;
                SQL.Text := 'DELETE FROM fields WHERE id = :id AND tabela = :tabela';
                ParamByName('id').AsInteger := QueryFields.FieldByName('id').AsInteger;
                ParamByName('tabela').AsInteger := QueryFields.FieldByName('tabela').AsInteger;
                Prepare;
                ExecSQL;
            end;

            QueryFields.Refresh;
        finally
            qry.Free;
        end;
    end;
end;

end.
