inherited frmConfiguracoes: TfrmConfiguracoes
  Caption = 'Configura'#231#245'es'
  TextHeight = 20
  inherited pnlFundo: TPanel
    inherited pnlTitulo: TJvPanel
      Caption = 'Configura'#231#245'es'
    end
    inherited pnlBotoes: TJvPanel
      inherited btnLocalizar: TAeroSpeedButton
        Left = 514
        Visible = False
      end
      inherited btnExcluir: TAeroSpeedButton
        Left = 430
        Visible = False
      end
      inherited btnSalvar: TAeroSpeedButton
        Left = 570
        Width = 235
        Caption = 'Confirmar'
        ExplicitLeft = 615
        ExplicitTop = 3
        ExplicitWidth = 235
      end
      inherited btnInserir: TAeroSpeedButton
        Left = 374
        Visible = False
      end
      inherited pnlDivisor: TPanel
        Left = 486
      end
    end
    object pgcPrincipal: TAdvPageControl
      AlignWithMargins = True
      Left = 5
      Top = 51
      Width = 808
      Height = 354
      ActivePage = tbsGeral
      ActiveFont.Charset = DEFAULT_CHARSET
      ActiveFont.Color = clBlack
      ActiveFont.Height = -15
      ActiveFont.Name = 'Segoe UI'
      ActiveFont.Style = []
      Align = alClient
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabBackGroundColor = clBtnFace
      TabMargin.RightMargin = 0
      TabOverlap = 0
      Version = '2.0.5.0'
      PersistPagesState.Location = plRegistry
      PersistPagesState.Enabled = False
      TabOrder = 2
      object tbsGeral: TAdvTabSheet
        Caption = 'Geral'
        Color = clBtnFace
        ColorTo = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabColor = clBtnFace
        TabColorTo = clNone
        object grpPesquisa: TGroupBox
          Left = 3
          Top = 3
          Width = 294
          Height = 118
          Caption = ' Pesquisa '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblTipoPesquisa: TLabel
            Left = 16
            Top = 32
            Width = 93
            Height = 20
            Caption = 'Tipo Pesquisa:'
          end
          object lblFiltrarPor: TLabel
            Left = 43
            Top = 66
            Width = 66
            Height = 20
            Caption = 'Filtrar Por:'
          end
          object cbxTipoPesquisa: TAdvComboBox
            Left = 115
            Top = 28
            Width = 150
            Height = 28
            Color = clWindow
            Version = '2.0.0.8'
            Visible = True
            ButtonWidth = 17
            Style = csDropDownList
            EmptyTextStyle = []
            DropWidth = 0
            Enabled = True
            ItemIndex = -1
            Items.Strings = (
              'IGUAL A'
              'CONT'#201'M'
              'INICIA COM'
              'TERMINA COM')
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clBlack
            LabelFont.Height = -15
            LabelFont.Name = 'Segoe UI'
            LabelFont.Style = []
            TabOrder = 0
          end
          object cbxFiltrarPor: TAdvComboBox
            Left = 115
            Top = 62
            Width = 150
            Height = 28
            Color = clWindow
            Version = '2.0.0.8'
            Visible = True
            ButtonWidth = 17
            Style = csDropDownList
            EmptyTextStyle = []
            DropWidth = 0
            Enabled = True
            ItemIndex = -1
            Items.Strings = (
              'C'#211'DIGO'
              'NOME')
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clBlack
            LabelFont.Height = -15
            LabelFont.Name = 'Segoe UI'
            LabelFont.Style = []
            TabOrder = 1
          end
        end
      end
    end
  end
end
