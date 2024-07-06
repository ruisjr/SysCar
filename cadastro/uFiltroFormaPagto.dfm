inherited FrmFiltroFormaPagto: TFrmFiltroFormaPagto
  Caption = 'Filtro'
  TextHeight = 20
  inherited pnlFundo: TPanel
    inherited grdFiltro: TJvDBGrid
      AutoAppend = True
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Title.Caption = 'Nome'
          Width = 200
          Visible = True
        end>
    end
    inherited gbxOpcoes: TJvGroupBox
      inherited edtPesquisa: TAdvEdit
        OnKeyUp = edtPesquisaKeyUp
      end
    end
  end
end
