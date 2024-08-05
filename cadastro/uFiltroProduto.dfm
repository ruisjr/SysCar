inherited frmFiltroProduto: TfrmFiltroProduto
  Caption = 'Filtro por Produto'
  TextHeight = 20
  inherited pnlFundo: TPanel
    inherited gbxOpcoes: TJvGroupBox
      inherited edtPesquisa: TAdvEdit
        OnKeyUp = edtPesquisaKeyUp
      end
    end
    inherited grdFiltro: TDBAdvGrid
      ColCount = 5
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
          HeaderFont.Color = clBlack
          HeaderFont.Height = -12
          HeaderFont.Name = 'Segoe UI'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = 'Segoe UI'
          PrintFont.Style = []
          Width = 20
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
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          Header = 'C'#243'digo'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -15
          HeaderFont.Name = 'Segoe UI'
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          Name = 'id'
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
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
          FieldName = 'codigo_barra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          Header = 'C'#243'digo de Barra'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -15
          HeaderFont.Name = 'Segoe UI'
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          Name = 'codigo_barra'
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWhite
          PrintFont.Height = -15
          PrintFont.Name = 'Segoe UI'
          PrintFont.Style = []
          Width = 150
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
          Header = 'Nome'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -15
          HeaderFont.Name = 'Segoe UI'
          HeaderFont.Style = []
          Name = 'nome'
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWhite
          PrintFont.Height = -15
          PrintFont.Name = 'Segoe UI'
          PrintFont.Style = []
          Width = 350
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          ButtonHeight = 18
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditMask = '#,##0.00'
          Editor = edFloat
          FieldName = 'preco_unit'
          FloatFormat = '%.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          Header = 'Pre'#231'o Unit'#225'rio'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -15
          HeaderFont.Name = 'Segoe UI'
          HeaderFont.Style = []
          Name = 'preco_unit'
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWhite
          PrintFont.Height = -15
          PrintFont.Name = 'Segoe UI'
          PrintFont.Style = []
          Width = 150
        end>
      ColWidths = (
        20
        100
        150
        350
        150)
    end
  end
end
