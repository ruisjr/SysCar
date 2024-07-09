object frmConfigDB: TfrmConfigDB
  Left = 0
  Top = 0
  Caption = 'Configura'#231#245'es de Banco de Dados'
  ClientHeight = 587
  ClientWidth = 1131
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 353
    Height = 581
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitHeight = 587
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 347
      Height = 575
      Align = alClient
      Caption = 'Tabelas'
      TabOrder = 0
      ExplicitLeft = 40
      ExplicitTop = 40
      ExplicitWidth = 185
      ExplicitHeight = 105
      object ListView1: TListView
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 337
        Height = 550
        Align = alClient
        Columns = <>
        TabOrder = 0
        ExplicitLeft = 88
        ExplicitTop = 256
        ExplicitWidth = 250
        ExplicitHeight = 150
      end
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 362
    Top = 3
    Width = 766
    Height = 581
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 640
    ExplicitTop = 136
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
end
