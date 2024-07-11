object frmCarregarDatabase: TfrmCarregarDatabase
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Carregar Database'
  ClientHeight = 252
  ClientWidth = 308
  Color = clBtnFace
  Constraints.MaxHeight = 290
  Constraints.MaxWidth = 320
  Constraints.MinHeight = 290
  Constraints.MinWidth = 320
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 85
    Height = 15
    Caption = 'Banco de Dados'
  end
  object Label2: TLabel
    Left = 231
    Top = 10
    Width = 28
    Height = 15
    Caption = 'Porta'
  end
  object Label3: TLabel
    Left = 10
    Top = 60
    Width = 40
    Height = 15
    Caption = 'Usu'#225'rio'
  end
  object lblSenhaDB: TLabel
    Left = 156
    Top = 60
    Width = 32
    Height = 15
    Caption = 'Senha'
  end
  object Label4: TLabel
    Left = 10
    Top = 110
    Width = 25
    Height = 15
    Caption = 'Host'
  end
  object Label5: TLabel
    Left = 156
    Top = 110
    Width = 83
    Height = 15
    Caption = 'Database Name'
  end
  object lblTimeOut: TLabel
    Left = 10
    Top = 160
    Width = 46
    Height = 15
    Caption = 'TimeOut'
  end
  object cbxDataBase: TComboBox
    Left = 10
    Top = 31
    Width = 215
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 0
    Items.Strings = (
      'FB - FIREBIRD'
      'PG - POSTGRES'
      'MYSQL - MYSQL')
  end
  object edtPorta: TSpinEdit
    Left = 231
    Top = 31
    Width = 65
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 5432
  end
  object edtUsuario: TEdit
    Left = 10
    Top = 81
    Width = 140
    Height = 23
    TabOrder = 2
  end
  object edtSenha: TEdit
    Left = 156
    Top = 81
    Width = 140
    Height = 23
    PasswordChar = '*'
    TabOrder = 3
  end
  object Button1: TButton
    Left = 10
    Top = 219
    Width = 100
    Height = 25
    Caption = 'Salvar'
    TabOrder = 6
    OnClick = Button1Click
  end
  object edtHostname: TEdit
    Left = 10
    Top = 131
    Width = 140
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object edtDbName: TEdit
    Left = 156
    Top = 131
    Width = 140
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object edtTimeOut: TSpinEdit
    Left = 10
    Top = 181
    Width = 65
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 7
    Value = 60
  end
end
