unit uConectarDataBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin, FireDac.Comp.Client;

type
  TfrmCarregarDatabase = class(TForm)
    Label1: TLabel;
    cbxDataBase: TComboBox;
    Label2: TLabel;
    edtPorta: TSpinEdit;
    Label3: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    lblSenhaDB: TLabel;
    Button1: TButton;
    Label4: TLabel;
    edtHostname: TEdit;
    Label5: TLabel;
    edtDbName: TEdit;
    lblTimeOut: TLabel;
    edtTimeOut: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    IdDatabase: Integer;
  public
    { Public declarations }
  end;

var
  frmCarregarDatabase: TfrmCarregarDatabase;

implementation

{$R *.dfm}

uses uUtil;

procedure TfrmCarregarDatabase.Button1Click(Sender: TObject);
var
    aQuery: String;
begin
    aQuery := 'INSERT INTO database (database, porta, usuario, senha, hostname, dbname, timeout) VALUES (:database, :porta, :usuario, :senha, :hostname, :dbname, :timeout)';
    if self.IdDatabase > 0 then
        aQuery := 'UPDATE database set database=:database, porta=:porta, usuario=:usuario, senha=:senha, hostname=:hostname, dbname=:dbname, timeout=:timeout WHERE id = :id';

    with getQuery do
    begin
        try
            Close;
            SQL.Clear;
            SQL.Text := aQuery;
            ParamByName('database').AsString := cbxDataBase.Text;
            ParamByName('porta').AsInteger := edtPorta.Value;
            ParamByName('usuario').AsString := edtUsuario.Text;
            ParamByName('senha').AsString := edtSenha.Text;
            ParamByName('hostname').AsString := edtHostname.Text;
            ParamByName('dbname').AsString := edtDbName.Text;
            ParamByName('timeout').AsInteger := edtTimeOut.Value;

            if self.IdDatabase > 0 then
                ParamByName('id').AsInteger := self.IdDatabase;

            Prepare;
            ExecSQL;
        finally
            Free;
        end;
    end;
    Close;
end;

procedure TfrmCarregarDatabase.FormShow(Sender: TObject);
begin
    self.IdDatabase := 0;
    with getQuery do
    begin
        try
            Close;
            SQL.Clear;
            SQL.Text := 'SELECT * FROM database';
            Open;

            cbxDataBase.SelText := FieldByName('database').AsString;
            edtPorta.Value := FieldByName('porta').AsInteger;
            edtUsuario.Text := FieldByName('usuario').AsString;
            edtSenha.Text := FieldByName('senha').AsString;
            edtHostname.Text := FieldByName('hostname').AsString;
            edtDbName.Text := FieldByName('dbname').AsString;

            if RecordCount > 0 then            
                self.IdDatabase := FieldByName('id').AsInteger;
        finally
            Free;
        end;
    end;
end;

end.
