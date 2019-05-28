object AppData: TAppData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 507
  Top = 224
  Height = 728
  Width = 1133
  object Connection: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 8
  end
  object User: TADODataSet
    Connection = Connection
    AfterScroll = UserAfterScroll
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
    object UserAdmin: TStringField
      FieldName = 'Admin'
    end
    object UserRESERVE: TStringField
      FieldName = 'RESERVE'
    end
    object UserIsAdmin: TBooleanField
      FieldName = 'IsAdmin'
    end
  end
  object Module: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 65
    Top = 64
  end
  object DS_Organiz: TDataSource
    DataSet = Organiz
    Left = 297
    Top = 112
  end
  object DS_Module: TDataSource
    DataSet = Module
    Left = 68
    Top = 112
  end
  object DS_User: TDataSource
    DataSet = User
    Left = 16
    Top = 112
  end
  object ExpenseDocHead: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 36
    Top = 325
  end
  object ExpenseDocDetail: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 36
    Top = 373
  end
  object InsertNewShop: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 460
    Top = 57
  end
  object InsertHeaderIncome: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 40
    Top = 192
  end
  object DeleteShop: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 464
    Top = 112
    object DeleteShopRes: TIntegerField
      FieldName = 'Res'
    end
  end
  object InsertIncomeDetail: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 40
    Top = 248
  end
  object MaxUnicumNumInc: TADODataSet
    Connection = Connection
    BeforeOpen = MaxUnicumNumIncBeforeOpen
    Parameters = <>
    Left = 144
    Top = 248
    object MaxUnicumNumIncUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object MaxUnicumNumIncNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
  end
  object GetIncomeDetail: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 248
    Top = 192
    object GetIncomeDetailUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object GetIncomeDetailNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object GetIncomeDetailNUM_PREDM: TSmallintField
      FieldName = 'NUM_PREDM'
    end
    object GetIncomeDetailUID_SHOP: TIntegerField
      FieldName = 'UID_SHOP'
    end
    object GetIncomeDetailNAME: TStringField
      FieldName = 'NAME'
    end
    object GetIncomeDetailADRESS: TStringField
      FieldName = 'ADRESS'
      Size = 50
    end
    object GetIncomeDetailSUM_NAL: TFloatField
      FieldName = 'SUM_NAL'
    end
    object GetIncomeDetailSUM_NOT_NAL: TFloatField
      FieldName = 'SUM_NOT_NAL'
    end
    object GetIncomeDetailDATE_P_POR: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object GetIncomeDetailStatusDoc: TStringField
      FieldName = 'StatusDoc'
    end
    object GetIncomeDetailPrimech: TStringField
      FieldName = 'Primech'
      Size = 250
    end
    object GetIncomeDetailOTMETKA: TStringField
      FieldName = 'OTMETKA'
      Size = 10
    end
  end
  object DeleteIncomeDocum: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 144
    Top = 192
  end
  object TransferToReserve: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 368
    Top = 56
  end
  object CorrShop: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 368
    Top = 112
  end
  object MaxUnicumNumExpense: TADODataSet
    Connection = Connection
    BeforeOpen = MaxUnicumNumExpenseBeforeOpen
    Parameters = <>
    Left = 144
    Top = 325
    object MaxUnicumNumExpenseUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object MaxUnicumNumExpenseNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
  end
  object ExpenceDetail: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 128
    Top = 448
    object ExpenceDetailUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object ExpenceDetailNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object ExpenceDetailDATE_P_POR: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object ExpenceDetailNUM_PREDM: TSmallintField
      FieldName = 'NUM_PREDM'
    end
    object ExpenceDetailNAME: TStringField
      FieldName = 'NAME'
    end
    object ExpenceDetailAdress: TStringField
      FieldName = 'Adress'
      Size = 50
    end
    object ExpenceDetailSUM_NAL: TFloatField
      FieldName = 'SUM_NAL'
    end
    object ExpenceDetailSUM_NOT_NAL: TFloatField
      FieldName = 'SUM_NOT_NAL'
    end
    object ExpenceDetailFAMILY: TStringField
      FieldName = 'FAMILY'
    end
    object ExpenceDetailCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ExpenceDetailNAZNACHENIE: TStringField
      FieldName = 'NAZNACHENIE'
      Size = 50
    end
    object ExpenceDetailTYPE_DOC: TStringField
      FieldName = 'TYPE_DOC'
    end
    object ExpenceDetailUID_SHOP: TIntegerField
      FieldName = 'UID_SHOP'
    end
    object ExpenceDetailPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 250
    end
    object ExpenceDetailStatusDoc: TStringField
      FieldName = 'StatusDoc'
      Size = 250
    end
    object ExpenceDetailRECIPIENT: TStringField
      FieldName = 'RECIPIENT'
      Size = 150
    end
    object ExpenceDetailOTMETKA: TStringField
      FieldName = 'OTMETKA'
      Size = 1
    end
  end
  object CorrIncomeDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 248
    Top = 248
  end
  object Report: TFlexCelReport
    AutoClose = False
    Adapter = MainForm.Adapter
    DataModule = Owner
    Left = 520
    Top = 200
  end
  object DeleteExpenceDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 264
    Top = 325
  end
  object CorrExpenceDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 144
    Top = 373
  end
  object CorrExpenceZPDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 264
    Top = 376
    object CorrExpenceZPDocUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object CorrExpenceZPDocNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object CorrExpenceZPDocDATE_P_POR: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object CorrExpenceZPDocNUM_PREDM: TIntegerField
      FieldName = 'NUM_PREDM'
    end
    object CorrExpenceZPDocUID_SHOP: TIntegerField
      FieldName = 'UID_SHOP'
    end
    object CorrExpenceZPDocNAME: TStringField
      FieldName = 'NAME'
    end
    object CorrExpenceZPDocAdress: TStringField
      FieldName = 'Adress'
    end
    object CorrExpenceZPDocSUM_NAL: TFloatField
      FieldName = 'SUM_NAL'
    end
    object CorrExpenceZPDocSUM_NOT_NAL: TFloatField
      FieldName = 'SUM_NOT_NAL'
    end
    object CorrExpenceZPDocPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 250
    end
    object CorrExpenceZPDocFAMILY: TStringField
      FieldName = 'FAMILY'
    end
    object CorrExpenceZPDocCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object CorrExpenceZPDocNAZNACHENIE: TStringField
      FieldName = 'NAZNACHENIE'
    end
    object CorrExpenceZPDocTYPE_DOC: TStringField
      FieldName = 'TYPE_DOC'
    end
    object CorrExpenceZPDocStatusDoc: TStringField
      FieldName = 'StatusDoc'
    end
    object CorrExpenceZPDocOTMETKA: TStringField
      FieldName = 'OTMETKA'
      Size = 1
    end
  end
  object ExpenceDetailZp: TADODataSet
    Connection = Connection
    BeforeOpen = ExpenceDetailZpBeforeOpen
    Parameters = <>
    Left = 32
    Top = 448
    object ExpenceDetailZpIntegerField: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object ExpenceDetailZpIntegerField2: TIntegerField
      FieldName = 'NUMDOC'
    end
    object ExpenceDetailZpDateTimeField: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object ExpenceDetailZpSmallintField: TSmallintField
      FieldName = 'NUM_PREDM'
    end
    object ExpenceDetailZpStringField: TStringField
      FieldName = 'NAME'
    end
    object ExpenceDetailZpStringField2: TStringField
      FieldName = 'Adress'
      Size = 50
    end
    object ExpenceDetailZpFloatField: TFloatField
      FieldName = 'SUM_NAL'
    end
    object ExpenceDetailZpFloatField2: TFloatField
      FieldName = 'SUM_NOT_NAL'
    end
    object ExpenceDetailZpStringField3: TStringField
      FieldName = 'FAMILY'
    end
    object ExpenceDetailZpDateTimeField2: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ExpenceDetailZpStringField4: TStringField
      FieldName = 'NAZNACHENIE'
      Size = 50
    end
    object ExpenceDetailZpStringField5: TStringField
      FieldName = 'TYPE_DOC'
    end
    object ExpenceDetailZpIntegerField3: TIntegerField
      FieldName = 'UID_SHOP'
    end
    object ExpenceDetailZpStringField6: TStringField
      FieldName = 'PRIMECH'
      Size = 250
    end
    object ExpenceDetailZpStringField7: TStringField
      FieldName = 'StatusDoc'
      Size = 250
    end
    object ExpenceDetailZpStringField8: TStringField
      FieldName = 'RECIPIENT'
      Size = 150
    end
    object ExpenceDetailZpOTMETKA: TStringField
      FieldName = 'OTMETKA'
      Size = 1
    end
  end
  object Users: TADODataSet
    Connection = Connection
    LockType = ltReadOnly
    BeforeOpen = UsersBeforeOpen
    Parameters = <>
    Left = 88
    Top = 8
    object UsersUID: TIntegerField
      FieldName = 'UID'
    end
    object UsersLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object UsersRESERVE: TStringField
      FieldName = 'RESERVE'
    end
    object UsersAdmin: TStringField
      FieldName = 'Admin'
    end
  end
  object TypeAccess: TADODataSet
    Connection = Connection
    LockType = ltReadOnly
    Parameters = <>
    Left = 209
    Top = 9
  end
  object UserAccess: TADODataSet
    Connection = Connection
    LockType = ltReadOnly
    BeforeOpen = UserAccessBeforeOpen
    Parameters = <>
    Left = 144
    Top = 8
    object UserAccessMODULE_UID: TIntegerField
      FieldName = 'MODULE_UID'
    end
    object UserAccessUSER_UID: TIntegerField
      FieldName = 'USER_UID'
    end
    object UserAccessLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object UserAccessMode: TIntegerField
      FieldName = 'Mode'
    end
  end
  object ZpAupDocHead: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 32
    Top = 526
  end
  object ZpAupDocDetail: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 32
    Top = 582
  end
  object MaxUnicumNumZpAup: TADODataSet
    Connection = Connection
    BeforeOpen = MaxUnicumNumZpAupBeforeOpen
    Parameters = <>
    Left = 136
    Top = 526
    object MaxUnicumNumZpAupUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object MaxUnicumNumZpAupNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
  end
  object DeleteZpAupDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 136
    Top = 582
  end
  object ZpAupDetail: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 240
    Top = 524
    object ZpAupDetailUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object ZpAupDetailNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object ZpAupDetailDATE_P_POR: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object ZpAupDetailNUM_PREDM: TIntegerField
      FieldName = 'NUM_PREDM'
    end
    object ZpAupDetailUID_SHOP: TIntegerField
      FieldName = 'UID_SHOP'
    end
    object ZpAupDetailName: TStringField
      FieldName = 'Name'
    end
    object ZpAupDetailAdress: TStringField
      FieldName = 'Adress'
      Size = 50
    end
    object ZpAupDetailSUM_NAL: TFloatField
      FieldName = 'SUM_NAL'
    end
    object ZpAupDetailFAMILY: TStringField
      FieldName = 'FAMILY'
    end
    object ZpAupDetailCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ZpAupDetailNAZNACHENIE: TStringField
      FieldName = 'NAZNACHENIE'
    end
    object ZpAupDetailPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 250
    end
    object ZpAupDetailStatusDoc: TStringField
      FieldName = 'StatusDoc'
    end
    object ZpAupDetailOTMETKA: TStringField
      FieldName = 'OTMETKA'
      Size = 1
    end
  end
  object CorrZpAupH: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 240
    Top = 580
  end
  object ExpenseOtherDetail: TADODataSet
    Connection = Connection
    BeforeOpen = ExpenseOtherDetailBeforeOpen
    Parameters = <>
    Left = 224
    Top = 448
    object ExpenseOtherDetailUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object ExpenseOtherDetailNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object ExpenseOtherDetailDATE_P_POR: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object ExpenseOtherDetailNUM_PREDM: TIntegerField
      FieldName = 'NUM_PREDM'
    end
    object ExpenseOtherDetailUID_SHOP: TIntegerField
      FieldName = 'UID_SHOP'
    end
    object ExpenseOtherDetailNAME: TStringField
      FieldName = 'NAME'
    end
    object ExpenseOtherDetailAdress: TStringField
      FieldName = 'Adress'
      Size = 50
    end
    object ExpenseOtherDetailSUM_NAL: TFloatField
      FieldName = 'SUM_NAL'
    end
    object ExpenseOtherDetailSUM_NOT_NAL: TFloatField
      FieldName = 'SUM_NOT_NAL'
    end
    object ExpenseOtherDetailPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 250
    end
    object ExpenseOtherDetailCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ExpenseOtherDetailNAZNACHENIE: TStringField
      FieldName = 'NAZNACHENIE'
      Size = 50
    end
    object ExpenseOtherDetailTYPE_DOC: TStringField
      FieldName = 'TYPE_DOC'
    end
    object ExpenseOtherDetailFAMILY: TStringField
      FieldName = 'FAMILY'
    end
    object ExpenseOtherDetailOTMETKA: TStringField
      FieldName = 'OTMETKA'
      Size = 1
    end
    object ExpenseOtherDetailRECIPIENT: TStringField
      FieldName = 'RECIPIENT'
      Size = 50
    end
  end
  object GetIncomeCashDetail: TADODataSet
    Connection = Connection
    BeforeOpen = GetIncomeCashDetailBeforeOpen
    Parameters = <>
    Left = 352
    Top = 192
    object IntegerField1: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object IntegerField2: TIntegerField
      FieldName = 'NUMDOC'
    end
    object SmallintField1: TSmallintField
      FieldName = 'NUM_PREDM'
    end
    object IntegerField3: TIntegerField
      FieldName = 'UID_SHOP'
    end
    object StringField1: TStringField
      FieldName = 'NAME'
    end
    object StringField2: TStringField
      FieldName = 'ADRESS'
      Size = 50
    end
    object FloatField1: TFloatField
      FieldName = 'SUM_NAL'
    end
    object FloatField2: TFloatField
      FieldName = 'SUM_NOT_NAL'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object GetIncomeCashDetailStatusDoc: TStringField
      FieldName = 'StatusDoc'
    end
    object GetIncomeCashDetailPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 250
    end
  end
  object AdoCmd: TADOCommand
    Connection = Connection
    Parameters = <>
    Left = 584
    Top = 24
  end
  object TaxToZpHeadDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 32
    Top = 656
  end
  object TaxToZpDetail: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 34
    Top = 707
  end
  object GetTaxToZpDetail: TADODataSet
    Connection = Connection
    BeforeOpen = GetTaxToZpDetailBeforeOpen
    Parameters = <>
    Left = 144
    Top = 656
    object GetTaxToZpDetailUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object GetTaxToZpDetailNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object GetTaxToZpDetailDATE_P_POR: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object GetTaxToZpDetailNUM_PREDM: TIntegerField
      FieldName = 'NUM_PREDM'
    end
    object GetTaxToZpDetailUID_SHOP: TIntegerField
      FieldName = 'UID_SHOP'
    end
    object GetTaxToZpDetailName: TStringField
      FieldName = 'Name'
    end
    object GetTaxToZpDetailAdress: TStringField
      FieldName = 'Adress'
      Size = 50
    end
    object GetTaxToZpDetailSUM_NOT_NAL: TFloatField
      FieldName = 'SUM_NOT_NAL'
    end
    object GetTaxToZpDetailFAMILY: TStringField
      FieldName = 'FAMILY'
    end
    object GetTaxToZpDetailCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object GetTaxToZpDetailPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 250
    end
    object GetTaxToZpDetailStatusDoc: TStringField
      FieldName = 'StatusDoc'
    end
    object GetTaxToZpDetailOTMETKA: TStringField
      FieldName = 'OTMETKA'
      Size = 1
    end
  end
  object CorrTaxToZpH: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 144
    Top = 704
  end
  object IncomeDifference: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 352
    Top = 248
    object IncomeDifferenceIncome_Difference_Nal_Curr: TFloatField
      FieldName = 'Income_Difference_Nal_Curr'
    end
    object IncomeDifferenceIncome_Difference_Nal_Range: TFloatField
      FieldName = 'Income_Difference_Nal_Range'
    end
    object IncomeDifferenceIncome_Difference_Not_Nal_Curr: TFloatField
      FieldName = 'Income_Difference_Not_Nal_Curr'
    end
    object IncomeDifferenceIncome_Difference_Not_Nal_Range: TFloatField
      FieldName = 'Income_Difference_Not_Nal_Range'
    end
  end
  object PercentOfTerminalHeadDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 448
    Top = 328
  end
  object PercentOfTerminalDetail: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 450
    Top = 379
  end
  object GetPercentOfTerminalDetail: TADODataSet
    Connection = Connection
    BeforeOpen = GetPercentOfTerminalDetailBeforeOpen
    Parameters = <>
    Left = 586
    Top = 328
    object IntegerField4: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object IntegerField5: TIntegerField
      FieldName = 'NUMDOC'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object IntegerField6: TIntegerField
      FieldName = 'NUM_PREDM'
    end
    object IntegerField7: TIntegerField
      FieldName = 'UID_SHOP'
    end
    object StringField3: TStringField
      FieldName = 'Name'
    end
    object StringField4: TStringField
      FieldName = 'Adress'
      Size = 50
    end
    object FloatField3: TFloatField
      FieldName = 'SUM_NOT_NAL'
    end
    object StringField5: TStringField
      FieldName = 'FAMILY'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object StringField6: TStringField
      FieldName = 'PRIMECH'
      Size = 250
    end
    object StringField7: TStringField
      FieldName = 'StatusDoc'
    end
    object GetPercentOfTerminalDetailOTMETKA: TStringField
      FieldName = 'OTMETKA'
      Size = 1
    end
  end
  object CorrPercentOfTerminalH: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 588
    Top = 380
  end
  object MaxUnicumNumPercentOfTerminal: TADODataSet
    Connection = Connection
    BeforeOpen = MaxUnicumNumPercentOfTerminalBeforeOpen
    Parameters = <>
    Left = 745
    Top = 329
    object MaxUnicumNumPercentOfTerminalUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object MaxUnicumNumPercentOfTerminalNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
  end
  object DeletePercentOfTerminalDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 753
    Top = 382
  end
  object Organiz: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 297
    Top = 56
    object OrganizUID: TIntegerField
      FieldName = 'UID'
    end
    object OrganizName: TStringField
      DisplayWidth = 50
      FieldName = 'Name'
      Size = 50
    end
    object OrganizAdress: TStringField
      DisplayWidth = 250
      FieldName = 'Adress'
      Size = 100
    end
    object OrganizINN: TStringField
      FieldName = 'INN'
    end
    object OrganizKPP: TStringField
      FieldName = 'KPP'
    end
    object OrganizRESERVE: TStringField
      FieldName = 'RESERVE'
    end
  end
  object ShipmentHeadDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 448
    Top = 463
  end
  object ShipmentDetailDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 452
    Top = 519
  end
  object MaxUnicumNumShipment: TADODataSet
    Connection = Connection
    BeforeOpen = MaxUnicumNumShipmentBeforeOpen
    Parameters = <>
    Left = 568
    Top = 464
    object MaxUnicumNumShipmentUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object MaxUnicumNumShipmentNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
  end
  object ShipmentDetail: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 568
    Top = 520
    object ShipmentDetailUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object ShipmentDetailNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object ShipmentDetailDATE_P_POR: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object ShipmentDetailNUM_PREDM: TSmallintField
      FieldName = 'NUM_PREDM'
    end
    object ShipmentDetailNAME: TStringField
      FieldName = 'NAME'
    end
    object ShipmentDetailAdress: TStringField
      FieldName = 'Adress'
      Size = 50
    end
    object ShipmentDetailSUM_NAL: TFloatField
      FieldName = 'SUM_NAL'
    end
    object ShipmentDetailSUM_NOT_NAL: TFloatField
      FieldName = 'SUM_NOT_NAL'
    end
    object ShipmentDetailFAMILY: TStringField
      FieldName = 'FAMILY'
    end
    object ShipmentDetailCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ShipmentDetailTYPE_DOC: TStringField
      FieldName = 'TYPE_DOC'
    end
    object ShipmentDetailUID_SHOP: TIntegerField
      FieldName = 'UID_SHOP'
    end
    object ShipmentDetailPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 250
    end
    object ShipmentDetailStatusDoc: TStringField
      FieldName = 'StatusDoc'
      Size = 250
    end
    object ShipmentDetailOTMETKA: TStringField
      FieldName = 'OTMETKA'
      Size = 1
    end
    object ShipmentDetailSUPPLIER: TStringField
      FieldName = 'SUPPLIER'
      Size = 50
    end
  end
  object DeleteShipment: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 680
    Top = 464
  end
  object CorrShipmentH: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 680
    Top = 520
  end
  object OffsHeadDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 448
    Top = 600
  end
  object OffsDetailDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 448
    Top = 656
  end
  object MaxUnicumNumOffs: TADODataSet
    Connection = Connection
    BeforeOpen = MaxUnicumNumOffsBeforeOpen
    Parameters = <>
    Left = 536
    Top = 600
    object MaxUnicumNumOffsUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object MaxUnicumNumOffsNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
  end
  object GetDetailOffs: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 536
    Top = 656
    object GetDetailOffsUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object GetDetailOffsNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object GetDetailOffsUID_SHOP: TIntegerField
      FieldName = 'UID_SHOP'
    end
    object GetDetailOffsNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object GetDetailOffsADRESS: TStringField
      FieldName = 'ADRESS'
      Size = 50
    end
    object GetDetailOffsSUM_NAL: TFloatField
      FieldName = 'SUM_NAL'
    end
    object GetDetailOffsDATE_P_POR: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object GetDetailOffsStatusDoc: TStringField
      FieldName = 'StatusDoc'
      Size = 1
    end
    object GetDetailOffsOTMETKA: TStringField
      FieldName = 'OTMETKA'
      Size = 1
    end
    object GetDetailOffsPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 250
    end
    object GetDetailOffsNUM_PREDM: TIntegerField
      FieldName = 'NUM_PREDM'
    end
    object GetDetailOffsSUM_NOT_NAL: TFloatField
      FieldName = 'SUM_NOT_NAL'
    end
  end
  object DeleteOffsDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 632
    Top = 600
  end
  object CorrOffHeadDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 632
    Top = 652
  end
  object PublicUtilitiesHeadDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 808
    Top = 464
    object PublicUtilitiesHeadDocUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object PublicUtilitiesHeadDocNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object PublicUtilitiesHeadDocCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
  end
  object PublicUtilitiesDetailDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 808
    Top = 520
  end
  object GetPublicUtilitiesDetail: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 920
    Top = 464
    object GetPublicUtilitiesDetailUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object GetPublicUtilitiesDetailNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object GetPublicUtilitiesDetailDATE_P_POR: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object GetPublicUtilitiesDetailSUM_NAL: TFloatField
      FieldName = 'SUM_NAL'
    end
    object GetPublicUtilitiesDetailSUM_NOT_NAL: TFloatField
      FieldName = 'SUM_NOT_NAL'
    end
    object GetPublicUtilitiesDetailUID_SHOP: TIntegerField
      FieldName = 'UID_SHOP'
    end
    object GetPublicUtilitiesDetailName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object GetPublicUtilitiesDetailAdress: TStringField
      FieldName = 'Adress'
      Size = 100
    end
    object GetPublicUtilitiesDetailSUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
    end
    object GetPublicUtilitiesDetailTypeEnergy_NAME: TStringField
      FieldName = 'TypeEnergy_NAME'
    end
    object GetPublicUtilitiesDetailNUM_PREDM: TIntegerField
      FieldName = 'NUM_PREDM'
    end
    object GetPublicUtilitiesDetailFAMILY: TStringField
      FieldName = 'FAMILY'
    end
    object GetPublicUtilitiesDetailPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 250
    end
    object GetPublicUtilitiesDetailStatusDoc: TStringField
      FieldName = 'StatusDoc'
      Size = 1
    end
    object GetPublicUtilitiesDetailOTMETKA: TStringField
      FieldName = 'OTMETKA'
      Size = 1
    end
  end
  object DeletePublicUtilitiesDoc: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 928
    Top = 520
  end
  object TypeEnergySet: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 672
    Top = 24
    object TypeEnergySetUID: TIntegerField
      FieldName = 'UID'
    end
    object TypeEnergySetName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object TypeEnergySetReserve: TStringField
      FieldName = 'Reserve'
      Size = 1
    end
  end
  object StateBuh: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 736
    Top = 24
    object StateBuhUID: TIntegerField
      FieldName = 'UID'
    end
    object StateBuhsName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object StateBuhReserve: TStringField
      FieldName = 'Reserve'
    end
  end
  object GetInfoAccess: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 120
    Top = 64
  end
  object GetSumCashBox: TADODataSet
    Connection = Connection
    BeforeOpen = GetSumCashBoxBeforeOpen
    Parameters = <>
    Left = 832
    Top = 24
    object GetSumCashBoxSUM_NAL: TFloatField
      FieldName = 'SUM_NAL'
    end
  end
  object CorrSumCashBox: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 920
    Top = 24
  end
end
