unit uGerenciamentoUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDefault, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, AdvUtil, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, DBAdvGrid, System.Generics.Collections, Data.DB, Datasnap.DBClient,
  {Classes de negócio}
  uUsuario, SimpleInterface, SimpleDao, SimpleAttributes, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TfrmGerenciamentoUsuario = class(TfrmFormDefault)
    Panel1: TPanel;
    btnUsuarios: TAeroSpeedButton;
    btnPerfis: TAeroSpeedButton;
    pnlUsuarios: TPanel;
    cdsUsuarios: TClientDataSet;
    DSDados: TDataSource;
    cdsUsuariosid: TIntegerField;
    cdsUsuariosnome: TStringField;
    cdsUsuarioslogin: TStringField;
    cdsUsuariosemail: TStringField;
    cdsUsuariosativo: TBooleanField;
    cdsUsuariosperfil: TIntegerField;
    grdFiltro: TJvDBGrid;
    btnSeguranca: TAeroSpeedButton;
    procedure btnUsuariosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnPerfisMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPerfisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSegurancaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnSegurancaClick(Sender: TObject);
  private
    { Private declarations }
    DAOUsuario: iSimpleDao<TUsuario>;
    procedure AtualizaLista;
  public
    { Public declarations }
  end;

var
  frmGerenciamentoUsuario: TfrmGerenciamentoUsuario;

implementation

{$R *.dfm}

uses uCallForm, uDataModule;

procedure TfrmGerenciamentoUsuario.btnSegurancaClick(Sender: TObject);
begin
  inherited;
    TCallForm.CallFormCad('TfrmCadRegrasSeguranca', 0);
end;

procedure TfrmGerenciamentoUsuario.btnSegurancaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    btnSeguranca.Cursor := crHandPoint;
end;

procedure TfrmGerenciamentoUsuario.AtualizaLista;
var
    ix: Integer;
    DAO: iSimpleDao<TUsuario>;
    oLista: TObjectList<TUsuario>;
begin
    DAO := TSimpleDao<TUsuario>.New(DM.GetConn);
    oLista := TObjectList<TUsuario>.Create;
    try
        DAO.SQL.OrderBy('nome').&End.Find(oLista);
        with cdsUsuarios do
        begin
            if Active then
                Close;

            CreateDataSet;
            Open;

            DisableControls;
            try
                for ix := 0 to oLista.Count -1 do
                begin
                    Append;

                    FieldByName('id').AsInteger := oLista[ix].ID;
                    FieldByName('nome').AsString := oLista[ix].Nome;
                    FieldByName('login').AsString := oLista[ix].Login;
                    FieldByName('ativo').AsBoolean := oLista[ix].Ativo;

                    Post;
                end;
            finally
                EnableControls;
            end;
        end;
    finally
        oLista.Free;
    end;
end;

procedure TfrmGerenciamentoUsuario.btnExcluirClick(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmGerenciamentoUsuario.btnInserirClick(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmGerenciamentoUsuario.btnPerfisClick(Sender: TObject);
begin
  inherited;
    TCallForm.CallFormCad('TfrmCadPerfilUsuario', 0);
    Self.AtualizaLista;
end;

procedure TfrmGerenciamentoUsuario.btnPerfisMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    btnPerfis.Cursor := crHandPoint;
end;

procedure TfrmGerenciamentoUsuario.btnSalvarClick(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmGerenciamentoUsuario.btnUsuariosClick(Sender: TObject);
begin
  inherited;
    TCallForm.CallFormCad('TfrmCadUsuario', Self.DSDados.DataSet.FieldByName('id').AsInteger);
    Self.AtualizaLista;
end;

procedure TfrmGerenciamentoUsuario.btnUsuariosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    btnUsuarios.Cursor := crHandPoint;
end;

procedure TfrmGerenciamentoUsuario.FormCreate(Sender: TObject);
begin
  inherited;
    grdFiltro.DataSource := self.DSDados;
    DAOUsuario := TSimpleDao<TUsuario>.New(DM.GetConn).DataSource(self.DSDados);
    DAOUsuario.SQL.Fields('id, nome, login, ativo').OrderBy('nome').&End.Find;
end;

procedure TfrmGerenciamentoUsuario.FormShow(Sender: TObject);
begin
  inherited;
    Self.AtualizaLista;
end;

initialization
  RegisterClass(TfrmGerenciamentoUsuario);

finalization
  UnRegisterClass(TfrmGerenciamentoUsuario);

end.
