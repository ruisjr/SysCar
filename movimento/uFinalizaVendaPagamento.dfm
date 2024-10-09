inherited frmFinalizaVendaPagamento: TfrmFinalizaVendaPagamento
  Caption = 'Pagamentos'
  TextHeight = 20
  inherited pnlFundo: TPanel
    inherited pnlTitulo: TJvPanel
      Caption = 'Pagamentos'
    end
    object Panel2: TPanel
      Left = 2
      Top = 48
      Width = 511
      Height = 360
      Align = alLeft
      Caption = 'Panel2'
      TabOrder = 2
    end
  end
  object DSPagamentos: TDataSource
    DataSet = cdsPagamentos
    Left = 385
    Top = 196
  end
  object cdsPagamentos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'valor'
        DataType = ftFloat
        Precision = 2
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 353
    Top = 196
    object cdsPagamentosid: TIntegerField
      FieldName = 'id'
    end
    object cdsPagamentosnome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object cdsPagamentosvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
end
