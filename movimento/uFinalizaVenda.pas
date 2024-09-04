unit uFinalizaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.StdCtrls, AdvEdit, AdvNavBar,
  AdvSmoothListBox, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Data.DB, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvExStdCtrls, JvGroupBox,
  AdvGlowButton, System.Generics.Collections, Datasnap.DBClient, Datasnap.Provider,Vcl.Menus, AdvMenus,
  { Classes de negpocio }
  SimpleInterface, SimpleDao, uFormaPagamento, ucMovimento, uLancamento;

type
  TFrmFinalizaVenda = class(TForm)
    pnlFundo: TPanel;
    pnlTitulo: TJvPanel;
    btnClose: TAeroSpeedButton;
    pnlBotoes: TJvPanel;
    btnFinalizar: TAeroSpeedButton;
    pnlValores: TPanel;
    Panel7: TPanel;
    Label8: TLabel;
    edtTotalpagar: TAdvEdit;
    Panel6: TPanel;
    Label2: TLabel;
    edtValorDesconto: TAdvEdit;
    Panel8: TPanel;
    lblTroco: TLabel;
    edtTroco: TAdvEdit;
    JvGroupBox1: TJvGroupBox;
    edtPercentualDesconto: TAdvEdit;
    Label4: TLabel;
    Label5: TLabel;
    cdsPagamentos: TClientDataSet;
    DSPagamentos: TDataSource;
    cdsPagamentosid: TIntegerField;
    cdsPagamentosnome: TStringField;
    cdsPagamentosvalor: TFloatField;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblEntrada: TLabel;
    lblSaida: TLabel;
    lblTempoTotal: TLabel;
    Label6: TLabel;
    lblTicket: TLabel;
    ppmMenuLateral: TAdvPopupMenu;
    mnInserirPagamento: TMenuItem;
    mnExcluirPagamento: TMenuItem;
    cdsProdutos: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    dsProdutos: TDataSource;
    pnlLateralEsquerda: TPanel;
    GroupBox1: TGroupBox;
    grdProduto: TJvDBGrid;
    GroupBox2: TGroupBox;
    pnlFormaPagamento: TPanel;
    slbFormaPagamento: TAdvSmoothListBox;
    pnlPagamentosRealizados: TPanel;
    grdPagamentos: TJvDBGrid;
    Panel1: TPanel;
    btnMenuPagamento: TAdvGlowButton;
    pnlCliente: TPanel;
    Label1: TLabel;
    edtCodigoMensalista: TAdvEdit;
    pnlNomeMensalista: TPanel;
    btnConsultaCliente: TAdvGlowButton;
    Panel2: TPanel;
    lblSaldoPagar: TLabel;
    edtSaldoPagar: TAdvEdit;
    cdsProdutosquantidade: TIntegerField;
    Panel3: TPanel;
    btnIncluirProduto: TAdvGlowButton;
    ppmMenuProdutos: TAdvPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure edtValorDescontoChange(Sender: TObject);
    procedure edtPercentualDescontoChange(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConsultaClienteClick(Sender: TObject);
    procedure edtCodigoMensalistaKeyPress(Sender: TObject; var Key: Char);
    procedure slbFormaPagamentoDblClick(Sender: TObject);
    procedure grdPagamentosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnMenuPagamentoClick(Sender: TObject);
    procedure mnInserirPagamentoClick(Sender: TObject);
    procedure cdsPagamentosAfterPost(DataSet: TDataSet);
    procedure btnIncluirProdutoClick(Sender: TObject);
  private
    { Private declarations }
    DAO: iSimpleDao<TFormaPagamento>;
    DAOMov: iSimpleDao<TMovimento>;
    DSFP: TDataSource;
    Ticket: Integer;

    { Procedimentos }
    procedure PesquisaMensalista(aCodigo: Integer; aSendMsg: Boolean = False);
    procedure CarregarFormasPagamento;
    procedure CarregarProdutos(aIdProduto: Integer; aQuantidade: Integer);
    procedure AtualizarPagamentos;
    procedure CalcularTotais;
    procedure CalcularTroco;
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
    uDataModule, uPessoa, uCallForm, uUtil, uFinalizaVendaFormaPagto, DateUtils, uProduto, uLogs;

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
begin
    DAOMov := TSimpleDao<TMovimento>.New(DM.GetConn);
    oMovimento := DAOMov.Find('ticket = ' + lblTicket.Caption);
    try
        try
            oMovimento.DataSaida := Now.GetDate;
            oMovimento.HoraSaida := Now.GetTime;
            oMovimento.Situacao := 'F';

            { Realiza os Movimentos Financeiros }
            InserirLancamento(oMovimento);
            DaoMov.Update(oMovimento);
        except
            On E: Exception do
            begin
                ErrorMessage(self.Caption, 'Não foi possível finalizar a venda de número: ' + lblTicket.Caption + '.' + #13+#10 + 'Motivo: ' + E.Message);
                abort;
            end;
        end;
    finally
        oMovimento.Free;
    end;

    Close;
end;

procedure TFrmFinalizaVenda.btnIncluirProdutoClick(Sender: TObject);
begin
    SubMenuPopUp(Sender, ppmMenuProdutos);
end;

procedure TFrmFinalizaVenda.btnMenuPagamentoClick(Sender: TObject);
begin
    SubMenuPopUp(Sender, ppmMenuLateral);
end;

procedure TFrmFinalizaVenda.CalcularTroco;
var
    aTotal: Currency;
begin
    aTotal := 0;
    with cdsPagamentos do
    begin
        DisableControls;
        try
            First;
            while not Eof do
            begin
                aTotal := aTotal + FieldByName('valor').AsFloat;
                Next;
            end;
        finally
            EnableControls;
        end;
    end;
    if aTotal > StrToFloat(edtTotalpagar.Text) then
        edtTroco.Value := aTotal - StrToFloat(edtTotalpagar.Text);
end;

procedure TFrmFinalizaVenda.CalcularTotais;
var
    DAOProduto: iSimpleDao<TProduto>;
    oProduto: TProduto;
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
            edtTotalPagar.Value := aHoras * oProduto.PrecoUnitario;
            CarregarProdutos(oProduto.ID, aHoras);
        end
        else
        begin
            oProduto := DAOProduto.Find('tipo = 1 AND unidade_medida = ' + QuotedStr('DIA'));
            aDias := DaysBetween(Now, StrToDateTime(lblEntrada.Caption));
            aMinutos := MinutesBetween(Now, StrToDateTime(lblEntrada.Caption));

            if aMinutos <= oProduto.Tolerancia then
                edtTotalpagar.Value := 0
            else
                edtTotalPagar.Value := aDias * oProduto.PrecoUnitario;

            CarregarProdutos(oProduto.ID, aDias);
        end;
    finally
        if Assigned(oProduto) then
            oProduto.Free;
    end;
end;

procedure TFrmFinalizaVenda.CarregarFormasPagamento;
var
    ix: Integer;
    aName: String;
    oLista: TObjectList<TFormaPagamento>;
begin
    oLista := TObjectList<TFormaPagamento>.Create;
    try
        DSFP := TDataSource.Create(self);
        DAO := TSimpleDao<TFormaPagamento>.New(DM.GetConn).DataSource(DSFP);

        DAO.SQL.Fields('id, nome').Where('ativo = True').OrderBy('id ASC').&End.Find(oLista);
        slbFormaPagamento.Items.Clear;
        for ix := 0 to oLista.Count -1 do
        begin
            slbFormaPagamento.Items.Insert(ix);
            with slbFormaPagamento.Items[ix] do
            begin
                aName := oLista[ix].ID.ToString + ' - ' + oLista[ix].Nome;
                Caption := aName;
                DisplayName := aName;
                CaptionFont.Size := 12;
                CaptionSelectedFont.Size := 12;
                CaptionSelectedFont.Style := [TFontStyle.fsBold];
            end;
        end;

        cdsPagamentos.CreateDataSet;
        cdsPagamentos.Open;
    finally
        FreeAndNil(oLista);
    end;
end;

procedure TFrmFinalizaVenda.CarregarProdutos(aIdProduto: Integer; aQuantidade: Integer);
var
    ix: Integer;
    oLista: TObjectList<TProduto>;
    DaoProduto: iSimpleDao<TProduto>;
begin
    oLista := TObjectList<TProduto>.Create;
    try
        cdsProdutos.CreateDataSet;

        DAOProduto := TSimpleDao<TProduto>.New(DM.GetConn);

        DAOProduto.SQL.Fields('id, nome_reduzido, preco_unit').Where('ativo = True AND id = ' + IntToStr(aIdProduto)).OrderBy('id ASC').&End.Find(oLista);
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

procedure TFrmFinalizaVenda.cdsPagamentosAfterPost(DataSet: TDataSet);
begin
    CalcularTroco;
end;

constructor TFrmFinalizaVenda.Create(AWoner: TComponent; aTicket: Integer);
begin
    inherited Create(AWoner);
    self.Ticket := aTicket;
end;

procedure TFrmFinalizaVenda.edtValorDescontoChange(Sender: TObject);
var
    saldo:  Currency;
begin
    saldo := (StrToFloat(edtTotalpagar.Text) * StrToFloat(edtValorDesconto.Text)) / 100;
    edtSaldoPagar.Text := FloatToStr(StrToFloat(edtTotalPagar.Text) - saldo);

    edtPercentualDesconto.Text := FloatToStr((StrToFloat(edtValorDesconto.Text) / StrToFloat(edtTotalpagar.Text)) * 100);
end;

procedure TFrmFinalizaVenda.FormCreate(Sender: TObject);
begin
    CarregarFormasPagamento;
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
            edtSaldoPagar.Text := FloatToStr(StrToFloat(edtSaldoPagar.Text) - cdsPagamentos.FieldByName('valor').AsFloat);
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
        oLancamento.Valor := edtSaldoPagar.Value;
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
                    oLancamentoProduto.Desconto := (edtPercentualDesconto.Value * oLancamentoProduto.Valor) / 100;
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
var
    Frm: TfrmFinalizaVendaFormaPagto;
begin
    Frm := TfrmFinalizaVendaFormaPagto.Create(nil, aFormaPagamento, aValor);
    try
        Frm.ShowModal;
        if Frm.Valor > 0 then
        begin
            with cdsPagamentos do
            begin
                DisableControls;
                try
                    Append;
                    FieldByName('id').AsInteger := Frm.FormaPagtoId;
                    FieldByName('nome').AsString := Frm.FormaPagtoNome;
                    FieldByName('valor').AsFloat := Frm.Valor;
                    Post;
                finally
                    EnableControls;
                end;
            end;

            edtSaldoPagar.Text := FloatToStr(StrToFloat(edtSaldoPagar.Text) + Frm.Valor);
        end;
        CalcularTroco;
    finally
        FreeAndNil(Frm);
    end;
end;

procedure TFrmFinalizaVenda.mnInserirPagamentoClick(Sender: TObject);
var
    aValor: Currency;
begin
    aValor := (StrToFloat(edtTotalPagar.Text) - StrToFloat(edtSaldoPagar.Text));
    if aValor < 0 then
        aValor := 0;

    InserirPagamento('', aValor);
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

procedure TFrmFinalizaVenda.edtCodigoMensalistaKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        PesquisaMensalista(StrToInt(edtCodigoMensalista.Text), True);
end;

procedure TFrmFinalizaVenda.edtPercentualDescontoChange(Sender: TObject);
var
    saldo: Currency;
begin
    saldo := (StrToFloat(edtTotalpagar.Text) * StrToFloat(edtPercentualDesconto.Text)) / 100;
    edtValorDesconto.Text := FloatToStr(saldo);
end;

procedure TFrmFinalizaVenda.pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   sc_DragMove = $f012;
begin
    ReleaseCapture;
    Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TFrmFinalizaVenda.slbFormaPagamentoDblClick(Sender: TObject);
var
    ix: Integer;
    aValor: Currency;
begin
    ix := slbFormaPagamento.SelectedItemIndex;

    aValor := (StrToFloat(edtTotalPagar.Text) - StrToFloat(edtSaldoPagar.Text));
    if aValor < 0 then
        aValor := 0;

    InserirPagamento(slbFormaPagamento.Items[ix].Caption, aValor);
end;

end.
