inherited FrmCadFormaPagto: TFrmCadFormaPagto
  Caption = 'Cadastro de Formas de Pagamento'
  ClientWidth = 725
  Constraints.MaxHeight = 725
  Constraints.MinWidth = 725
  ExplicitWidth = 725
  TextHeight = 20
  inherited pnlFundo: TPanel
    Width = 725
    TabOrder = 1
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
    object lblTipoFormaPagto: TLabel [2]
      Left = 514
      Top = 115
      Width = 121
      Height = 20
      Caption = 'Tipo Forma Pagto.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTipoRecebimento: TLabel [3]
      Left = 8
      Top = 175
      Width = 122
      Height = 20
      Caption = 'Tipo Recebimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblMoeda: TLabel [4]
      Left = 164
      Top = 175
      Width = 47
      Height = 20
      Caption = 'Moeda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    inherited pnlTitulo: TJvPanel
      Width = 717
      Caption = 'Cadastro de Formas de Pagamento'
      TabOrder = 3
      inherited btnClose: TAeroSpeedButton
        Left = 679
      end
    end
    inherited pnlBotoes: TJvPanel
      Width = 717
      TabOrder = 8
      inherited btnLocalizar: TAeroSpeedButton
        Left = 664
      end
      inherited btnExcluir: TAeroSpeedButton
        Left = 580
      end
      inherited btnInserir: TAeroSpeedButton
        Left = 524
      end
      inherited pnlDivisor: TPanel
        Left = 636
      end
    end
    object edtCodigo: TAdvEdit
      Left = 8
      Top = 81
      Width = 100
      Height = 28
      EditType = etNumeric
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
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
      Visible = True
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
      TabOrder = 9
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
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = ''
      Visible = True
      Version = '4.0.5.0'
    end
    object cbxTipoFormaPagto: TAdvComboBox
      Left = 514
      Top = 141
      Width = 200
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
        'DINHEIRO'
        'BOLETO'
        'C. DEBITO'
        'C. CREDITO'
        'PIX'
        'TED'
        'DOC'
        'TRANSF. ELETRONICA'
        'CREDITO LOJA'
        'VALE ALIMENTACAO')
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clBlack
      LabelFont.Height = -15
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object cbxMoeda: TAdvComboBox
      Left = 164
      Top = 197
      Width = 150
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
        'REAL'
        'DOLAR'
        'EURO'
        'PESOS')
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clBlack
      LabelFont.Height = -15
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object grpUtilizacao: TJvGroupBox
      Left = 320
      Top = 231
      Width = 240
      Height = 90
      Caption = 'Utilizar em'
      TabOrder = 7
      object chkContasPagar: TAdvOfficeCheckBox
        Left = 16
        Top = 25
        Width = 200
        Height = 20
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Contas a Pagar'
        ReturnIsTab = False
        Version = '1.8.4.1'
      end
      object chkContasReceber: TAdvOfficeCheckBox
        Left = 16
        Top = 51
        Width = 200
        Height = 20
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = 'Contas a Receber'
        ReturnIsTab = False
        Version = '1.8.4.1'
      end
    end
    object grpVencimento: TJvGroupBox
      Left = 8
      Top = 231
      Width = 306
      Height = 90
      Caption = 'Vencimento'
      TabOrder = 6
      StyleName = 'Windows'
      object lblDiaVencimento: TLabel
        Left = 10
        Top = 25
        Width = 61
        Height = 20
        Caption = 'Dia Venc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblParcelas: TLabel
        Left = 77
        Top = 25
        Width = 53
        Height = 20
        Caption = 'Parcelas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtDiaVencimento: TAdvEdit
        Left = 10
        Top = 51
        Width = 61
        Height = 28
        EditType = etNumeric
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
        Text = '0'
        Visible = True
        Version = '4.0.5.0'
      end
      object edtParcelas: TAdvEdit
        Left = 77
        Top = 51
        Width = 53
        Height = 28
        EditType = etNumeric
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
        TabOrder = 1
        Text = '0'
        Visible = True
        Version = '4.0.5.0'
      end
    end
    object chkPermiteTroco: TAdvOfficeCheckBox
      Left = 320
      Top = 201
      Width = 200
      Height = 20
      TabOrder = 5
      Alignment = taLeftJustify
      Caption = 'Permite Troco'
      ReturnIsTab = False
      Version = '1.8.4.1'
    end
  end
  object cbxTipoRecebimento: TAdvComboBox
    Left = 8
    Top = 197
    Width = 150
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
      'A VISTA'
      'A PRAZO')
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clBlack
    LabelFont.Height = -15
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = cbxTipoRecebimentoChange
  end
end
