unit uFormSingleDefault;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AeroButtons, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  uLogs, Data.DB, Vcl.WinXCtrls, JvRadioGroup,
  { Classes de Negócio }
  SimpleDao, SimpleInterface, SimpleEntity;

type
  TStatusMode = (smInserting, smUpdating, smViewing);

  TfrmSingleFormDefault = class(TForm)
    pnlFundo: TPanel;
    pnlTitulo: TJvPanel;
    btnClose: TAeroSpeedButton;
    pnlBotoes: TJvPanel;
    btnConfirmar: TAeroSpeedButton;
    pnlDivisor: TPanel;
    Panel1: TPanel;
    procedure btnCloseMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
  private
    { Private declarations }
    FId: Integer;
    FDSDados: TDataSource;
    FStatusMode: TStatusMode;

    procedure Clear;
    procedure SetStatus(aStatus: TStatusMode);
  public
    { Public declarations }
    procedure Save;

    {Métodos virtuais e abastratos}
    procedure Insert; virtual;
    procedure Update; virtual;
    procedure Delete; virtual;
    procedure SetID(aValue: Integer);

    { funções }
    function InModeEditing: boolean;
    function InModeInserting: boolean;
  protected
    { Properties }
    property DSDados: TDataSource read FDSDados write FDSDados;
    property ID: Integer read FId write SetID;
  end;

var
  frmSingleFormDefault: TfrmSingleFormDefault;

implementation

{$R *.dfm}

uses
    Vcl.StdCtrls, Vcl.ComCtrls, AdvToggle, uUtil;


procedure TfrmSingleFormDefault.btnLocalizarClick(Sender: TObject);
begin
    if self.ID > 0 then
        self.SetStatus(smUpdating);
end;

procedure TfrmSingleFormDefault.Clear;
var
  nIndex: Integer;
  aCampo: String;
begin
    for nIndex := 0 to Self.ComponentCount-1 do
    begin
        if Components[nIndex] is TCustomEdit then
        begin
            aCampo := Split('t', (Components[nIndex] as TCustomEdit).Name, False);
            if aCampo = 'Codigo' then
                (Components[nIndex] as TCustomEdit).Text := '0'
            else
                (Components[nIndex] as TCustomEdit).Clear
        end;

        if Components[nIndex] is TCustomComboBox then
            (Components[nIndex] as TCustomComboBox).ItemIndex := -1;

        if Components[nIndex] is TDateTimePicker then
            (Components[nIndex] as TDateTimePicker).DateTime := Now;

        if Components[nIndex] is TAdvToggleSwitch then
            (Components[nIndex] as TAdvToggleSwitch).On := False;

        if Components[nIndex] is TToggleSwitch then
            (Components[nIndex] as TToggleSwitch).State := tssOn;

        if Components[nIndex] is TJvRadioGroup then
            (Components[nIndex] as TJvRadioGroup).ItemIndex := 0;
    end;
end;

procedure TfrmSingleFormDefault.Delete;
begin
    if (self.ID = 0) or (QuestionMessage(self.Caption, 'Deseja excluir o registro ' + self.ID.ToString) = RET_NO) then
        Abort;

    TLog.New.info('Excluindo o registro ' + self.ID.ToString);

    Self.Clear;
end;

procedure TfrmSingleFormDefault.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    TLog.New.info('Fechando a tela ' + self.Caption);
end;

procedure TfrmSingleFormDefault.FormCreate(Sender: TObject);
begin
    Clear;

    FDSDados := TDataSource.Create(nil);

    TLog.New.info('Acessando a tela ' + self.Caption);
end;

procedure TfrmSingleFormDefault.FormDestroy(Sender: TObject);
begin
    FDSDados.Free;
end;

procedure TfrmSingleFormDefault.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    case key of
        VK_RETURN: perform(WM_NEXTDLGCTL,0,0);
    end;
end;

function TfrmSingleFormDefault.InModeEditing: boolean;
begin
    Result := (FStatusMode = smUpdating);
end;

function TfrmSingleFormDefault.InModeInserting: boolean;
begin
    Result := (FStatusMode = smInserting);
end;

procedure TfrmSingleFormDefault.Insert;
begin
    TLog.New.info('Inserindo novo registro');
end;

procedure TfrmSingleFormDefault.btnExcluirClick(Sender: TObject);
begin
    Delete;
end;

procedure TfrmSingleFormDefault.btnInserirClick(Sender: TObject);
begin
    if self.InModeEditing and (QuestionMessage(self.Caption, 'Registro atual está em edição. Deseja salvar as alterações do registro atual?') = RET_YES) then
    begin
        Save;
        Clear;
    end
    else
        Clear;
end;

procedure TfrmSingleFormDefault.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmSingleFormDefault.btnCloseMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnClose.Cursor := crHandPoint;
end;

procedure TfrmSingleFormDefault.btnConfirmarClick(Sender: TObject);
begin
    Save;
end;

procedure TfrmSingleFormDefault.pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
    ReleaseCapture;
    Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TfrmSingleFormDefault.Save;
begin
    try
        if FStatusMode = smInserting  then
        begin
            Insert;
            InfoMessage(self.Caption, 'Registro incluído com sucesso!');
        end
        else if FStatusMode = smUpdating then
        begin
            Update;
            InfoMessage(self.Caption, 'Registro atualizado com sucesso!');
        end;
    except
        on E: Exception do
        begin
             TLog.New.info('Ocorreu erro ao realizar a inserção ou edição do registro. ' + #13+#10 + E.Message);
             ErrorMessage(self.Caption, 'Não foi possível atualizar o registro.' +#13+#10 + 'Motivo: ' + E.Message);
        end;
    end;
end;

procedure TfrmSingleFormDefault.SetID(aValue: Integer);
begin
    FId := aValue;

    SetStatus(smInserting);
    if FId > 0 then
        SetStatus(smUpdating);
end;

procedure TfrmSingleFormDefault.SetStatus(aStatus: TStatusMode);
begin
    FStatusMode := aStatus;
end;

procedure TfrmSingleFormDefault.Update;
begin
    TLog.New.info('Atualizando registro ' + Self.ID.ToString);
end;

end.
