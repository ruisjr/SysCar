program Config;

uses
  Vcl.Forms,
  configdb in 'configdb.pas' {frmConfigDB},
  dataModule in 'dataModule.pas' {DM: TDataModule},
  uConectarDataBase in 'uConectarDataBase.pas' {frmCarregarDatabase},
  uUtil in 'uUtil.pas',
  uLogs in 'uLogs.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmConfigDB, frmConfigDB);
  Application.Run;
end.
