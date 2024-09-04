unit uFiltroDefault;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.StdCtrls, JvExStdCtrls, JvGroupBox, AdvCombo, AdvEdit, AdvUtil, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  {Classes de negócio}
  uUtil;


type
  TFrmFiltroDefault = class(TForm)
    pnlFundo: TPanel;
    pnlTitulo: TJvPanel;
    btnClose: TAeroSpeedButton;
    pnlBotoes: TJvPanel;
    btnConfirmar: TAeroSpeedButton;
    pnlDivisor: TPanel;
    gbxOpcoes: TJvGroupBox;
    Label1: TLabel;
    cbxFiltro: TAdvComboBox;
    Label2: TLabel;
    edtPesquisa: TAdvEdit;
    Label3: TLabel;
    cbxTipo: TAdvComboBox;
    Label4: TLabel;
    edtLimite: TAdvEdit;
    grdFiltro: TDBAdvGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCloseMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdFiltroDblClick(Sender: TObject);
  private
    { Private declarations }
    FFields: String;
    FDsDados: TDataSource;
    FRetorno: Integer;
    procedure setFields(const Value: String);
    procedure loadConfig;
  public


    { Public declarations }
    function getWhere(aField: String; aValue: String; aTipo: Integer = cPESQ_CODIGO): String;

    procedure SetCaption(aCaption: String);
  published
    property DSDados: TDataSource read FDSDados write FDSDados;
    property Return: Integer read FRetorno write FRetorno;
    property Fields: String read FFields write setFields;
  end;

var
  FrmFiltroDefault: TFrmFiltroDefault;

implementation

{$R *.dfm}

uses uLogs, uConfiguracoes, SimpleInterface, SimpleDao, uDataModule;

procedure TFrmFiltroDefault.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmFiltroDefault.btnCloseMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnClose.Cursor := crHandPoint;
end;

procedure TFrmFiltroDefault.btnConfirmarClick(Sender: TObject);
begin
    self.Return := grdFiltro.DataSource.DataSet.FieldByName('id').AsInteger;
    Close;
end;

procedure TFrmFiltroDefault.btnConfirmarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnConfirmar.Cursor := crHandPoint;
end;

procedure TFrmFiltroDefault.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    TLog.New.info('Fechando a tela ' + self.Caption);
end;

procedure TFrmFiltroDefault.FormCreate(Sender: TObject);
begin
    TLog.New.info('Acessando a tela ' + self.Caption);

    self.Fields := 'id, nome';

    loadConfig;

    FDsDados := TDataSource.Create(nil);
    grdFiltro.DataSource := FDSDados;

    edtLimite.EditType := etNumeric;
    edtLimite.Text := '100';
end;

procedure TFrmFiltroDefault.FormDestroy(Sender: TObject);
begin
    FreeAndNil(FDsDados);
end;

procedure TFrmFiltroDefault.FormShow(Sender: TObject);
begin
    edtPesquisa.SetFocus;
end;

procedure TFrmFiltroDefault.pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
    ReleaseCapture;
    Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TFrmFiltroDefault.SetCaption(aCaption: String);
begin
    self.Caption := 'Filtrar por ' + aCaption;
    pnlTitulo.Caption := self.Caption;
end;

procedure TFrmFiltroDefault.setFields(const Value: String);
begin
    FFields := Value;
end;

function TFrmFiltroDefault.getWhere(aField: String; aValue: String; aTipo: Integer = cPESQ_CODIGO): String;
begin
    case aTipo of
        cPESQ_CODIGO:
        begin
            case cbxTipo.ItemIndex of
                0: Result := aField + '=' + aValue;
                1: Result := aField + ' ILIKE ' + '%'+aValue+'%';
                2: Result := aField + ' ILIKE ' + aValue+'%';
                3: Result := aField + ' ILIKE ' + '%'+aValue;
            else
                Result := aField + '=' + aValue;
            end;
        end;
        cPESQ_NOME:
        begin
            case cbxTipo.ItemIndex of
                0: Result := aField + '=' + QuotedStr(aValue);
                1: Result := aField + ' ILIKE ' + QuotedStr('%'+aValue+'%');
                2: Result := aField + ' ILIKE ' + QuotedStr(aValue+'%');
                3: Result := aField + ' ILIKE ' + QuotedStr('%'+aValue);
            else
                Result := aField + '=' + aValue;
            end;
        end;
    end;
end;

procedure TFrmFiltroDefault.grdFiltroDblClick(Sender: TObject);
begin
    btnConfirmarClick(self);
end;

procedure TFrmFiltroDefault.loadConfig;
var
    DAO: iSimpleDao<TConfiguracoes>;
    oConfiguracoes: TConfiguracoes;
begin
    DAO := TSimpleDao<TConfiguracoes>.New(DM.GetConn);
    oConfiguracoes := DAO.Find(1);
    try
        cbxTipo.ItemIndex := oConfiguracoes.TipoPesquisa;
        cbxFiltro.ItemIndex := oConfiguracoes.FiltrarPor;
    finally
        oConfiguracoes.Free;
    end;
end;

end.
