object AppData: TAppData
  OldCreateOrder = False
  Left = 824
  Top = 290
  Height = 468
  Width = 675
  object Connection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=12345;Persist Security Info=True;Us' +
      'er ID=pmp;Data Source=PC-PMP\F2008SQL'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 15
    Top = 8
  end
  object User: TADODataSet
    Connection = Connection
    BeforeOpen = UserBeforeOpen
    Parameters = <>
    Left = 16
    Top = 64
    object UserUID: TIntegerField
      FieldName = 'UID'
    end
    object UserLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object UserEmployeeName: TStringField
      FieldName = 'EmployeeName'
    end
  end
  object Module: TADODataSet
    Parameters = <>
    Left = 65
    Top = 64
  end
  object DetailHeaderInc: TADODataSet
    Parameters = <>
    Left = 28
    Top = 184
  end
  object DetailMoveInc: TADODataSet
    Parameters = <>
    Left = 28
    Top = 240
  end
  object DS_User: TDataSource
    DataSet = User
    Left = 16
    Top = 112
  end
  object DS_Module: TDataSource
    DataSet = Module
    Left = 68
    Top = 112
  end
  object Organiz: TADODataSet
    Connection = Connection
    BeforeOpen = OrganizBeforeOpen
    Parameters = <>
    Left = 129
    Top = 64
    object OrganizUID: TIntegerField
      FieldName = 'UID'
    end
    object OrganizName: TStringField
      FieldName = 'Name'
    end
    object OrganizAdress: TStringField
      DisplayWidth = 250
      FieldName = 'Adress'
      Size = 70
    end
  end
  object DS_Organiz: TDataSource
    DataSet = Organiz
    Left = 129
    Top = 112
  end
  object InsertNewShop: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 116
    Top = 185
  end
  object DeleteShop: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 120
    Top = 240
  end
  object Insert: TADODataSet
    Parameters = <>
    Left = 192
    Top = 184
  end
end
