inherited frmFiltroPessoa: TfrmFiltroPessoa
  Caption = 'Filtro de pessoas'
  TextHeight = 20
  inherited pnlFundo: TPanel
    inherited pnlTitulo: TJvPanel
      Caption = 'Filtrar'
    end
    inherited grdFiltro: TJvDBGrid
      Font.Color = clBlack
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'id'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Width = 200
          Visible = True
        end>
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
  end
end
