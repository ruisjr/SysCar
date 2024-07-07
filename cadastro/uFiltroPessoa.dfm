inherited frmFiltroPessoa: TfrmFiltroPessoa
  Caption = 'Filtro de pessoas'
  TextHeight = 20
  inherited pnlFundo: TPanel
    inherited pnlTitulo: TJvPanel
      Caption = 'Filtrar'
    end
    inherited gbxOpcoes: TJvGroupBox
      inherited cbxFiltro: TAdvComboBox
        OnChange = cbxFiltroChange
      end
      inherited edtPesquisa: TAdvEdit
        OnKeyUp = edtPesquisaKeyUp
      end
      inherited edtLimite: TAdvEdit
        OnKeyUp = edtPesquisaKeyUp
      end
    end
    inherited grdFiltro: TDBAdvGrid
      ColCount = 2
      Font.Color = clBlack
      ParentFont = False
      FixedColWidth = 99
      Columns = <
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          ButtonHeight = 18
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -15
          HeaderFont.Name = 'Segoe UI'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -15
          PrintFont.Name = 'Segoe UI'
          PrintFont.Style = []
          Width = 99
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          ButtonHeight = 18
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -15
          HeaderFont.Name = 'Segoe UI'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clBlack
          PrintFont.Height = -15
          PrintFont.Name = 'Segoe UI'
          PrintFont.Style = []
          Width = 200
        end>
      ColWidths = (
        99
        200)
      RowHeights = (
        25
        25)
    end
  end
end
