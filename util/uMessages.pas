unit uMessages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls, JvExStdCtrls, JvMemo, System.TypInfo, Soap.WebServExp,
  Soap.WSDLBind, Xml.XMLSchema, Soap.WSDLPub, AeroButtons;

type
  TMessageType = (mtInfo, mtWarning, mtError, mtQuestion);
  TMessageReturn = (mrOK, mrYes, mrNo, mrCancel);

  TFrmMessage = class(TForm)
    pnlMessage: TPanel;
    imgMessage: TImage;
    lblCaption: TLabel;
    mmMensagem: TJvMemo;
    WSDLHTMLPublish1: TWSDLHTMLPublish;
    btnOK: TButton;
    btnNao: TButton;
    btnSim: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FCaption: String;
    FMessage: String;
    Picture: String;
    FTipo: TMessageType;
    FMessageReturn: TMessageReturn;

    { procedures }
    procedure loadImage;
    procedure loadButtons;
  public
    { Public declarations }
    constructor Create(AWoner: TComponent; aCaption: String; aMessage: String; aTipo: TMessageType);
  published
    property MessageReturn: TMessageReturn read FMessageReturn write FMessageReturn;
  end;

var
  FrmMessage: TFrmMessage;

const
  POS_BTN_ESQ = 369;
  POS_BTN_MEI = 539;
  POS_BTN_DIR = 709;

implementation

{$R *.dfm}

uses uLogs;

{ TFrmMessage }

procedure TFrmMessage.btnNaoClick(Sender: TObject);
begin
    FMessageReturn := mrNO;
    Close;
end;

procedure TFrmMessage.btnOKClick(Sender: TObject);
begin
    FMessageReturn := mrOK;
    Close;
end;

procedure TFrmMessage.btnSimClick(Sender: TObject);
begin
    FMessageReturn := mrYes;
    Close;
end;

constructor TFrmMessage.Create(AWoner: TComponent; aCaption, aMessage: String; aTipo: TMessageType);
begin
    inherited Create(AWoner);
    FCaption := aCaption;
    FMessage := aMessage;
    FTipo := aTipo;

    FMessageReturn := mrCancel;
end;

procedure TFrmMessage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if not (FMessageReturn in [mrOK, mrYes, mrNo]) then
        FMessageReturn := mrCancel
end;

procedure TFrmMessage.FormCreate(Sender: TObject);
begin
    case FTipo of
        mtInfo:
        begin
            btnSim.Visible := False;
            btnNao.Visible := False;
        end;
        mtQuestion:
            btnOK.Visible := False;
    end;
end;

procedure TFrmMessage.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    case key of
        VK_ESCAPE: Close;
    end;
end;

procedure TFrmMessage.FormShow(Sender: TObject);
begin
    pnlMessage.Top := (self.Height - pnlMessage.Height) div 2;
    pnlMessage.Left := (self.Width - pnlMessage.Width) div 2;

    lblCaption.Caption := FCaption;
    mmMensagem.Lines.Text := FMessage;

    loadImage;
    loadButtons;
end;

procedure TFrmMessage.loadButtons;
begin
    case FTipo of
        mtInfo, mtWarning, mtError:
        begin
            btnSim.Visible := False;
            btnNao.Visible := False;
        end;
        mtQuestion:
        begin
            btnOK.Visible := False;
            btnSim.Left := btnNao.Left;
            btnNao.Left := btnOK.Left;
        end;
    end;
end;

procedure TFrmMessage.loadImage;
begin
    try
        case FTipo of
            mtInfo:
                imgMessage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\img\Info_70px.png');
            mtWarning:
                imgMessage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\img\Attention_70px.png');
            mtError:
                imgMessage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\img\Cancel_70px.png');
            mtQuestion:
                imgMessage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\img\Help_70px.png');
        else
            imgMessage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\img\Megaphone_70px.png');
        end;
    except
        on E: Exception do
            TLog.New.error('Não foi possível localizar a imagem para o tipo.');
    end;
end;

end.
