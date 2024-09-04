inherited frmCadRegrasSeguranca: TfrmCadRegrasSeguranca
  Caption = 'Regras de Seguran'#231'a'
  TextHeight = 20
  inherited pnlFundo: TPanel
    inherited pnlTitulo: TJvPanel
      Caption = 'Regras de Seguran'#231'a'
    end
    inherited pnlBotoes: TJvPanel
      inherited btnLocalizar: TAeroSpeedButton
        Visible = False
      end
      inherited pnlDivisor: TPanel
        Visible = False
      end
    end
    object tvPerfil: TTreeView
      AlignWithMargins = True
      Left = 5
      Top = 51
      Width = 195
      Height = 354
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Indent = 19
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Items.NodeData = {
        0301000000380000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0000000000010D410044004D0049004E004900530054005200410044004F0052
        00}
    end
  end
end
