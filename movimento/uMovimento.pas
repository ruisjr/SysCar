unit uMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.ExtCtrls, AeroButtons, JvExExtCtrls,
  JvExtComponent, JvPanel, System.Generics.Collections, Datasnap.DBClient,
  { Classes de negócio }
  ucMovimento, SimpleInterface, SimpleDao, uVeiculo;

type
  TFrmMovimento = class(TForm)
    pnlFundo: TPanel;
    pnlTitulo: TJvPanel;
    btnClose: TAeroSpeedButton;
    Panel1: TPanel;
    grdMovimento: TJvDBGrid;
    btnSaida: TAeroSpeedButton;
    btnEntrada: TAeroSpeedButton;
    cdsMovimento: TClientDataSet;
    DSDados: TDataSource;
    cdsMovimentoticket: TIntegerField;
    cdsMovimentoplaca: TStringField;
    cdsMovimentonome_veiculo: TStringField;
    cdsMovimentodt_entrada: TDateField;
    cdsMovimentohr_entrada: TTimeField;
    cdsMovimentonome_mensalista: TStringField;
    cdsMovimentomensalista: TIntegerField;
    cdsMovimentoveiculo: TIntegerField;
    cdsMovimentomodelo: TIntegerField;
    cdsMovimentoid: TIntegerField;
    cdsMovimentonome_modelo: TStringField;
    cdsMovimentodt_saida: TDateField;
    cdsMovimentohr_saida: TTimeField;
    pnlDataHora: TPanel;
    tmrEntrada: TTimer;
    procedure btnCloseClick(Sender: TObject);
    procedure btnEntradaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSaidaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrEntradaTimer(Sender: TObject);
  private
    { Private declarations }
    DAO: iSimpleDao<TMovimento>;
    DAOModelo: iSimpleDao<TModelo>;
    DAOVeiculo: iSimpleDao<TVeiculo>;

    { Procedures }
    procedure AtualizaMovimento;
  public
    { Public declarations }
  end;

var
  FrmMovimento: TFrmMovimento;

implementation

{$R *.dfm}

uses uFinalizaVenda, uIniciaVenda, uDataModule;

procedure TFrmMovimento.atualizaMovimento;
var
    oLista: TObjectList<TMovimento>;
    ix: Integer;
    oModelo: TModelo;
    oVeiculo: TVeiculo;
begin
    oLista := TObjectList<TMovimento>.Create;
    try
        DAO := TSimpleDao<TMovimento>.New(DM.GetConn);
        DAOModelo := TSimpleDao<TModelo>.New(DM.GetConn);
        DAOVeiculo := TSimpleDao<TVeiculo>.New(DM.GetConn);

        DAO.SQL.OrderBy('ticket').&End.Find(oLista);

        with cdsMovimento do
        begin
            if Active then
                Close;

            CreateDataSet;
            Open;

            DisableControls;
            for ix := 0 to oLista.Count -1 do
            begin
                Append;

                FieldByName('id').AsInteger := olista[ix].ID;
                FieldByName('ticket').AsInteger := oLista[ix].Ticket;
                FieldByName('placa').AsString := oLista[ix].Placa;
                FieldByName('dt_entrada').AsDateTime := oLista[ix].DataEntrada;
                FieldByName('hr_entrada').AsDateTime := oLista[ix].HoraEntrada;

                try
                    oModelo := DAOModelo.Find('id = '+oLista[ix].Modelo.ToString);
                    oVeiculo := DAOVeiculo.Find('id = '+oLista[ix].Veiculo.ToString);

                    FieldByName('modelo').AsInteger := oLista[ix].Modelo;
                    FieldByName('veiculo').AsInteger := oLista[ix].Veiculo;
                    FieldByName('nome_veiculo').AsString := oVeiculo.Nome + ' ' + oModelo.Nome;
                finally
                    oModelo.Free;
                    oVeiculo.Free;
                end;

                Post;
            end;

            EnableControls;
        end;
    finally
        oLista.free;
    end;
end;

procedure TFrmMovimento.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmMovimento.btnEntradaClick(Sender: TObject);
var
    Frm: TfrmIniciaVenda;
begin
    Frm := TfrmIniciaVenda.Create(self);
    try
        Frm.ShowModal;
        atualizaMovimento;
    finally
        FreeAndNil(Frm);
    end;
end;

procedure TFrmMovimento.btnSaidaClick(Sender: TObject);
var
    vFinaliza: TFrmFinalizaVenda;
begin
    try
        vFinaliza := TFrmFinalizaVenda.Create(self, cdsMovimento.FieldByName('ticket').AsInteger);
        vFinaliza.ShowModal;
    finally
        FreeAndNil(vFinaliza);
    end;
end;

procedure TFrmMovimento.FormCreate(Sender: TObject);
begin
    AtualizaMovimento;
end;

procedure TFrmMovimento.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    case key of
        VK_F3:
            btnEntradaClick(self);
        VK_F4:
            btnSaidaClick(self);
    end;
end;

procedure TFrmMovimento.tmrEntradaTimer(Sender: TObject);
begin
    pnlDataHora.Caption := FormatDateTime('dd "de" mmmmm - HH:MM:SS', Now);
end;

end.
