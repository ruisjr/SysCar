unit uLogs;

interface

uses
    Vcl.Forms,
    System.SysUtils,
    Quick.Logger,
    Quick.Logger.Provider.Files,
    Quick.Logger.Provider.Console;

Type
    iLog = interface
        ['{EBF2E3E8-9699-41AE-AC7C-0A06C4757E7D}']
        function info(aMessage: String): iLog;
        function debug(aMessage: String): iLog;
        function error(aMessage: String): iLog;
        function warn(aMessage: String): iLog;
    end;

    TLog = class(TInterfacedObject, iLog)
    private

    public
        class function New: iLog;
        function info(aMessage: String): iLog;
        function debug(aMessage: String): iLog;
        function error(aMessage: String): iLog;
        function warn(aMessage: String): iLog;
    end;

implementation

{ TLog }

function TLog.debug(aMessage: String): iLog;
begin
    Log(aMessage, etDebug);
end;

function TLog.error(aMessage: String): iLog;
begin
    Log(aMessage, etError);
end;

function TLog.info(aMessage: String): iLog;
begin
    Log(aMessage, etInfo);
end;

class function TLog.New: iLog;
begin
    Result := Self.create;
end;

function TLog.warn(aMessage: String): iLog;
begin
    Log(aMessage, etWarning);
end;

initialization

    //Add Log File and console providers
    Logger.Providers.Add(GlobalLogFileProvider);
    Logger.Providers.Add(GlobalLogConsoleProvider);
    //Configure provider options
    with GlobalLogFileProvider do
 	begin
    	FileName := '.\log\' + ExtractFileName(Application.ExeName).Replace('.exe','') + '.log';
        DailyRotate := True;
        MaxFileSizeInMB := 20;
        LogLevel := LOG_DEBUG;
    	Enabled := True;
  	end;
    with GlobalLogConsoleProvider do
    begin
    	LogLevel := LOG_DEBUG;
        ShowEventColors := True;
        Enabled := True;
    end;
end.
