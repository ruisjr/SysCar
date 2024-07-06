inherited frmCadVeiculo: TfrmCadVeiculo
  Caption = 'Cadastro de Ve'#237'culos'
  ClientHeight = 539
  ClientWidth = 462
  Constraints.MaxWidth = 462
  Constraints.MinWidth = 462
  ExplicitWidth = 462
  ExplicitHeight = 539
  TextHeight = 20
  inherited pnlFundo: TPanel
    Width = 462
    Height = 539
    ExplicitWidth = 462
    ExplicitHeight = 539
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
    object imgLogo: TImage [2]
      Left = 374
      Top = 50
      Width = 80
      Height = 80
    end
    inherited pnlTitulo: TJvPanel
      Width = 454
      Caption = 'Cadastro de Ve'#237'culo'
      TabOrder = 2
      ExplicitWidth = 454
      inherited btnClose: TAeroSpeedButton
        Left = 416
        ExplicitLeft = 416
      end
    end
    inherited pnlBotoes: TJvPanel
      Top = 482
      Width = 454
      TabOrder = 3
      ExplicitTop = 482
      ExplicitWidth = 454
      inherited btnLocalizar: TAeroSpeedButton
        Left = 401
        ExplicitLeft = 401
      end
      inherited btnExcluir: TAeroSpeedButton
        Left = 317
        ExplicitLeft = 317
      end
      inherited btnInserir: TAeroSpeedButton
        Left = 261
        ExplicitLeft = 261
      end
      inherited pnlDivisor: TPanel
        Left = 373
        ExplicitLeft = 373
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
    object edtNome: TAdvEdit
      Left = 8
      Top = 141
      Width = 446
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
      TabOrder = 1
      Text = ''
      Visible = True
      Version = '4.0.5.0'
    end
    object grpTipo: TJvRadioGroup
      Left = 9
      Top = 175
      Width = 446
      Height = 54
      Caption = ' Tipo'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Autom'#243'vel'
        'Moto'
        'Caminh'#227'o')
      TabOrder = 4
      OnClick = grpTipoClick
    end
    object Panel1: TPanel
      Left = 1
      Top = 235
      Width = 460
      Height = 244
      Align = alBottom
      BevelOuter = bvNone
      Color = 8017159
      ParentBackground = False
      TabOrder = 5
      object Panel2: TPanel
        Left = 419
        Top = 0
        Width = 41
        Height = 244
        Align = alRight
        BevelOuter = bvNone
        Color = 8017159
        ParentBackground = False
        TabOrder = 0
        object btnMenuContato: TAdvGlowButton
          Left = 8
          Top = 6
          Width = 25
          Height = 25
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -12
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          Picture.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            6100000006624B474400FF00FF00FFA0BDA793000000394944415438116360A0
            103082F4C7C4C41481E8254B96F44547475B00D9C5408C173132321E07A967C2
            AB6A48488E860103C368180C8B300000FD67240D61A3EFB30000000049454E44
            AE426082}
          Rounded = True
          TabOrder = 0
          OnClick = btnMenuContatoClick
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
          DropDownWidth = 15
        end
      end
      object grdModelo: TJvDBGrid
        Left = 0
        Top = 0
        Width = 419
        Height = 244
        Align = alClient
        Color = 8017159
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -15
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 24
        TitleRowHeight = 24
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Color = clBlack
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome'
            Width = 280
            Visible = True
          end>
      end
    end
  end
  object ppmMenuLateral: TAdvPopupMenu
    Version = '2.7.1.12'
    UIStyle = tsWindows10
    Left = 240
    Top = 80
    object InserirModelo1: TMenuItem
      Caption = '&Inserir'
    end
    object Excluir1: TMenuItem
      Caption = '&Excluir'
    end
  end
end
