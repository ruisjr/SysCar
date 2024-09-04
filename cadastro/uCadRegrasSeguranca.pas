unit uCadRegrasSeguranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormDefault, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.Generics.Collections,
  {Classes de negócio}
  uUsuario, SimpleInterface, SimpleDao, SimpleAttributes;

type
  TfrmCadRegrasSeguranca = class(TfrmFormDefault)
    tvPerfil: TTreeView;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    DAOPerfil: iSimpleDao<TPerfilUsuario>;
  public
    { Public declarations }
  end;

var
  frmCadRegrasSeguranca: TfrmCadRegrasSeguranca;

implementation

{$R *.dfm}

uses uDataModule;

procedure TfrmCadRegrasSeguranca.FormCreate(Sender: TObject);
var
    ix: Integer;
    oLista: TObjectList<TPerfilUsuario>;
begin
  inherited;
    tvPerfil.Items.Clear;

    oLista := TObjectList<TPerfilUsuario>.Create;
    try
        DAOPerfil := TSimpleDao<TPerfilUsuario>.New(DM.GetConn);
        DAOPerfil.SQL.Fields('id, nome').OrderBy('nome ASC').&End.Find(oLista);
        for ix := 0 to oLista.count -1 do
        begin
            tvPerfil.Items.Add(Nil, oLista[ix].Nome)
        end;
    finally
        oLista.Free;
    end;
end;

initialization
  RegisterClass(TfrmCadRegrasSeguranca);

finalization
  UnRegisterClass(TfrmCadRegrasSeguranca);

end.
