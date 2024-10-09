inherited frmCadRegrasSeguranca: TfrmCadRegrasSeguranca
  Caption = 'Regras de Seguran'#231'a'
  ClientHeight = 360
  ClientWidth = 820
  Constraints.MaxHeight = 360
  Constraints.MaxWidth = 820
  Constraints.MinHeight = 360
  Constraints.MinWidth = 820
  OnShow = FormShow
  ExplicitWidth = 820
  ExplicitHeight = 360
  TextHeight = 20
  inherited pnlFundo: TPanel
    Width = 820
    Height = 360
    ExplicitWidth = 950
    ExplicitHeight = 366
    inherited pnlTitulo: TJvPanel
      Width = 810
      Caption = 'Regras de Seguran'#231'a'
      ExplicitWidth = 940
      inherited btnClose: TAeroSpeedButton
        Left = 772
        ExplicitLeft = 902
      end
    end
    inherited pnlBotoes: TJvPanel
      Top = 302
      Width = 810
      ExplicitTop = 308
      ExplicitWidth = 940
      inherited btnLocalizar: TAeroSpeedButton
        Left = 757
        Visible = False
        ExplicitLeft = 887
      end
      inherited btnExcluir: TAeroSpeedButton
        Left = 673
        Visible = False
        ExplicitLeft = 803
      end
      inherited btnSalvar: TAeroSpeedButton
        Left = 442
        Width = 225
        Caption = 'Confirmar'
        ExplicitLeft = 569
        ExplicitTop = 3
        ExplicitWidth = 225
      end
      inherited btnInserir: TAeroSpeedButton
        Left = 386
        Visible = False
        ExplicitLeft = 516
      end
      inherited pnlDivisor: TPanel
        Left = 729
        ExplicitLeft = 859
      end
    end
    object grpRegrasSenha: TAdvGroupBox
      AlignWithMargins = True
      Left = 411
      Top = 51
      Width = 400
      Height = 245
      BorderColor = 15000546
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -12
      CaptionFont.Name = 'Segoe UI'
      CaptionFont.Style = []
      CheckBox.Action = caControlsDisable
      CheckBox.Visible = True
      Align = alLeft
      Caption = 'Habilitar regras de senhas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = True
      ParentFont = False
      TabOrder = 2
      UIStyle = tsWindows10
      object Label1: TLabel
        Left = 10
        Top = 32
        Width = 315
        Height = 20
        AutoSize = False
        Caption = 'Quantidade m'#237'nima de caracteres:'
      end
      object Label2: TLabel
        Left = 10
        Top = 68
        Width = 315
        Height = 20
        AutoSize = False
        Caption = 'Quantidade m'#225'xima de caracteres:'
      end
      object Label3: TLabel
        Left = 10
        Top = 104
        Width = 315
        Height = 20
        AutoSize = False
        Caption = 'Quantidade m'#237'nima de caracteres num'#233'ricos:'
      end
      object Label4: TLabel
        Left = 10
        Top = 140
        Width = 315
        Height = 20
        AutoSize = False
        Caption = 'Quantidade m'#237'nima de caracteres mai'#250'sculas:'
      end
      object Label5: TLabel
        Left = 10
        Top = 176
        Width = 315
        Height = 20
        AutoSize = False
        Caption = 'Quantidade m'#237'nima de caracteres min'#250'sculas:'
      end
      object Label6: TLabel
        Left = 10
        Top = 212
        Width = 315
        Height = 20
        AutoSize = False
        Caption = 'Quantidade m'#237'nima de caracteres especiais:'
      end
      object spMinimoCaracter: TSpinEdit
        Left = 331
        Top = 27
        Width = 57
        Height = 30
        MaxValue = 30
        MinValue = 6
        TabOrder = 0
        Value = 6
      end
      object spMaximoCaracter: TSpinEdit
        Left = 331
        Top = 63
        Width = 57
        Height = 30
        MaxValue = 50
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
      object spMinimoNumerico: TSpinEdit
        Left = 331
        Top = 99
        Width = 57
        Height = 30
        MaxValue = 30
        MinValue = 1
        TabOrder = 2
        Value = 1
      end
      object spMinimoMaisculo: TSpinEdit
        Left = 331
        Top = 135
        Width = 57
        Height = 30
        MaxValue = 30
        MinValue = 1
        TabOrder = 3
        Value = 1
      end
      object spMinimoMinusculo: TSpinEdit
        Left = 331
        Top = 171
        Width = 57
        Height = 30
        MaxValue = 30
        MinValue = 1
        TabOrder = 4
        Value = 1
      end
      object spMinimoEspecial: TSpinEdit
        Left = 331
        Top = 207
        Width = 57
        Height = 30
        MaxValue = 30
        MinValue = 1
        TabOrder = 5
        Value = 1
      end
    end
    object grpRegrasBloqueio: TAdvGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 51
      Width = 400
      Height = 245
      BorderColor = 15000546
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -12
      CaptionFont.Name = 'Segoe UI'
      CaptionFont.Style = []
      CheckBox.Action = caControlsDisable
      CheckBox.Visible = True
      Align = alLeft
      Caption = 'Habilitar regras de bloqueio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = True
      ParentFont = False
      TabOrder = 3
      OnCheckBoxClick = grpRegrasBloqueioCheckBoxClick
      UIStyle = tsWindows10
      object Label7: TLabel
        Left = 10
        Top = 32
        Width = 315
        Height = 20
        AutoSize = False
        Caption = 'Quantidade m'#225'xima de re-tentativas:'
      end
      object Label8: TLabel
        Left = 10
        Top = 68
        Width = 315
        Height = 20
        AutoSize = False
        Caption = 'Per'#237'odo m'#225'ximo de inatividade (dias):'
      end
      object Label9: TLabel
        Left = 10
        Top = 104
        Width = 315
        Height = 20
        AutoSize = False
        Caption = 'Per'#237'odo de expira'#231#227'o de senhas (dias):'
      end
      object Label10: TLabel
        Left = 10
        Top = 140
        Width = 315
        Height = 20
        AutoSize = False
        Caption = 'Quantidade de senhas observadas no hist'#243'rico:'
      end
      object spRetentativa: TSpinEdit
        Left = 331
        Top = 27
        Width = 57
        Height = 30
        MaxValue = 10
        MinValue = 3
        TabOrder = 0
        Value = 3
      end
      object spInatividade: TSpinEdit
        Left = 331
        Top = 63
        Width = 57
        Height = 30
        MaxValue = 60
        MinValue = 15
        TabOrder = 1
        Value = 15
      end
      object spExpiracao: TSpinEdit
        Left = 331
        Top = 99
        Width = 57
        Height = 30
        MaxValue = 90
        MinValue = 30
        TabOrder = 2
        Value = 30
      end
      object spHistorico: TSpinEdit
        Left = 331
        Top = 135
        Width = 57
        Height = 30
        MaxValue = 10
        MinValue = 3
        TabOrder = 3
        Value = 3
      end
    end
  end
end
