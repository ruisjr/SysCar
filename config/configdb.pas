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
    grdConstraints: TDBAdvGrid;
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
    N1: TMenuItem;
    ManutenodeBase1: TMenuItem;
    btnAtualizarTabelaIndividual: TButton;
    ConectaDB1: TMenuItem;
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
    procedure btnConstraintsInserirClick(Sender: TObject);
    procedure tbPrimaryKeyShow(Sender: TObject);
    procedure btnConstraintsExcluirClick(Sender: TObject);
    procedure RemoverTabela1Click(Sender: TObject);
    procedure ConectaDB1Click(Sender: TObject);
    procedure btnAtualizarTabelaIndividualClick(Sender: TObject);
  private
    { Private declarations }
    QueryTables: TFDQuery;
    procedure RefreshControles;
    procedure LimparFields;
    procedure CarregarFields(aIdTabela: Integer);
    procedure CarregarConstraints(aIdTabela: Integer);
    procedure CarregarFieldsToConstraints;
    procedure CreateTableDatabase(aTabela: String);
    procedure CreateFieldsDatabase(aTabela: String);
    procedure CreateConstraints(aTabela: String);
  public
    { Public declarations }
  end;

var
  frmConfigDB: TfrmConfigDB;

implementation

{$R *.dfm}

uses dataModule, uUtil, uConectarDataBase, uLogs;

procedure TfrmConfigDB.btnConstraintsExcluirClick(Sender: TObject);
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
                SQL.Text := 'DELETE FROM constraints WHERE id = :id AND tabela = :tabela';
                ParamByName('id').AsInteger := QueryConstraints.FieldByName('id').AsInteger;
                ParamByName('tabela').AsInteger := QueryConstraints.FieldByName('tabela').AsInteger;
                TLog.New.debug(QueryFields.SQL.Text);
                Prepare;
                ExecSQL;
            end;

            QueryConstraints.Refresh;
        finally
            qry.Free;
        end;
    end;
end;

procedure TfrmConfigDB.btnConstraintsInserirClick(Sender: TObject);
var
    qry: TFDQuery;
begin
    qry := getQuery;
    try
        With qry do
        begin
            Close;
            SQL.Clear;
            SQL.Text := 'INSERT INTO constraints (nome, tipo, campo_fk, tabela_fk, campo_tabela_fk, tabela) '+
                        'VALUES (:nome, :tipo, :campo_fk, :tabela_fk, :campo_tabela_fk, :tabela)';
            ParamByName('nome').AsString := edtPrimaryKey.Text;
            ParamByName('tipo').AsString := cbxTipoConstraint.Text;
            ParamByName('campo_fk').AsString := cbxCampoFK.Text;
            ParamByName('tabela_fk').AsString := edtTabelaForeignKey.Text;
            ParamByName('campo_tabela_fk').AsString := edtCampoForeignKey.Text;
            ParamByName('tabela').AsInteger := QueryTables.FieldByName('id').AsInteger;
            TLog.New.debug(Qry.SQL.Text);
            Prepare;
            ExecSQL;
        end;

        QueryConstraints.Refresh;
        LimparFields;
    finally
        qry.Free;
    end;
end;

procedure TfrmConfigDB.btnCriarTabelaClick(Sender: TObject);
var
    oQuery: TFDQuery;
begin
    TLog.New.info('Criando a tabela ' + edtNomeTabela.Text);
    oQuery := getQuery;
    try
        oQuery.SQL.Text := 'INSERT INTO tabelas (nome) VALUES (' + QuotedStr(edtNomeTabela.Text) + ')';
        TLog.New.debug(oQuery.SQL.Text);
        oQuery.Prepare;
        oQuery.ExecSQL;
        QueryTables.Close;
        QueryTables.Open;
    finally
        oQuery.Free;
    end;

    btnCriarTabela.Enabled := False;
    lblCodigoTabela.Enabled := False;
    edtIdTabela.Enabled := False;
    lblNomeTabela.Enabled := False;
    edtNomeTabela.Enabled := False;
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
    DM.Command.Execute('DROP TABLE constraints');
    DM.Command.Execute('DROP TABLE database');
    RefreshControles;
end;

procedure TfrmConfigDB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QueryTables.Free;
end;

procedure TfrmConfigDB.FormCreate(Sender: TObject);
begin
    TLog.New.info('Acessando a tela ' + self.Caption);
    QueryTables := getQuery;
    QueryFields := getQuery;

    dsTabelas.DataSet := QueryTables;
    dsFields.DataSet := QueryFields;

    pgObjects.ActivePageIndex := 0;
    btnCriarTabela.Enabled := False;
    lblCodigoTabela.Enabled := False;
    edtIdTabela.Enabled := False;
    lblNomeTabela.Enabled := False;
    edtNomeTabela.Enabled := False;

    try
        DM.Command.Execute(getTableTabelas);
        DM.Command.Execute(getTableFields);
        DM.Command.Execute(getTableConstraints);
        DM.Command.Execute(getTableDataBase);

        QueryTables.SQL.Clear;
        QueryTables.SQL.Text := 'SELECT * FROM tabelas';
        TLog.New.debug(QueryTables.SQL.Text);
        QueryTables.Prepare;
        QueryTables.Open;
    except
        on E: Exception do
        begin
            TLog.New.debug(getTableTabelas);
            DM.Command.Execute(getTableTabelas);
            TLog.New.debug(getTableFields);
            DM.Command.Execute(getTableFields);
            TLog.New.debug(getTableConstraints);
            DM.Command.Execute(getTableConstraints);

            QueryTables.SQL.Text := 'SELECT * FROM tabelas';
            TLog.New.debug(QueryTables.SQL.Text);
            QueryTables.Prepare;
            QueryTables.Open;
        end;
    end;
end;

procedure TfrmConfigDB.grdTabelasDblClick(Sender: TObject);
begin
    edtIdTabela.Text := QueryTables.FieldByName('id').AsString;
    edtNomeTabela.Text := QueryTables.FieldByName('nome').AsString;

    CarregarFields(StrToInt(edtIdTabela.Text));
    CarregarFieldsToConstraints;
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

procedure TfrmConfigDB.RemoverTabela1Click(Sender: TObject);
var
    Qry: TFDQuery;
begin
    Qry := getQuery;
    try
        if QueryTables.RecordCount > 0 then
        begin
            With Qry do
            begin
                Close;
                SQL.Clear;
                SQL.Text := 'DELETE FROM tabelas WHERE id = :id';
                ParamByName('id').AsInteger := QueryTables.FieldByName('id').AsInteger;
                TLog.New.debug(QueryTables.SQL.Text);
                Prepare;
                ExecSQL;
            end;
            QueryTables.Refresh;
        end;
    finally
        Qry.Free;
    end;
end;

procedure TfrmConfigDB.tbPrimaryKeyShow(Sender: TObject);
begin
    CarregarFieldsToConstraints;
end;

procedure TfrmConfigDB.btnInserirClick(Sender: TObject);
var
    qry: TFDQuery;
begin
    if edtIdTabela.Text = '' then
        Exit;

    TLog.New.info('Inserindo o campo ' + edtNomeField.Text);
    qry := getQuery;
    try
        With qry do
        begin
            Close;
            SQL.Clear;
            SQL.Text := 'INSERT INTO fields (nome, tipo, tamanho, precisao, nao_nulo, valor_padrao, tabela) '+
                        'VALUES (:nome, :tipo, :tamanho, :precisao, :nao_nulo, :valor_padrao, :tabela)';
            TLog.New.debug(Qry.SQL.Text);
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

procedure TfrmConfigDB.btnAtualizarTabelaIndividualClick(Sender: TObject);
begin
    if edtIdTabela.Text = '' then
    begin
        ShowMessage('Nenhuma tabela foi selecionada!',[tfCanBeMinimized]);
        Exit;
    end;

    CreateTableDatabase(edtNomeTabela.Text);
    CreateFieldsDatabase(edtNomeTabela.Text);
    CreateConstraints(edtNomeTabela.Text);
end;

procedure TfrmConfigDB.CarregarConstraints(aIdTabela: Integer);
begin
    try
        With QueryConstraints do
        begin
            Close;
            SQL.Clear;
            SQL.Text := getSelectConstraints(aIdTabela);
            TLog.New.debug(QueryConstraints.SQL.Text);
            Prepare;
            Active := True;
        end;
    except

    end;
end;

procedure TfrmConfigDB.CarregarFields(aIdTabela: Integer);
begin
    try
        With QueryFields do
        begin
            Close;
            SQL.Clear;
            SQL.Text := getSelectFields(aIdTabela);
            TLog.New.debug(QueryFields.SQL.Text);
            Prepare;
            Active := True;
        end;
    except

    end;
end;

procedure TfrmConfigDB.CarregarFieldsToConstraints;
var
    Qry: TFDQuery;
begin
    if edtIdTabela.Text = '' then
        Abort;

    Qry := getQuery;
    try
        with Qry do
        begin
            Close;
            SQL.Clear;
            SQL.Text := getSelectConstraints(StrToInt(edtIdTabela.Text));
            TLog.New.debug(Qry.SQL.Text);
            Prepare;
            Active := True;
        end;

        cbxCampoFK.Items.Clear;
        QueryFields.First;
        while not QueryFields.Eof do
        begin
            cbxCampoFK.Items.Append(QueryFields.FieldByName('nome').AsString);
            QueryFields.Next;
        end;

        CarregarConstraints(QueryTables.FieldByName('id').AsInteger);
    finally
        Qry.Free;
    end;
end;

procedure TfrmConfigDB.cbxTipoConstraintChange(Sender: TObject);
begin
    if (cbxTipoConstraint.ItemIndex in [0, 2]) then
    begin
        lblCampoForeignKey.Enabled := True;
        edtCampoForeignKey.Enabled := True;
        lblTabelaForeignKey.Enabled := False;
        edtTabelaForeignKey.Enabled := False;
        lblCampoForeignKey.Enabled := False;
        edtCampoForeignKey.Enabled := False;
    end
    else if cbxTipoConstraint.ItemIndex = 1 then
    begin
        lblCampoForeignKey.Enabled := True;
        edtCampoForeignKey.Enabled := True;
        lblTabelaForeignKey.Enabled := True;
        edtTabelaForeignKey.Enabled := True;
        lblCampoForeignKey.Enabled := False;
        edtCampoForeignKey.Enabled := True;
    end
    else
    begin
        lblCampoForeignKey.Enabled := True;
        edtCampoForeignKey.Enabled := True;
        lblTabelaForeignKey.Enabled := False;
        edtTabelaForeignKey.Enabled := False;
        lblCampoForeignKey.Enabled := False;
        edtCampoForeignKey.Enabled := False;

        edtTabelaForeignKey.Clear;
        edtCampoForeignKey.Clear;
    end;
end;

procedure TfrmConfigDB.ConectaDB1Click(Sender: TObject);
var
    FrmDB: TfrmCarregarDatabase;
begin
    FrmDB := TfrmCarregarDatabase.Create(self);
    try
        FrmDB.ShowModal;
    finally
        FrmDB.Free;
    end;
end;

procedure TfrmConfigDB.CreateConstraints(aTabela: String);
var
    Qry, QueryFields: TFDQuery;
    aQuery: String;
begin
    Qry := getQuery;
    QueryFields := getQuery;
    try
        with QueryFields do
        begin
            SQL.Text := Format('SELECT c.* FROM constraints c JOIN tabelas t ON t.id = c.tabela AND t.nome = %s', [QuotedStr(aTabela)]);
            Open;

            First;
            while not QueryFields.Eof do
            begin
                if FieldByName('tipo').AsString.ToUpper = 'PRIMARY KEY' then
                    aQuery := Format('ALTER TABLE %s ADD CONSTRAINT %s %s (%s)', [atabela, FieldByName('nome').AsString, FieldByName('tipo').AsString, FieldByName('campo_fk').AsString])
                else if FieldByName('tipo').AsString.ToUpper = 'FOREIGN KEY' then
                    aQuery := Format('ALTER TABLE %s ADD CONSTRAINT %s %s (%s) REFERENCES %s (%s)', [atabela, FieldByName('nome').AsString, FieldByName('tipo').AsString, FieldByName('campo_fk').AsString, FieldByName('tabela_fk').AsString, FieldByName('campo_tabela_fk').AsString])
                else if FieldByName('tipo').AsString.ToUpper = 'INDEX' then
                    aQuery := Format('ALTER TABLE %s ADD CONSTRAINT %s %s (%s) REFERENCES %s (%s)', [atabela, FieldByName('nome').AsString, FieldByName('tipo').AsString, FieldByName('campo_fk').AsString, FieldByName('tabela_fk').AsString, FieldByName('campo_tabela_fk').AsString]);


                Qry.Close;
                Qry.SQL.Clear;
                Qry.SQL.Text := aQuery;
                TLog.New.debug(aQuery);
//                Qry.Prepare;
//                Qry.ExecSQL;

                Next
            end;
        end;
    finally
        Qry.Free;
        QueryFields.Free;
    end;
end;

procedure TfrmConfigDB.CreateFieldsDatabase(aTabela: String);
var
    aFieldExists: Boolean;
    qryDataBase: TFDQuery;
    qryFields: TFDQuery;
    qryCommand: TFDQuery;
begin
    {
        1. Valida se os campos existem.
        2. Se o campo não existe, cria.
        3. Se o campo existe, verifica se o tipo e outras caracteriscas são iguais aos configurados.
    }
    qryDataBase := getQueryDatabase;
    qryFields := getQuery;
    qryCommand := getQuery;
    try
        { Fields da estrutura }
        qryFields.Close;
        qryFields.SQL.Clear;
        qryFields.SQL.Text := Format('SELECT * FROM fields WHERE tabela = %d', [StrToInt(edtIdTabela.Text)]);
        TLog.New.debug(qryFields.SQL.Text);
        qryFields.Prepare;
        qryFields.Open;

        { Dados do que existe no banco }
        qryDataBase.Close;
        qryDataBase.SQL.Clear;
        qryDataBase.SQL.Text := Format('SELECT column_name, column_default, is_nullable, data_type FROM information_schema.columns WHERE table_name = %s', [QuotedStr(aTabela)]);
        TLog.New.debug(qryDataBase.SQL.Text);
        qryDataBase.Prepare;
        qryDataBase.Open;

        qryFields.First;
        while not qryFields.EOF do
        begin
            aFieldExists := False;
            if FieldExists(aTabela, qryFields.FieldByName('nome').AsString) then
                aFieldExists := True;

            AdicionarEditarCampos(aTabela, qryFields.FieldByName('nome').AsString, qryFields.FieldByName('tipo').AsString, qryFields.FieldByName('tamanho').AsString, qryFields.FieldByName('precisao').AsString, aFieldExists);
            AplicarNotNull(aTabela, qryFields.FieldByName('nome').AsString, qryFields.FieldByName('nao_nulo').AsBoolean);
            AplicarDefault(aTabela, qryFields.FieldByName('nome').AsString, qryFields.FieldByName('valor_padrao').AsString);

            qryFields.Next;
        end;
    finally
        qryFields.Free;
        qryCommand.Free;
    end;
end;

procedure TfrmConfigDB.CreateTableDatabase(aTabela: String);
var
    aQuery: String;
    Qry: TFDQuery;
begin
    Qry := getQueryDatabase;
    try
        aQuery := Format('CREATE TABLE IF NOT EXISTS %s ()', [aTabela]);
        TLog.New.debug(aQuery);
        Qry.SQL.Text := aQuery;
        Qry.Prepare;
        Qry.ExecSQL;
    finally
        Qry.Free;
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
                TLog.New.debug(qry.SQL.Text);
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
