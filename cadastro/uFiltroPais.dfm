inherited FrmFiltroPais: TFrmFiltroPais
  Caption = 'Filtro'
  TextHeight = 20
  inherited pnlFundo: TPanel
    inherited gbxOpcoes: TJvGroupBox
      inherited edtPesquisa: TAdvEdit
        OnKeyUp = edtPesquisaKeyUp
      end
    end
  end
end
