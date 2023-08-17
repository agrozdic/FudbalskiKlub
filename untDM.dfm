object dm: Tdm
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 527
  Width = 474
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=FudbalskiKlub.mdb;P' +
      'ersist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 56
    Top = 24
  end
  object GRAD: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Grad'
    Left = 56
    Top = 96
  end
  object IGRAC: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Igrac'
    Left = 56
    Top = 168
  end
  object KLUB: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Klub'
    Left = 56
    Top = 240
  end
  object POZICIJA: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Pozicija_igraca'
    Left = 56
    Top = 312
  end
  object STADION: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Stadion'
    Left = 56
    Top = 384
  end
  object DataSource1: TDataSource
    DataSet = GRAD
    Left = 160
    Top = 96
  end
  object DataSource2: TDataSource
    DataSet = IGRAC
    Left = 160
    Top = 168
  end
  object DataSource3: TDataSource
    DataSet = KLUB
    Left = 160
    Top = 240
  end
  object DataSource4: TDataSource
    DataSet = POZICIJA
    Left = 160
    Top = 312
  end
  object DataSource5: TDataSource
    DataSet = STADION
    Left = 160
    Top = 384
  end
end
