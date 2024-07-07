unit uFinalizaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AeroButtons, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ExtCtrls, Vcl.StdCtrls, AdvEdit, AdvNavBar,
  AdvSmoothListBox, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Data.DB, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvExStdCtrls, JvGroupBox,
  AdvGlowButton, System.Generics.Collections, Datasnap.DBClient, Datasnap.Provider,
  { Classes de negpocio }
  SimpleInterface, SimpleDao, uFormaPagamento, ucMovimento, Vcl.Menus, AdvMenus;

type
  TFrmFinalizaVenda = class(TForm)
    pnlFundo: TPanel;
    pnlTitulo: TJvPanel;
    btnClose: TAeroSpeedButton;
    pnlBotoes: TJvPanel;
    btnInserir: TAeroSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    edtCodigoMensalista: TAdvEdit;
    pnlNomeMensalista: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    slbFormaPagamento: TAdvSmoothListBox;
    grdPagamentos: TJvDBGrid;
    Panel7: TPanel;
    Label8: TLabel;
    edtTotalpagar: TAdvEdit;
    Panel6: TPanel;
    Label2: TLabel;
    edtValorDesconto: TAdvEdit;
    Panel8: TPanel;
    Label3: TLabel;
    edtSaldoPagar: TAdvEdit;
    JvGroupBox1: TJvGroupBox;
    btnConsultaCliente: TAdvGlowButton;
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
    Panel1: TPanel;
    btnMenuContato: TAdvGlowButton;
    ppmMenuLateral: TAdvPopupMenu;
    InserirModelo1: TMenuItem;
    Excluir1: TMenuItem;
    procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure edtValorDescontoChange(Sender: TObject);
    procedure edtPercentualDescontoChange(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConsultaClienteClick(Sender: TObject);
    procedure edtCodigoMensalistaKeyPress(Sender: TObject; var Key: Char);
    procedure slbFormaPagamentoDblClick(Sender: TObject);
    procedure grdPagamentosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnMenuContatoClick(Sender: TObject);
    procedure InserirModelo1Click(Sender: TObject);
  private
    { Private declarations }
    DAO: iSimpleDao<TFormaPagamento>;
    DAOMov: iSimpleDao<TMovimento>;
    DSFP: TDataSource;
    Ticket: Integer;

    { Procedimentos }
    procedure PesquisaMensalista(aCodigo: Integer; aSendMsg: Boolean = False);
    procedure AtualizaPagamentos;
    procedure CalcularTotais;
    procedure AtualizaBaixa(aHoraEntrada, aDataEntrada: TDateTime; aHoraSaida, aDataSaida: TDateTime);
  public
    { Public declarations }

    { Construtores e Destrutores }
    constructor Create(AWoner: TComponent; aTicket: Integer);
  end;

var
  FrmFinalizaVenda: TFrmFinalizaVenda;

implementation

{$R *.dfm}

uses uDataModule, uPessoa, uCallForm, uUtil, uFinalizaVendaFormaPagto, DateUtils, uProduto;

procedure TFrmFinalizaVenda.AtualizaBaixa(aHoraEntrada, aDataEntrada: TDateTime; aHoraSaida, aDataSaida: TDateTime);
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

procedure TFrmFinalizaVenda.AtualizaPagamentos;
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

        AtualizaBaixa(oMovimento.HoraEntrada, oMovimento.DataEntrada, aDataSai.GetTime, aDataSai.GetDate);
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

procedure TFrmFinalizaVenda.btnInserirClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmFinalizaVenda.btnMenuContatoClick(Sender: TObject);
begin
    SubMenuPopUp(Sender, ppmMenuLateral);
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
        end;
    finally
        oProduto.Free;
    end;
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
    AtualizaPagamentos;
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

procedure TFrmFinalizaVenda.InserirModelo1Click(Sender: TObject);
var
    Frm: TfrmFinalizaVendaFormaPagto;
begin
    Frm := TfrmFinalizaVendaFormaPagto.Create(nil, '', (StrToFloat(edtTotalPagar.Text) - StrToFloat(edtSaldoPagar.Text)));
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
    finally
        FreeAndNil(Frm);
    end;
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
    Frm: TfrmFinalizaVendaFormaPagto;
    ix: Integer;
begin
    ix := slbFormaPagamento.SelectedItemIndex;
    Frm := TfrmFinalizaVendaFormaPagto.Create(nil, slbFormaPagamento.Items[ix].Caption, (StrToFloat(edtTotalPagar.Text) - StrToFloat(edtSaldoPagar.Text)));
    try
        Frm.ShowModal;
        if Frm.Valor > 0 then
        begin
            with cdsPagamentos do
            begin
                DisableControls;
                try
                    Append;
                    FieldByName('id').AsInteger := StrToInt(Split('-', slbFormaPagamento.Items[ix].Caption));
                    FieldByName('nome').AsString := Split('-', slbFormaPagamento.Items[ix].Caption, False);
                    FieldByName('valor').AsFloat := Frm.Valor;
                    Post;
                finally
                    EnableControls;
                end;
            end;

            edtSaldoPagar.Text := FloatToStr(StrToFloat(edtSaldoPagar.Text) + Frm.Valor);
        end;
    finally
        FreeAndNil(Frm);
    end;
end;

end.
