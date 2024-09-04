unit uCep;

interface

uses
    Vcl.Forms, System.SysUtils, System.Classes, System.JSON, idHTTP, IdSSLOpenSSL;

type
    TCep = Class
    private

    public
        function GetCep(cep: String): TJSONObject;
        procedure CarregaCep(JSON: TJSONObject; aForm: TForm);
    End;


implementation

{ TCep }

procedure TCep.CarregaCep(JSON: TJSONObject; aForm: TForm);
begin

end;

function TCep.GetCep(cep: String): TJSONObject;
var
   HTTP: TIdHTTP;
   IDSSLHandler : TIdSSLIOHandlerSocketOpenSSL;
   Response: TStringStream;
   LJsonObj: TJSONObject;
begin
   try
      HTTP := TIdHTTP.Create;
      IDSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create;
      IDSSLHandler.SSLOptions.SSLVersions := [sslvTLSv1_2];
      HTTP.IOHandler := IDSSLHandler;
      Response := TStringStream.Create('');
      HTTP.Get('https://viacep.com.br/ws/' + CEP + '/json', Response);
      if (HTTP.ResponseCode = 200) and not(Utf8ToAnsi(Response.DataString) = '{'#$A'  "erro": true'#$A'}') then
         Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( Utf8ToAnsi(Response.DataString)), 0) as TJSONObject;
   finally
      FreeAndNil(HTTP);
      FreeAndNil(IDSSLHandler);
      Response.Destroy;
   end;

end;

end.
