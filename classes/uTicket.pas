unit uTicket;

interface

type
    TTicket = class
    private
        procedure loadDLL;
    public
        class function getTicket: Integer;
    end;

    function Bematech_FI_RelatorioGerencial(Texto: String): Integer; StdCall; External 'BEMAFI32.DLL';
    function Bematech_FI_AbrePortaSerial: Integer; StdCall; External 'BEMAFI32.DLL';

implementation

{ TTicker }

class function TTicket.getTicket: Integer;
var
    cTexto: String;
    iRetorno: Integer;
begin

    cTexto := 'Digite o texto a ser impresso aqui !!!';
//    iRetorno := Bematech_FI_AbrePortaSerial();
    iRetorno := Bematech_FI_RelatorioGerencial( pchar( cTexto ) );
    Result := iRetorno;
end;

procedure TTicket.loadDLL;
begin
    //Chama a dll
end;

end.
