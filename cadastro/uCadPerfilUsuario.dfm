inherited frmCadPerfilUsuario: TfrmCadPerfilUsuario
  Caption = 'Cadastro de Perfil'
  ClientHeight = 355
  ClientWidth = 600
  Constraints.MaxHeight = 355
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 355
  Constraints.MinWidth = 600
  OnShow = FormShow
  ExplicitWidth = 600
  ExplicitHeight = 355
  TextHeight = 20
  inherited pnlFundo: TPanel
    Width = 600
    Height = 355
    ExplicitWidth = 450
    ExplicitHeight = 235
    object lblCodigo: TLabel [0]
      Left = 191
      Top = 51
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
      Left = 191
      Top = 111
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
    inherited pnlTitulo: TJvPanel
      Width = 590
      Caption = 'Cadastro de Perfis'
      ExplicitWidth = 440
      inherited btnClose: TAeroSpeedButton
        Left = 552
        ExplicitLeft = 402
      end
    end
    inherited pnlBotoes: TJvPanel
      Top = 297
      Width = 590
      ExplicitTop = 177
      ExplicitWidth = 440
      inherited btnLocalizar: TAeroSpeedButton
        Left = 537
        Visible = False
        ExplicitLeft = 387
      end
      inherited btnExcluir: TAeroSpeedButton
        Left = 453
        ExplicitLeft = 303
      end
      inherited btnSalvar: TAeroSpeedButton
        Left = 397
        ExplicitLeft = 247
      end
      inherited btnInserir: TAeroSpeedButton
        Left = 341
        ExplicitLeft = 191
      end
      inherited pnlDivisor: TPanel
        Left = 509
        ExplicitLeft = 359
      end
    end
    object edtCodigo: TAdvEdit
      Left = 191
      Top = 77
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
      TabOrder = 2
      Text = ''
      Visible = True
      Version = '4.0.5.0'
    end
    object tglAtivo: TToggleSwitch
      Left = 297
      Top = 80
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
    object edtNome: TAdvEdit
      Left = 191
      Top = 137
      Width = 400
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
      TabOrder = 4
      Text = ''
      Visible = True
      Version = '4.0.5.0'
    end
    object tvPerfil: TTreeView
      AlignWithMargins = True
      Left = 5
      Top = 51
      Width = 180
      Height = 240
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Indent = 19
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      OnDblClick = tvPerfilDblClick
      Items.NodeData = {
        0301000000380000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0000000000010D410044004D0049004E004900530054005200410044004F0052
        00}
      ExplicitHeight = 241
    end
  end
end
