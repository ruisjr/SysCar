inherited frmIniciaVenda: TfrmIniciaVenda
  Caption = 'Iniciar Atendimento'
  ClientHeight = 230
  ClientWidth = 640
  Constraints.MaxHeight = 230
  Constraints.MaxWidth = 640
  Constraints.MinHeight = 230
  Constraints.MinWidth = 640
  ExplicitWidth = 640
  ExplicitHeight = 230
  TextHeight = 20
  inherited pnlFundo: TPanel
    Width = 640
    Height = 230
    ExplicitWidth = 640
    ExplicitHeight = 230
    object Label1: TLabel [0]
      Left = 10
      Top = 109
      Width = 48
      Height = 20
      Caption = 'Ve'#237'culo'
    end
    object Label2: TLabel [1]
      Left = 321
      Top = 109
      Width = 52
      Height = 20
      Caption = 'Modelo'
    end
    object Label4: TLabel [2]
      Left = 10
      Top = 50
      Width = 35
      Height = 20
      Caption = 'Placa'
    end
    inherited pnlTitulo: TJvPanel
      Width = 632
      Caption = 'Iniciar Atendimento'
      TabOrder = 3
      ExplicitWidth = 632
      inherited btnClose: TAeroSpeedButton
        Left = 594
        ExplicitLeft = 594
      end
    end
    inherited pnlBotoes: TJvPanel
      Top = 173
      Width = 632
      TabOrder = 4
      ExplicitTop = 173
      ExplicitWidth = 632
      inherited btnLocalizar: TAeroSpeedButton
        Left = 579
        ExplicitLeft = 579
      end
      inherited btnExcluir: TAeroSpeedButton
        Left = 495
        ExplicitLeft = 495
      end
      inherited btnSalvar: TAeroSpeedButton
        Left = 439
        ExplicitLeft = 419
        ExplicitTop = -4
      end
      inherited btnInserir: TAeroSpeedButton
        Left = 383
        ExplicitLeft = 439
      end
      inherited pnlDivisor: TPanel
        Left = 551
        ExplicitLeft = 495
      end
    end
    object cbxVeiculo: TAdvComboBox
      Left = 10
      Top = 135
      Width = 305
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
      TabOrder = 1
      OnChange = cbxVeiculoChange
    end
    object btnConsultaCliente: TAdvGlowButton
      Left = 64
      Top = 109
      Width = 23
      Height = 23
      Default = True
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -13
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000006624B474400FF00FF00FFA0BDA793000001A4494441543811A5523D
        4BC350146D3EBA9450872A8291829319B44B41D17FE05C2A31D58A8299C41FE3
        A63835AD0D54500BA58E5D1C74D0A1DAA9439046413022C4A53589E73D4AC923
        2815C339B9EF9E7BDFCD7DF72516FBE7C385F7E7F379291E8F6B1CC7AD0EF56B
        9EE74F0DC3F81CFA11332A50281416116D8213E00348B080D7BBEFFB6BD56AF5
        11EB0878A2902FC33640CBF3BCF94AA5B24228088202AD872E1ABAAE27B08E80
        1640DB5B884C82AA699ACFB014A552C9461115CEB4EBBA9BB011D00238F31222
        77F86A0F96018A3C41B847CE326C047C48F1436B6689CD1E23841C5A2008825B
        68590C72169641B1584C239E056F98C0D0A10506838101FF0D3455559D81A5C0
        6619433D87E3489254868D609C6B74B14B049BFD7E7FA756AB31C71110A068B7
        DBAF8AA21CE3CA5E70E60444D2D109FC3DFC076968BBB891B95C2E77D96AB502
        C429461D50EFE717A769DA218AEC23E5CCB6ED0D14F9C23A36EA8038BF111D5E
        65329929E46C27934925954A5D5896E5D321421C0701667080C432B82ECBB20E
        3B7E0724B9D3E90498535D14C50FC7718EBADD2E335092F3677E032DB18AE461
        CC7CD50000000049454E44AE426082}
      Rounded = True
      TabOrder = 5
      Appearance.BorderColor = 11382963
      Appearance.BorderColorHot = 11565130
      Appearance.BorderColorCheckedHot = 11565130
      Appearance.BorderColorDown = 11565130
      Appearance.BorderColorChecked = 13744549
      Appearance.BorderColorDisabled = 13948116
      Appearance.Color = clWhite
      Appearance.ColorTo = clWhite
      Appearance.ColorChecked = 13744549
      Appearance.ColorCheckedTo = 13744549
      Appearance.ColorDisabled = clWhite
      Appearance.ColorDisabledTo = clNone
      Appearance.ColorDown = 11565130
      Appearance.ColorDownTo = 11565130
      Appearance.ColorHot = 16444643
      Appearance.ColorHotTo = 16444643
      Appearance.ColorMirror = clWhite
      Appearance.ColorMirrorTo = clWhite
      Appearance.ColorMirrorHot = 16444643
      Appearance.ColorMirrorHotTo = 16444643
      Appearance.ColorMirrorDown = 11565130
      Appearance.ColorMirrorDownTo = 11565130
      Appearance.ColorMirrorChecked = 13744549
      Appearance.ColorMirrorCheckedTo = 13744549
      Appearance.ColorMirrorDisabled = clWhite
      Appearance.ColorMirrorDisabledTo = clNone
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Appearance.TextColorChecked = 3750459
      Appearance.TextColorDown = 2303013
      Appearance.TextColorHot = 2303013
      Appearance.TextColorDisabled = 13948116
    end
    object cbxModelo: TAdvComboBox
      Left = 321
      Top = 135
      Width = 305
      Height = 28
      Color = clWhite
      Version = '2.0.0.8'
      Visible = True
      ButtonWidth = 17
      Style = csDropDownList
      EmptyTextStyle = []
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
      TabOrder = 2
    end
    object edtPlaca: TAdvEdit
      Left = 10
      Top = 75
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
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = ''
      Visible = True
      Version = '4.0.5.0'
    end
  end
end
