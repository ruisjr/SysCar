object FrmMessage: TFrmMessage
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 240
  BorderStyle = bsNone
  ClientHeight = 405
  ClientWidth = 887
  Color = 3223857
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -22
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    887
    405)
  TextHeight = 30
  object pnlMessage: TPanel
    Left = 89
    Top = 83
    Width = 704
    Height = 294
    Anchors = []
    BevelOuter = bvNone
    TabOrder = 0
    object imgMessage: TImage
      Left = 10
      Top = 10
      Width = 70
      Height = 70
      Center = True
      Stretch = True
    end
    object lblCaption: TLabel
      Left = 98
      Top = 30
      Width = 189
      Height = 30
      Caption = 'Seu procedimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object mmMensagem: TJvMemo
      Left = 10
      Top = 86
      Width = 687
      Height = 140
      TabStop = False
      BorderStyle = bsNone
      Color = 3223857
      Flat = True
      Lines.Strings = (
        'mmMensagem')
      ParentFlat = False
      ReadOnly = True
      Transparent = True
      TabOrder = 0
      WantReturns = False
      OnKeyDown = FormKeyDown
    end
    object btnOK: TButton
      Left = 567
      Top = 248
      Width = 130
      Height = 41
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnNao: TButton
      Left = 431
      Top = 248
      Width = 130
      Height = 41
      Caption = 'N'#227'o'
      TabOrder = 2
      OnClick = btnNaoClick
    end
    object btnSim: TButton
      Left = 295
      Top = 248
      Width = 130
      Height = 41
      Caption = 'Sim'
      TabOrder = 3
      OnClick = btnSimClick
    end
  end
  object WSDLHTMLPublish1: TWSDLHTMLPublish
    WebDispatch.MethodType = mtAny
    WebDispatch.PathInfo = 'wsdl*'
    Left = 856
    Top = 232
  end
end
