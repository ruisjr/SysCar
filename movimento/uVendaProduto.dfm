inherited frmVendaProduto: TfrmVendaProduto
  Caption = 'Produtos'
  ClientHeight = 235
  ClientWidth = 585
  Constraints.MaxHeight = 235
  Constraints.MaxWidth = 585
  Constraints.MinHeight = 235
  Constraints.MinWidth = 585
  ExplicitWidth = 585
  ExplicitHeight = 235
  TextHeight = 20
  inherited pnlFundo: TPanel
    Width = 585
    Height = 235
    ExplicitWidth = 585
    ExplicitHeight = 235
    object lblProduto: TLabel [0]
      Left = 8
      Top = 48
      Width = 53
      Height = 20
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 108
      Width = 78
      Height = 20
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel [2]
      Left = 104
      Top = 108
      Width = 71
      Height = 20
      Caption = 'Pre'#231'o Unit.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel [3]
      Left = 452
      Top = 107
      Width = 33
      Height = 20
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    inherited pnlTitulo: TJvPanel
      Width = 575
      Caption = 'Produtos'
      TabOrder = 5
      ExplicitWidth = 575
      inherited btnClose: TAeroSpeedButton
        Left = 537
        ExplicitLeft = 537
      end
    end
    inherited pnlBotoes: TJvPanel
      Top = 177
      Width = 575
      TabOrder = 6
      ExplicitTop = 177
      ExplicitWidth = 575
      inherited btnConfirmar: TAeroSpeedButton
        Left = 309
        ExplicitLeft = 309
      end
      inherited pnlDivisor: TPanel
        Left = 281
        ExplicitLeft = 281
      end
      inherited Panel1: TPanel
        Left = 550
        ExplicitLeft = 550
      end
    end
    object edtCodigoProduto: TAdvEdit
      Left = 8
      Top = 74
      Width = 140
      Height = 28
      EditType = etNumeric
      EmptyTextStyle = []
      FlatLineColor = clWindowText
      FocusColor = clWhite
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
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
      Visible = True
      OnEnter = edtCodigoProdutoEnter
      OnExit = edtCodigoProdutoExit
      OnKeyDown = edtCodigoProdutoKeyDown
      Version = '4.0.5.0'
      UIStyle = tsWindows10
    end
    object pnlNomeProduto: TPanel
      Left = 154
      Top = 73
      Width = 384
      Height = 28
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object edtQuantidade: TAdvEdit
      Left = 8
      Top = 134
      Width = 90
      Height = 28
      EditType = etFloat
      EmptyTextStyle = []
      FlatLineColor = clWindowText
      FocusColor = clWhite
      Precision = 2
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
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0,00'
      Visible = True
      OnChange = edtQuantidadeChange
      Version = '4.0.5.0'
      UIStyle = tsWindows10
    end
    object edtPrecoUnit: TAdvEdit
      Left = 104
      Top = 134
      Width = 120
      Height = 28
      EditType = etFloat
      EmptyTextStyle = []
      FlatLineColor = clWindowText
      FocusColor = clWhite
      Precision = 2
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
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '0,00'
      Visible = True
      Version = '4.0.5.0'
      UIStyle = tsWindows10
    end
    object GroupBox1: TGroupBox
      Left = 230
      Top = 107
      Width = 216
      Height = 60
      Caption = 'Descontos'
      TabOrder = 3
      object Label3: TLabel
        Left = 12
        Top = 29
        Width = 12
        Height = 20
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 99
        Top = 29
        Width = 17
        Height = 20
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtPercentualDesconto: TAdvEdit
        Left = 30
        Top = 25
        Width = 63
        Height = 28
        EditType = etFloat
        EmptyTextStyle = []
        FlatLineColor = clWindowText
        FocusColor = clWhite
        Precision = 2
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
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
        Visible = True
        OnExit = edtPercentualDescontoExit
        Version = '4.0.5.0'
        UIStyle = tsWindows10
      end
      object edtValorDesconto: TAdvEdit
        Left = 122
        Top = 25
        Width = 63
        Height = 28
        EditType = etFloat
        EmptyTextStyle = []
        FlatLineColor = clWindowText
        FocusColor = clWhite
        Precision = 2
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
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '0,00'
        Visible = True
        OnExit = edtValorDescontoExit
        Version = '4.0.5.0'
        UIStyle = tsWindows10
      end
    end
    object edtTotal: TAdvEdit
      Left = 452
      Top = 134
      Width = 120
      Height = 28
      EditType = etFloat
      EmptyTextStyle = []
      FlatLineColor = clWindowText
      FocusColor = clWhite
      Precision = 2
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
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '0,00'
      Visible = True
      Version = '4.0.5.0'
      UIStyle = tsWindows10
    end
    object btnConsultaCliente: TAdvGlowButton
      Left = 544
      Top = 74
      Width = 28
      Height = 28
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
      Transparent = True
      TabOrder = 8
      OnClick = btnConsultaClienteClick
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
  end
end
