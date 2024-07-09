program Config;

uses
  Vcl.Forms,
  configdb in 'configdb.pas' {frmConfigDB};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmConfigDB, frmConfigDB);
  Application.Run;
end.
