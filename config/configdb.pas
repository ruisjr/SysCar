unit configdb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmConfigDB = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ListView1: TListView;
    Panel2: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigDB: TfrmConfigDB;

implementation

{$R *.dfm}

end.
