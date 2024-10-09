unit uFinalizaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.StdCtrls, AdvEdit, AdvNavBar,
  AdvSmoothListBox, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Data.DB, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvExStdCtrls, JvGroupBox,
  AdvGlowButton, System.Generics.Collections, Datasnap.DBClient, Datasnap.Provider,Vcl.Menus, AdvMenus,
  { Classes de negpocio }
  SimpleInterface, SimpleDao, uFormaPagamento, ucMovimento, uLancamento, uProduto;

type
  TFrmFinalizaVenda = class(TForm)
    pnlFundo: TPanel;
    pnlTitulo: TJvPanel;
    btnClose: TAeroSpeedButton;
    pnlBotoes: TJvPanel;
    btnFinalizar: TAeroSpeedButton;
    pnlValores: TPanel;
    pnlTempoDecorrido: TJvGroupBox;
    cdsPagamentos: TClientDataSet;
    DSPagamentos: TDataSource;
    cdsPagamentosid: TIntegerField;
    cdsPagamentosnome: TStringField;
    cdsPagamentosvalor: TFloatField;
    Label7: TLabel;
    Label9: TLabel;
    lblEntrada: TLabel;
    lblSaida: TLabel;
    Label6: TLabel;
    lblTicket: TLabel;
    ppmMenuLateral: TAdvPopupMenu;
    mnInserirPagamento: TMenuItem;
    mnExcluirPagamento: TMenuItem;
    cdsProdutos: TClientDataSet;
    id: TIntegerField;
    nome_reduzido: TStringField;
    preco_unit: TFloatField;
    dsProdutos: TDataSource;
    pnlLateralEsquerda: TPanel;
    GroupBox1: TGroupBox;
    grdProduto: TJvDBGrid;
    pnlCliente: TPanel;
    lblNomeCliente: TLabel;
    edtCodigoMensalista: TAdvEdit;
    pnlNomeMensalista: TPanel;
    btnConsultaCliente: TAdvGlowButton;
    quantidade: TIntegerField;
    Panel3: TPanel;
    btnRemoverProduto: TAdvGlowButton;
    lblTempoTotal: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    JvGroupBox1: TJvGroupBox;
    lblTotalPagar: TLabel;
    JvGroupBox2: TJvGroupBox;
    lblTotalServicos: TLabel;
    JvGroupBox3: TJvGroupBox;
    lblTotalProdutos: TLabel;
    tipo: TIntegerField;
    cdsProdutostotal: TFloatField;
    btnAdicionarProduto: TAdvGlowButton;
    procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConsultaClienteClick(Sender: TObject);
    procedure grdPagamentosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnMenuPagamentoClick(Sender: TObject);
    procedure cdsProdutosCalcFields(DataSet: TDataSet);
    procedure btnAdicionarProdutoClick(Sender: TObject);
    procedure edtCodigoMensalistaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRemoverProdutoClick(Sender: TObject);
  private
    { Private declarations }
    DAOMov: iSimpleDao<TMovimento>;
    DAOProduto: iSimpleDAO<TProduto>;
    DSFP: TDataSource;
    Ticket: Integer;

    { Procedimentos }
    procedure PesquisaMensalista(aCodigo: Integer; aSendMsg: Boolean = False);
    procedure CarregarProdutos(aIdProduto: Integer; aQuantidade: Integer);
    procedure AtualizarPagamentos;
    procedure CalcularTotais;
    procedure CalcularProdutos;
    procedure InserirLancamento(oMovimento: TMovimento);
    procedure InserirPagamento(aFormaPagamento: String; aValor: Currency);
    procedure AtualizarBaixa(aHoraEntrada, aDataEntrada: TDateTime; aHoraSaida, aDataSaida: TDateTime);
  public
    { Public declarations }

    { Construtores e Destrutores }
    constructor Create(AWoner: TComponent; aTicket: Integer);
  end;

var
  FrmFinalizaVenda: TFrmFinalizaVenda;

implementation

{$R *.dfm}

uses
    uDataModule, uPessoa, uCallForm, uUtil, uFinalizaVendaFormaPagto, DateUtils, uLogs;

procedure TFrmFinalizaVenda.btnAdicionarProdutoClick(Sender: TObject);
var
   aCodProduto: Integer;
   oProduto: TProduto;
begin
    TCallForm.CallFormPesq('TfrmVendaProduto', 'Consulta de Produto', aCodProduto);
    if aCodProduto > 0 then
    begin
        oProduto := DAOProduto.Find(aCodProduto);
        try
            cdsProdutos.Append;
            cdsProdutos.FieldByName('id').AsInteger := oProduto.ID;
            cdsProdutos.FieldByName('nome_reduzido').AsString := oProduto.NomeReduzido;
            cdsProdutos.FieldByName('quantidade').AsInteger := 1;
            cdsProdutos.FieldByName('preco_unit').AsFloat := oProduto.PrecoUnitario;
            cdsProdutos.FieldByName('tipo').AsInteger := oProduto.Tipo;
            cdsProdutos.Post;

            CalcularProdutos;
        finally
            oProduto.Free;
        end;
    end;
end;

procedure TFrmFinalizaVenda.AtualizarBaixa(aHoraEntrada, aDataEntrada: TDateTime; aHoraSaida, aDataSaida: TDateTime);
var
    aDataEntradaComp: TDateTime;
    aDataSaidaComp: TDateTime;
    aDias, aHoras: Integer;

    function getDiaExtenso(aDias: Integer): String;
    begin
        Result := IntToStr(aDias) + ' Dia ';
        if aDias > 1 then
            Result := IntToStr(aDias) + ' Dias ';
    end;

    function getMinutoExtenso(aMinutos: Integer):String;
    begin
        Result := IntToStr(aMinutos) + ' Minuto ';
        if aMinutos > 1 then
            Result := IntToStr(aMinutos) + ' Minutos ';
    end;

    function getHoraExtenso(aHoras: Integer): String;
    begin
        Result := IntToStr(aHoras) + ' Hora ';
        if aHoras > 1 then
            Result := IntToStr(aHoras) + ' Horas ';
    end;
begin
    aDataEntradaComp := aDataEntrada + aHoraEntrada;
    aDataSaidaComp := aDataSaida + aHoraSaida;
    aDias := (DaysBetween(aDataSaidaComp, aDataEntradaComp));
    aHoras := HoursBetween(IncDay(aDataSaidaComp, -aDias), aDataEntradaComp);

    if DaysBetween(aDataSaidaComp, aDataEntradaComp) > 0 then
    begin
        lblTempoTotal.Caption := getDiaExtenso(aDias) +
                                 getHoraExtenso(aHoras) +
                                 getMinutoExtenso(MinutesBetween(IncHour(IncDay(aDataSaidaComp, -aDias),-aHoras), aDataEntradaComp));
    end
    else if HoursBetween(aDataSaidaComp, aDataEntradaComp) > 0 then
        lblTempoTotal.Caption := getHoraExtenso(aHoras) +
                                 getMinutoExtenso(MinutesBetween(IncDay(aDataSaidaComp, -aHoras), aDataEntradaComp))
    else
        lblTempoTotal.Caption := getMinutoExtenso(MinutesBetween(aDataSaidaComp, aDataEntradaComp));
end;

procedure TFrmFinalizaVenda.AtualizarPagamentos;
var
    DAOMovimento: iSimpleDao<TMovimento>;
    oMovimento: TMovimento;
    aDataSai: TDateTime;
begin
    DAOMovimento := TSimpleDao<TMovimento>.New(DM.GetConn);
    oMovimento := DAOMovimento.Find('ticket = ' + self.Ticket.ToString);
    try
        aDataSai := Now;
        lblTicket.Caption := oMovimento.Ticket.ToString;
        lblEntrada.Caption := DateToStr(oMovimento.DataEntrada) + ' - ' + TimeToStr(oMovimento.HoraEntrada);
        lblSaida.Caption := DateToStr(aDataSai) + ' - ' + TimeToStr(aDataSai);
        lblTempoTotal.Caption := Formatdatetime('dd/mm/yy hh:mm:ss', oMovimento.DataEntrada + oMovimento.HOraEntrada);

        AtualizarBaixa(oMovimento.HoraEntrada, oMovimento.DataEntrada, aDataSai.GetTime, aDataSai.GetDate);
    finally
        oMovimento.Free;
    end;
end;

procedure TFrmFinalizaVenda.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmFinalizaVenda.btnConsultaClienteClick(Sender: TObject);
var
    aRetorno: Integer;
begin
    TCallForm.CallFormPesq('TfrmFiltroPessoa', 'Mensalista', aRetorno);
    PesquisaMensalista(aRetorno)
end;

procedure TFrmFinalizaVenda.btnFinalizarClick(Sender: TObject);
var
    oMovimento: TMovimento;
    aRetorno: Integer;
begin
    TCallForm.CallFormPesq('TfrmFinalizaVendaPagamento', 'Pagamento', aRetorno);
//    DAOMov := TSimpleDao<TMovimento>.New(DM.GetConn);
//    oMovimento := DAOMov.Find('ticket = ' + lblTicket.Caption);
//    try
//        try
//            oMovimento.DataSaida := Now.GetDate;
//            oMovimento.HoraSaida := Now.GetTime;
//            oMovimento.Situacao := 'F';
//
//            { Realiza os Movimentos Financeiros }
//            InserirLancamento(oMovimento);
//            DaoMov.Update(oMovimento);
//        except
//            On E: Exception do
//            begin
//                ErrorMessage(self.Caption, 'Não foi possível finalizar a venda de número: ' + lblTicket.Caption + '.' + #13+#10 + 'Motivo: ' + E.Message);
//                abort;
//            end;
//        end;
//    finally
//        oMovimento.Free;
//    end;
//
//    Close;
end;

procedure TFrmFinalizaVenda.btnMenuPagamentoClick(Sender: TObject);
begin
    SubMenuPopUp(Sender, ppmMenuLateral);
end;

procedure TFrmFinalizaVenda.btnRemoverProdutoClick(Sender: TObject);
begin
    if cdsProdutos.FieldByName('id').AsInteger > 0 then
    begin
        if QuestionMessage(self.Caption, Format('Deseja remover o produto %s?', [cdsProdutos.FieldByName('nome_reduzido').AsString])) = RET_YES then
        begin
            cdsProdutos.Delete;
            cdsProdutos.Post;
        end;
    end;
end;

procedure TFrmFinalizaVenda.CalcularProdutos;
var
    aTotalGeral,
    aTotalProdutos,
    aTotalServicos: Currency;
begin
    aTotalProdutos := 0;
    aTotalServicos := 0;
    aTotalGeral := 0;

    cdsProdutos.DisableControls;
    try
        cdsProdutos.First;
        while not cdsProdutos.Eof do
        begin
            if cdsProdutos.FieldByName('tipo').AsInteger = 0 then
                aTotalProdutos := aTotalProdutos + (cdsProdutos.FieldByName('total').AsFloat)
            else
                aTotalServicos := aTotalServicos + cdsProdutos.FieldByName('total').AsFloat;

            aTotalGeral := aTotalGeral + cdsProdutos.FieldByName('total').AsFloat;
            cdsProdutos.Next;
        end;
    finally
        cdsProdutos.EnableControls;
    end;

    lblTotalServicos.Caption := FloatToStrF(aTotalServicos, ffCurrency, 10, 2);
    lblTotalProdutos.Caption := FloatToStrF(aTotalProdutos, ffCurrency, 10, 2);

end;

procedure TFrmFinalizaVenda.CalcularTotais;
var
    oProduto: TProduto;
    DAOProduto: iSimpleDao<TProduto>;
    aDias,
    aHoras,
    aMinutos: Integer;
begin
    DAOProduto := TSimpleDao<TProduto>.New(DM.GetConn);
    try
        if DaysBetween(Now, StrToDateTime(lblEntrada.Caption)) = 0 then
        begin
            oProduto := DAOProduto.Find('tipo = 1 AND unidade_medida = ' + QuotedStr('H'));
            aHoras := HoursBetween(Now, StrToDateTime(lblEntrada.Caption));
            lblTotalPagar.Caption := FloatToStrF(aHoras * oProduto.PrecoUnitario, ffCurrency, 10, 2);

            CarregarProdutos(oProduto.ID, aHoras);
        end
        else
        begin
            oProduto := DAOProduto.Find('tipo = 1 AND unidade_medida = ' + QuotedStr('DIA'));
            aDias := DaysBetween(Now, StrToDateTime(lblEntrada.Caption));
            aMinutos := MinutesBetween(Now, StrToDateTime(lblEntrada.Caption));

            if aMinutos <= oProduto.Tolerancia then
                lblTotalpagar.Caption := '0,00'
            else
                lblTotalpagar.Caption := FloatToStrF(aDias * oProduto.PrecoUnitario, ffCurrency, 10, 2);

            CarregarProdutos(oProduto.ID, aDias);
        end;

        CalcularProdutos;
    finally
        if Assigned(oProduto) then
            oProduto.Free;
    end;
end;

procedure TFrmFinalizaVenda.CarregarProdutos(aIdProduto: Integer; aQuantidade: Integer);
var
    ix: Integer;
    oLista: TObjectList<TProduto>;
begin
    oLista := TObjectList<TProduto>.Create;
    try
        cdsProdutos.CreateDataSet;

        DAOProduto.SQL.Fields('id, nome_reduzido, preco_unit, tipo').Where('ativo = True AND id = ' + IntToStr(aIdProduto)).OrderBy('id ASC').&End.Find(oLista);
        for ix := 0 to oLista.Count -1 do
        begin
            with cdsProdutos do
            begin
                DisableControls;
                try
                    Append;
                    FieldByName('id').AsInteger := oLista[ix].ID;
                    FieldByName('nome_reduzido').AsString := oLista[ix].NomeReduzido;
                    FieldByName('quantidade').AsInteger := aQuantidade;
                    FieldByName('preco_unit').AsFloat := oLista[ix].PrecoUnitario;
                    FieldByName('tipo').AsInteger := oLista[ix].Tipo;
                    Post;
                finally
                    EnableControls;
                end;
            end;
        end;

        cdsProdutos.Open;
    finally
        FreeAndNil(oLista);
    end;
end;

procedure TFrmFinalizaVenda.cdsProdutosCalcFields(DataSet: TDataSet);
begin
    DataSet.FieldByName('total').AsFloat := DataSet.FieldByName('quantidade').AsFloat * DataSet.FieldByName('preco_unit').AsFloat;
end;

constructor TFrmFinalizaVenda.Create(AWoner: TComponent; aTicket: Integer);
begin
    inherited Create(AWoner);
    self.Ticket := aTicket;
end;

procedure TFrmFinalizaVenda.FormCreate(Sender: TObject);
begin
    DAOProduto := TSimpleDao<TProduto>.New(DM.GetConn);

    AtualizarPagamentos;
    CalcularTotais;
end;

procedure TFrmFinalizaVenda.FormDestroy(Sender: TObject);
begin
    FreeAndNil(DSFP);
end;

procedure TFrmFinalizaVenda.grdPagamentosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = VK_DELETE then
    begin
        if QuestionMessage('Exclusão de Pagamento', 'Deseja excluir a forma de pagamento ' + cdsPagamentos.FieldByName('nome').AsString + '?') = RET_YES then
        begin
            cdsPagamentos.Delete;
        end;
    end;
end;

procedure TFrmFinalizaVenda.InserirLancamento(oMovimento: TMovimento);
var
    oLancamento: TLancamento;
    oLancamentoProduto: TLancamentoProduto;

    DaoLancamento: iSimpleDao<TLancamento>;
    DaoLancamentoProduto: iSimpleDao<TLancamentoProduto>;
begin

    DaoLancamento := TSimpleDao<TLancamento>.New(DM.GetConn);
    DaoLancamentoProduto := TSimpleDao<TLancamentoProduto>.New(DM.GetConn);

    oLancamento := TLancamento.Create;
    oLancamentoProduto := TLancamentoProduto.Create;
    try
        { Inclusão do Lançamento da Venda }
        oLancamento.Data := Now;
        oLancamento.Documento := oMovimento.Ticket.ToString;
        oLancamento.Movimento := oMovimento.ID;
        oLancamento.Tipo := LANC_TIPO_ENTRADA;
        DaoLancamento.Insert(oLancamento);
        oLancamento := DaoLancamento.Find('movimento = ' + oMovimento.ID.ToString + ' AND data = ' + QuotedStr(DateTimeToStr(oLancamento.Data)));

        { Lançamento dos Produtos da Venda }
        oLancamentoProduto := TLancamentoProduto.Create;
        cdsProdutos.DisableControls;
        try
            with cdsProdutos do
            begin
                while not Eof do
                begin
                    oLancamentoProduto.ID := FieldByName('id').AsInteger;
                    oLancamentoProduto.Lancamento := oLancamento.ID;
                    oLancamentoProduto.Valor := FieldByName('preco_unit').AsFloat * FieldByName('quantidade').AsFloat;
                    oLancamentoProduto.PrecoUnitario := FieldByName('preco_unit').AsFloat;
                    oLancamentoProduto.Produto := FieldByName('id').AsInteger;
                    DaoLancamentoProduto.Insert(oLancamentoProduto);
                    Next;
                end;
            end;
        finally
            cdsProdutos.EnableControls;
        end;
    finally
        oLancamentoProduto.Free;
        oLancamento.Free;
    end;
end;

procedure TFrmFinalizaVenda.InserirPagamento(aFormaPagamento: String; aValor: Currency);
//var
//    Frm: TfrmFinalizaVendaFormaPagto;
begin
//    Frm := TfrmFinalizaVendaFormaPagto.Create(nil, aFormaPagamento, aValor);
//    try
//        Frm.ShowModal;
//        if Frm.Valor > 0 then
//        begin
//            with cdsPagamentos do
//            begin
//                DisableControls;
//                try
//                    Append;
//                    FieldByName('id').AsInteger := Frm.FormaPagtoId;
//                    FieldByName('nome').AsString := Frm.FormaPagtoNome;
//                    FieldByName('valor').AsFloat := Frm.Valor;
//                    Post;
//                finally
//                    EnableControls;
//                end;
//            end;
//        end;
//    finally
//        FreeAndNil(Frm);
//    end;
end;

procedure TFrmFinalizaVenda.PesquisaMensalista(aCodigo: Integer; aSendMsg: Boolean = False);
var
    DaoPessoa: iSimpleDao<TPessoa>;
    oMensalista: TPessoa;
begin
    if aCodigo > 0 then
    begin
        DaoPessoa := TSimpleDao<TPessoa>.New(DM.GetConn);
        oMensalista := DaoPessoa.Find(aCodigo);
        try
            if (oMensalista.Id = 0) and aSendMsg then
            begin
                InfoMessage('Finaliza Venda', 'Cliente não encontrado para finalizar a venda');
            end;

            edtCodigoMensalista.Text := oMensalista.Id.ToString;
            pnlNomeMensalista.Caption := oMensalista.Nome;
        finally
            oMensalista.Free;
        end;
    end
    else
    begin
        edtCodigoMensalista.Text := '';
        pnlNomeMensalista.Caption := '';
    end;
end;

procedure TFrmFinalizaVenda.edtCodigoMensalistaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
    aRetorno: Integer;
begin
    if key = VK_RETURN then
    begin
        TCallForm.CallFormPesq('TfrmFiltroPessoa', 'Mensalista', aRetorno);
        PesquisaMensalista(aRetorno, True);
    end;
end;

procedure TFrmFinalizaVenda.pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
    ReleaseCapture;
    Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
