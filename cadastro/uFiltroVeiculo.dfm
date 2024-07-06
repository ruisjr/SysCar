inherited FrmFiltroVeiculo: TFrmFiltroVeiculo
  Caption = 'Filtrar por Ve'#237'culos'
  TextHeight = 20
  inherited pnlFundo: TPanel
    inherited pnlTitulo: TJvPanel
      Caption = 'Filtrar por Ve'#237'culos'
    end
    inherited gbxOpcoes: TJvGroupBox
      inherited edtPesquisa: TAdvEdit
        OnKeyUp = edtPesquisaKeyUp
      end
    end
  end
end
