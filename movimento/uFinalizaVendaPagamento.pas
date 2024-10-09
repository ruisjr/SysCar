unit uFinalizaVendaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormSingleDefault, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Data.DB,
  Datasnap.DBClient;

type
  TfrmFinalizaVendaPagamento = class(TfrmSingleFormDefault)
    DSPagamentos: TDataSource;
    cdsPagamentos: TClientDataSet;
    cdsPagamentosid: TIntegerField;
    cdsPagamentosnome: TStringField;
    cdsPagamentosvalor: TFloatField;
    Panel2: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinalizaVendaPagamento: TfrmFinalizaVendaPagamento;

implementation

{$R *.dfm}


initialization
  RegisterClass(TfrmFinalizaVendaPagamento);

finalization
  UnRegisterClass(TfrmFinalizaVendaPagamento);

end.
