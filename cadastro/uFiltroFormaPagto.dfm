inherited FrmFiltroFormaPagto: TFrmFiltroFormaPagto
  Caption = 'Filtro'
  TextHeight = 20
  inherited pnlFundo: TPanel
    inherited gbxOpcoes: TJvGroupBox
      inherited edtPesquisa: TAdvEdit
        OnKeyUp = edtPesquisaKeyUp
      end
    end
    inherited grdFiltro: TDBAdvGrid
      FixedColWidth = 15
      FixedRowHeight = 30
      Columns = <
        item
          Borders = []
          BorderPen.Color = clSilver
          ButtonHeight = 18
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWhite
          HeaderFont.Height = -17
          HeaderFont.Name = 'Segoe UI'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWhite
          PrintFont.Height = -15
          PrintFont.Name = 'Segoe UI'
          PrintFont.Style = []
          Width = 15
        end
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
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Header = 'C'#243'digo'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -17
          HeaderFont.Name = 'Segoe UI'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWhite
          PrintFont.Height = -15
          PrintFont.Name = 'Segoe UI'
          PrintFont.Style = []
          Width = 100
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
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Header = 'Nome'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -17
          HeaderFont.Name = 'Segoe UI'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWhite
          PrintFont.Height = -15
          PrintFont.Name = 'Segoe UI'
          PrintFont.Style = []
          Width = 250
        end>
      ColWidths = (
        15
        100
        250)
      RowHeights = (
        30
        25)
    end
  end
end
