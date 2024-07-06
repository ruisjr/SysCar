inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produto'
  OnShow = FormShow
  TextHeight = 20
  inherited pnlFundo: TPanel
    Font.Color = clBlack
    object lblCodigo: TLabel [0]
      Left = 8
      Top = 55
      Width = 49
      Height = 20
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
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
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblEmail: TLabel [2]
      Left = 514
      Top = 115
      Width = 108
      Height = 20
      Caption = 'Nome Reduzido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblDataCadastro: TLabel [3]
      Left = 709
      Top = 55
      Width = 95
      Height = 20
      Caption = 'Data Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel [4]
      Left = 8
      Top = 175
      Width = 109
      Height = 20
      Caption = 'C'#243'digo de barra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel [5]
      Left = 421
      Top = 175
      Width = 71
      Height = 20
      Caption = 'Unid. Med.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    inherited pnlTitulo: TJvPanel
      Caption = 'Cadastro de Produto'
      TabOrder = 8
    end
    inherited pnlBotoes: TJvPanel
      TabOrder = 9
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
      OnKeyDown = edtCodigoKeyDown
      Version = '4.0.5.0'
    end
    object tglAtivo: TToggleSwitch
      Left = 114
      Top = 85
      Width = 91
      Height = 22
      Color = clWhite
      StateCaptions.CaptionOn = 'Ativo'
      StateCaptions.CaptionOff = 'Ativo'
      TabOrder = 10
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
      TabOrder = 2
      Text = ''
      Visible = True
      Version = '4.0.5.0'
    end
    object edtNomeReduzido: TAdvEdit
      Left = 514
      Top = 141
      Width = 295
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
      TabOrder = 3
      Text = ''
      Visible = True
      Version = '4.0.5.0'
    end
    object edtDataCadastro: TAdvDateTimePicker
      Left = 709
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
    object edtCodigoBarra: TAdvEdit
      Left = 8
      Top = 201
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
      TabOrder = 4
      Text = ''
      Visible = True
      Version = '4.0.5.0'
    end
    object cbxUnidMed: TAdvComboBox
      Left = 421
      Top = 201
      Width = 87
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
      TabOrder = 5
    end
    object grpPrecos: TGroupBox
      Left = 8
      Top = 235
      Width = 329
      Height = 155
      Caption = 'Geral'
      TabOrder = 7
      object Label2: TLabel
        Left = 10
        Top = 30
        Width = 94
        Height = 20
        Caption = 'Pre'#231'o Unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 166
        Top = 30
        Width = 90
        Height = 20
        Caption = 'Pre'#231'o a Prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 10
        Top = 90
        Width = 95
        Height = 20
        Caption = 'Pre'#231'o Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtPrecoUnit: TAdvEdit
        Left = 10
        Top = 56
        Width = 150
        Height = 28
        EditAlign = eaRight
        EditType = etFloat
        EmptyText = '0,00'
        EmptyTextStyle = []
        FlatLineColor = 11250603
        FocusColor = clWindow
        FocusFontColor = 3881787
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
        CharCase = ecUpperCase
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
        Visible = True
        Version = '4.0.5.0'
      end
      object edtPrecoPrazo: TAdvEdit
        Left = 166
        Top = 56
        Width = 150
        Height = 28
        EditAlign = eaRight
        EditType = etFloat
        EmptyText = '0,00'
        EmptyTextStyle = []
        FlatLineColor = 11250603
        FocusColor = clWindow
        FocusFontColor = 3881787
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
        CharCase = ecUpperCase
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '0,00'
        Visible = True
        Version = '4.0.5.0'
      end
      object edtPrecoAnterior: TAdvEdit
        Left = 10
        Top = 116
        Width = 150
        Height = 28
        EditAlign = eaRight
        EditType = etFloat
        EmptyText = '0,00'
        EmptyTextStyle = []
        FlatLineColor = 11250603
        FocusColor = clWindow
        FocusFontColor = 3881787
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
        CharCase = ecUpperCase
        Color = clWindow
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = '0,00'
        Visible = True
        Version = '4.0.5.0'
      end
    end
    object rdgTipoMercadoria: TJvRadioGroup
      Left = 164
      Top = 175
      Width = 251
      Height = 54
      Caption = 'Tipo'
      Columns = 2
      Items.Strings = (
        'Mercadoria'
        'Servi'#231'o')
      TabOrder = 6
    end
  end
end
