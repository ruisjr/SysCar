program Config;

uses
  Vcl.Forms,
  configdb in 'configdb.pas' {frmConfigDB},
  uUtil in 'uUtil.pas',
  dataModule in 'dataModule.pas' {DM: TDataModule},
  uConectarDataBase in 'uConectarDataBase.pas' {frmCarregarDatabase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmConfigDB, frmConfigDB);
  Application.Run;
end.
