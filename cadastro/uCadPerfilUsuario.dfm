inherited frmCadPerfilUsuario: TfrmCadPerfilUsuario
  Caption = 'Cadastro de Perfil'
  ClientHeight = 235
  ClientWidth = 450
  Constraints.MaxHeight = 235
  Constraints.MaxWidth = 450
  Constraints.MinHeight = 235
  Constraints.MinWidth = 450
  OnShow = FormShow
  ExplicitWidth = 450
  ExplicitHeight = 235
  TextHeight = 20
  inherited pnlFundo: TPanel
    Width = 450
    Height = 235
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
    inherited pnlTitulo: TJvPanel
      Width = 440
      Caption = 'Cadastro de Perfis'
      inherited btnClose: TAeroSpeedButton
        Left = 402
      end
    end
    inherited pnlBotoes: TJvPanel
      Top = 177
      Width = 440
      inherited btnLocalizar: TAeroSpeedButton
        Left = 387
      end
      inherited btnExcluir: TAeroSpeedButton
        Left = 303
      end
      inherited btnSalvar: TAeroSpeedButton
        Left = 247
      end
      inherited btnInserir: TAeroSpeedButton
        Left = 191
      end
      inherited pnlDivisor: TPanel
        Left = 359
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
      TabOrder = 2
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
  end
end
