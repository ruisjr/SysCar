inherited frmCadMensalista: TfrmCadMensalista
  AlphaBlendValue = 240
  Caption = 'Cadastro de Mensalista'
  ClientHeight = 510
  ClientWidth = 750
  Color = clBtnFace
  Constraints.MaxHeight = 510
  Constraints.MaxWidth = 750
  Constraints.MinHeight = 510
  Constraints.MinWidth = 750
  Font.Color = clWhite
  OnShow = FormShow
  ExplicitWidth = 750
  ExplicitHeight = 510
  TextHeight = 20
  inherited pnlFundo: TPanel
    Width = 750
    Height = 510
    TabOrder = 8
    ExplicitWidth = 750
    ExplicitHeight = 470
    object lblCelular: TLabel [0]
      Left = 260
      Top = 175
      Width = 46
      Height = 20
      Caption = 'Celular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTelefone: TLabel [1]
      Left = 134
      Top = 175
      Width = 57
      Height = 20
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblSexo: TLabel [2]
      Left = 8
      Top = 175
      Width = 32
      Height = 20
      Caption = 'Sexo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblNome: TLabel [3]
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
    object lblCPF: TLabel [4]
      Left = 514
      Top = 115
      Width = 24
      Height = 20
      Caption = 'CPF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblRG: TLabel [5]
      Left = 640
      Top = 115
      Width = 19
      Height = 20
      Caption = 'RG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblDataCadastro: TLabel [6]
      Left = 640
      Top = 55
      Width = 95
      Height = 20
      Caption = 'Data Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCodigo: TLabel [7]
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
    object lblEmail: TLabel [8]
      Left = 386
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
    inherited pnlTitulo: TJvPanel
      Width = 740
      Caption = 'Cadastro de Mensalista'
      ExplicitWidth = 740
      inherited btnClose: TAeroSpeedButton
        Left = 702
        ExplicitLeft = 695
      end
    end
    inherited pnlBotoes: TJvPanel
      Top = 452
      Width = 740
      ExplicitLeft = 29
      ExplicitTop = 270
      ExplicitWidth = 740
      inherited btnLocalizar: TAeroSpeedButton
        Left = 687
        ExplicitLeft = 695
      end
      inherited btnExcluir: TAeroSpeedButton
        Left = 547
        ExplicitLeft = 611
      end
      inherited btnSalvar: TAeroSpeedButton
        Left = 603
        ExplicitLeft = 605
      end
      inherited btnInserir: TAeroSpeedButton
        Left = 491
        ExplicitLeft = 555
      end
      inherited pnlDivisor: TPanel
        Left = 659
        ExplicitLeft = 659
      end
    end
    object gbxEndereco: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 235
      Width = 740
      Height = 210
      Caption = 'Endere'#231'o'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      object lblCep: TLabel
        Left = 8
        Top = 30
        Width = 26
        Height = 20
        Caption = 'Cep'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblLogradouro: TLabel
        Left = 114
        Top = 30
        Width = 78
        Height = 20
        Caption = 'Logradouro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblNumero: TLabel
        Left = 470
        Top = 30
        Width = 19
        Height = 20
        Caption = 'Nr.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblBairro: TLabel
        Left = 526
        Top = 30
        Width = 40
        Height = 20
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblCidade: TLabel
        Left = 8
        Top = 90
        Width = 66
        Height = 20
        Caption = 'Munic'#237'pio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblUF: TLabel
        Left = 364
        Top = 90
        Width = 17
        Height = 20
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblComplemento: TLabel
        Left = 430
        Top = 90
        Width = 95
        Height = 20
        Caption = 'Complemento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblPais: TLabel
        Left = 8
        Top = 150
        Width = 25
        Height = 20
        Caption = 'Pa'#237's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtLogradouro: TAdvEdit
        Left = 114
        Top = 56
        Width = 350
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
        Lookup.Font.Color = clBlack
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
      object edtNumero: TAdvEdit
        Left = 470
        Top = 56
        Width = 50
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
        Lookup.Font.Color = clBlack
        Lookup.Font.Height = -11
        Lookup.Font.Name = 'Segoe UI'
        Lookup.Font.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        TabOrder = 2
        Text = ''
        Visible = True
        Version = '4.0.5.0'
      end
      object edtCep: TAdvMaskEdit
        Left = 8
        Top = 56
        Width = 100
        Height = 28
        CharCase = ecUpperCase
        Color = clWhite
        DefaultHandling = True
        Enabled = True
        EditMask = '00000\-999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 9
        ParentFont = False
        TabOrder = 0
        Text = '     -   '
        Visible = True
        AutoFocus = False
        Flat = False
        FlatLineColor = 11250603
        FlatParentColor = True
        ShowModified = False
        FocusColor = clWhite
        FocusBorder = False
        FocusFontColor = 3881787
        LabelAlwaysEnabled = False
        LabelPosition = lpLeftTop
        LabelTransparent = False
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clBlack
        LabelFont.Height = -15
        LabelFont.Name = 'Segoe UI'
        LabelFont.Style = []
        ModifiedColor = clRed
        SelectFirstChar = False
        Version = '4.0.5.0'
      end
      object btnCep: TAdvGlowButton
        Left = 40
        Top = 30
        Width = 20
        Height = 20
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
        TabOrder = 3
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
      object edtBairro: TAdvEdit
        Left = 526
        Top = 56
        Width = 205
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
        Lookup.Font.Color = clBlack
        Lookup.Font.Height = -11
        Lookup.Font.Name = 'Segoe UI'
        Lookup.Font.Style = []
        Lookup.Separator = ';'
        CharCase = ecUpperCase
        Color = clWindow
        TabOrder = 4
        Text = ''
        Visible = True
        Version = '4.0.5.0'
      end
      object edtMunicipio: TAdvEdit
        Left = 8
        Top = 116
        Width = 350
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
        Lookup.Font.Color = clBlack
        Lookup.Font.Height = -11
        Lookup.Font.Name = 'Segoe UI'
        Lookup.Font.Style = []
        Lookup.Separator = ';'
        CharCase = ecUpperCase
        Color = clWindow
        Enabled = False
        TabOrder = 5
        Text = ''
        Visible = True
        Version = '4.0.5.0'
      end
      object cbxUF: TAdvComboBox
        Left = 364
        Top = 116
        Width = 60
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
        Items.Strings = (
          ''
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RJ'
          'RN'
          'RS'
          'RO'
          'RR'
          'SC'
          'SP'
          'SE'
          'TO')
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clBlack
        LabelFont.Height = -15
        LabelFont.Name = 'Segoe UI'
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object edtComplemento: TAdvEdit
        Left = 430
        Top = 116
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
        Lookup.Font.Color = clBlack
        Lookup.Font.Height = -11
        Lookup.Font.Name = 'Segoe UI'
        Lookup.Font.Style = []
        Lookup.Separator = ';'
        CharCase = ecUpperCase
        Color = clWindow
        TabOrder = 7
        Text = ''
        Visible = True
        Version = '4.0.5.0'
      end
      object btnMunicipio: TAdvGlowButton
        Left = 80
        Top = 90
        Width = 20
        Height = 20
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
        TabOrder = 9
        OnClick = btnMunicipioClick
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
      object btnPais: TAdvGlowButton
        Left = 39
        Top = 150
        Width = 20
        Height = 20
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
        TabOrder = 10
        OnClick = btnPaisClick
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
      object edtPais: TAdvEdit
        Left = 8
        Top = 176
        Width = 350
        Height = 28
        EditorEnabled = False
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
        Lookup.Font.Color = clBlack
        Lookup.Font.Height = -11
        Lookup.Font.Name = 'Segoe UI'
        Lookup.Font.Style = []
        Lookup.Separator = ';'
        CharCase = ecUpperCase
        Color = clWindow
        Enabled = False
        TabOrder = 8
        Text = ''
        Visible = True
        Version = '4.0.5.0'
      end
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
    LabelFont.Color = clBlack
    LabelFont.Height = -15
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -13
    Lookup.Font.Name = 'Segoe UI'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = ''
    Visible = True
    OnKeyDown = edtCodigoKeyDown
    Version = '4.0.5.0'
  end
  object edtNome: TAdvEdit
    Left = 8
    Top = 141
    Width = 500
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
    Lookup.Font.Height = -13
    Lookup.Font.Name = 'Segoe UI'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = ''
    Visible = True
    Version = '4.0.5.0'
  end
  object edtCPF: TAdvMaskEdit
    Left = 514
    Top = 141
    Width = 120
    Height = 28
    CharCase = ecUpperCase
    Color = clWhite
    DefaultHandling = True
    Enabled = True
    EditMask = '000\.000\.000\-00;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 14
    ParentFont = False
    TabOrder = 3
    Text = '   .   .   -  '
    Visible = True
    AutoFocus = False
    Flat = False
    FlatLineColor = 11250603
    FlatParentColor = True
    ShowModified = False
    FocusColor = clWhite
    FocusBorder = False
    FocusFontColor = 3881787
    LabelAlwaysEnabled = False
    LabelPosition = lpLeftTop
    LabelTransparent = False
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clBlack
    LabelFont.Height = -15
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    ModifiedColor = clRed
    SelectFirstChar = False
    Version = '4.0.5.0'
  end
  object edtDataCadastro: TAdvDateTimePicker
    Left = 640
    Top = 81
    Width = 100
    Height = 28
    Date = 45459.000000000000000000
    Format = ''
    Time = 0.971273148148611700
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    Kind = dkDate
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 1
    BorderStyle = bsSingle
    Ctl3D = True
    DateTime = 45459.971273148150000000
    Version = '1.3.6.6'
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clBlack
    LabelFont.Height = -15
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
  end
  object edtRG: TAdvMaskEdit
    Left = 640
    Top = 141
    Width = 98
    Height = 28
    CharCase = ecUpperCase
    Color = clWhite
    DefaultHandling = True
    Enabled = True
    EditMask = '00\.000\.000\-A;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 12
    ParentFont = False
    TabOrder = 4
    Text = '  .   .   - '
    Visible = True
    AutoFocus = False
    Flat = False
    FlatLineColor = 11250603
    FlatParentColor = True
    ShowModified = False
    FocusColor = clWhite
    FocusBorder = False
    FocusFontColor = 3881787
    LabelAlwaysEnabled = False
    LabelPosition = lpLeftTop
    LabelTransparent = False
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clBlack
    LabelFont.Height = -15
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    ModifiedColor = clRed
    SelectFirstChar = False
    Version = '4.0.5.0'
  end
  object cbxSexo: TAdvComboBox
    Left = 8
    Top = 201
    Width = 120
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
    Items.Strings = (
      ''
      'FEMININO'
      'MASCULINO')
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clBlack
    LabelFont.Height = -15
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object tglAtivo: TToggleSwitch
    Left = 114
    Top = 85
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
    TabOrder = 7
  end
  object edtEmail: TAdvEdit
    Left = 386
    Top = 201
    Width = 352
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
    Lookup.Font.Height = -13
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
    TabOrder = 6
    Text = ''
    Visible = True
    Version = '4.0.5.0'
  end
  object edtTelefone: TAdvMaskEdit
    Left = 134
    Top = 201
    Width = 120
    Height = 28
    CharCase = ecUpperCase
    Color = clWhite
    DefaultHandling = True
    Enabled = True
    EditMask = '!\(99\) 00000-0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    TabOrder = 9
    Text = '(  )      -    '
    Visible = True
    AutoFocus = False
    Flat = False
    FlatLineColor = 11250603
    FlatParentColor = True
    ShowModified = False
    FocusColor = clWhite
    FocusBorder = False
    FocusFontColor = 3881787
    LabelAlwaysEnabled = False
    LabelPosition = lpLeftTop
    LabelTransparent = False
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clBlack
    LabelFont.Height = -15
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    ModifiedColor = clRed
    SelectFirstChar = False
    Version = '4.0.5.0'
  end
  object edtCelular: TAdvMaskEdit
    Left = 260
    Top = 201
    Width = 120
    Height = 28
    CharCase = ecUpperCase
    Color = clWhite
    DefaultHandling = True
    Enabled = True
    EditMask = '!\(99\) 00000-0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    TabOrder = 10
    Text = '(  )      -    '
    Visible = True
    AutoFocus = False
    Flat = False
    FlatLineColor = 11250603
    FlatParentColor = True
    ShowModified = False
    FocusColor = clWhite
    FocusBorder = False
    FocusFontColor = 3881787
    LabelAlwaysEnabled = False
    LabelPosition = lpLeftTop
    LabelTransparent = False
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clBlack
    LabelFont.Height = -15
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    ModifiedColor = clRed
    SelectFirstChar = False
    Version = '4.0.5.0'
  end
end
