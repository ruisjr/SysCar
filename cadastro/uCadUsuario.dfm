inherited frmCadUsuario: TfrmCadUsuario
  Caption = 'frmCadUsuario'
  ClientHeight = 355
  ClientWidth = 640
  Constraints.MaxHeight = 355
  Constraints.MaxWidth = 640
  Constraints.MinHeight = 355
  Constraints.MinWidth = 640
  OnShow = FormShow
  ExplicitWidth = 640
  ExplicitHeight = 355
  TextHeight = 20
  inherited pnlFundo: TPanel
    Width = 640
    Height = 355
    ExplicitWidth = 640
    ExplicitHeight = 355
    object lblCodigo: TLabel [0]
      Left = 8
      Top = 55
      Width = 49
      Height = 20
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblNome: TLabel [1]
      Left = 8
      Top = 115
      Width = 41
      Height = 20
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblLogin: TLabel [2]
      Left = 314
      Top = 115
      Width = 37
      Height = 20
      Caption = 'Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblEmail: TLabel [3]
      Left = 8
      Top = 175
      Width = 43
      Height = 20
      Caption = 'E-mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblPerfil: TLabel [4]
      Left = 8
      Top = 235
      Width = 33
      Height = 20
      Caption = 'Perfil'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object imgFoto: TImage [5]
      Left = 475
      Top = 141
      Width = 145
      Height = 148
    end
    inherited pnlTitulo: TJvPanel
      Width = 630
      Caption = 'Cadastro de Usu'#225'rio'
      TabOrder = 1
      ExplicitWidth = 630
      inherited btnClose: TAeroSpeedButton
        Left = 592
        ExplicitLeft = 592
      end
    end
    inherited pnlBotoes: TJvPanel
      Top = 297
      Width = 630
      TabOrder = 2
      ExplicitTop = 297
      ExplicitWidth = 630
      inherited btnLocalizar: TAeroSpeedButton
        Left = 577
        Visible = False
        ExplicitLeft = 577
      end
      inherited btnExcluir: TAeroSpeedButton
        Left = 493
        ExplicitLeft = 493
      end
      inherited btnSalvar: TAeroSpeedButton
        Left = 437
        ExplicitLeft = 437
      end
      inherited btnInserir: TAeroSpeedButton
        Left = 381
        ExplicitLeft = 381
      end
      inherited pnlDivisor: TPanel
        Left = 549
        Visible = False
        ExplicitLeft = 549
      end
    end
    object edtCodigo: TAdvEdit
      Left = 8
      Top = 81
      Width = 100
      Height = 28
      EmptyTextStyle = []
      FlatLineColor = 11250603
      FocusColor = clWindow
      FocusFontColor = 3881787
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -15
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      Lookup.Font.Charset = DEFAULT_CHARSET
      Lookup.Font.Color = clWhite
      Lookup.Font.Height = -11
      Lookup.Font.Name = 'Segoe UI'
      Lookup.Font.Style = []
      Lookup.Separator = ';'
      CharCase = ecUpperCase
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = ''
      Visible = True
      Version = '4.0.5.0'
    end
    object tglAtivo: TToggleSwitch
      Left = 114
      Top = 84
      Width = 101
      Height = 22
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      StateCaptions.CaptionOn = 'Ativo'
      StateCaptions.CaptionOff = 'Inativo'
      TabOrder = 3
    end
    object cbxPerfil: TAdvComboBox
      Left = 8
      Top = 261
      Width = 456
      Height = 28
      Color = clWhite
      Version = '2.0.0.8'
      Visible = True
      ButtonWidth = 17
      Style = csDropDownList
      EmptyTextStyle = []
      CharCase = ecUpperCase
      DropWidth = 0
      Enabled = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = -1
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clBlack
      LabelFont.Height = -15
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object edtNome: TAdvEdit
    Left = 8
    Top = 141
    Width = 300
    Height = 28
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -15
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Segoe UI'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    CharCase = ecUpperCase
    Color = clWindow
    TabOrder = 1
    Text = ''
    Visible = True
    Version = '4.0.5.0'
  end
  object edtLogin: TAdvEdit
    Left = 314
    Top = 141
    Width = 150
    Height = 28
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -15
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Segoe UI'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    CharCase = ecUpperCase
    Color = clWindow
    TabOrder = 2
    Text = ''
    Visible = True
    Version = '4.0.5.0'
  end
  object edtEmail: TAdvEdit
    Left = 8
    Top = 201
    Width = 456
    Height = 28
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -15
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Segoe UI'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    CharCase = ecUpperCase
    Color = clWindow
    TabOrder = 3
    Text = ''
    Visible = True
    Version = '4.0.5.0'
  end
end
