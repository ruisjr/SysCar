object DM: TDM
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object dbconn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\rui.junior\OneDrive\Sistemas\Syscar\config\con' +
        'figdb'
      'User_Name=syscar'
      'Password=syscar'
      'Encrypt=aes-128'
      'DateTimeFormat=DateTime'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 22
  end
  object Command: TFDCommand
    Connection = dbconn
    Left = 104
    Top = 24
  end
end
