unit uFormDefault;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AeroButtons, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  uLogs, Data.DB, Vcl.WinXCtrls, JvRadioGroup,
  { Classes de Negócio }
  SimpleDao, SimpleInterface, SimpleEntity;

type
  TStatusMode = (smInserting, smUpdating, smViewing);

  TfrmFormDefault = class(TForm)
    pnlFundo: TPanel;
    pnlTitulo: TJvPanel;
    btnClose: TAeroSpeedButton;
    pnlBotoes: TJvPanel;
    btnLocalizar: TAeroSpeedButton;
    btnExcluir: TAeroSpeedButton;
    btnSalvar: TAeroSpeedButton;
    pnlDivisor: TPanel;
    btnInserir: TAeroSpeedButton;
    procedure btnCloseMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnSalvarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnExcluirMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnLocalizarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnSalvarClick(Sender: TObject);
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
  frmFormDefault: TfrmFormDefault;

implementation

{$R *.dfm}

uses
    Vcl.StdCtrls, Vcl.ComCtrls, AdvToggle, uUtil;


procedure TfrmFormDefault.btnLocalizarClick(Sender: TObject);
begin
    if self.ID > 0 then
        self.SetStatus(smUpdating);
end;

procedure TfrmFormDefault.btnLocalizarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnLocalizar.Cursor := crHandPoint;
end;

procedure TfrmFormDefault.Clear;
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

procedure TfrmFormDefault.Delete;
begin
    if (self.ID = 0) or (QuestionMessage(self.Caption, 'Deseja excluir o registro ' + self.ID.ToString) = RET_NO) then
        Abort;

    TLog.New.info('Excluindo o registro ' + self.ID.ToString);

    Self.Clear;
end;

procedure TfrmFormDefault.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    TLog.New.info('Fechando a tela ' + self.Caption);
end;

procedure TfrmFormDefault.FormCreate(Sender: TObject);
begin
    Clear;

    FDSDados := TDataSource.Create(nil);

    TLog.New.info('Acessando a tela ' + self.Caption);
end;

procedure TfrmFormDefault.FormDestroy(Sender: TObject);
begin
    FDSDados.Free;
end;

procedure TfrmFormDefault.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    case key of
        VK_RETURN: perform(WM_NEXTDLGCTL,0,0);
    end;
end;

function TfrmFormDefault.InModeEditing: boolean;
begin
    Result := (FStatusMode = smUpdating);
end;

function TfrmFormDefault.InModeInserting: boolean;
begin
    Result := (FStatusMode = smInserting);
end;

procedure TfrmFormDefault.Insert;
begin
    TLog.New.info('Inserindo novo registro');
end;

procedure TfrmFormDefault.btnExcluirClick(Sender: TObject);
begin
    Delete;
end;

procedure TfrmFormDefault.btnExcluirMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnExcluir.Cursor := crHandPoint;
end;

procedure TfrmFormDefault.btnInserirClick(Sender: TObject);
begin
    if self.InModeEditing and (QuestionMessage(self.Caption, 'Registro atual está em edição. Deseja salvar as alterações do registro atual?') = RET_YES) then
    begin
        Save;
        Clear;
    end
    else
        Clear;
end;

procedure TfrmFormDefault.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmFormDefault.btnCloseMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnClose.Cursor := crHandPoint;
end;

procedure TfrmFormDefault.btnSalvarClick(Sender: TObject);
begin
    Save;
end;

procedure TfrmFormDefault.btnSalvarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    btnInserir.Cursor := crHandPoint;
end;

procedure TfrmFormDefault.pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
    ReleaseCapture;
    Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TfrmFormDefault.Save;
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

procedure TfrmFormDefault.SetID(aValue: Integer);
begin
    FId := aValue;

    SetStatus(smInserting);
    if FId > 0 then
        SetStatus(smUpdating);
end;

procedure TfrmFormDefault.SetStatus(aStatus: TStatusMode);
begin
    FStatusMode := aStatus;
end;

procedure TfrmFormDefault.Update;
begin
    TLog.New.info('Atualizando registro ' + Self.ID.ToString);
end;

end.
