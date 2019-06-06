unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids,
  DBGrids,DB, ADODB, Tabs, UExcelAdapter, OLEAdapter, UCustomFlexCelReport,
  UFlexCelReport, DateUtils, ImgList, XPMan;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    MainMenu: TMainMenu;
    ActionList: TActionList;
    IncomeAction: TAction;
    SettingMenu: TMenuItem;
    AccessMenu: TMenuItem;
    NaznachenieMenu: TMenuItem;
    ShopMenu: TMenuItem;
    UserMenu: TMenuItem;
    N6: TMenuItem;
    CreateDocMenu: TMenuItem;
    CreateBtn: TBitBtn;
    ExpenseAction: TAction;
    ExpenseZPAction: TAction;
    ExpenseOtherAction: TAction;
    ZpAupAction: TAction;
    TaxToZpAction: TAction;
    PercentOfTerminalAction: TAction;
    ShipmentVostokAction: TAction;
    ShipmentOtherAction: TAction;
    OffsAction: TAction;
    PublicUtilitiesAction: TAction;
    Bar2: TStatusBar;
    Bar1: TStatusBar;
    IncomeGrid: TDBGrid;
    CorrIncomAction: TAction;
    ExpenseGrid: TDBGrid;
    Tabs: TTabSet;
    ExpenseZPGrid: TDBGrid;
    ExpenseOtherGrid: TDBGrid;
    ZpAupGrid: TDBGrid;
    PercentOfTerminalGrid: TDBGrid;
    ShipmentVostokGrid: TDBGrid;
    ShipmentOtherGrid: TDBGrid;
    OffsGrid: TDBGrid;
    PublicUtilitiesGrid: TDBGrid;
    DS_ReestrIncome: TDataSource;
    ReestrIncome: TADODataSet;
    ReestrIncomeUNICUM_NUM: TIntegerField;
    ReestrIncomeDATE_P_POR: TDateTimeField;
    ReestrIncomeCREATE_DATE: TDateTimeField;
    ReestrIncomeFAMILY: TStringField;
    ReestrIncomeSUM_NAL: TFloatField;
    ReestrIncomeSUM_NOT_NAL: TFloatField;
    ReestrIncomeWHO_CORR: TStringField;
    ReestrIncomeDATE_CORR: TDateTimeField;
    ReestrExpense: TADODataSet;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    DateTimeField3: TDateTimeField;
    DS_ReestrExpense: TDataSource;
    DS_ReestrExpenseZP: TDataSource;
    ReestrExpenseZP: TADODataSet;
    DS_ReestrExpenseOther: TDataSource;
    ReestrExpenseOther: TADODataSet;
    IntegerField4: TIntegerField;
    DateTimeField10: TDateTimeField;
    DateTimeField11: TDateTimeField;
    StringField7: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField8: TStringField;
    DateTimeField12: TDateTimeField;
    DS_ReestrZpAup: TDataSource;
    ReestrZpAup: TADODataSet;
    IntegerField5: TIntegerField;
    DateTimeField13: TDateTimeField;
    DateTimeField14: TDateTimeField;
    StringField9: TStringField;
    FloatField9: TFloatField;
    StringField10: TStringField;
    DateTimeField15: TDateTimeField;
    DS_ReestrPercentOfTerminal: TDataSource;
    ReestrPercentOfTerminal: TADODataSet;
    IntegerField6: TIntegerField;
    DateTimeField16: TDateTimeField;
    DateTimeField17: TDateTimeField;
    StringField11: TStringField;
    FloatField12: TFloatField;
    StringField12: TStringField;
    DateTimeField18: TDateTimeField;
    DS_ReestrShipmentVostok: TDataSource;
    ReestrShipmentVostok: TADODataSet;
    DS_ReestrShipmentOther: TDataSource;
    ReestrShipmentOther: TADODataSet;
    DS_ReestrOffs: TDataSource;
    ReestrOffs: TADODataSet;
    DS_ReestrPublicUtilities: TDataSource;
    ReestrPublicUtilities: TADODataSet;
    ReestrTaxToZp: TADODataSet;
    IntegerField2: TIntegerField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    StringField3: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField4: TStringField;
    DateTimeField6: TDateTimeField;
    DS_ReestrTaxToZp: TDataSource;
    DeleteDocumnAction: TAction;
    PopupIncomeMenu: TPopupMenu;
    CreateIncomePop: TMenuItem;
    DeleteIncomePop: TMenuItem;
    CorrIncomePop: TMenuItem;
    RangeBtn: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    FindEdit: TEdit;
    Bevel1: TBevel;
    ReestrExpenseTYPE_DOC: TStringField;
    RefreshIncomePop: TMenuItem;
    FindBtn: TBitBtn;
    PopupExpenseMenu: TPopupMenu;
    CreateExpensePop: TMenuItem;
    CorrExpensePop: TMenuItem;
    DeleteExpensePop: TMenuItem;
    RefreshExpensePop: TMenuItem;
    CorrExpenceAction: TAction;
    Adapter: TOLEAdapter;
    PrintIncomePop: TMenuItem;
    PrintIncomeReestrPop: TMenuItem;
    Report: TFlexCelReport;
    ReportMenu: TMenuItem;
    RangeIncomePop: TMenuItem;
    PrintIncomeDocPop: TMenuItem;
    ReestrIncomeNUMDOC: TIntegerField;
    ReestrExpenseNUMDOC: TIntegerField;
    DeleteExpenceDocumAction: TAction;
    PopupExpenseZPMenu: TPopupMenu;
    ReestrExpenseZPUNICUM_NUM: TIntegerField;
    ReestrExpenseZPDATE_P_POR: TDateTimeField;
    ReestrExpenseZPCREATE_DATE: TDateTimeField;
    ReestrExpenseZPFAMILY: TStringField;
    ReestrExpenseZPSUM_NAL: TFloatField;
    ReestrExpenseZPSUM_NOT_NAL: TFloatField;
    ReestrExpenseZPWHO_CORR: TStringField;
    ReestrExpenseZPDATE_CORR: TDateTimeField;
    ReestrExpenseZPTYPE_DOC: TStringField;
    ReestrExpenseZPNUMDOC: TIntegerField;
    CorrExpenseZpAction: TAction;
    CorrExpenseZpPop: TMenuItem;
    CreateExpenseZpPop: TMenuItem;
    DeleteExpenseZpPop: TMenuItem;
    DeleteExpenceZpDocAction: TAction;
    PrintExpenseZpPop: TMenuItem;
    PrintExpenseZpReestrPop: TMenuItem;
    ReestrExpenseOtherNUMDOC: TIntegerField;
    ReestrExpenseOtherType_Doc: TStringField;
    PrintExpenseZpDocPop: TMenuItem;
    PrintExpensePop: TMenuItem;
    PrintExpenseReestrPop: TMenuItem;
    PrintExpenseDocPop: TMenuItem;
    PopupExpenseOtherMenu: TPopupMenu;
    CreateExpenseOtherPop: TMenuItem;
    ReestrExpenseZPPRIMECH: TStringField;
    ReestrExpensePRIMECH: TStringField;
    ReestrExpenseOtherPRIMECH: TStringField;
    RefreshExpenseZpPop: TMenuItem;
    ReturnGrid: TDBGrid;
    ReestrReturn: TADODataSet;
    DS_Return: TDataSource;
    DS_ENVD: TDataSource;
    ReestrENVD: TADODataSet;
    ENVDGrid: TDBGrid;
    ModulsMenu: TMenuItem;
    ReestrIncomeTYPE_DOC: TStringField;
    CorrExpenseOtherPop: TMenuItem;
    DeleteExepenseOtherPop: TMenuItem;
    RefreshExpenseOtherPop: TMenuItem;
    CorrExpenseOtherAction: TAction;
    DeleteExpenceOtherDocAction: TAction;
    ReestrZpAupPRIMECH: TStringField;
    ReestrZpAupNUMDOC: TIntegerField;
    PopupZpAupMenu: TPopupMenu;
    CreateZpAupPop: TMenuItem;
    CorrZpAupPop: TMenuItem;
    DeleteZpAupPop: TMenuItem;
    RefreshZpAupPop: TMenuItem;
    DeleteZpAupDocAction: TAction;
    CorrZpAupAction: TAction;
    PrintZpAupPop: TMenuItem;
    PrintZpAupReestrPop: TMenuItem;
    PrintZpAupDocPop: TMenuItem;
    ViewIncomeDocAction: TAction;
    PreviewIncomePop: TMenuItem;
    ViewZpAupAction: TAction;
    PreviewZpAupPop: TMenuItem;
    PreviewExpensePop: TMenuItem;
    PreviewExpenseZpPop: TMenuItem;
    PreviewExpenseOtherPop: TMenuItem;
    RangeZpAupPop: TMenuItem;
    RangeExpensePop: TMenuItem;
    RangeExpenseZpPop: TMenuItem;
    RangeExpenseOtherPop: TMenuItem;
    PrintExpenseOtherPop: TMenuItem;
    PrintExpenseOtherReestrPop: TMenuItem;
    PrintExpenseOtherDocPop: TMenuItem;
    ViewExpenceDocAction: TAction;
    ViewExpenceZpDocAction: TAction;
    ViewExpenceOtherDocAction: TAction;
    ReportBtn: TBitBtn;
    IncomeCashGrid: TDBGrid;
    PopupIncomeCashMenu: TPopupMenu;
    CreateCashPop: TMenuItem;
    ViewCashPop: TMenuItem;
    CorrCashPop: TMenuItem;
    DeleteCashPop: TMenuItem;
    RefreshCashPop: TMenuItem;
    PrintCashPop: TMenuItem;
    ReestrIncomeCashPop: TMenuItem;
    DocIncomeCashPop: TMenuItem;
    RangeCashPop: TMenuItem;
    ReestrIncomeCash: TADODataSet;
    IntegerField12: TIntegerField;
    DateTimeField34: TDateTimeField;
    DateTimeField35: TDateTimeField;
    StringField23: TStringField;
    FloatField10: TFloatField;
    FloatField23: TFloatField;
    StringField24: TStringField;
    DateTimeField36: TDateTimeField;
    IntegerField13: TIntegerField;
    StringField25: TStringField;
    DS_IncomeCash: TDataSource;
    IncomeCashAction: TAction;
    CorrIncomeCashAction: TAction;
    ViewIncomeCashAction: TAction;
    DeleteIncomeCashDocAction: TAction;
    RefershReestrTimer: TTimer;
    ReestrTaxToZpTypeDoc: TStringField;
    ReestrTaxToZpNUMDOC: TIntegerField;
    PopupTaxToZpMenu: TPopupMenu;
    CreateTaxToZpPop: TMenuItem;
    CorrTaxToZpAction: TAction;
    CorrTaxToZpPop: TMenuItem;
    ReestrTaxToZpPrimech: TStringField;
    DeleteTaxToZpAction: TAction;
    DeleteTaxToZpPop: TMenuItem;
    RefreshTaxToZpPop: TMenuItem;
    PreviewTaxToZpPop: TMenuItem;
    PreviewTaxToZpAction: TAction;
    PrintTaxToZpPop: TMenuItem;
    PrintTaxToZpReestrPop: TMenuItem;
    PrintTaxToZpDocPop: TMenuItem;
    RangeTaxToZpPopup: TMenuItem;
    ImageList: TImageList;
    ReestrPercentOfTerminalNUMDOC: TIntegerField;
    ReestrPercentOfTerminalPRIMECH: TStringField;
    ReestrPercentOfTerminalStatusDoc: TStringField;
    PopupPercentOfTerminalMenu: TPopupMenu;
    CreatePercentOfTerminalPop: TMenuItem;
    PreviewPercentOfTerminalPop: TMenuItem;
    CorrPercentOfTerminalPop: TMenuItem;
    DeletePercentOfTerminalPop: TMenuItem;
    PrintPercentOfTerminalPop: TMenuItem;
    PrintReestrPercentOfTerminalPop: TMenuItem;
    PrintDocPercentOfTerminalPop: TMenuItem;
    RefreshPercentOfTerminalPop: TMenuItem;
    RangePercentOfTerminalPop: TMenuItem;
    DeletePercentOfTerminalAction: TAction;
    CorrPercentOfTerminalAction: TAction;
    ViewPercentOfTerminateAction: TAction;
    PopupReportMenu: TPopupMenu;
    ReportDayAction: TAction;
    ReportMonthAction: TAction;
    ReportDayPop: TMenuItem;
    ReportMonthPop: TMenuItem;
    ReportIncomeMonthAction: TAction;
    ReportIncomeCashMonthAction: TAction;
    ReportExpenseMonthAction: TAction;
    ReportExpenseZpMonthAction: TAction;
    ReportExpenseOtherMonthAction: TAction;
    ReportZpAupMonthAction: TAction;
    ReportTaxToZpMonthAction: TAction;
    ReportPercentOfTerminalMonthAction: TAction;
    ReportIncomeDayAction: TAction;
    ReportIncomeCashDayAction: TAction;
    ReportExpenseDayAction: TAction;
    ReportExpenseZpDayAction: TAction;
    ReportExpenseOtherDayAction: TAction;
    ReportZpAupDayAction: TAction;
    ReportTaxToZpDayAction: TAction;
    ReportPercentOfTerminalDayAction: TAction;
    ReestrIncomePRIMECH: TStringField;
    ReestrIncomeCashPRIMECH: TStringField;
    ReestrIncomeFAMILY_1: TStringField;
    ReestrExpenseFAMILY_1: TStringField;
    ReestrExpenseZPFAMILY_1: TStringField;
    ReestrExpenseOtherFAMILY_1: TStringField;
    ReestrZpAupFAMILY_1: TStringField;
    ReestrTaxToZpFAMILY_1: TStringField;
    ReestrPercentOfTerminalFAMILY_1: TStringField;
    ReestrIncomeCashFAMILY_1: TStringField;
    CheckOtmetkaIncomeAction: TAction;
    ReestrIncomeOTMETKA: TStringField;
    ReestrExpenseOTMETKA: TStringField;
    ReestrExpenseZPOTMETKA: TStringField;
    ReestrExpenseOtherOTMETKA: TStringField;
    ReestrZpAupOTMETKA: TStringField;
    ReestrPercentOfTerminalOTMETKA: TStringField;
    KassaSumMenu: TMenuItem;
    TotalSummMenu: TMenuItem;
    UncheckOtmetkaIncomeAction: TAction;
    CheckOtmetkaExpenseAction: TAction;
    UncheckOtmetkaExpenseAction: TAction;
    CheckOtmetkaExpenseZPAction: TAction;
    UncheckOtmetkaExpenseZpAction: TAction;
    CheckOtmetkaExpenseOtherAction: TAction;
    UncheckOtmetkaExpenseOtherAction: TAction;
    CheckOtmetkaZpAupAction: TAction;
    UncheckOtmetkaZpAupAction: TAction;
    CheckOtmetkaTaxToZpAction: TAction;
    UncheckOtmetkaTaxToZpAction: TAction;
    CheckPercentOfTerminalAction: TAction;
    UncheckPercentOfTerminalAction: TAction;
    CheckOtmetkaIncomePop: TMenuItem;
    UncheckOtmetkaIncomePop: TMenuItem;
    CheckOtmetkaExpensePop: TMenuItem;
    UncheckOtmetkaExpensePop: TMenuItem;
    CheckOtmetkaExpenseZPPop: TMenuItem;
    UncheckOtmetkaExpenseZpPop: TMenuItem;
    CheckOtmetkaExpenseOtherPop: TMenuItem;
    UncheckOtmetkaExpenseOtherPop: TMenuItem;
    CheckOtmetkaTaxToZpPop: TMenuItem;
    UncheckOtmetkaTaxToZpPop: TMenuItem;
    CheckOtmetkaZpAupPop: TMenuItem;
    UncheckOtmetkaZpAupPop: TMenuItem;
    CheckPercentOfTerminalPop: TMenuItem;
    UncheckPercentOfTerminalPop: TMenuItem;
    CheckOtmetkaIncomeCashAction: TAction;
    UncheckOtmetkaIncomeCashAction: TAction;
    CheckOtmetkaIncomeCashPop: TMenuItem;
    UncheckOtmetkaIncomeCashPop: TMenuItem;
    ReestrIncomeCashOTMETKA: TStringField;
    ReestrTaxToZpOTMETKA: TStringField;
    TaxToZpGrid: TDBGrid;
    ReestrExpenseWHO_CORR_1: TStringField;
    ReestrIncomeWHO_CORR_1: TStringField;
    ReestrExpenseZPWHO_CORR_1: TStringField;
    ReestrExpenseOtherWHO_CORR_1: TStringField;
    ReestrZpAupWHO_CORR_1: TStringField;
    ReestrTaxToZpWHO_CORR_1: TStringField;
    ReestrPercentOfTerminalWHO_CORR_1: TStringField;
    ReestrIncomeCashWHO_CORR_1: TStringField;
    ViewBtn: TBitBtn;
    CorrBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    CheckOtmetkaBtn: TBitBtn;
    RefreshBtn: TBitBtn;
    SearchBtn: TBitBtn;
    XPManifest1: TXPManifest;
    SuppliersMenu: TMenuItem;
    ReestrShipmentVostokUNICUM_NUM: TIntegerField;
    ReestrShipmentVostokDATE_P_POR: TDateTimeField;
    ReestrShipmentVostokCREATE_DATE: TDateTimeField;
    ReestrShipmentVostokFAMILY_1: TStringField;
    ReestrShipmentVostokFAMILY: TStringField;
    ReestrShipmentVostokSUM_NAL: TFloatField;
    ReestrShipmentVostokSUM_NOT_NAL: TFloatField;
    ReestrShipmentVostokWHO_CORR: TStringField;
    ReestrShipmentVostokDATE_CORR: TDateTimeField;
    ReestrShipmentVostokTYPE_DOC: TStringField;
    ReestrShipmentVostokNUMDOC: TIntegerField;
    ReestrShipmentVostokPRIMECH: TStringField;
    ReestrShipmentVostokOTMETKA: TStringField;
    ReestrShipmentVostokWHO_CORR_1: TStringField;
    ReestrShipmentOtherUNICUM_NUM: TIntegerField;
    ReestrShipmentOtherDATE_P_POR: TDateTimeField;
    ReestrShipmentOtherCREATE_DATE: TDateTimeField;
    ReestrShipmentOtherFAMILY_1: TStringField;
    ReestrShipmentOtherFAMILY: TStringField;
    ReestrShipmentOtherSUM_NAL: TFloatField;
    ReestrShipmentOtherSUM_NOT_NAL: TFloatField;
    ReestrShipmentOtherWHO_CORR: TStringField;
    ReestrShipmentOtherDATE_CORR: TDateTimeField;
    ReestrShipmentOtherTYPE_DOC: TStringField;
    ReestrShipmentOtherNUMDOC: TIntegerField;
    ReestrShipmentOtherPRIMECH: TStringField;
    ReestrShipmentOtherOTMETKA: TStringField;
    ReestrShipmentOtherWHO_CORR_1: TStringField;
    CorrShipmentVostokAction: TAction;
    ViewShipmentVostokAction: TAction;
    CorrShipmentOtherAction: TAction;
    ViewShipmentOtherAction: TAction;
    PopupShipmentVostokMenu: TPopupMenu;
    CreateShipmentVostokPop: TMenuItem;
    CorrShipmentVostokPop: TMenuItem;
    ViewShipmentVostokPop: TMenuItem;
    DeleteShipmentVostokDocAction: TAction;
    DeleteShipmentVostokPop: TMenuItem;
    RefreshShipmentVostokPop: TMenuItem;
    RangeShipmentVostokPop: TMenuItem;
    DeleteShipmentOtherDocAction: TAction;
    PopupShipmentOtherMenu: TPopupMenu;
    CreateShipmentOtherPop: TMenuItem;
    CorrShipmentOtherPop: TMenuItem;
    ViewShipmentOtherPop: TMenuItem;
    DeleteShipmentOtherPop: TMenuItem;
    RefreshShipmentOtherPop: TMenuItem;
    RangeShipmentOtherPop: TMenuItem;
    PrintShipmentVostokPop: TMenuItem;
    PrintReestrShipmentVostokPop: TMenuItem;
    PrintDocShipmentVostokPop: TMenuItem;
    PrintShipmentOtherPop: TMenuItem;
    PrintReestrShipmentOtherPop: TMenuItem;
    PrintDocShipmentOtherPop: TMenuItem;
    CheckOtmetkaShipmentVostokAction: TAction;
    CheckOtmetkaShipmentOtherAction: TAction;
    UncheckOtmetkaShipmentVostokAction: TAction;
    UnheckOtmetkaShipmentOtherAction: TAction;
    CheckOtmetkaShipmentVostokPopup: TMenuItem;
    UnCheckOtmetkaShipmentVostokPopup: TMenuItem;
    CheckOtmetkaShipmentOtherPopup: TMenuItem;
    UnCheckOtmetkaShipmentOtherPopup: TMenuItem;
    ReportShipmentVostokMonthAction: TAction;
    ReportShipmentOtherMonthAction: TAction;
    ReportShipmentVostokDayAction: TAction;
    ReportShipmentOtherDayAction: TAction;
    ReestrOffsUNICUM_NUM: TIntegerField;
    ReestrOffsDATE_P_POR: TDateTimeField;
    ReestrOffsCREATE_DATE: TDateTimeField;
    ReestrOffsFAMILY: TStringField;
    ReestrOffsSUM_NAL: TFloatField;
    ReestrOffsWHO_CORR: TStringField;
    ReestrOffsDATE_CORR: TDateTimeField;
    ReestrOffsNUMDOC: TIntegerField;
    ReestrOffsTYPE_DOC: TStringField;
    ReestrOffsPRIMECH: TStringField;
    ReestrOffsFAMILY_1: TStringField;
    ReestrOffsOTMETKA: TStringField;
    ReestrOffsWHO_CORR_1: TStringField;
    PopupOffsMenu: TPopupMenu;
    CreateOffsPop: TMenuItem;
    RefreshOffsPop: TMenuItem;
    PrintOffsPop: TMenuItem;
    PrintReestrOffsPop: TMenuItem;
    PrintDocOffsPop: TMenuItem;
    RangeOffsPop: TMenuItem;
    CorrOffsAction: TAction;
    ViewOffsAction: TAction;
    ViewOffsPop: TMenuItem;
    CorrOffsPop: TMenuItem;
    DeleteOffsAction: TAction;
    DeleteOffsPop: TMenuItem;
    CheckOtmetkaOffsAction: TAction;
    CheckOtmetkaOffsPop: TMenuItem;
    UnCheckOtmetkaOffsAction: TAction;
    UnCheckOtmetkaOffsPop: TMenuItem;
    ReturnAction: TAction;
    CorrReturnAction: TAction;
    ReestrReturnUNICUM_NUM: TIntegerField;
    ReestrReturnDATE_P_POR: TDateTimeField;
    ReestrReturnCREATE_DATE: TDateTimeField;
    ReestrReturnFAMILY: TStringField;
    ReestrReturnSUM_NAL: TFloatField;
    ReestrReturnWHO_CORR: TStringField;
    ReestrReturnDATE_CORR: TDateTimeField;
    ReestrReturnNUMDOC: TIntegerField;
    ReestrReturnTYPE_DOC: TStringField;
    ReestrReturnPRIMECH: TStringField;
    ReestrReturnFAMILY_1: TStringField;
    ReestrReturnOTMETKA: TStringField;
    ReestrReturnWHO_CORR_1: TStringField;
    PopupReturnMenu: TPopupMenu;
    CreateReturnPop: TMenuItem;
    ViewReturnPop: TMenuItem;
    CorrReturnPop: TMenuItem;
    DeleteReturnPop: TMenuItem;
    CheckOtmReturnPop: TMenuItem;
    UnCheckOtmReturnPop: TMenuItem;
    RefreshReturnPop: TMenuItem;
    PrintReturnPop: TMenuItem;
    PrintReestrReturnPop: TMenuItem;
    PrintReturnDocPop: TMenuItem;
    RangeReturnPop: TMenuItem;
    ViewReturnAction: TAction;
    CheckOtmetkaReturnAction: TAction;
    UnCheckOtmetkaReturnAction: TAction;
    DeleteReturnAction: TAction;
    ReportOffsMonthAction: TAction;
    ReportReturnMonthAction: TAction;
    ReportOffsDayAction: TAction;
    ReportReturnDayAction: TAction;
    EnvdAction: TAction;
    ReestrENVDUNICUM_NUM: TIntegerField;
    ReestrENVDDATE_P_POR: TDateTimeField;
    ReestrENVDCREATE_DATE: TDateTimeField;
    ReestrENVDFAMILY: TStringField;
    ReestrENVDSUM_NAL: TFloatField;
    ReestrENVDWHO_CORR: TStringField;
    ReestrENVDDATE_CORR: TDateTimeField;
    ReestrENVDNUMDOC: TIntegerField;
    ReestrENVDTYPE_DOC: TStringField;
    ReestrENVDPRIMECH: TStringField;
    ReestrENVDFAMILY_1: TStringField;
    ReestrENVDOTMETKA: TStringField;
    ReestrENVDWHO_CORR_1: TStringField;
    CorrEnvdAction: TAction;
    ViewEnvdAction: TAction;
    PopupEnvdMenu: TPopupMenu;
    CreateEnvdPop: TMenuItem;
    CorrEnvdPop: TMenuItem;
    ViewEnvdPop: TMenuItem;
    RefreshEnvdPop: TMenuItem;
    PrintEnvdPop: TMenuItem;
    PrintReestrEnvdPop: TMenuItem;
    PrintDocEnvdPop: TMenuItem;
    RangeEnvdPop: TMenuItem;
    DeleteEnvdAction: TAction;
    N2: TMenuItem;
    CheckOtmetkaEnvdAction: TAction;
    UnCheckOtmetkaEnvdAction: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    ReportEnvdDayAction: TAction;
    ReportEnvdMonthAction: TAction;
    TypeEnergyMenu: TMenuItem;
    ReestrPublicUtilitiesUNICUM_NUM: TIntegerField;
    ReestrPublicUtilitiesDATE_P_POR: TDateTimeField;
    ReestrPublicUtilitiesCREATE_DATE: TDateTimeField;
    ReestrPublicUtilitiesFAMILY: TStringField;
    ReestrPublicUtilitiesSUM_NOT_NAL: TFloatField;
    ReestrPublicUtilitiesWHO_CORR: TStringField;
    ReestrPublicUtilitiesNUMDOC: TIntegerField;
    ReestrPublicUtilitiesPRIMECH: TStringField;
    ReestrPublicUtilitiesFAMILY_1: TStringField;
    ReestrPublicUtilitiesOTMETKA: TStringField;
    ReestrPublicUtilitiesWHO_CORR_1: TStringField;
    ReestrPublicUtilitiesSUM_NAL: TFloatField;
    ReestrPublicUtilitiesDATE_CORR: TDateTimeField;
    PopupPublicUtilitiesMenu: TPopupMenu;
    CreatePublicUtilitiesPop: TMenuItem;
    DeletePublicUtilitiesDocAction: TAction;
    CorrPublicUtilitiesAction: TAction;
    ViewPublicUtilitiesAction: TAction;
    CorrPublicUtilitiesPop: TMenuItem;
    DeletePublicUtilitiesPop: TMenuItem;
    ViewPublicUtilitiesPop: TMenuItem;
    RefreshPublicUtilitiesPop: TMenuItem;
    RangePublicUtilitiesPop: TMenuItem;
    CheckOtmetkaPublicUtilitiesAction: TAction;
    UnCheckOtmetkaPublicUtilitiesAction: TAction;
    CheckOtmetkaPublicUtilitiesPop: TMenuItem;
    UnCheckOtmetkaPublicUtilitiesPop: TMenuItem;
    PrintPublicUtilitiesPop: TMenuItem;
    PrintReestrPublicUtilities: TMenuItem;
    PrintDocPublicUtilities: TMenuItem;
    ReportPublicUtilitiesDayAction: TAction;
    ReportPublicUtilitiesMonthAction: TAction;
    StateMenu: TMenuItem;
    CorrDocMenu: TMenuItem;
    ViewDocMenu: TMenuItem;
    DeleteDocMenu: TMenuItem;
    SetOtmetkaDocMenu: TMenuItem;
    ReportDateMenu: TMenuItem;
    ReportMonthMenu: TMenuItem;
    MainPopupMenu: TPopupMenu;
    N23: TMenuItem;
    N41: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N35: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    DownloadBtn: TBitBtn;
    CashBoxBtn: TBitBtn;
    procedure ShopMenuClick(Sender: TObject);
    procedure UserMenuClick(Sender: TObject);
    procedure CreateBtnClick(Sender: TObject);
    procedure IncomeActionExecute(Sender: TObject);
    procedure TabsClick(Sender: TObject);
    procedure DeleteDocumnActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RangeBtnClick(Sender: TObject);
    procedure ExpenseActionExecute(Sender: TObject);
    procedure RefreshIncomePopClick(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure CorrIncomActionExecute(Sender: TObject);
    procedure CorrExpenceActionExecute(Sender: TObject);
    procedure PrintIncomeReestrPopClick(Sender: TObject);
    procedure IncomeGridTitleClick(Column: TColumn);
    procedure PrintIncomeDocPopClick(Sender: TObject);
    procedure DeleteExpenceDocumActionExecute(Sender: TObject);
    procedure ExpenseZPActionExecute(Sender: TObject);
    procedure CorrExpenseZpActionExecute(Sender: TObject);
    procedure DeleteExpenceZpDocActionExecute(Sender: TObject);
    procedure PrintExpenseReestrPopClick(Sender: TObject);
    procedure PrintExpenseDocPopClick(Sender: TObject);
    procedure ExpenseOtherActionExecute(Sender: TObject);
    procedure ReportExpPopupClick(Sender: TObject);
    procedure PrintExpenseZpReestrPopClick(Sender: TObject);
    procedure PrintExpenseZpDocPopClick(Sender: TObject);
    procedure RefreshExpensePopClick(Sender: TObject);
    procedure RefreshExpenseZpPopClick(Sender: TObject);
    procedure NaznachenieMenuClick(Sender: TObject);
    procedure AccessMenuClick(Sender: TObject);
    procedure ModulsMenuClick(Sender: TObject);
    procedure CorrExpenseOtherActionExecute(Sender: TObject);
    procedure DeleteExpenceOtherDocActionExecute(Sender: TObject);
    procedure RefreshExpenseOtherPopClick(Sender: TObject);
    procedure ZpAupActionExecute(Sender: TObject);
    procedure DeleteZpAupDocActionExecute(Sender: TObject);
    procedure CorrZpAupActionExecute(Sender: TObject);
    procedure RefreshZpAupPopClick(Sender: TObject);
    procedure ViewIncomeDocActionExecute(Sender: TObject);
    procedure ViewZpAupActionExecute(Sender: TObject);
    procedure ViewExpenceDocActionExecute(Sender: TObject);
    procedure ViewExpenceZpDocActionExecute(Sender: TObject);
    procedure ViewExpenceOtherDocActionExecute(Sender: TObject);
    procedure PrintZpAupReestrPopClick(Sender: TObject);
    procedure PrintZpAupDocPopClick(Sender: TObject);
    procedure PrintExpenseOtherReestrPopClick(Sender: TObject);
    procedure PrintExpenseOtherDocPopClick(Sender: TObject);
    procedure IncomeCashActionExecute(Sender: TObject);
    procedure CorrIncomeCashActionExecute(Sender: TObject);
    procedure ViewIncomeCashActionExecute(Sender: TObject);
    procedure DeleteIncomeCashDocActionExecute(Sender: TObject);
    procedure ReestrIncomeCashPopClick(Sender: TObject);
    procedure DocIncomeCashPopClick(Sender: TObject);
    procedure RefershReestrTimerTimer(Sender: TObject);
    procedure TaxToZpActionExecute(Sender: TObject);
    procedure CorrTaxToZpActionExecute(Sender: TObject);
    procedure DeleteTaxToZpActionExecute(Sender: TObject);
    procedure RefreshTaxToZpPopClick(Sender: TObject);
    procedure PreviewTaxToZpActionExecute(Sender: TObject);
    procedure PrintTaxToZpReestrPopClick(Sender: TObject);
    procedure PrintTaxToZpDocPopClick(Sender: TObject);
    procedure Bar2DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure RefreshPercentOfTerminalPopClick(Sender: TObject);
    procedure PercentOfTerminalActionExecute(Sender: TObject);
    procedure DeletePercentOfTerminalActionExecute(Sender: TObject);
    procedure CorrPercentOfTerminalActionExecute(Sender: TObject);
    procedure ViewPercentOfTerminateActionExecute(Sender: TObject);
    procedure PrintReestrPercentOfTerminalPopClick(Sender: TObject);
    procedure PrintDocPercentOfTerminalPopClick(Sender: TObject);
    procedure ReportMonthActionExecute(Sender: TObject);
    procedure ReportBtnClick(Sender: TObject);
    procedure ReportDayActionExecute(Sender: TObject);
    procedure ReportIncomeMonthActionExecute(Sender: TObject);
    procedure ReportIncomeCashMonthActionExecute(Sender: TObject);
    procedure ReportExpenseMonthActionExecute(Sender: TObject);
    procedure ReportExpenseZpMonthActionExecute(Sender: TObject);
    procedure ReportExpenseOtherMonthActionExecute(Sender: TObject);
    procedure ReportZpAupMonthActionExecute(Sender: TObject);
    procedure ReportTaxToZpMonthActionExecute(Sender: TObject);
    procedure ReportPercentOfTerminalMonthActionExecute(Sender: TObject);
    procedure ReportIncomeDayActionExecute(Sender: TObject);
    procedure ReportIncomeCashDayActionExecute(Sender: TObject);
    procedure ReportExpenseDayActionExecute(Sender: TObject);
    procedure ReportExpenseZpDayActionExecute(Sender: TObject);
    procedure ReportExpenseOtherDayActionExecute(Sender: TObject);
    procedure ReportZpAupDayActionExecute(Sender: TObject);
    procedure ReportTaxToZpDayActionExecute(Sender: TObject);
    procedure ReportPercentOfTerminalDayActionExecute(Sender: TObject);
    procedure CheckOtmetkaIncomeActionExecute(Sender: TObject);
    procedure UncheckOtmetkaIncomeActionExecute(Sender: TObject);
    procedure CheckOtmetkaExpenseActionExecute(Sender: TObject);
    procedure CheckOtmetkaExpenseZPActionExecute(Sender: TObject);
    procedure UncheckOtmetkaExpenseZpActionExecute(Sender: TObject);
    procedure CheckOtmetkaExpenseOtherActionExecute(Sender: TObject);
    procedure UncheckOtmetkaExpenseOtherActionExecute(Sender: TObject);
    procedure CheckOtmetkaZpAupActionExecute(Sender: TObject);
    procedure UncheckOtmetkaZpAupActionExecute(Sender: TObject);
    procedure CheckOtmetkaTaxToZpActionExecute(Sender: TObject);
    procedure UncheckOtmetkaTaxToZpActionExecute(Sender: TObject);
    procedure CheckPercentOfTerminalActionExecute(Sender: TObject);
    procedure UncheckPercentOfTerminalActionExecute(Sender: TObject);
    procedure CheckOtmetkaIncomeCashActionExecute(Sender: TObject);
    procedure UncheckOtmetkaIncomeCashActionExecute(Sender: TObject);
    procedure UncheckOtmetkaExpenseActionExecute(Sender: TObject);
    procedure IncomeGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ExpenseGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ExpenseZPGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ExpenseOtherGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ZpAupGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TaxToZpGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PercentOfTerminalGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure IncomeCashGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PopupIncomeMenuPopup(Sender: TObject);
    procedure PopupExpenseMenuPopup(Sender: TObject);
    procedure PopupExpenseOtherMenuPopup(Sender: TObject);
    procedure PopupExpenseZPMenuPopup(Sender: TObject);
    procedure PopupZpAupMenuPopup(Sender: TObject);
    procedure PopupTaxToZpMenuPopup(Sender: TObject);
    procedure PopupPercentOfTerminalMenuPopup(Sender: TObject);
    procedure PopupIncomeCashMenuPopup(Sender: TObject);
    procedure TotalSummMenuClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure CorrBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure CheckOtmetkaBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure RefreshCashPopClick(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
    procedure SuppliersMenuClick(Sender: TObject);
    procedure ShipmentVostokActionExecute(Sender: TObject);
    procedure CorrShipmentVostokActionExecute(Sender: TObject);
    procedure ViewShipmentVostokActionExecute(Sender: TObject);
    procedure ShipmentOtherActionExecute(Sender: TObject);
    procedure CorrShipmentOtherActionExecute(Sender: TObject);
    procedure ViewShipmentOtherActionExecute(Sender: TObject);
    procedure RefreshShipmentVostokPopClick(Sender: TObject);
    procedure DeleteShipmentVostokDocActionExecute(Sender: TObject);
    procedure DeleteShipmentOtherDocActionExecute(Sender: TObject);
    procedure CheckOtmetkaShipmentVostokActionExecute(Sender: TObject);
    procedure CheckOtmetkaShipmentOtherActionExecute(Sender: TObject);
    procedure UncheckOtmetkaShipmentVostokActionExecute(Sender: TObject);
    procedure UnheckOtmetkaShipmentOtherActionExecute(Sender: TObject);
    procedure ShipmentVostokGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ShipmentOtherGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PopupShipmentVostokMenuPopup(Sender: TObject);
    procedure PopupShipmentOtherMenuPopup(Sender: TObject);
    procedure PrintReestrShipmentVostokPopClick(Sender: TObject);
    procedure PrintReestrShipmentOtherPopClick(Sender: TObject);
    procedure PrintDocShipmentVostokPopClick(Sender: TObject);
    procedure PrintDocShipmentOtherPopClick(Sender: TObject);
    procedure ReportShipmentVostokMonthActionExecute(Sender: TObject);
    procedure ReportShipmentOtherMonthActionExecute(Sender: TObject);
    procedure ReportShipmentVostokDayActionExecute(Sender: TObject);
    procedure ReportShipmentOtherDayActionExecute(Sender: TObject);
    procedure OffsActionExecute(Sender: TObject);
    procedure CorrOffsActionExecute(Sender: TObject);
    procedure ViewOffsActionExecute(Sender: TObject);
    procedure DeleteOffsActionExecute(Sender: TObject);
    procedure PrintReestrOffsPopClick(Sender: TObject);
    procedure CheckOtmetkaOffsActionExecute(Sender: TObject);
    procedure UnCheckOtmetkaOffsActionExecute(Sender: TObject);
    procedure PopupOffsMenuPopup(Sender: TObject);
    procedure OffsGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PrintDocOffsPopClick(Sender: TObject);
    procedure ReturnActionExecute(Sender: TObject);
    procedure CorrReturnActionExecute(Sender: TObject);
    procedure ViewReturnActionExecute(Sender: TObject);
    procedure PrintReestrReturnPopClick(Sender: TObject);
    procedure PrintReturnDocPopClick(Sender: TObject);
    procedure ReturnGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckOtmetkaReturnActionExecute(Sender: TObject);
    procedure UnCheckOtmetkaReturnActionExecute(Sender: TObject);
    procedure DeleteReturnActionExecute(Sender: TObject);
    procedure PopupReturnMenuPopup(Sender: TObject);
    procedure ReportOffsMonthActionExecute(Sender: TObject);
    procedure ReportReturnMonthActionExecute(Sender: TObject);
    procedure ReportOffsDayActionExecute(Sender: TObject);
    procedure ReportReturnDayActionExecute(Sender: TObject);
    procedure RefreshReturnPopClick(Sender: TObject);
    procedure RefreshOffsPopClick(Sender: TObject);
    procedure EnvdActionExecute(Sender: TObject);
    procedure CorrEnvdActionExecute(Sender: TObject);
    procedure ViewEnvdActionExecute(Sender: TObject);
    procedure DeleteEnvdActionExecute(Sender: TObject);
    procedure CheckOtmetkaEnvdActionExecute(Sender: TObject);
    procedure UnCheckOtmetkaEnvdActionExecute(Sender: TObject);
    procedure ENVDGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RefreshEnvdPopClick(Sender: TObject);
    procedure ReportEnvdDayActionExecute(Sender: TObject);
    procedure ReportEnvdMonthActionExecute(Sender: TObject);
    procedure PrintReestrEnvdPopClick(Sender: TObject);
    procedure PrintDocEnvdPopClick(Sender: TObject);
    procedure TypeEnergyMenuClick(Sender: TObject);
    procedure PublicUtilitiesActionExecute(Sender: TObject);
    procedure DeletePublicUtilitiesDocActionExecute(Sender: TObject);
    procedure CorrPublicUtilitiesActionExecute(Sender: TObject);
    procedure ViewPublicUtilitiesActionExecute(Sender: TObject);
    procedure RefreshPublicUtilitiesPopClick(Sender: TObject);
    procedure RefreshShipmentOtherPopClick(Sender: TObject);
    procedure CheckOtmetkaPublicUtilitiesActionExecute(Sender: TObject);
    procedure UnCheckOtmetkaPublicUtilitiesActionExecute(Sender: TObject);
    procedure PopupPublicUtilitiesMenuPopup(Sender: TObject);
    procedure PublicUtilitiesGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PrintReestrPublicUtilitiesClick(Sender: TObject);
    procedure PrintDocPublicUtilitiesClick(Sender: TObject);
    procedure ReportPublicUtilitiesDayActionExecute(Sender: TObject);
    procedure ReportPublicUtilitiesMonthActionExecute(Sender: TObject);
    procedure StateMenuClick(Sender: TObject);
    procedure DownloadBtnClick(Sender: TObject);
    procedure CashBoxBtnClick(Sender: TObject);
  private
    { Private declarations }

    procedure OpenSales;

    function GetBegDate: variant;
    function GetEndDate: variant;
    function GetDatePor: variant;

    procedure CallRangeForm(TabIndex: integer);
    procedure FirstRunApplication;

  public
    { Public declarations }
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    procedure AccessIncomeMode(i_TabIndex, ModeAccess: integer);
    procedure IncomeDifference(BegDate, EndDate: TDateTime);
    procedure BarCalc(TabIndex: integer);
    procedure BarRange;

 published
    property BegDate: variant read GetBegDate;
    property EndDate: variant read GetEndDate;
    property DatePor: variant read GetDatePor;
  end;

var
  MainForm: TMainForm;
  StrFilter: string;
  TypeSaveIncome, TypeSaveZpAup, TypeSaveTaxToZp, TypeSavePercent, TypeReport: integer;
  f_GetDate, RangeTabIndex: integer;
  TypeSaveExpence, TypeExpense: integer;
  TypeSaveShipment, TypeShipment: integer;
  TypeSaveOffs, TypeOffs: integer;
  TypeSavePublicUtilities, TypePublicUtilities: integer;
  DBeg, DEnd: TDateTime;
  i_AccessMode, Idx, fl_TypeReport: integer;


implementation

uses Shop, User, CreateDoc, AddShop, ModuleData, sConst, Globals, Range,
  Expenses, StrUtils, IncomeReport, Naznachenie, Access, Module, ZpAup,
  IncomeCash, TaxToZp, PercentOfTerminal, StdConvs, KassaSum, Search,
  Supplier, Shipment, Offs, TypeEnergy, PublicUtilities, StateBuh,
  DownloadFile;

{$R *.dfm}

procedure TMainForm.ShopMenuClick(Sender: TObject);
var
    ShopF: TShopForm;
begin
  ShopF := TShopForm.Create(MainForm);

      try
        ShopF.SettingShopForm(0);
        ShopF.RefreshShopGrid();
        ShopF.ShowModal();
      finally
         FreeAndNil(ShopF);
      end;
end;

procedure TMainForm.UserMenuClick(Sender: TObject);
var
    UserF: TUserForm;
begin
  try
      UserF := TUserForm.Create(MainForm);
      UserF.RefreshUser();
      UserF.ShowModal();
  finally
      FreeAndNil(UserF);
  end;
end;

procedure TMainForm.CreateBtnClick(Sender: TObject);
begin

  case Tabs.TabIndex of
    TAB_Income:        IncomeActionExecute(Self);
    TAB_Expense:       ExpenseActionExecute(Self);
    TAB_ExpenseZP:     ExpenseZPActionExecute(Self);
    TAB_ExpenseOther:  ExpenseOtherActionExecute(Self);
    TAB_ZpAup:         ZpAupActionExecute(Self);
    TAB_TaxToZp:       TaxToZpActionExecute(Self);
    TAB_PercentOfTerminal: PercentOfTerminalActionExecute(Self);
    TAB_ShipmentVostok:    ShipmentVostokActionExecute(Self);
    TAB_ShipmentOther:     ShipmentOtherActionExecute(Self);
    TAB_Offs:              OffsActionExecute(Self);
    TAB_PublicUtilities:   PublicUtilitiesActionExecute(Self);
    TAB_Return:            ReturnActionExecute(Self);
    TAB_ENVD:              EnvdActionExecute(Self);
    TAB_IncomeCash:         IncomeCashActionExecute(Self);
  end;

end;

procedure TMainForm.IncomeActionExecute(Sender: TObject);
var
    i: integer;
    IncomeF: TCreateDocumentForm;
begin
    IncomeF := TCreateDocumentForm.Create(MainForm);
    try
        AppData.Organiz.Active := False;
        AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
        AppData.Organiz.Active := True;

       with IncomeF do
       begin
          DetailStringGridSetting(g_CreateDoc);
          TypeSaveIncome := g_CreateDoc;
          Caption := 'Создать документ (Выручка)';
          NumDocEdit.Text := EmptyStr;
          DateIncomePicker.Date := Now();
       end;

      AppData.Organiz.First;
       with IncomeF.DetailStringGrid do
        Begin
          RowCount := AppData.Organiz.RecordCount+1;
          while not AppData.Organiz.Eof do
           Begin
            For i := 1 to RowCount-1 do
             Begin
                Cells[0,i] := IntToStr(i);
                Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
                Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
                Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
                AppData.Organiz.Next;
             end;
           end;
        end;

        with  IncomeF.Bar do
          Begin
            Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
            Panels[1].Text := 'Сумма (нал): ' + '0';
            Panels[2].Text := 'Сумма (безнал): ' + '0';
          end;

          IncomeF.ShowModal();
    finally
        FreeAndNil(IncomeF);
    end;
end;

procedure TMainForm.OpenSales;
var
  Dataset: TDataset;
begin
Screen.Cursor := crSQLWait;
case Tabs.TabIndex of
  TAB_Income            :   Dataset := ReestrIncome;
  TAB_Expense           :   Dataset := ReestrExpense;
  TAB_ExpenseZP         :   Dataset := ReestrExpenseZP;
  TAB_ExpenseOther      :   Dataset := ReestrExpenseOther;
  TAB_ZpAup             :   Dataset := ReestrZpAup;
  TAB_TaxToZp           :   Dataset := ReestrTaxToZp;
  TAB_PercentOfTerminal :   Dataset := ReestrPercentOfTerminal;
  TAB_ShipmentVostok    :   Dataset := ReestrShipmentVostok;
  TAB_ShipmentOther     :   Dataset := ReestrShipmentOther;
  TAB_Offs              :   Dataset := ReestrOffs;
  TAB_PublicUtilities   :   Dataset := ReestrPublicUtilities;
  TAB_Return            :   Dataset := ReestrReturn;
  TAB_ENVD              :   Dataset := ReestrENVD;
  TAB_IncomeCash        :   DataSet := ReestrIncomeCash;


end;
 Dataset.DisableControls;
 Try
    Dataset.Active := False;
    Dataset.Active := True;
 finally
  Dataset.EnableControls;
  Screen.Cursor := crDefault;
  case Tabs.TabIndex of
   TAB_Income:            begin
                            InvalidateRect(IncomeGrid.Handle, nil, True);
                            IncomeGrid.Align := alClient;
                            BarCalc(TAB_Income);
                            //IncomeGrid.SetFocus;
                          end;

   TAB_Expense:           begin
                            InvalidateRect(ExpenseGrid.Handle, nil, True);
                            ExpenseGrid.Align := alClient;
                            BarCalc(TAB_Expense);
                            //ExpenseGrid.SetFocus;
                          end;

   TAB_ExpenseZP:         begin
                            InvalidateRect(ExpenseZPGrid.Handle, nil, True);
                            ExpenseZPGrid.Align := alClient;
                            BarCalc(TAB_ExpenseZP);
                            //ExpenseZPGrid.SetFocus;
                          end;

   TAB_ExpenseOther:      begin
                            InvalidateRect(ExpenseOtherGrid.Handle, nil, True);
                            BarCalc(TAB_ExpenseOther);
                            ExpenseOtherGrid.Align := alClient;
                            //ExpenseOtherGrid.SetFocus;
                          end;

   TAB_ZpAup:             begin
                            InvalidateRect(ZpAupGrid.Handle, nil, True);
                            BarCalc(TAB_ZpAup);
                            ZpAupGrid.Align := alClient;
                            //ZpAupGrid.SetFocus;
                          end;

   TAB_TaxToZp:           begin
                            InvalidateRect(TaxToZpGrid.Handle, nil, True);
                            BarCalc(TAB_TaxToZp);
                            TaxToZpGrid.Align := alClient;
                            //TaxToZpGrid.SetFocus;
                          end;
   TAB_PercentOfTerminal: begin
                            InvalidateRect(PercentOfTerminalGrid.Handle, nil, True);
                            BarCalc(TAB_PercentOfTerminal);
                            PercentOfTerminalGrid.Align := alClient;
                            //PercentOfTerminalGrid.SetFocus;
                          end;

   TAB_ShipmentVostok:    begin
                            InvalidateRect(ShipmentVostokGrid.Handle, nil, True);
                            BarCalc(TAB_ShipmentVostok);
                            ShipmentVostokGrid.Align := alClient;
                            //ShipmentVostokGrid.SetFocus;
                          end;

   TAB_ShipmentOther:     begin
                            InvalidateRect(ShipmentOtherGrid.Handle, nil, True);
                            BarCalc(TAB_ShipmentOther);
                            ShipmentOtherGrid.Align := alClient;
                            //ShipmentOtherGrid.SetFocus;
                          end;

   TAB_Offs:              begin
                            InvalidateRect(OffsGrid.Handle, nil, True);
                            OffsGrid.Align := alClient;
                            BarCalc(TAB_Offs);
                            //OffsGrid.SetFocus;
                          end;

   TAB_PublicUtilities:   begin
                            InvalidateRect(PublicUtilitiesGrid.Handle, nil, True);
                            PublicUtilitiesGrid.Align := alClient;
                            BarCalc(TAB_PublicUtilities);
                          end;

   TAB_Return:           begin
                            InvalidateRect(ReturnGrid.Handle, nil, True);
                            ReturnGrid.Align := alClient;
                            BarCalc(TAB_Return);
                            //ReturnGrid.SetFocus;
                          end;

   TAB_ENVD:              begin
                            InvalidateRect(ENVDGrid.Handle, nil, True);
                            ENVDGrid.Align := alClient;
                            BarCalc(TAB_ENVD);
                            //ENVDGrid.SetFocus;
                          end;

   TAB_IncomeCash:       Begin
                          InvalidateRect(IncomeCashGrid.Handle, nil, True);
                          IncomeCashGrid.Align := alClient;
                          BarCalc(TAB_IncomeCash);
                         end;
  end;
 end;
end;

procedure TMainForm.TabsClick(Sender: TObject);
var
     i, LowItemAccess: integer;
     QMessage: Word;
begin

  if Tabs.TabIndex in AccessM  then
  begin
     IncomeGrid.Visible := Tabs.TabIndex = TAB_Income;
     ExpenseGrid.Visible := Tabs.TabIndex = TAB_Expense;
     ExpenseZPGrid.Visible := Tabs.TabIndex = TAB_ExpenseZP;
     ExpenseOtherGrid.Visible := Tabs.TabIndex = TAB_ExpenseOther;
     ZpAupGrid.Visible := Tabs.TabIndex = TAB_ZpAup;
     TaxToZpGrid.Visible := Tabs.TabIndex = TAB_TaxToZp;
     PercentOfTerminalGrid.Visible := Tabs.TabIndex = TAB_PercentOfTerminal;
     ShipmentVostokGrid.Visible := Tabs.TabIndex = TAB_ShipmentVostok;
     ShipmentOtherGrid.Visible := Tabs.TabIndex = TAB_ShipmentOther;
     OffsGrid.Visible := Tabs.TabIndex = TAB_Offs;
     PublicUtilitiesGrid.Visible := Tabs.TabIndex = TAB_PublicUtilities;
     ReturnGrid.Visible := Tabs.TabIndex = TAB_Return;
     ENVDGrid.Visible := Tabs.TabIndex = TAB_ENVD;
     IncomeCashGrid.Visible := Tabs.TabIndex = TAB_IncomeCash;

     OpenSales();

      if f_GetDate = 0 then
         IncomeDifference(DBeg, DEnd)
      else
         IncomeDifference(RangeForm.BeginPicker.Date, RangeForm.EndPicker.Date);

     AppData.UserAccess.Locate('MODULE_UID', IntToStr(Tabs.TabIndex), [loCaseInsensitive, loPartialKey]);
     i_AccessMode := AppData.UserAccess.FieldByName('Mode').AsInteger;
     AccessIncomeMode(Tabs.TabIndex, i_AccessMode);
  end
  else
  Begin
      for i:= 0 to 255 do
        if i in AccessM then
        Begin
          Tabs.TabIndex := i;
            QMessage := MessageBox(Handle, PChar('У вас нет прав на просмотр данный вкладки! Обратитесь к администратору'),PChar('Ограничение доступа'), MB_ICONINFORMATION+MB_OK);
            Break;
        end;

  end;
end;

procedure TMainForm.DeleteDocumnActionExecute(Sender: TObject);
var
    QDel, QRes:  word;
begin
  if not (ReestrIncome.IsEmpty) then
    Begin
      AppData.GetIncomeDetail.Active := False;
      AppData.GetIncomeDetail.CommandText := Format( SSQLGetIncomeDetail, [MainForm.ReestrIncome.FieldByName('UNICUM_NUM').AsInteger]);
      AppData.GetIncomeDetail.Active := True;


      if AppData.GetIncomeDetail.FieldByName('StatusDoc').AsString = '*'then
         begin
          MessageBox(Handle, PChar('Документ: ' + AppData.GetIncomeDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
          Exit;
         end
      else
        Begin
          QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
          if QDel=IDYES then
            begin
              AppData.DeleteIncomeDocum.Active := False;
              AppData.DeleteIncomeDocum.CommandText := FOrmat (SSQLD_DeleteIncomeDocum, [ReestrIncome.FieldByName('UNICUM_NUM').AsInteger,
                                                                                         ReestrIncome.FieldByName('NUMDOC').AsInteger]);
              AppData.DeleteIncomeDocum.Active := True;
              QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

              ReestrIncome.Active := False;
              ReestrIncome.Active := True;
              BarCalc(TAB_Income);
            end
        else
            Exit;
        end;
    end
  else
            Exit;
end;

procedure TMainForm.AppMessage(var Msg: TMsg; var Handled: Boolean);
var I : SmallInt;
begin
if Msg.message= WM_MOUSEWHEEL then
  begin
    Msg.message:=WM_KEYDOWN;
    Msg.lParam:=0;
    i:=HiWord(Msg.wParam);

    if i>0 then
        Msg.wParam:=VK_UP
    else
        Msg.wParam:=VK_DOWN;
        Handled:=false;
  end;
end;


procedure TMainForm.FirstRunApplication;
begin
  ReestrIncome.CommandText  := Format(SSQLGetReestrincome, [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                          FormatDateTime('yyyy-mm-dd', DEnd)]);

  ReestrExpense.CommandText := Format(SSQLGetReestrExpense, [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                            FormatDateTime('yyyy-mm-dd', DEnd)]);

  ReestrExpenseZP.CommandText := Format(SSQLGetReestrExpenseZP, [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                                  FormatDateTime('yyyy-mm-dd', DEnd)]);

  ReestrExpenseOther.CommandText := Format(SSQLGetReestrExpenseOther, [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                                            FormatDateTime('yyyy-mm-dd', DEnd)]);

  ReestrZpAup.CommandText := Format(SSQLGetReestrZpAUP, [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                            FormatDateTime('yyyy-mm-dd', DEnd)]);

  ReestrTaxToZp.CommandText := Format(SSQLGetReestrTaxToZp, [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                            FormatDateTime('yyyy-mm-dd', DEnd)]);

  ReestrPercentOfTerminal.CommandText := Format(SSQLGetReestrPercentOfTerminal, [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                                                            FormatDateTime('yyyy-mm-dd', DEnd)]);

  ReestrShipmentVostok.CommandText := Format(SSQLGetReestrShipmentVostok, [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                                                  FormatDateTime('yyyy-mm-dd', DEnd)]);

  ReestrShipmentOther.CommandText := Format(SSQLGetReestrShipmentOther,  [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                                                FormatDateTime('yyyy-mm-dd', DEnd)]);

  ReestrOffs.CommandText := Format(SSQLGetReestrOffs,  [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                     FormatDateTime('yyyy-mm-dd', DEnd)]);

  ReestrReturn.CommandText := Format(SSQLGetReestrReturn, [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                          FormatDateTime('yyyy-mm-dd', DEnd)]);

  ReestrPublicUtilities.CommandText := Format(SSQLGetReestrPublicUtilities, [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                                                      FormatDateTime('yyyy-mm-dd', DEnd)]);

  ReestrENVD.CommandText  := Format(SSQLGetReestrEnvd,    [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                          FormatDateTime('yyyy-mm-dd', DEnd)]);

  ReestrIncomeCash.CommandText := Format(SSQLGetReestrIncomeCach, [FormatDateTime('yyyy-mm-dd', DBeg),
                                                                                     FormatDateTime('yyyy-mm-dd', DEnd)]);

end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     // Первый и последний день текущего месяца
      DBeg := StartOfTheMonth(Now);
      DEnd := EndOfTheMonth(Now);
      f_GetDate := 0;
      Idx := 99;

      AppData.Users.Active := False;
      AppData.Users.Active := True;
      AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
      if AppData.Users.FieldByName('Admin').AsString = '*' then
        Begin
           SettingMenu.Visible := True;
           //KassaSumMenu.Visible := True;
        end
      else
        Begin
          SettingMenu.Visible := False;
          //KassaSumMenu.Visible := False;
        end;


     Application.OnMessage := AppMessage;  // Пролистывание всех DBGrid в программе

     Bar1.Panels[0].Text := 'UID пользователя: ' + IntToStr(g_UserUID);
     Bar1.Panels[1].Text := 'Пользователь: ' + g_User;
     Bar1.Panels[2].Text := 'Сервер: ' + g_Server;
     BarRange();

     // Ограничение на действия с документами
     FirstRunApplication();
     AppData.AccessArraySetting();
     AppData.UserAccess.First;
     AccessIncomeMode(AppData.UserAccess.FieldByName('MODULE_UID').AsInteger, i_AccessMode);
     TabsClick(Self);
     IncomeDifference(DBeg, DEnd);
end;

procedure TMainForm.RangeBtnClick(Sender: TObject);
begin
  CallRangeForm(Tabs.TabIndex);
end;

procedure TMainForm.ExpenseActionExecute(Sender: TObject);
var
    i: integer;
begin
      TypeSaveExpence := g_CreateDoc;
      TypeExpense     := TAB_Expense;
      ExpenseForm.ExpenceSetting(TAB_Expense, g_CreateDoc);

      AppData.Organiz.Active := False;
      AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
      AppData.Organiz.Active := True;

      AppData.Organiz.First;
      with ExpenseForm.ExpenseStringGrid do
        Begin
          RowCount := AppData.Organiz.RecordCount + 1;
          while not AppData.Organiz.Eof do
          Begin
            For i := 1 to RowCount do
            Begin
              Cells[0,i] := IntToStr(i);
              Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
              Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
              Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
              AppData.Organiz.Next;
            end;
          end;
        end;
       with  ExpenseForm.Bar do
        Begin
          Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
          Panels[1].Text := 'Сумма (нал): ' + '0';
          Panels[2].Text := 'Сумма (безнал): ' + '0';
        end;
      ExpenseForm.ShowModal();

end;

procedure TMainForm.RefreshIncomePopClick(Sender: TObject);
begin
    Screen.Cursor := crSQLWait;
    ReestrIncome.Active := False;
    ReestrIncome.Active := True;
    Screen.Cursor := crDefault;
end;

procedure TMainForm.FindBtnClick(Sender: TObject);
begin
StrFilter := EmptyStr;
  StrFilter := 'NUMDOC = ' + QuotedStr(Trim(FindEdit.Text));
  case Tabs.TabIndex of
    TAB_Income            : Begin
                              ReestrIncome.Filter := StrFilter;
                              if FindEdit.Text <> EmptyStr then
                                ReestrIncome.Filtered := True;
                            end;

    TAB_Expense           : Begin
                              ReestrExpense.Filter := StrFilter;
                              if  FindEdit.Text <> EmptyStr then
                                ReestrExpense.Filtered := True;
                            end;

    TAB_ExpenseZP        : Begin
                              ReestrExpenseZP.Filter := StrFilter;
                              if  FindEdit.Text <> EmptyStr then
                                ReestrExpenseZP.Filtered := True;
                            end;

    TAB_ExpenseOther      : Begin
                              ReestrExpenseOther.Filter := StrFilter;
                              if  FindEdit.Text <> EmptyStr then
                                ReestrExpenseOther.Filtered := True;
                            end;

    TAB_ZpAup             : Begin
                              ReestrZpAup.Filter := StrFilter;
                              if  FindEdit.Text <> EmptyStr then
                                ReestrZpAup.Filtered := True;
                            end;

    TAB_TaxToZp           : Begin
                              ReestrTaxToZp.Filter := StrFilter;
                              if  FindEdit.Text <> EmptyStr then
                                ReestrTaxToZp.Filtered := True;
                            end;

    TAB_PercentOfTerminal : Begin
                              ReestrPercentOfTerminal.Filter := StrFilter;
                              if  FindEdit.Text <> EmptyStr then
                                ReestrPercentOfTerminal.Filtered := True;
                            end;

    TAB_ShipmentVostok    : Begin
                              ReestrExpense.Filter := StrFilter;
                              if  FindEdit.Text <> EmptyStr then
                                ReestrExpense.Filtered := True;
                            end;

    TAB_ShipmentOther     : Begin
                              ReestrShipmentOther.Filter := StrFilter;
                              if  FindEdit.Text <> EmptyStr then
                                ReestrShipmentOther.Filtered := True;
                            end;

    TAB_Offs              : Begin
                              ReestrOffs.Filter := StrFilter;
                              if  FindEdit.Text <> EmptyStr then
                                ReestrOffs.Filtered := True;
                            end;

    TAB_PublicUtilities   : Begin
                              ReestrPublicUtilities.Filter := StrFilter;
                              if  FindEdit.Text <> EmptyStr then
                                ReestrPublicUtilities.Filtered := True;
                            end;
    TAB_ENVD:               Begin
                              ReestrENVD.Filter := StrFilter;
                              if FindEdit.Text <> EmptyStr then
                                 ReestrENVD .Filtered := True;
                            end;
    TAB_IncomeCash:         Begin
                              ReestrIncomeCash.Filter := StrFilter;
                              if FindEdit.Text <> EmptyStr then
                                 ReestrIncomeCash .Filtered := True;
                            end;
  end;

end;

procedure TMainForm.FindEditChange(Sender: TObject);
begin
  If FindEdit.Text = EmptyStr then
    Begin
        FindBtn.Default := False;
        ReestrIncome.Filtered  := False;
        ReestrExpense.Filtered := False;
        ReestrExpenseZP.Filtered := False;
        ReestrExpenseOther.Filtered := False;
        ReestrZpAup.Filtered := False;
        ReestrTaxToZp.Filtered := False;
        ReestrPercentOfTerminal.Filtered := False;
        ReestrShipmentVostok.Filtered := False;
        ReestrShipmentOther.Filtered := False;
        ReestrOffs.Filtered := False;
        ReestrPublicUtilities.Filtered := False;
    end
  else
        FindBtn.Default := True;
end;

procedure TMainForm.CorrIncomActionExecute(Sender: TObject);
var
    i, RecordCountDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
    Mes: Word;
    IncomeF: TCreateDocumentForm;
begin

  IncomeF := TCreateDocumentForm.Create(MainForm);
    try
        Sum_Nal     := 0;
        Sum_Not_Nal := 0;
        TypeSaveIncome := g_CorrDoc;

       if not (ReestrIncome.IsEmpty) then
         Begin
              AppData.GetIncomeDetail.Active := False;
              AppData.GetIncomeDetail.CommandText := Format( SSQLGetIncomeDetail, [ReestrIncome.FieldByName('UNICUM_NUM').AsInteger]);
              AppData.GetIncomeDetail.Active := True;


              if AppData.GetIncomeDetail.FieldByName('StatusDoc').AsString = '*' then
                 begin
                    MessageBox(Handle, PChar('Документ: ' + AppData.GetIncomeDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                    Exit;
                 end
              else
                Begin
                  AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                    if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.GetIncomeDetail.FieldByName('OTMETKA').AsString = '*') then
                        Begin
                          MessageBox(Handle, PChar('Документ № ' + AppData.GetIncomeDetail.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                          Exit;
                        end
                    else
                        Begin
                          with AppData do
                           Begin
                              AdoCmd.CommandText := Format(SSQLUpdateIncStatusCorrDoc, [ReestrIncome.FieldByName('UNICUM_NUM').AsInteger, 1]);
                              AdoCmd.Execute;
                            end;

                          RecordCountDetail := AppData.GetIncomeDetail.RecordCount+1;

                            with IncomeF do
                            begin
                              DetailStringGridSetting(g_CorrDoc);
                              Caption := 'Корректировка документа';
                              DetailStringGrid.RowCount := RecordCountDetail;
                              NumDocEdit.Text := ReestrIncome.FieldByName('NUMDOC').AsString;
                              DateIncomePicker.Date := AppData.GetIncomeDetail.FieldByName('DATE_P_POR').AsDateTime;
                              PrimechEdit.Text :=  ReestrIncome.FieldByName('PRIMECH').AsString;
                            end;


                            AppData.GetIncomeDetail.First;
                            while not  AppData.GetIncomeDetail.Eof do
                            Begin
                              for i:= 1 to IncomeF.DetailStringGrid.RowCount -1 do
                              Begin
                               with IncomeF.DetailStringGrid  do
                                begin
                                  Cells[0,i] := IntToStr(AppData.GetIncomeDetail.FieldByName('NUM_PREDM').AsInteger);
                                  Cells[1,i] := AppData.GetIncomeDetail.FieldByName('UID_SHOP').AsString;
                                  Cells[2,i] := AppData.GetIncomeDetail.FieldByName('NAME').AsString;
                                  Cells[3,i] := AppData.GetIncomeDetail.FieldByName('ADRESS').AsString;
                                  Cells[4,i] := AppData.GetIncomeDetail.FieldByName('SUM_NAL').AsString;
                                  Cells[5,i] := AppData.GetIncomeDetail.FieldByName('SUM_NOT_NAL').AsString;
                                  Cells[6,i] := AppData.GetIncomeDetail.FieldByName('PRIMECH').AsString;
                                  Sum_Nal     := Sum_Nal + AppData.GetIncomeDetail.FieldByName('SUM_NAL').AsFloat;
                                  Sum_Not_Nal :=  Sum_Not_Nal + AppData.GetIncomeDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                                  AppData.GetIncomeDetail.Next;
                                end;
                              end;
                            end;

                            with  IncomeF.Bar do
                            Begin
                              Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetIncomeDetail.RecordCount);
                              Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                              Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                            end;
                          IncomeF.ShowModal();
                          end;
                        end;
         end
         else
                  Exit;
    finally
            FreeAndNil(IncomeF);
    end;
end;

procedure TMainForm.CorrExpenceActionExecute(Sender: TObject);
var
    i, RecordCountExpenceDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
begin

  if not (ReestrExpense.IsEmpty) then
    Begin
               AppData.ExpenceDetail.Active := False;
               AppData.ExpenceDetail.CommandText := Format(SSQLGetExpenceDetail, [MainForm.ReestrExpense.FieldByName('UNICUM_NUM').AsInteger]);               
               AppData.ExpenceDetail.Active := True;

         if AppData.ExpenceDetail.FieldByName('StatusDoc').AsString = '*' then
            Begin
              MessageBox(Handle, PChar('Документ: ' + AppData.ExpenceDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
              Exit;
            end
         else
          Begin
              AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
              if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.ExpenceDetail.FieldByName('OTMETKA').AsString = '*') then
                  Begin
                    MessageBox(Handle, PChar('Документ № ' + AppData.ExpenceDetail.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                    Exit;
                  end
              else
                  Begin

                    TypeSaveExpence := g_CorrDoc;
                    TypeExpense     := TAB_Expense;
                    ExpenseForm.ExpenceSetting(TAB_Expense, g_CorrDoc);
                    Sum_Nal     := 0;
                    Sum_Not_Nal := 0;

                    with AppData do
                      Begin
                       AdoCmd.CommandText := Format(SSQLUpdateExpStatusCorrDoc, [ReestrExpense.FieldByName('UNICUM_NUM').AsInteger, 1]);
                       AdoCmd.Execute;
                      end;

                    RecordCountExpenceDetail := AppData.ExpenceDetail.RecordCount+1;

                     ExpenseForm.Caption := 'Корректировка документа';
                     ExpenseForm.NumDocEdit.Text := ReestrExpense.FieldByName('NUMDOC').AsString;
                     ExpenseForm.ExpencePicker.Date := DateOf(ReestrExpense.FieldByName('DATE_P_POR').AsDateTime);
                     ExpenseForm.PrimechEdit.Text := ReestrExpense.FieldByName('PRIMECH').AsString;
                     ExpenseForm.MonthCombo.Visible := False;
                     ExpenseForm.YearSpinEdit.Visible := False;
                     ExpenseForm.ExpenseStringGrid.RowCount := RecordCountExpenceDetail;

                    AppData.ExpenceDetail.First;
                    while not  AppData.ExpenceDetail.Eof do
                    Begin
                      for i:= 1 to ExpenseForm.ExpenseStringGrid.RowCount-1 do
                      Begin
                       with ExpenseForm.ExpenseStringGrid  do
                        begin
                          Cells[0,i] := IntToStr(AppData.ExpenceDetail.FieldByName('NUM_PREDM').AsInteger);
                          Cells[1,i] := AppData.ExpenceDetail.FieldByName('UID_SHOP').AsString;
                          Cells[2,i] := AppData.ExpenceDetail.FieldByName('NAME').AsString;
                          Cells[3,i] := AppData.ExpenceDetail.FieldByName('ADRESS').AsString;
                          Cells[4,i] := AppData.ExpenceDetail.FieldByName('SUM_NAL').AsString;
                          Cells[5,i] := AppData.ExpenceDetail.FieldByName('SUM_NOT_NAL').AsString;
                          Cells[6,i] := AppData.ExpenceDetail.FieldByName('NAZNACHENIE').AsString;
                          Cells[7,i] := AppData.ExpenceDetail.FieldByName('RECIPIENT').AsString;
                          Cells[8,i] := AppData.ExpenceDetail.FieldByName('PRIMECH').AsString;
                          Sum_Nal     := Sum_Nal + AppData.ExpenceDetail.FieldByName('SUM_NAL').AsFloat;
                          Sum_Not_Nal :=  Sum_Not_Nal + AppData.ExpenceDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                          AppData.ExpenceDetail.Next;
                        end;
                      end;
                    end;

                    with  ExpenseForm.Bar do
                    Begin
                      Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.ExpenceDetail.RecordCount);
                      Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                      Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                    end;
                    ExpenseForm.ShowModal();
                end;
              end;
      end
    else
            Exit;
end;


procedure TMainForm.PrintIncomeReestrPopClick(Sender: TObject);
begin
    ReestrIncome.DisableControls;
    Report.Template := SIncomeReestr;
    Report.Run;
    ReestrIncome.EnableControls;
end;

procedure TMainForm.IncomeGridTitleClick(Column: TColumn);
var
  Str: string;
begin
  if Assigned(Column) and Assigned(Column.Field) and
    (Column.Field.FieldKind = fkData) then
    with TADODataset(Column.Grid.DataSource.Dataset) do
    begin
      Str := Column.FieldName;
      if Pos(Str, IndexFieldNames) = 0 then
        IndexFieldNames := Str
      else
        if Pos('DESC', IndexFieldNames) > 0 then
          IndexFieldNames := Str
        else
          IndexFieldNames := Str + ' DESC';
    end;
end;

procedure TMainForm.PrintIncomeDocPopClick(Sender: TObject);
begin
  fl_TypeReport := TAB_Income;
  AppData.GetIncomeDetail.Active := False;
  AppData.GetIncomeDetail.CommandText := Format( SSQLGetIncomeDetail, [MainForm.ReestrIncome.FieldByName('UNICUM_NUM').AsInteger]);
  AppData.GetIncomeDetail.Active := True;

  AppData.Report.Template := SIncomeTotalDoc;
  AppData.Report.Run;
end;

procedure TMainForm.DeleteExpenceDocumActionExecute(Sender: TObject);
var
    QDel, QRes:  word;
begin

  if not (ReestrExpense.IsEmpty) then
    Begin
       AppData.ExpenceDetail.Active := False;
       AppData.ExpenceDetail.CommandText := Format(SSQLGetExpenceDetail, [MainForm.ReestrExpense.FieldByName('UNICUM_NUM').AsInteger]);       
       AppData.ExpenceDetail.Active := True;

       if AppData.ExpenceDetail.FieldByName('StatusDoc').AsString = '*' then
          Begin
            MessageBox(Handle, PChar('Документ: ' + AppData.ExpenceDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
            Exit;
          end
       else
          Begin
            QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
            if QDel=IDYES then
              begin
                AppData.DeleteExpenceDoc.Active := False;
                AppData.DeleteExpenceDoc.CommandText := Format(SSQLDeleteExpenceDocum, [ReestrExpense.FieldByName('UNICUM_NUM').AsInteger]);
                AppData.DeleteExpenceDoc.Active := True;
                QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

                ReestrExpense.Active := False;
                ReestrExpense.Active := True;
                BarCalc(TAB_Expense);
          end
          else
                Exit;
          end;
    end
  else
                Exit;
end;

procedure TMainForm.ExpenseZPActionExecute(Sender: TObject);
var
    i: integer;
begin
  TypeSaveExpence := g_CreateDoc;
  TypeExpense     := TAB_ExpenseZP;
 ExpenseForm.ExpenceSetting(TAB_ExpenseZP, g_CreateDoc);
  AppData.Organiz.Active := False;
  AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
  AppData.Organiz.Active := True;

AppData.Organiz.First;
 with ExpenseForm.ExpenseStringGrid do
  Begin
    RowCount := AppData.Organiz.RecordCount + 1;
    while not AppData.Organiz.Eof do
     Begin
      For i := 1 to RowCount do
       Begin
        Cells[0,i] := IntToStr(i);
        Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
        Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
        Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
        AppData.Organiz.Next;
       end;
     end;
  end;
  with  ExpenseForm.Bar do
    Begin
      Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
      Panels[1].Text := 'Сумма (нал): ' + '0';
      Panels[2].Text := 'Сумма (безнал): ' + '0';
    end;


  ExpenseForm.ShowModal();

end;

procedure TMainForm.CorrExpenseZpActionExecute(Sender: TObject);
var
    i, RecordCountExpenceDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
    Year, Month, Day: Word;
begin

if not (ReestrExpenseZP.IsEmpty) then
    Begin
         AppData.CorrExpenceZPDoc.Active := False;
         AppData.CorrExpenceZPDoc.CommandText := Format(SSQLGetExpenceZPDetail, [ReestrExpenseZP.FieldByName('UNICUM_NUM').AsInteger]);
         AppData.CorrExpenceZPDoc.Active := True;

         if AppData.CorrExpenceZPDoc.FieldByName('StatusDoc').AsString = '*' then
            Begin
              MessageBox(Handle, PChar('Документ: ' + ReestrExpenseZP.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
              Exit;
            end
         else
            Begin
              AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
              if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.CorrExpenceZPDoc.FieldByName('OTMETKA').AsString = '*') then
                  Begin
                    MessageBox(Handle, PChar('Документ № ' + AppData.CorrExpenceZPDoc.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                    Exit;
                  end
              else
                  Begin
                      Sum_Nal     := 0;
                      Sum_Not_Nal := 0;
                      TypeSaveExpence := g_CorrDoc;
                      TypeExpense     := TAB_ExpenseZP;
                      ExpenseForm.ExpenceSetting(TAB_ExpenseZP, g_CorrDoc);

                      with AppData do
                      Begin
                       AdoCmd.CommandText := Format(SSQLUpdateExpStatusCorrDoc, [ReestrExpenseZP.FieldByName('UNICUM_NUM').AsInteger, 1]);
                       AdoCmd.Execute;
                      end;

                      DecodeDate(ReestrExpenseZP.FieldByName('DATE_P_POR').AsDateTime, Year, Month, Day);

                      RecordCountExpenceDetail := AppData.CorrExpenceZPDoc.RecordCount+1;
                      with  ExpenseForm do
                      begin
                        Caption := 'Корректировка документа';
                        NumDocEdit.Text := ReestrExpenseZP.FieldByName('NUMDOC').AsString;
                        ExpencePicker.Date := ReestrExpenseZP.FieldByName('DATE_P_POR').AsDateTime;
                        PrimechEdit.Text := ReestrExpenseZP.FieldByName('PRIMECH').AsString;
                        MonthCombo.ItemIndex := Month;
                        MonthCombo.Visible := True;
                        YearSpinEdit.Visible := False;
                        ExpenseStringGrid.RowCount := RecordCountExpenceDetail;
                      end;

                    AppData.CorrExpenceZPDoc.First;
                    while not  AppData.CorrExpenceZPDoc.Eof do
                    Begin
                      for i:= 1 to ExpenseForm.ExpenseStringGrid.RowCount-1 do
                      Begin
                       with ExpenseForm.ExpenseStringGrid  do
                        begin
                          Cells[0,i] := IntToStr(AppData.CorrExpenceZPDoc.FieldByName('NUM_PREDM').AsInteger);
                          Cells[1,i] := AppData.CorrExpenceZPDoc.FieldByName('UID_SHOP').AsString;
                          Cells[2,i] := AppData.CorrExpenceZPDoc.FieldByName('NAME').AsString;
                          Cells[3,i] := AppData.CorrExpenceZPDoc.FieldByName('ADRESS').AsString;
                          Cells[4,i] := AppData.CorrExpenceZPDoc.FieldByName('SUM_NAL').AsString;
                          Cells[5,i] := AppData.CorrExpenceZPDoc.FieldByName('SUM_NOT_NAL').AsString;
                          Cells[8,i] := AppData.CorrExpenceZPDoc.FieldByName('PRIMECH').AsString;
                          Sum_Nal     := Sum_Nal + AppData.CorrExpenceZPDoc.FieldByName('SUM_NAL').AsFloat;
                          Sum_Not_Nal :=  Sum_Not_Nal + AppData.CorrExpenceZPDoc.FieldByName('SUM_NOT_NAL').AsFloat;
                          AppData.CorrExpenceZPDoc.Next;
                        end;
                      end;
                    end;

                    with  ExpenseForm.Bar do
                    Begin
                      Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.CorrExpenceZPDoc.RecordCount);
                      Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                      Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                    end;
                    ExpenseForm.ShowModal();
                  end;
              end;
      end
    else
            Exit;
end;

procedure TMainForm.DeleteExpenceZpDocActionExecute(Sender: TObject);
var
    QDel, QRes:  word;
begin
   if not (ReestrExpenseZP.IsEmpty) then
     Begin
       AppData.CorrExpenceZPDoc.Active := False;
       AppData.CorrExpenceZPDoc.CommandText := Format(SSQLGetExpenceZPDetail, [ReestrExpenseZP.FieldByName('UNICUM_NUM').AsInteger]);
       AppData.CorrExpenceZPDoc.Active := True;

       if AppData.CorrExpenceZPDoc.FieldByName('StatusDoc').AsString = '*' then
          Begin
            MessageBox(Handle, PChar('Документ: ' + ReestrExpenseZP.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
            Exit;
          end
       else
          Begin
            QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
            if QDel=IDYES then
              begin
                AppData.DeleteExpenceDoc.Active := False;
                AppData.DeleteExpenceDoc.CommandText := Format(SSQLDeleteExpenceDocum, [ReestrExpenseZp.FieldByName('UNICUM_NUM').AsInteger]);
                AppData.DeleteExpenceDoc.Active := True;
                QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

                ReestrExpenseZp.Active := False;
                ReestrExpenseZp.Active := True;
                BarCalc(TAB_ExpenseZP);
              end
            else
                Exit;
            end;
     end
   else
                Exit;
end;

procedure TMainForm.PrintExpenseReestrPopClick(Sender: TObject);
begin
    ReestrExpense.DisableControls;
    Report.Template := SExpenseReestr;
    Report.Run;
    ReestrExpense.First;
    ReestrExpense.EnableControls;
end;

procedure TMainForm.PrintExpenseDocPopClick(Sender: TObject);
begin
    fl_TypeReport := TAB_Expense;
    AppData.Report.Template := SExpenseTotalDoc;
    AppData.Report.Run;
end;

procedure TMainForm.ExpenseOtherActionExecute(Sender: TObject);
var
    i: integer;
begin
  TypeSaveExpence := g_CreateDoc;
  TypeExpense     := TAB_ExpenseOther;
  ExpenseForm.ExpenceSetting(TAB_ExpenseOther, g_CreateDoc);
  ExpenseForm.Caption := 'Расходы (прочие)';
  ExpenseForm.ExpencePicker.Enabled := True;

  AppData.Organiz.Active := False;
  AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
  AppData.Organiz.Active := True;

AppData.Organiz.First;
 with ExpenseForm.ExpenseStringGrid do
  Begin
    RowCount := AppData.Organiz.RecordCount + 1;
    while not AppData.Organiz.Eof do
     Begin
      For i := 1 to RowCount do
       Begin
        Cells[0,i] := IntToStr(i);
        Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
        Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
        Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
        AppData.Organiz.Next;
       end;
     end;
  end;
 with  ExpenseForm.Bar do
    Begin
      Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
      Panels[1].Text := 'Сумма (нал): ' + '0';
      Panels[2].Text := 'Сумма (безнал): ' + '0';
    end;
 ExpenseForm.ShowModal();
end;

procedure TMainForm.ReportExpPopupClick(Sender: TObject);
begin
    TypeReport := TAB_Expense;
    ReportForm.Caption := 'Отчет по магазинам -> Расходы -> За месяц';
    ReportForm.ShowModal();
end;

procedure TMainForm.PrintExpenseZpReestrPopClick(Sender: TObject);
begin
    Report.Template := EmptyStr;
    ReestrExpenseZP.DisableControls;
    Report.Template := SExpenseReestrZp;
    ReestrExpenseZP.First;
    Report.Run;
    ReestrExpenseZP.EnableControls;
end;

function TMainForm.GetBegDate: variant;
begin
  if f_GetDate = 0 then
    Result := FormatDateTime('dd.mm.yyyy', DBeg)+ ' ' + 'г.'
  else
  if f_GetDate = 1 then
    Result := FormatDateTime('dd.mm.yyyy', RangeForm.BeginPicker.Date)+ ' ' + 'г.';
end;

function TMainForm.GetEndDate: variant;
begin
  if f_GetDate = 0 then
    Result := FormatDateTime('dd.mm.yyyy',DEnd)+ ' ' + 'г.'
  else
  if f_GetDate = 1 then
    Result := FormatDateTime('dd.mm.yyyy', RangeForm.EndPicker.Date)+ ' ' + 'г.';
end;

procedure TMainForm.PrintExpenseZpDocPopClick(Sender: TObject);
begin
    fl_TypeReport := TAB_ExpenseZP;
    AppData.Report.Template := SExpenseTotalDocZp;
    AppData.Report.Run;
end;

procedure TMainForm.RefreshExpensePopClick(Sender: TObject);
begin
    Screen.Cursor := crSQLWait;
    ReestrExpense.Active := False;
    ReestrExpense.Active := True;
    Screen.Cursor := crDefault;
end;

procedure TMainForm.RefreshExpenseZpPopClick(Sender: TObject);
begin
    Screen.Cursor := crSQLWait;
    ReestrExpenseZP.Active := False;
    ReestrExpenseZP.Active := True;
    Screen.Cursor := crDefault;
end;

function TMainForm.GetDatePor: variant;
begin
    Result := AppData.ExpenceDetail.FieldByName('DATE_P_POR').AsString;
end;

procedure TMainForm.BarCalc(TabIndex: integer);
var
  f_Sum_Nal, f_Sum_Not_Nal: real;
  i, KolDoc: integer;
begin
  f_Sum_Nal := 0;
  f_Sum_Not_Nal := 0;

  Case TabIndex of
    TAB_Income:   Begin
                    ReestrIncome.First;
                    while not ReestrIncome.Eof do
                      Begin
                        f_Sum_Nal := f_Sum_Nal + ReestrIncome.FieldByName('SUM_NAL').AsFloat;
                        f_Sum_Not_Nal := f_Sum_Not_Nal + ReestrIncome.FieldByName('SUM_NOT_NAL').AsFloat;
                        ReestrIncome.Next;
                      end;

                    KolDoc := ReestrIncome.RecordCount;
                    with Bar2 do
                      begin
                        Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                        Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', f_Sum_Nal);
                        Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', f_Sum_Not_Nal);
                      end;
                   ReestrIncome.First;
                  end;

    TAB_Expense:  Begin
                    ReestrExpense.First;
                    while not ReestrExpense.Eof do
                    Begin
                        f_Sum_Nal := f_Sum_Nal + ReestrExpense.FieldByName('SUM_NAL').AsFloat;
                        f_Sum_Not_Nal := f_Sum_Not_Nal + ReestrExpense.FieldByName('SUM_NOT_NAL').AsFloat;
                        ReestrExpense.Next;
                    end;

                    KolDoc := ReestrExpense.RecordCount;
                    with Bar2 do
                    begin
                        Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                        Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', f_Sum_Nal);
                        Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', f_Sum_Not_Nal);
                    end;
                    ReestrExpense.First;
                  end;

    TAB_ExpenseZP:  begin
                      ReestrExpenseZP.First;
                      while not ReestrExpenseZP.Eof do
                      Begin
                        f_Sum_Nal := f_Sum_Nal + ReestrExpenseZP.FieldByName('SUM_NAL').AsFloat;
                        f_Sum_Not_Nal := f_Sum_Not_Nal + ReestrExpenseZP.FieldByName('SUM_NOT_NAL').AsFloat;
                        ReestrExpenseZP.Next;
                      end;

                      KolDoc := ReestrExpenseZP.RecordCount;
                      with Bar2 do
                      begin
                        Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                        Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', f_Sum_Nal);
                        Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', f_Sum_Not_Nal);
                      end;
                      ReestrExpenseZP.First;
                    end;

    TAB_ExpenseOther:  begin
                          ReestrExpenseOther.First;
                          while not ReestrExpenseOther.Eof do
                          begin
                              f_Sum_Nal := f_Sum_Nal + ReestrExpenseOther.FieldByName('SUM_NAL').AsFloat;
                              f_Sum_Not_Nal := f_Sum_Not_Nal + ReestrExpenseOther.FieldByName('SUM_NOT_NAL').AsFloat;
                              ReestrExpenseOther.Next;
                          end;

                          KolDoc := ReestrExpenseOther.RecordCount;
                          with Bar2 do
                          begin
                              Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                              Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', f_Sum_Nal);
                              Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', f_Sum_Not_Nal);
                          end;
                          ReestrExpenseOther.First;
                       end;

     TAB_ZpAup:      Begin
                       ReestrZpAup.First;
                       while not ReestrZpAup.Eof do
                       Begin
                            f_Sum_Nal := f_Sum_Nal + ReestrZpAup.FieldByName('SUM_NAL').AsFloat;
                            ReestrZpAup.Next;
                       end;
                            KolDoc := ReestrZpAup.RecordCount;
                       with Bar2 do
                       begin
                            Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                            Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', f_Sum_Nal);
                            Panels[2].Text := 'Сумма (безнал): ' + '0';
                       end;
                       ReestrZpAup.First;
                     end;

     TAB_TaxToZp:   Begin
                       ReestrTaxToZp.First;
                       while not ReestrTaxToZp.Eof do
                       Begin
                            f_Sum_Not_Nal := f_Sum_Not_Nal + ReestrTaxToZp  .FieldByName('SUM_NOT_NAL').AsFloat;
                            ReestrTaxToZp.Next;
                       end;
                            KolDoc := ReestrTaxToZp.RecordCount;
                       with Bar2 do
                       begin
                            Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                            Panels[1].Text := 'Сумма (нал): ' + '0';
                            Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', f_Sum_Not_Nal);
                       end;
                       ReestrTaxToZp.First;
                     end;

     TAB_PercentOfTerminal: Begin
                              ReestrPercentOfTerminal.First;
                              while not ReestrPercentOfTerminal.Eof do
                              Begin
                                f_Sum_Not_Nal := f_Sum_Not_Nal + ReestrPercentOfTerminal.FieldByName('SUM_NOT_NAL').AsFloat;
                                ReestrPercentOfTerminal.Next;
                              end;
                                KolDoc := ReestrPercentOfTerminal.RecordCount;
                              with Bar2 do
                              begin
                                Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                                Panels[1].Text := 'Сумма (нал): ' +  '0';
                                Panels[2].Text := 'Сумма (безнал): ' +FormatFloat('#,###,###.###', f_Sum_Not_Nal); 
                              end;
                              ReestrPercentOfTerminal.First;
                            end;

     TAB_ShipmentVostok:    Begin
                              ReestrShipmentVostok.First;
                              while not ReestrShipmentVostok.Eof do
                              Begin
                                  f_Sum_Nal := f_Sum_Nal + ReestrShipmentVostok.FieldByName('SUM_NAL').AsFloat;
                                  f_Sum_Not_Nal := f_Sum_Not_Nal + ReestrShipmentVostok.FieldByName('SUM_NOT_NAL').AsFloat;
                                  ReestrShipmentVostok.Next;
                              end;

                              KolDoc := ReestrShipmentVostok.RecordCount;
                              with Bar2 do
                              begin
                                  Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                                  Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', f_Sum_Nal);
                                  Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', f_Sum_Not_Nal);
                              end;
                              ReestrShipmentVostok.First;
                            end;

     TAB_ShipmentOther:    Begin
                              ReestrShipmentOther.First;
                              while not ReestrShipmentOther.Eof do
                              Begin
                                  f_Sum_Nal := f_Sum_Nal + ReestrShipmentOther.FieldByName('SUM_NAL').AsFloat;
                                  f_Sum_Not_Nal := f_Sum_Not_Nal + ReestrShipmentOther.FieldByName('SUM_NOT_NAL').AsFloat;
                                  ReestrShipmentOther.Next;
                              end;

                              KolDoc := ReestrShipmentOther.RecordCount;
                              with Bar2 do
                              begin
                                  Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                                  Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', f_Sum_Nal);
                                  Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', f_Sum_Not_Nal);
                              end;
                              ReestrShipmentOther.First;
                            end;

     TAB_Offs:             Begin
                             ReestrOffs.First;
                             while not ReestrOffs.Eof do
                             Begin
                                  f_Sum_Nal := f_Sum_Nal + ReestrOffs.FieldByName('SUM_NAL').AsFloat;
                                  ReestrOffs.Next;
                             end;
                                  KolDoc := ReestrOffs.RecordCount;
                             with Bar2 do
                             begin
                                  Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                                  Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', f_Sum_Nal);
                                  Panels[2].Text := 'Сумма (безнал): ' + '0';
                             end;
                             ReestrOffs.First;
                           end;


    TAB_Return:             Begin
                             ReestrReturn.First;
                             while not ReestrReturn.Eof do
                             Begin
                                  f_Sum_Nal := f_Sum_Nal + ReestrReturn.FieldByName('SUM_NAL').AsFloat;
                                  ReestrReturn.Next;
                             end;
                                  KolDoc := ReestrReturn.RecordCount;
                             with Bar2 do
                             begin
                                  Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                                  Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', f_Sum_Nal);
                                  Panels[2].Text := 'Сумма (безнал): ' + '0';
                             end;
                             ReestrReturn.First;
                           end;


    TAB_ENVD:             Begin
                             ReestrENVD.First;
                             while not ReestrENVD.Eof do
                             Begin
                                  f_Sum_Not_Nal := f_Sum_Not_Nal + ReestrENVD.FieldByName('SUM_NOT_NAL').AsFloat;
                                  ReestrENVD.Next;
                             end;
                                  KolDoc := ReestrENVD.RecordCount;
                             with Bar2 do
                             begin
                                  Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                                  Panels[1].Text := 'Сумма (нал): ' + '0';
                                  Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', f_Sum_Not_Nal);
                             end;
                             ReestrENVD.First;
                           end;

    TAB_PublicUtilities:  Begin
                            ReestrPublicUtilities.First;
                            while not ReestrPublicUtilities.Eof do
                              Begin
                                f_Sum_Nal := f_Sum_Nal + ReestrPublicUtilities.FieldByName('SUM_NAL').AsFloat;
                                f_Sum_Not_Nal := f_Sum_Not_Nal + ReestrPublicUtilities.FieldByName('SUM_NOT_NAL').AsFloat;
                                ReestrPublicUtilities.Next;
                              end;

                              KolDoc := ReestrPublicUtilities.RecordCount;
                              with Bar2 do
                            begin
                                Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                                Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', f_Sum_Nal);
                                Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', f_Sum_Not_Nal);
                            end;
                            ReestrPublicUtilities.First;
                          end;

     TAB_IncomeCash:  Begin
                        ReestrIncomeCash.First;
                        while not ReestrIncomeCash.Eof do
                          Begin
                            f_Sum_Nal := f_Sum_Nal + ReestrIncomeCash.FieldByName('SUM_NAL').AsFloat;
                            f_Sum_Not_Nal := f_Sum_Not_Nal + ReestrIncomeCash.FieldByName('SUM_NOT_NAL').AsFloat;
                            ReestrIncomeCash.Next;
                          end;

                          KolDoc := ReestrIncomeCash.RecordCount;
                          with Bar2 do
                        begin
                            Panels[0].Text := 'Количество документов: ' + IntToStr(KolDoc);
                            Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', f_Sum_Nal);
                            Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', f_Sum_Not_Nal);
                        end;
                        ReestrIncomeCash.First;
                      End;
    end;

end;

procedure TMainForm.NaznachenieMenuClick(Sender: TObject);
var
    NaznachenieF: TNaznachenieForm;
begin
  Try
     NaznachenieF := TNaznachenieForm.Create(MainForm);
     NaznachenieF.RefreshNaznachenie();
     NaznachenieF.ShowModal();
  Finally
     FreeAndNil(NaznachenieF);
  end;
end;

procedure TMainForm.AccessMenuClick(Sender: TObject);
var
    AccessF: TAccessForm;
begin
    AccessF := TAccessForm.Create(MainForm);
    Try
        AppData.User.Active := False;
        AppData.User.CommandText := Format(SSQLGetUser, [i_ReserveWith]);
        AppData.User.Active := True;

        AccessF.ShowModal();
    finally
        FreeAndNil(AccessF);
    end;
end;

procedure TMainForm.ModulsMenuClick(Sender: TObject);
begin
  ModuleForm.ShowModal();
end;

procedure TMainForm.CorrExpenseOtherActionExecute(Sender: TObject);
var
    i, RecordCountExpenceDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
begin

  if not (ReestrExpenseOther.IsEmpty) then
     Begin
         Appdata.CorrExpenceDoc.Active := False;
         Appdata.CorrExpenceDoc.CommandText := Format(SSQLGetExpenceDetail, [MainForm.ReestrExpenseOther.FieldByName('UNICUM_NUM').AsInteger]);
         Appdata.CorrExpenceDoc.Active := True;

       if Appdata.CorrExpenceDoc.FieldByName('StatusDoc').AsString = '*' then
            Begin
              MessageBox(Handle, PChar('Документ: ' + Appdata.CorrExpenceDoc.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
              Exit;
            end
       else
            Begin
               AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
              if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.CorrExpenceDoc.FieldByName('OTMETKA').AsString = '*') then
                  Begin
                    MessageBox(Handle, PChar('Документ № ' + AppData.CorrExpenceDoc.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                    Exit;
                  end
              else
                  Begin
                      TypeSaveExpence := g_CorrDoc;
                      TypeExpense     := TAB_ExpenseOther;
                      ExpenseForm.ExpenceSetting(TAB_ExpenseOther, g_CorrDoc);
                      Sum_Nal     := 0;
                      Sum_Not_Nal := 0;

                      with AppData do
                      Begin
                        AdoCmd.CommandText := Format(SSQLUpdateExpStatusCorrDoc, [ReestrExpenseOther.FieldByName('UNICUM_NUM').AsInteger, 1]);
                        AdoCmd.Execute;
                      end;

                      RecordCountExpenceDetail := AppData.CorrExpenceDoc.RecordCount+1;

                      with ExpenseForm do
                          Begin
                              Caption := 'Корректировка документа';
                              NumDocEdit.Text := ReestrExpenseOther.FieldByName('NUMDOC').AsString;
                              ExpencePicker.Date := ReestrExpenseOther.FieldByName('DATE_P_POR').AsDateTime;
                              PrimechEdit.Text := ReestrExpenseOther.FieldByName('PRIMECH').AsString;
                              MonthCombo.Visible := False;
                              YearSpinEdit.Visible := False;
                              ExpenseStringGrid.RowCount := RecordCountExpenceDetail;
                          end;

                      AppData.CorrExpenceDoc.First;
                      while not  AppData.CorrExpenceDoc.Eof do
                      Begin
                        for i:= 1 to ExpenseForm.ExpenseStringGrid.RowCount-1 do
                          Begin
                            with ExpenseForm.ExpenseStringGrid  do
                              begin
                                Cells[0,i] := IntToStr(AppData.CorrExpenceDoc.FieldByName('NUM_PREDM').AsInteger);
                                Cells[1,i] := AppData.CorrExpenceDoc.FieldByName('UID_SHOP').AsString;
                                Cells[2,i] := AppData.CorrExpenceDoc.FieldByName('NAME').AsString;
                                Cells[3,i] := AppData.CorrExpenceDoc.FieldByName('ADRESS').AsString;
                                Cells[4,i] := AppData.CorrExpenceDoc.FieldByName('SUM_NAL').AsString;
                                Cells[5,i] := AppData.CorrExpenceDoc.FieldByName('SUM_NOT_NAL').AsString;
                                Cells[6,i] := AppData.CorrExpenceDoc.FieldByName('NAZNACHENIE').AsString;
                                Cells[7,i] := AppData.CorrExpenceDoc.FieldByName('RECIPIENT').AsString;
                                Cells[8,i] := AppData.CorrExpenceDoc.FieldByName('PRIMECH').AsString;
                                Sum_Nal     := Sum_Nal + AppData.CorrExpenceDoc.FieldByName('SUM_NAL').AsFloat;
                                Sum_Not_Nal :=  Sum_Not_Nal + AppData.CorrExpenceDoc.FieldByName('SUM_NOT_NAL').AsFloat;
                                AppData.CorrExpenceDoc.Next;
                              end;
                          end;
                      end;

                      with  ExpenseForm.Bar do
                      Begin
                        Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.CorrExpenceDoc.RecordCount);
                        Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                        Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                      end;

                      ExpenseForm.ShowModal();
                    end;
                end;
      end
    else
              Exit;
end;

procedure TMainForm.DeleteExpenceOtherDocActionExecute(Sender: TObject);
var
    QDel, QRes:  word;
begin

   if not (ReestrExpenseOther.IsEmpty) then
    Begin
       Appdata.CorrExpenceDoc.Active := False;
       Appdata.CorrExpenceDoc.CommandText := Format(SSQLGetExpenceDetail, [MainForm.ReestrExpenseOther.FieldByName('UNICUM_NUM').AsInteger]);
       Appdata.CorrExpenceDoc.Active := True;

       if Appdata.CorrExpenceDoc.FieldByName('StatusDoc').AsString = '*' then
          Begin
            MessageBox(Handle, PChar('Документ: ' + Appdata.CorrExpenceDoc.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
            Exit;
          end
       else
          Begin
            QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
            if QDel=IDYES then
              begin
                AppData.DeleteExpenceDoc.Active := False;
                AppData.DeleteExpenceDoc.CommandText := Format(SSQLDeleteExpenceDocum, [ReestrExpenseOther.FieldByName('UNICUM_NUM').AsInteger]);
                AppData.DeleteExpenceDoc.Active := True;
                QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

                ReestrExpenseOther.Active := False;
                ReestrExpenseOther.Active := True;
                BarCalc(TAB_ExpenseOther);
             end
            else
                Exit;
          end;
    end
   else
                Exit;
end;

procedure TMainForm.RefreshExpenseOtherPopClick(Sender: TObject);
begin
    Screen.Cursor := crSQLWait;
    ReestrExpenseOther.Active := False;
    ReestrExpenseOther.Active := True;
    Screen.Cursor := crDefault;
end;

procedure TMainForm.ZpAupActionExecute(Sender: TObject);
var
    i:integer;
    ZpAupF: TZpAupForm;
begin
  ZpAupF := TZpAupForm.Create(MainForm);

   try
      TypeSaveZpAup := g_CreateDoc;
      AppData.Organiz.Active := False;
      AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
      AppData.Organiz.Active := True;

      ZpAupF.ZpAupStringGridSetting(g_CreateDoc);

      AppData.Organiz.First;
       with ZpAupF.ZpAupStringGrid do
        Begin
          RowCount := AppData.Organiz.RecordCount + 1;
          while not AppData.Organiz.Eof do
           Begin
            For i := 1 to RowCount do
             Begin
                Cells[0,i] := IntToStr(i);
                Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
                Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
                Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
                AppData.Organiz.Next;
             end;
           end;
        end;
       with  ZpAupF.Bar do
          Begin
              Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
              Panels[1].Text := 'Сумма (нал): ' + '0';
              Panels[2].Text := 'Сумма (безнал): ' + '0';
          end;
        ZpAupF.ShowModal();
   finally
       FreeAndNil(ZpAupF);
   end;

end;

procedure TMainForm.DeleteZpAupDocActionExecute(Sender: TObject);
var
    QDel, QRes:  word;
begin

  if not (ReestrZpAup.IsEmpty) then
    Begin
      AppData.ZpAupDetail.Active := False;
      AppData.ZpAupDetail.CommandText := Format(SSQLGetZpAupDocDetail, [ReestrZpAup.FieldByName('UNICUM_NUM').AsInteger]);
      AppData.ZpAupDetail.Active := True;

      if AppData.ZpAupDetail.FieldByName('StatusDoc').AsString = '*' then
        Begin
          MessageBox(Handle, PChar('Документ: ' + Appdata.ZpAupDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
          Exit;
        end
      else
        Begin
          QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
          if QDel=IDYES then
            begin
              AppData.DeleteZpAupDoc.Active := False;
              AppData.DeleteZpAupDoc.CommandText := Format(SSQLDeleteZpAupDocum, [ReestrZpAup.FieldByName('UNICUM_NUM').AsInteger]);
              AppData.DeleteZpAupDoc.Active := True;
              QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

              ReestrZpAup.Active := False;
              ReestrZpAup.Active := True;
              BarCalc(TAB_ZpAup);
            end
          else
              Exit;
        end;
    end
  else
              Exit;
end;

procedure TMainForm.CorrZpAupActionExecute(Sender: TObject);
var
    i, RecordCountZpAupDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
    ZpAupF: TZpAupForm;
begin
   ZpAupF := TZpAupForm.Create(MainForm);

   try
      if not (ReestrZpAup.IsEmpty) then
          Begin
              AppData.ZpAupDetail.Active := False;
              AppData.ZpAupDetail.CommandText := Format(SSQLGetZpAupDocDetail, [ReestrZpAup.FieldByName('UNICUM_NUM').AsInteger]);
              AppData.ZpAupDetail.Active := True;

              if AppData.ZpAupDetail.FieldByName('StatusDoc').AsString = '*' then
                Begin
                  MessageBox(Handle, PChar('Документ: ' + Appdata.ZpAupDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                  Exit;
                end
              else
              Begin
                       AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                    if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.ZpAupDetail.FieldByName('OTMETKA').AsString = '*') then
                        Begin
                          MessageBox(Handle, PChar('Документ № ' + AppData.ZpAupDetail.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                          Exit;
                        end
                    else
                        Begin
                            Sum_Nal     := 0;
                            Sum_Not_Nal := 0;
                            TypeSaveZpAup := g_CorrDoc;
                            ZpAupF.ZpAupStringGridSetting(g_CorrDoc);

                            AppData.AdoCmd.CommandText := Format(SSQLUpdateZpAupStatusCorrDoc, [Appdata.ZpAupDetail.FieldByName('UNICUM_NUM').AsInteger, 1]);
                            AppData.AdoCmd.Execute;

                            RecordCountZpAupDetail := AppData.ZpAupDetail.RecordCount + 1;
                            with  ZpAupF do
                            Begin
                               Caption := 'Корректировка документа (ЗП АУП)';
                               NumDocEdit.Text := ReestrZpAup.FieldByName('NUMDOC').AsString;
                               ZpAupPicker.Date := ReestrZpAup.FieldByName('DATE_P_POR').AsDateTime;
                               PrimechEdit.Text := ReestrZpAup.FieldByName('PRIMECH').AsString;
                               ZpAupStringGrid.RowCount := RecordCountZpAupDetail;
                            end;

                            AppData.ZpAupDetail.First;
                            while not  AppData.ZpAupDetail.Eof do
                            Begin
                             for i:= 1 to ZpAupF.ZpAupStringGrid.RowCount-1 do
                              Begin
                                 with ZpAupF.ZpAupStringGrid  do
                                  begin
                                    Cells[0,i] := IntToStr(AppData.ZpAupDetail.FieldByName('NUM_PREDM').AsInteger);
                                    Cells[1,i] := AppData.ZpAupDetail.FieldByName('UID_SHOP').AsString;
                                    Cells[2,i] := AppData.ZpAupDetail.FieldByName('NAME').AsString;
                                    Cells[3,i] := AppData.ZpAupDetail.FieldByName('ADRESS').AsString;
                                    Cells[4,i] := AppData.ZpAupDetail.FieldByName('SUM_NAL').AsString;
                                    Cells[5,i] := AppData.ZpAupDetail.FieldByName('NAZNACHENIE').AsString;
                                    Cells[6,i] := AppData.ZpAupDetail.FieldByName('PRIMECH').AsString;

                                    Sum_Nal     := Sum_Nal + AppData.ZpAupDetail.FieldByName('SUM_NAL').AsFloat;
                                    AppData.ZpAupDetail.Next;
                                  end;
                              end;
                            end;

                            with  ZpAupF.Bar do
                            Begin
                              Panels[0].Text := 'Магазинов: ' + FormatFloat('#,###,###.###', AppData.ZpAupDetail.RecordCount);
                              Panels[1].Text := 'Сумма (нал): ' + FloatToStr (Sum_Nal);
                            end;

                          ZpAupF.ShowModal();
                         end;
                    end;
             end
          else
                  Exit;
   finally
        FreeAndNil(ZpAupF);
   end;
end;

procedure TMainForm.RefreshZpAupPopClick(Sender: TObject);
begin
    Screen.Cursor := crSQLWait;
    ReestrZpAup.Active := False;
    ReestrZpAup.Active := True;
    Screen.Cursor := crDefault;
end;

procedure TMainForm.ViewIncomeDocActionExecute(Sender: TObject);
var
    i, RecordCountDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
    Mes: Word;
    IncomeF: TCreateDocumentForm;
begin

      IncomeF := TCreateDocumentForm.Create(MainForm);
      try
         if not (ReestrIncome.IsEmpty) then
          Begin
              Sum_Nal     := 0;
              Sum_Not_Nal := 0;
              TypeSaveIncome := g_Preview;

              AppData.GetIncomeDetail.Active := False;
              AppData.GetIncomeDetail.CommandText := Format( SSQLGetIncomeDetail, [ReestrIncome.FieldByName('UNICUM_NUM').AsInteger]);
              AppData.GetIncomeDetail.Active := True;
              RecordCountDetail := AppData.GetIncomeDetail.RecordCount+1;

            with IncomeF do
             begin
              DetailStringGridSetting(g_Preview);
              Caption := 'Просмотр документа';
              DetailStringGrid.RowCount := RecordCountDetail;
              NumDocEdit.Text := ReestrIncome.FieldByName('NUMDOC').AsString;
              DateIncomePicker.Date := AppData.GetIncomeDetail.FieldByName('DATE_P_POR').AsDateTime;
              PrimechEdit.Text :=  ReestrIncome.FieldByName('PRIMECH').AsString;
             end;

              AppData.GetIncomeDetail.First;
              while not  AppData.GetIncomeDetail.Eof do
                Begin
                 for i:= 1 to IncomeF.DetailStringGrid.RowCount - 1 do
                  Begin
                     with IncomeF.DetailStringGrid  do
                      begin
                        Cells[0,i] := IntToStr(AppData.GetIncomeDetail.FieldByName('NUM_PREDM').AsInteger);
                        Cells[1,i] := AppData.GetIncomeDetail.FieldByName('UID_SHOP').AsString;
                        Cells[2,i] := AppData.GetIncomeDetail.FieldByName('NAME').AsString;
                        Cells[3,i] := AppData.GetIncomeDetail.FieldByName('ADRESS').AsString;
                        Cells[4,i] := FormatFloat('#,###,###.###', AppData.GetIncomeDetail.FieldByName('SUM_NAL').AsFloat);
                        Cells[5,i] := FormatFloat('#,###,###.###', AppData.GetIncomeDetail.FieldByName('SUM_NOT_NAL').AsFloat);
                        Cells[6,i] := AppData.GetIncomeDetail.FieldByName('PRIMECH').AsString;
                        Sum_Nal     := Sum_Nal + AppData.GetIncomeDetail.FieldByName('SUM_NAL').AsFloat;
                        Sum_Not_Nal :=  Sum_Not_Nal + AppData.GetIncomeDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                        AppData.GetIncomeDetail.Next;
                      end;
                  end;
                end;

              with  IncomeF.Bar do
                Begin
                  Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetIncomeDetail.RecordCount);
                  Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                  Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                end;
             IncomeF.ShowModal();
          end
        else
                Exit;
      finally
            FreeAndNil(IncomeF);
      end;
end;


procedure TMainForm.ViewZpAupActionExecute(Sender: TObject);
var
    i, RecordCountZpAupDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
    ZpAupF: TZpAupForm;
begin
  ZpAupF := TZpAupForm.Create(MainForm);

  try
      if not (ReestrZpAup.IsEmpty) then
          Begin
                ZpAupF.ZpAupStringGridSetting(g_Preview);
                TypeSaveZpAup := g_Preview;
                Sum_Nal     := 0;
                Sum_Not_Nal := 0;


                AppData.ZpAupDetail.Active := False;
                AppData.ZpAupDetail.CommandText := Format(SSQLGetZpAupDocDetail, [ReestrZpAup.FieldByName('UNICUM_NUM').AsInteger]);
                AppData.ZpAupDetail.Active := True;

                RecordCountZpAupDetail := AppData.ZpAupDetail.RecordCount + 1;
                with  ZpAupF do
                Begin
                     Caption := 'Просмотр документа (ЗП АУП)';
                     NumDocEdit.Text := ReestrZpAup.FieldByName('NUMDOC').AsString;
                     ZpAupPicker.Date := ReestrZpAup.FieldByName('DATE_P_POR').AsDateTime;
                     PrimechEdit.Text := ReestrZpAup.FieldByName('PRIMECH').AsString;
                     ZpAupStringGrid.RowCount := RecordCountZpAupDetail;
                end;

                AppData.ZpAupDetail.First;
                while not  AppData.ZpAupDetail.Eof do
                  Begin
                   for i:= 1 to ZpAupF.ZpAupStringGrid.RowCount-1 do
                    Begin
                       with ZpAupF.ZpAupStringGrid  do
                        begin
                          Cells[0,i] := IntToStr(AppData.ZpAupDetail.FieldByName('NUM_PREDM').AsInteger);
                          Cells[1,i] := AppData.ZpAupDetail.FieldByName('UID_SHOP').AsString;
                          Cells[2,i] := AppData.ZpAupDetail.FieldByName('NAME').AsString;
                          Cells[3,i] := AppData.ZpAupDetail.FieldByName('ADRESS').AsString;
                          Cells[4,i] := FormatFloat('#,###,###.###', AppData.ZpAupDetail.FieldByName('SUM_NAL').AsFloat);
                          Cells[5,i] := AppData.ZpAupDetail.FieldByName('NAZNACHENIE').AsString;
                          Cells[6,i] := AppData.ZpAupDetail.FieldByName('PRIMECH').AsString;

                          Sum_Nal     := Sum_Nal + AppData.ZpAupDetail.FieldByName('SUM_NAL').AsFloat;
                          AppData.ZpAupDetail.Next;
                        end;
                    end;
                  end;

                  with  ZpAupF.Bar do
                  Begin
                      Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.ZpAupDetail.RecordCount);
                      Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                  end;

               ZpAupF.ShowModal();
          end
      else
                Exit;
  finally
        FreeAndNil(ZpAupF);
  end;
end;
procedure TMainForm.AccessIncomeMode(i_TabIndex, ModeAccess: integer);
begin
  Tabs.TabIndex := i_TabIndex;
  Case Tabs.TabIndex of
  // Выручка
    TAB_Income:   begin
                    Case ModeAccess of
                    // Только чтение
                    1:   begin
                          CreateIncomePop.Enabled := False;   // Создание (Выручка)
                          CorrIncomePop.Enabled := False;   // Корректировка (Выручка)
                          DeleteIncomePop.Enabled := False;   // Удаление (Выручка)
                          CheckOtmetkaIncomePop.Enabled := False; // Установка отметки
                          UncheckOtmetkaIncomePop.Enabled := False; // Снятие отметки

                          PreviewIncomePop.Enabled := True;    // Просмотр (Выручка)
                          PrintIncomePop.Enabled := True;    // Печать (Выручка)
                          RefreshIncomePop.Enabled := True;    // Обновление (Выручка)
                          RangeIncomePop.Enabled := True;    // Выбор периода (Выручка)
                        end;
                    // Чтение и запись
                    2:  Begin
                          CreateIncomePop.Enabled := True;   // Создание (Выручка)
                          CorrIncomePop.Enabled := True;     // Корректировка (Выручка)
                          DeleteIncomePop.Enabled := True;   // Удаление (Выручка)
                          CheckOtmetkaIncomePop.Enabled := True;  // Установка отметки
                          AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                          if AppData.Users.FieldByName('Admin').AsString = '*' then
                             UncheckOtmetkaIncomePop.Enabled := True  // Снятие отметки
                          else
                             UncheckOtmetkaIncomePop.Enabled := False; // Снятие отметки


                          PreviewIncomePop.Enabled := True;                 // Просмотр (Выручка)
                          PrintIncomePop.Enabled := True;                 // Печать (Выручка)
                          RefreshIncomePop.Enabled := True;    // Обновление (Выручка)
                          RangeIncomePop.Enabled := True;                 // Выбор периода (Выручка)
                        end;
                    end;
                  end;

    // Расходы
    TAB_Expense:  begin
                    Case ModeAccess of
                    // Только чтение
                    1:   begin
                          CreateExpensePop.Enabled := False;          // Создание (Расходы)
                          CorrExpensePop.Enabled := False;            // Корректировка (Расходы)
                          DeleteExpensePop.Enabled := False;          // Удаление (Расходы)
                          CheckOtmetkaExpensePop.Enabled := False;    // Установка отметки
                          UncheckOtmetkaExpensePop.Enabled := False;  // Снятие отметки

                          PreviewExpensePop.Enabled := True;           // Просмотр (Расходы)
                          PrintExpensePop.Enabled := True;             // Печать (Расходы)
                          RefreshExpensePop.Enabled := True;           // Обновление (Расходы)
                          RangeExpensePop.Enabled := True;             // Выбор периода (Расходы)
                        end;
                    // Чтение и запись
                    2:  Begin
                          CreateExpensePop.Enabled := True;             // Создание (Расходы)
                          CorrExpensePop.Enabled := True;               // Корректировка (Расходы)
                          DeleteExpensePop.Enabled := True;             // Удаление (Расходы)
                          CheckOtmetkaExpensePop.Enabled := True;      // Установка отметки
                          AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                          if AppData.Users.FieldByName('Admin').AsString = '*' then
                             UncheckOtmetkaExpensePop.Enabled := True    // Снятие отметки
                          else
                             UncheckOtmetkaExpensePop.Enabled := False;  // Снятие отметки

                          PreviewExpensePop.Enabled := True;    // Просмотр (Расходы)
                          PrintExpensePop.Enabled := True;    // Печать (Расходы)
                          RefreshExpensePop.Enabled := True;    // Обновление (Расходы)
                          RangeExpensePop.Enabled := True;    // Выбор периода (Расходы)
                        end;
                    end;
                  end;


    // Расходы (ЗП)
    TAB_ExpenseZP:  begin
                    Case ModeAccess of
                    // Только чтение
                    1:   begin
                          CreateExpenseZpPop.Enabled := False;      // Создание (Расходы (ЗП))
                          CorrExpenseZpPop.Enabled := False;        // Корректировка (Расходы (ЗП))
                          DeleteExpenseZpPop.Enabled := False;      // Удаление (Расходы (ЗП))
                          CheckOtmetkaExpenseZPPop.Enabled := False;  // Установка отметки
                          UncheckOtmetkaExpenseZpPop.Enabled := False;  // Снятие отметки

                          PreviewExpenseZpPop.Enabled := True;    // Просмотр (Расходы (ЗП))
                          PrintExpenseZpPop.Enabled := True;     // Печать (Расходы (ЗП))
                          RefreshExpenseZpPop.Enabled := True;     // Обновление (Расходы (ЗП))
                          RangeExpenseZpPop.Enabled := True;    // Выбор периода (Расходы (ЗП))
                        end;
                    // Чтение и запись
                    2:  Begin
                          CreateExpenseZpPop.Enabled := True;                 // Создание (Расходы (ЗП))
                          CorrExpenseZpPop.Enabled := True;                   // Корректировка (Расходы (ЗП))
                          DeleteExpenseZpPop.Enabled := True;                 // Удаление (Расходы (ЗП))
                          CheckOtmetkaExpenseZPPop.Enabled := True;           // Установка отметки
                          AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                          if AppData.Users.FieldByName('Admin').AsString = '*' then
                             UncheckOtmetkaExpenseZpPop.Enabled := True       // Снятие отметки
                          else
                             UncheckOtmetkaExpenseZpPop.Enabled :=  False;    // Снятие отметки


                          PreviewExpenseZpPop.Enabled := True;     // Просмотр (Расходы (ЗП))
                          PrintExpenseZpPop.Enabled := True;       // Печать (Расходы (ЗП))
                          RefreshExpenseZpPop.Enabled := True;     // Обновление (Расходы (ЗП))
                          RangeExpenseZpPop.Enabled := True;       // Выбор периода (Расходы (ЗП))
                        end;
                    end;
                  end;


    // Расходы (Прочие)
      TAB_ExpenseOther:  begin
                          Case ModeAccess of
                          // Только чтение
                          1:   begin
                                CreateExpenseOtherPop.Enabled := False;         // Создание (Расходы (Прочие))
                                CorrExpenseOtherPop.Enabled := False;           // Корректировка (Расходы (Прочие))
                                DeleteExepenseOtherPop.Enabled := False;        // Удаление (Расходы (Прочие))
                                CheckOtmetkaExpenseOtherPop.Enabled := False;   // Установка отметки
                                UncheckOtmetkaExpenseOtherPop.Enabled := False; // Снятие отметки

                                PreviewExpenseOtherPop.Enabled := True;         // Просмотр (Расходы (Прочие))
                                PrintExpenseOtherPop.Enabled := True;           // Печать (Расходы (Прочие))
                                RefreshExpenseOtherPop.Enabled := True;         // Обновление (Расходы (Прочие))
                                RangeExpenseOtherPop.Enabled := True;           // Выбор периода (Расходы (Прочие))
                              end;
                          // Чтение и запись
                          2:  Begin
                                CreateExpenseOtherPop.Enabled := True;    // Создание (Расходы (Прочие))
                                CorrExpenseOtherPop.Enabled := True;    // Корректировка (Расходы (Прочие))
                                DeleteExepenseOtherPop.Enabled := True;    // Удаление (Расходы (Прочие))
                                CheckOtmetkaExpenseOtherPop.Enabled := True;   // Установка отметки
                                AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                                if AppData.Users.FieldByName('Admin').AsString = '*' then
                                   UncheckOtmetkaExpenseOtherPop.Enabled := True   // Снятие отметки
                                else
                                   UncheckOtmetkaExpenseOtherPop.Enabled := False; // Снятие отметки

                                PreviewExpenseOtherPop.Enabled := True;    // Просмотр (Расходы (Прочие))
                                PrintExpenseOtherPop.Enabled := True;    // Печать (Расходы (Прочие))
                                RefreshExpenseOtherPop.Enabled := True;    // Обновление (Расходы (Прочие))
                                RangeExpenseOtherPop.Enabled := True;     // Выбор периода (Расходы (Прочие))
                              end;
                          end;
                         end;


    // ЗП АУП
    TAB_ZpAup:    begin
                    Case ModeAccess of
                      // Только чтение
                      1:    begin
                             CreateZpAupPop.Enabled := False;  // Создание (ЗП АУП)
                             CorrZpAupPop.Enabled := False;  // Корректировка (ЗП АУП)
                             DeleteZpAupPop.Enabled := False;  // Удаление (ЗП АУП)
                             CheckOtmetkaZpAupPop.Enabled := False; // Установка отметки
                             UncheckOtmetkaZpAupPop.Enabled := False; // Снятие отметки

                             PreviewZpAupPop.Enabled := True;   // Просмотр (ЗП АУП)
                             PrintZpAupPop.Enabled := True;   // Печать (ЗП АУП)
                             RefreshZpAupPop.Enabled := True;   // Обновление (ЗП АУП)
                             RangeZpAupPop.Enabled := True;   // Период (ЗП АУП)
                           end;

                      // Чтение и запись
                      2:   Begin
                             CreateZpAupPop.Enabled := True;            // Создание (ЗП АУП)
                             CorrZpAupPop.Enabled := True;              // Корректировка (ЗП АУП)
                             DeleteZpAupPop.Enabled := True;            // Удаление (ЗП АУП)
                             CheckOtmetkaZpAupPop.Enabled := True;      // Установка отметки
                             AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                             if AppData.Users.FieldByName('Admin').AsString = '*' then
                                UncheckOtmetkaZpAupPop.Enabled := True   // Снятие отметки
                             else
                                UncheckOtmetkaZpAupPop.Enabled := False; // Снятие отметки

                             PreviewZpAupPop.Enabled := True;   // Просмотр (ЗП АУП)
                             PrintZpAupPop.Enabled := True;   // Печать (ЗП АУП)
                             RefreshZpAupPop.Enabled := True;   // Обновление (ЗП АУП)
                             RangeZpAupPop.Enabled := True;   // Период (ЗП АУП)
                           end;
                    end;
                  end;

                  // Налоги по ЗП
    TAB_TaxToZp:  Begin
                    Case ModeAccess of
                    // Только чтение
                      1:    Begin
                               CreateTaxToZpPop.Enabled := False;   // Создание (Налоги по ЗП)
                               CorrTaxToZpPop.Enabled := False;     // Корректировка (Налоги по ЗП)
                               DeleteTaxToZpPop.Enabled := False;   // Удаление (Налоги по ЗП)
                               CheckOtmetkaTaxToZpPop.Enabled := False;  // Установка отметки
                               UncheckOtmetkaTaxToZpPop.Enabled := False;  // Снятие отметки

                               PreviewTaxToZpPop.Enabled := True;   // Просмотр (Налоги по ЗП)
                               PrintTaxToZpPop.Enabled   := True;   // Печать   (Налоги по ЗП)
                               RefreshTaxToZpPop.Enabled := True;   // Обновить (Налоги по ЗП)
                               RangeTaxToZpPopup.Enabled := True;   // Период   (Налоги по ЗП)
                            end;
                   // Чтение и запись
                      2:    Begin
                               CreateTaxToZpPop.Enabled := True;   // Создание (Налоги по ЗП)
                               CorrTaxToZpPop.Enabled := True;     // Корректировка (Налоги по ЗП)
                               DeleteTaxToZpPop.Enabled := True;   // Удаление (Налоги по ЗП)
                               CheckOtmetkaTaxToZpPop.Enabled := True;  // Установка отметки
                               AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                               if AppData.Users.FieldByName('Admin').AsString = '*' then
                                  UncheckOtmetkaTaxToZpPop.Enabled := True    // Снятие отметки
                               else
                                  UncheckOtmetkaTaxToZpPop.Enabled := False;  // Снятие отметки


                               PreviewTaxToZpPop.Enabled := True;   // Просмотр (Налоги по ЗП)
                               PrintTaxToZpPop.Enabled   := True;   // Печать   (Налоги по ЗП)
                               RefreshTaxToZpPop.Enabled := True;   // Обновить (Налоги по ЗП)
                               RangeTaxToZpPopup.Enabled := True;   // Период   (Налоги по ЗП)
                            end;
                    end;
                  end;

    //  Процент по терминалу
    TAB_PercentOfTerminal:    Begin
                            // Только чтение
                                Case ModeAccess of
                                  1:    Begin
                                           CreatePercentOfTerminalPop.Enabled := False;   // Создание (Процент по терминалу)
                                           CorrPercentOfTerminalPop.Enabled   := False;   // Корректировка (Процент по терминалу)
                                           DeletePercentOfTerminalPop.Enabled := False;   // Удаление (Процент по терминалу)
                                           CheckPercentOfTerminalPop.Enabled := False;    // Установка отметки
                                           UncheckPercentOfTerminalPop.Enabled := False;  // Снятие отметки

                                           PreviewPercentOfTerminalPop.Enabled := True;   // Просмотр    (Процент по терминалу)
                                           PrintPercentOfTerminalPop.Enabled   := True;   // Печать      (Процент по терминалу)
                                           RefreshPercentOfTerminalPop.Enabled := True;   // Обновление  (Процент по терминалу)
                                           RangePercentOfTerminalPop.Enabled   := True;   // Период      (Процент по терминалу)
                                        end;

                                  // Чтение и запись
                                  2:    Begin
                                           CreatePercentOfTerminalPop.Enabled := True;   // Создание (Процент по терминалу)
                                           CorrPercentOfTerminalPop.Enabled   := True;   // Корректировка (Процент по терминалу)
                                           DeletePercentOfTerminalPop.Enabled := True;   // Удаление (Процент по терминалу)
                                           CheckPercentOfTerminalPop.Enabled :=  True;   // Установка отметки
                                           AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                                           if AppData.Users.FieldByName('Admin').AsString = '*' then
                                              UncheckPercentOfTerminalPop.Enabled := True    // Снятие отметки
                                           else
                                              UncheckPercentOfTerminalPop.Enabled := False;  // Снятие отметки

                                           PreviewPercentOfTerminalPop.Enabled := True;   // Просмотр    (Процент по терминалу)
                                           PrintPercentOfTerminalPop.Enabled   := True;   // Печать      (Процент по терминалу)
                                           RefreshPercentOfTerminalPop.Enabled := True;   // Обновление  (Процент по терминалу)
                                           RangePercentOfTerminalPop.Enabled   := True;   // Период      (Процент по терминалу)
                                        end;
                                end;
                              end;

    //  Отгрузка (Восток)
    TAB_ShipmentVostok:       Begin
                            // Только чтение
                                Case ModeAccess of
                                  1:    Begin
                                           CreateShipmentVostokPop.Enabled := False;   // Создание (Процент по терминалу)
                                           CorrShipmentVostokPop.Enabled   := False;   // Корректировка (Процент по терминалу)
                                           DeleteShipmentVostokPop.Enabled := False;   // Удаление (Процент по терминалу)
                                           CheckOtmetkaShipmentVostokPopup.Enabled := False;    // Установка отметки
                                           UnCheckOtmetkaShipmentVostokPopup.Enabled := False;  // Снятие отметки

                                           ViewShipmentVostokPop.Enabled := True;   // Просмотр    (Процент по терминалу)
                                           PrintShipmentVostokPop.Enabled   := True;   // Печать      (Процент по терминалу)
                                           RefreshShipmentVostokPop.Enabled := True;   // Обновление  (Процент по терминалу)
                                           RangeShipmentVostokPop.Enabled   := True;   // Период      (Процент по терминалу)
                                        end;

                                  // Чтение и запись
                                  2:    Begin
                                           CreateShipmentVostokPop.Enabled := True;   // Создание (Процент по терминалу)
                                           CorrShipmentVostokPop.Enabled   := True;   // Корректировка (Процент по терминалу)
                                           DeleteShipmentVostokPop.Enabled := True;   // Удаление (Процент по терминалу)
                                           CheckOtmetkaShipmentVostokPopup.Enabled :=  True;   // Установка отметки
                                           AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                                           if AppData.Users.FieldByName('Admin').AsString = '*' then
                                              UnCheckOtmetkaShipmentVostokPopup.Enabled := True    // Снятие отметки
                                           else
                                              UnCheckOtmetkaShipmentVostokPopup.Enabled := False;  // Снятие отметки

                                           ViewShipmentVostokPop.Enabled := True;      // Просмотр    (Процент по терминалу)
                                           PrintShipmentVostokPop.Enabled   := True;   // Печать      (Процент по терминалу)
                                           RefreshShipmentVostokPop.Enabled := True;   // Обновление  (Процент по терминалу)
                                           RangeShipmentVostokPop.Enabled   := True;   // Период      (Процент по терминалу)
                                        end;
                                end;
                              end;

      // Отгрузка (Прочие)
    TAB_ShipmentOther:       Begin
                            // Только чтение
                                Case ModeAccess of
                                  1:    Begin
                                           CreateShipmentOtherPop.Enabled := False;   // Создание (Процент по терминалу)
                                           CorrShipmentOtherPop.Enabled   := False;   // Корректировка (Процент по терминалу)
                                           DeleteShipmentOtherPop.Enabled := False;   // Удаление (Процент по терминалу)
                                           CheckOtmetkaShipmentOtherPopup.Enabled := False;    // Установка отметки
                                           UnCheckOtmetkaShipmentOtherPopup.Enabled := False;  // Снятие отметки

                                           ViewShipmentOtherPop.Enabled := True;   // Просмотр    (Процент по терминалу)
                                           PrintShipmentOtherPop.Enabled   := True;   // Печать      (Процент по терминалу)
                                           RefreshShipmentOtherPop.Enabled := True;   // Обновление  (Процент по терминалу)
                                           RangeShipmentOtherPop.Enabled   := True;   // Период      (Процент по терминалу)
                                        end;

                                  // Чтение и запись
                                  2:    Begin
                                           CreateShipmentOtherPop.Enabled := True;   // Создание (Процент по терминалу)
                                           CorrShipmentOtherPop.Enabled   := True;   // Корректировка (Процент по терминалу)
                                           DeleteShipmentOtherPop.Enabled := True;   // Удаление (Процент по терминалу)
                                           CheckOtmetkaShipmentOtherPopup.Enabled :=  True;   // Установка отметки
                                           AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                                           if AppData.Users.FieldByName('Admin').AsString = '*' then
                                              UnCheckOtmetkaShipmentOtherPopup.Enabled := True    // Снятие отметки
                                           else
                                              UnCheckOtmetkaShipmentOtherPopup.Enabled := False;  // Снятие отметки

                                           ViewShipmentOtherPop.Enabled := True;      // Просмотр    (Процент по терминалу)
                                           PrintShipmentOtherPop.Enabled   := True;   // Печать      (Процент по терминалу)
                                           RefreshShipmentOtherPop.Enabled := True;   // Обновление  (Процент по терминалу)
                                           RangeShipmentOtherPop.Enabled   := True;   // Период      (Процент по терминалу)
                                        end;
                                end;
                              end;
   { DONE 1 -opmp -cTuesdey : Настройки доступа (Списание) }
     // Списание
     TAB_Offs:            Begin
                            // Только чтение
                                Case ModeAccess of
                                  1:    Begin
                                           CreateOffsPop.Enabled := False;   // Создание (Списание)
                                           CorrOffsPop.Enabled   := False;   // Корректировка (Списание)
                                           DeleteOffsPop.Enabled := False;   // Удаление (Списание)
                                           CheckOtmetkaOffsPop.Enabled := False;    // Установка отметки
                                           UnCheckOtmetkaOffsPop.Enabled := False;  // Снятие отметки

                                           ViewOffsPop.Enabled := True;   // Просмотр    (Списание)
                                           PrintOffsPop.Enabled   := True;   // Печать      (Списание)
                                           RefreshOffsPop.Enabled := True;   // Обновление  (Списание)
                                           RangeOffsPop.Enabled   := True;   // Период      (Списание)
                                        end;

                                  // Чтение и запись
                                  2:    Begin
                                           CreateOffsPop.Enabled := True;   // Создание (Списание)
                                           CorrOffsPop.Enabled   := True;   // Корректировка (Списание)
                                           DeleteOffsPop.Enabled := True;   // Удаление (Списание)
                                           CheckOtmetkaOffsPop.Enabled :=  True;   // Установка отметки
                                           AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                                           if AppData.Users.FieldByName('Admin').AsString = '*' then
                                              UnCheckOtmetkaOffsPop.Enabled := True    // Снятие отметки
                                           else
                                              UnCheckOtmetkaOffsPop.Enabled := False;  // Снятие отметки

                                           ViewOffsPop.Enabled := True;      // Просмотр    (Списание)
                                           PrintOffsPop.Enabled   := True;   // Печать      (Списание)
                                           RefreshOffsPop.Enabled := True;   // Обновление  (Списание)
                                           RangeOffsPop.Enabled   := True;   // Период      (Списание)
                                        end;
                                end;
                          end;

    // Возврат
    TAB_Return:           Begin
                            // Только чтение
                                Case ModeAccess of
                                  1:    Begin
                                           CreateReturnPop.Enabled := False;      // Создание (Возврат)
                                           CorrReturnPop.Enabled   := False;      // Корректировка (Возврат)
                                           DeleteReturnPop.Enabled := False;      // Удаление (Возврат)
                                           CheckOtmReturnPop.Enabled := False;    // Установка отметки  (Возврат)
                                           UnCheckOtmReturnPop.Enabled := False;  // Снятие отметки

                                           ViewReturnPop.Enabled := True;         // Просмотр    (Возврат)
                                           PrintReturnPop.Enabled   := True;      // Печать      (Возврат)
                                           RefreshReturnPop.Enabled := True;      // Обновление  (Возврат)
                                           RangeReturnPop.Enabled   := True;      // Период      (Возврат)
                                        end;

                                  // Чтение и запись
                                  2:    Begin
                                           CreateReturnPop.Enabled := True;        // Создание (Возврат)
                                           CorrReturnPop.Enabled   := True;        // Корректировка (Возврат)
                                           DeleteReturnPop.Enabled := True;        // Удаление (Возврат)
                                           CheckOtmReturnPop.Enabled :=  True;     // Установка отметки (Возврат)
                                           AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                                           if AppData.Users.FieldByName('Admin').AsString = '*' then
                                              UnCheckOtmReturnPop.Enabled := True    // Снятие отметки (Возврат)
                                           else
                                              UnCheckOtmReturnPop.Enabled := False;  // Снятие отметки (Возврат)

                                           ViewReturnPop.Enabled := True;      // Просмотр    (Возврат)
                                           PrintReturnPop.Enabled   := True;   // Печать      (Возврат)
                                           RefreshReturnPop.Enabled := True;   // Обновление  (Возврат)
                                           RangeReturnPop.Enabled   := True;   // Период      (Возврат)
                                        end;
                                end;
                              end;

         { DONE 1 -opmp -cTuesdey : Настройки доступа (Коммунальные услуги) }

    // Коммунальные услуги
    TAB_PublicUtilities:  Begin
                            // Только чтение
                                Case ModeAccess of
                                  1:    Begin
                                           CreatePublicUtilitiesPop.Enabled := False;   // Создание (Коммунальные услуги)
                                           CorrPublicUtilitiesPop.Enabled   := False;   // Корректировка (Коммунальные услуги)
                                           DeletePublicUtilitiesPop.Enabled := False;   // Удаление (Коммунальные услуги)
                                           CheckOtmetkaPublicUtilitiesPop.Enabled := False;    // Установка отметки (Коммунальные услуги)
                                           UnCheckOtmetkaPublicUtilitiesPop.Enabled := False;  // Снятие отметки   (Коммунальные услуги)

                                           ViewPublicUtilitiesPop.Enabled := True;   // Просмотр    (Коммунальные услуги)
                                           PrintPublicUtilitiesPop.Enabled   := True;   // Печать      (Коммунальные услуги)
                                           RefreshPublicUtilitiesPop.Enabled := True;   // Обновление  (Коммунальные услуги)
                                           RangePublicUtilitiesPop.Enabled   := True;   // Период      (Коммунальные услуги)
                                        end;

                                  // Чтение и запись
                                  2:    Begin
                                           CreatePublicUtilitiesPop.Enabled := True;   // Создание (Коммунальные услуги)
                                           CorrPublicUtilitiesPop.Enabled   := True;   // Корректировка (Коммунальные услуги)
                                           DeletePublicUtilitiesPop.Enabled := True;   // Удаление (Коммунальные услуги)
                                           CheckOtmetkaPublicUtilitiesPop.Enabled :=  True;   // Установка отметки
                                           AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                                           if AppData.Users.FieldByName('Admin').AsString = '*' then
                                              UnCheckOtmetkaPublicUtilitiesPop.Enabled := True    // Снятие отметки (Коммунальные услуги)
                                           else
                                              UnCheckOtmetkaPublicUtilitiesPop.Enabled := False;  // Снятие отметки (Коммунальные услуги)

                                           ViewPublicUtilitiesPop.Enabled := True;      // Просмотр    (Коммунальные услуги)
                                           PrintPublicUtilitiesPop.Enabled   := True;   // Печать      (Коммунальные услуги)
                                           RefreshPublicUtilitiesPop.Enabled := True;   // Обновление  (Коммунальные услуги)
                                           RangePublicUtilitiesPop.Enabled   := True;   // Период      (Коммунальные услуги)
                                        end;
                                end;
                          end;

    // Выручка (Касса)
    TAB_IncomeCash:     Begin
                            Case ModeAccess of
                              // Только чтение
                              1:    Begin
                                      CreateCashPop.Enabled := False;                 // Создать
                                      CorrCashPop.Enabled := False;                   // Корректировка
                                      DeleteCashPop.Enabled := False;                 // Удаление
                                      CheckOtmetkaIncomeCashPop.Enabled := False;     // Установка отметки
                                      UncheckOtmetkaIncomeCashPop.Enabled := False;   // Снятие отметки

                                      ViewCashPop.Enabled := True;                    // Просмотр
                                      RefreshCashPop.Enabled := True;                 // Обновление
                                      PrintCashPop.Enabled := True;                   // Печать
                                      RangeCashPop.Enabled := True;                   // Период
                                    end;

                               // Чтение и запись
                               2:   Begin
                                      CreateCashPop.Enabled := True;                   // Создать
                                      CorrCashPop.Enabled := True;                     // Корректировка
                                      DeleteCashPop.Enabled := True;                   // Удаление
                                      CheckOtmetkaIncomeCashPop.Enabled := True;       // Установка отметки
                                      AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                                      if AppData.Users.FieldByName('Admin').AsString = '*' then
                                          UncheckOtmetkaIncomeCashPop.Enabled := True    // Снятие отметки
                                      else
                                          UncheckOtmetkaIncomeCashPop.Enabled := False;  // Снятие отметки

                                      ViewCashPop.Enabled := True;                       // Просмотр
                                      RefreshCashPop.Enabled := True;                    // Обновление
                                      PrintCashPop.Enabled := True;                      // Печать
                                      RangeCashPop.Enabled := True;                      // Период
                                    end;
                            end;
                        end;

  end;


end;

procedure TMainForm.ViewExpenceDocActionExecute(Sender: TObject);
var
    i, RecordCountExpenceDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
begin

  if not (ReestrExpense.IsEmpty) then
    Begin
            ExpenseForm.ExpenceSetting(TAB_Expense, g_Preview);
            TypeExpense := TAB_Expense;
            TypeSaveExpence := g_Preview;

            Sum_Nal     := 0;
            Sum_Not_Nal := 0;

             AppData.ExpenceDetail.Active := False;
             AppData.ExpenceDetail.CommandText := Format(SSQLGetExpenceDetail, [MainForm.ReestrExpense.FieldByName('UNICUM_NUM').AsInteger]);
             AppData.ExpenceDetail.Active := True;

             RecordCountExpenceDetail := AppData.ExpenceDetail.RecordCount+1;

                with ExpenseForm do
                  Begin
                     Caption := 'Просмотр документа';
                     NumDocEdit.Text := ReestrExpense.FieldByName('NUMDOC').AsString;
                     ExpencePicker.Date := ReestrExpense.FieldByName('DATE_P_POR').AsDateTime;
                     PrimechEdit.Text := ReestrExpense.FieldByName('PRIMECH').AsString;
                     MonthCombo.Visible := False;
                     YearSpinEdit.Visible := False;
                     ExpenseStringGrid.RowCount := RecordCountExpenceDetail;
                  end;



            AppData.ExpenceDetail.First;
            while not  AppData.ExpenceDetail.Eof do
              Begin
               for i:= 1 to ExpenseForm.ExpenseStringGrid.RowCount-1 do
                Begin
                   with ExpenseForm.ExpenseStringGrid  do
                    begin
                      Cells[0,i] := IntToStr(AppData.ExpenceDetail.FieldByName('NUM_PREDM').AsInteger);
                      Cells[1,i] := AppData.ExpenceDetail.FieldByName('UID_SHOP').AsString;
                      Cells[2,i] := AppData.ExpenceDetail.FieldByName('NAME').AsString;
                      Cells[3,i] := AppData.ExpenceDetail.FieldByName('ADRESS').AsString;
                      Cells[4,i] := FormatFloat('#,###,###.###', AppData.ExpenceDetail.FieldByName('SUM_NAL').AsFloat);
                      Cells[5,i] := FormatFloat('#,###,###.###', AppData.ExpenceDetail.FieldByName('SUM_NOT_NAL').AsFloat);
                      Cells[6,i] := AppData.ExpenceDetail.FieldByName('NAZNACHENIE').AsString;
                      Cells[7,i] := AppData.ExpenceDetail.FieldByName('RECIPIENT').AsString;
                      Cells[8,i] := AppData.ExpenceDetail.FieldByName('PRIMECH').AsString;
                      Sum_Nal     := Sum_Nal + AppData.ExpenceDetail.FieldByName('SUM_NAL').AsFloat;
                      Sum_Not_Nal :=  Sum_Not_Nal + AppData.ExpenceDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                      AppData.ExpenceDetail.Next;
                    end;
                end;
              end;

              with  ExpenseForm.Bar do
              Begin
                  Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.ExpenceDetail.RecordCount);
                  Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                  Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
              end;
           ExpenseForm.ShowModal();
    end
  else
          Exit;
end;

procedure TMainForm.ViewExpenceZpDocActionExecute(Sender: TObject);
var
    i, RecordCountExpenceDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
    Year, Month, Day: Word;
begin

if not (ReestrExpenseZP.IsEmpty) then
    Begin
        ExpenseForm.ExpenceSetting(TAB_ExpenseZP, g_Preview);
        TypeExpense := TAB_ExpenseZP;
        TypeSaveExpence := g_Preview;
        Sum_Nal     := 0;
        Sum_Not_Nal := 0;

         AppData.CorrExpenceZPDoc.Active := False;
         AppData.CorrExpenceZPDoc.CommandText := Format(SSQLGetExpenceZPDetail, [ReestrExpenseZP.FieldByName('UNICUM_NUM').AsInteger]);

         AppData.CorrExpenceZPDoc.Active := True;

         DecodeDate(ReestrExpenseZP.FieldByName('DATE_P_POR').AsDateTime, Year, Month, Day);


         RecordCountExpenceDetail := AppData.CorrExpenceZPDoc.RecordCount+1;
           with  ExpenseForm do
           begin
             NumDocEdit.Text := ReestrExpenseZP.FieldByName('NUMDOC').AsString;
             ExpencePicker.Date := ReestrExpenseZP.FieldByName('DATE_P_POR').AsDateTime;
             PrimechEdit.Text := ReestrExpenseZP.FieldByName('PRIMECH').AsString;
             MonthCombo.ItemIndex := Month;
             MonthCombo.Visible := True;
             YearSpinEdit.Visible := False;
             ExpenseStringGrid.RowCount := RecordCountExpenceDetail;
          end;



          AppData.CorrExpenceZPDoc.First;
        while not  AppData.CorrExpenceZPDoc.Eof do
          Begin
           for i:= 1 to ExpenseForm.ExpenseStringGrid.RowCount-1 do
            Begin
               with ExpenseForm.ExpenseStringGrid  do
                begin
                  Cells[0,i] := IntToStr(AppData.CorrExpenceZPDoc.FieldByName('NUM_PREDM').AsInteger);
                  Cells[1,i] := AppData.CorrExpenceZPDoc.FieldByName('UID_SHOP').AsString;
                  Cells[2,i] := AppData.CorrExpenceZPDoc.FieldByName('NAME').AsString;
                  Cells[3,i] := AppData.CorrExpenceZPDoc.FieldByName('ADRESS').AsString;
                  Cells[4,i] := FormatFloat('#,###,###.###', AppData.CorrExpenceZPDoc.FieldByName('SUM_NAL').AsFloat);
                  Cells[5,i] := FormatFloat('#,###,###.###', AppData.CorrExpenceZPDoc.FieldByName('SUM_NOT_NAL').AsFloat);
                  Cells[8,i] := AppData.CorrExpenceZPDoc.FieldByName('PRIMECH').AsString;
                  Sum_Nal     := Sum_Nal + AppData.CorrExpenceZPDoc.FieldByName('SUM_NAL').AsFloat;
                  Sum_Not_Nal :=  Sum_Not_Nal + AppData.CorrExpenceZPDoc.FieldByName('SUM_NOT_NAL').AsFloat;
                  AppData.CorrExpenceZPDoc.Next;
                end;
            end;
          end;

          with  ExpenseForm.Bar do
          Begin
            Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.CorrExpenceZPDoc.RecordCount);
            Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
            Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
          end;
       ExpenseForm.ShowModal();
    end
  else
          Exit;
end;

procedure TMainForm.ViewExpenceOtherDocActionExecute(Sender: TObject);
var
    i, RecordCountExpenceDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
begin

    if not (ReestrExpenseOther.IsEmpty) then
       Begin
          ExpenseForm.ExpenceSetting(TAB_ExpenseOther, g_Preview);
          TypeExpense := TAB_ExpenseOther;
          TypeSaveExpence := g_Preview;
          Sum_Nal     := 0;
          Sum_Not_Nal := 0;

           AppData.CorrExpenceDoc.Active := False;
           AppData.CorrExpenceDoc.CommandText := Format(SSQLGetExpenceDetail, [MainForm.ReestrExpenseOther.FieldByName('UNICUM_NUM').AsInteger]);

           AppData.CorrExpenceDoc.Active := True;

           RecordCountExpenceDetail := AppData.CorrExpenceDoc.RecordCount+1;

             with  ExpenseForm do
              Begin
                 Caption := 'Просмотр документа';
                 NumDocEdit.Text := ReestrExpenseOther.FieldByName('NUMDOC').AsString;
                 ExpencePicker.Date := ReestrExpenseOther.FieldByName('DATE_P_POR').AsDateTime;
                 PrimechEdit.Text := ReestrExpenseOther.FieldByName('PRIMECH').AsString;
                 MonthCombo.Visible := False;
                 YearSpinEdit.Visible := False;
                 ExpenseStringGrid.RowCount := RecordCountExpenceDetail;
              end;

            AppData.CorrExpenceDoc.First;
          while not  AppData.CorrExpenceDoc.Eof do
            Begin
             for i:= 1 to ExpenseForm.ExpenseStringGrid.RowCount-1 do
              Begin
                 with ExpenseForm.ExpenseStringGrid  do
                  begin
                    Cells[0,i] := IntToStr(AppData.CorrExpenceDoc.FieldByName('NUM_PREDM').AsInteger);
                    Cells[1,i] := AppData.CorrExpenceDoc.FieldByName('UID_SHOP').AsString;
                    Cells[2,i] := AppData.CorrExpenceDoc.FieldByName('NAME').AsString;
                    Cells[3,i] := AppData.CorrExpenceDoc.FieldByName('ADRESS').AsString;
                    Cells[4,i] := FormatFloat('#,###,###.###', AppData.CorrExpenceDoc.FieldByName('SUM_NAL').AsFloat);
                    Cells[5,i] := FormatFloat('#,###,###.###', AppData.CorrExpenceDoc.FieldByName('SUM_NOT_NAL').AsFloat);
                    Cells[6,i] := AppData.CorrExpenceDoc.FieldByName('NAZNACHENIE').AsString;
                    Cells[7,i] := AppData.CorrExpenceDoc.FieldByName('RECIPIENT').AsString;
                    Cells[8,i] := AppData.CorrExpenceDoc.FieldByName('PRIMECH').AsString;

                    Sum_Nal     := Sum_Nal + AppData.CorrExpenceDoc.FieldByName('SUM_NAL').AsFloat;
                    Sum_Not_Nal :=  Sum_Not_Nal + AppData.CorrExpenceDoc.FieldByName('SUM_NOT_NAL').AsFloat;
                    AppData.CorrExpenceDoc.Next;
                  end;
              end;
            end;

            with  ExpenseForm.Bar do
            Begin
              Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.CorrExpenceDoc.RecordCount);
              Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
              Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
            end;

         ExpenseForm.ShowModal();
       end
    else
            Exit;

end;

procedure TMainForm.PrintZpAupReestrPopClick(Sender: TObject);
begin
    ReestrZpAup.DisableControls;
    Report.Template := SZpAupReestr;
    Report.Run;
    ReestrZpAup.EnableControls;
end;

procedure TMainForm.PrintZpAupDocPopClick(Sender: TObject);
begin
    fl_TypeReport := TAB_ZpAup;
    AppData.ZpAupDetail.Active := False;
    AppData.ZpAupDetail.CommandText := Format(SSQLGetZpAupDocDetail, [ReestrZpAup.FieldByName('UNICUM_NUM').AsInteger]);
    AppData.ZpAupDetail.Active := True;

    AppData.Report.Template := SZpAupTotalDoc;
    AppData.Report.Run;
end;

procedure TMainForm.PrintExpenseOtherReestrPopClick(Sender: TObject);
begin
    ReestrExpenseOther.DisableControls;
    Report.Template := SExpenseReestrOther;
    Report.Run;
    ReestrExpenseOther.First;
    ReestrExpenseOther.EnableControls;
end;

procedure TMainForm.PrintExpenseOtherDocPopClick(Sender: TObject);
begin
   fl_TypeReport := TAB_ExpenseOther;
   AppData.Report.Template := SExpenseOtherTotalDoc;
   AppData.Report.Run;
end;

procedure TMainForm.IncomeCashActionExecute(Sender: TObject);
var
    i: integer;
    IncomeCashF: TIncomeCashForm;
begin
     IncomeCashF := TIncomeCashForm.Create(MainForm);
     try
        AppData.Organiz.Active := False;
        AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
        AppData.Organiz.Active := True;


        TypeSaveIncome := g_CreateDoc;
         with IncomeCashF do
          begin
            SettingIncomeCash(g_CreateDoc);
            Caption := 'Создать документ (Выручка(Бухгатерия))';
            NumDocEdit.Text := EmptyStr;
            DateIncomePicker.Date := Now();
          end;

        AppData.Organiz.First;
        with IncomeCashF.DetailStringGrid do
        Begin
          RowCount := AppData.Organiz.RecordCount+1;
          while not AppData.Organiz.Eof do
           Begin
            For i := 1 to RowCount-1 do
             Begin
                Cells[0,i] := IntToStr(i);
                Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
                Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
                Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
                AppData.Organiz.Next;
             end;
           end;
        end;

        with  IncomeCashF.Bar do
          Begin
            Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
            Panels[1].Text := 'Сумма (нал): ' + '0';
            Panels[2].Text := 'Сумма (безнал): ' + '0';
          end;
        IncomeCashF.ShowModal();
     finally
        FreeAndNil(IncomeCashF);
     end;
end;

procedure TMainForm.CorrIncomeCashActionExecute(Sender: TObject);
var
    i, RecordCountDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
    Mes: Word;
    IncomeF: TIncomeCashForm;
begin
    IncomeF := TIncomeCashForm(MainForm);
    try
      if not (ReestrIncomeCash.IsEmpty) then
         Begin
            AppData.GetIncomeDetail.Active := False;
            AppData.GetIncomeDetail.CommandText := Format(SSQLGetIncomeDetail, [ReestrIncomeCash.FieldByName('UNICUM_NUM').AsInteger]);
            AppData.GetIncomeDetail.Active := True;

             if AppData.GetIncomeDetail.FieldByName('StatusDoc').AsString = '*' then
               begin
                  MessageBox(Handle, PChar('Документ: ' + AppData.GetIncomeDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                  Exit;
               end
             else
               Begin
                     AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                     if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.GetIncomeDetail.FieldByName('OTMETKA').AsString = '*') then
                      Begin
                        MessageBox(Handle, PChar('Документ № ' + AppData.GetIncomeDetail.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                        Exit;
                      end
                  else
                      Begin
                        with AppData do
                        Begin
                          AdoCmd.CommandText := Format(SSQLUpdateIncStatusCorrDoc, [ReestrIncomeCash.FieldByName('UNICUM_NUM').AsInteger, 1]);
                          AdoCmd.Execute;
                        end;

                        Sum_Nal     := 0;
                        Sum_Not_Nal := 0;
                        TypeSaveIncome := g_CorrDoc;
                        RecordCountDetail := AppData.GetIncomeDetail.RecordCount+1;

                        with IncomeCashForm do
                        begin
                            SettingIncomeCash(g_CorrDoc);
                            Caption := 'Корректировка документа';
                            DetailStringGrid.RowCount := RecordCountDetail;
                            NumDocEdit.Text := ReestrIncomeCash.FieldByName('NUMDOC').AsString;
                            DateIncomePicker.Date := AppData.GetIncomeDetail.FieldByName('DATE_P_POR').AsDateTime;
                            PrimechEdit.Text :=  ReestrIncomeCash.FieldByName('PRIMECH').AsString;
                        end;

                        AppData.GetIncomeDetail.First;
                        while not  AppData.GetIncomeDetail.Eof do
                        Begin
                          for i:= 1 to IncomeCashForm.DetailStringGrid.RowCount - 1 do
                            Begin
                              with IncomeCashForm.DetailStringGrid  do
                                begin
                                  Cells[0,i] := IntToStr(AppData.GetIncomeDetail.FieldByName('NUM_PREDM').AsInteger);
                                  Cells[1,i] := AppData.GetIncomeDetail.FieldByName('UID_SHOP').AsString;
                                  Cells[2,i] := AppData.GetIncomeDetail.FieldByName('NAME').AsString;
                                  Cells[3,i] := AppData.GetIncomeDetail.FieldByName('ADRESS').AsString;
                                  Cells[4,i] := AppData.GetIncomeDetail.FieldByName('SUM_NAL').AsString;
                                  Cells[5,i] := AppData.GetIncomeDetail.FieldByName('SUM_NOT_NAL').AsString;
                                  Cells[6,i] := AppData.GetIncomeDetail.FieldByName('PRIMECH').AsString;
                                  Sum_Nal     := Sum_Nal + AppData.GetIncomeDetail.FieldByName('SUM_NAL').AsFloat;
                                  Sum_Not_Nal :=  Sum_Not_Nal + AppData.GetIncomeDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                                  AppData.GetIncomeDetail.Next;
                                end;
                            end;
                        end;

                        with  IncomeCashForm.Bar do
                        Begin
                          Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetIncomeDetail.RecordCount);
                          Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                          Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                        end;
                        IncomeCashForm.ShowModal();
                    end;
               end;
          end
      else
                      Exit;
    finally
          FreeAndNil(IncomeF);
    end;
end;

procedure TMainForm.ViewIncomeCashActionExecute(Sender: TObject);
var
    i, RecordCountDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
    Mes: Word;
    IncomeCashF: TIncomeCashForm;
begin

   IncomeCashF := TIncomeCashForm.Create(MainForm);
   try
        if not (ReestrIncomeCash.IsEmpty) then
            Begin
              Sum_Nal     := 0;
              Sum_Not_Nal := 0;

              AppData.GetIncomeDetail.Active := False;
              AppData.GetIncomeDetail.CommandText := Format(SSQLGetIncomeDetail, [ReestrIncomeCash.FieldByName('UNICUM_NUM').AsInteger]);
              AppData.GetIncomeDetail.Active := True;
              RecordCountDetail := AppData.GetIncomeDetail.RecordCount+1;

              with IncomeCashF do
                begin
                  SettingIncomeCash(g_Preview);
                  TypeSaveIncome := g_Preview;
                  Caption := 'Просмотр';
                  DetailStringGrid.RowCount := RecordCountDetail;
                  NumDocEdit.Text :=  AppData.GetIncomeDetail.FieldByName('NUMDOC').AsString;
                  DateIncomePicker.Date := AppData.GetIncomeDetail.FieldByName('DATE_P_POR').AsDateTime;
                  PrimechEdit.Text :=  ReestrIncomeCash.FieldByName('PRIMECH').AsString;
                end;


              AppData.GetIncomeDetail.First;
              while not  AppData.GetIncomeDetail.Eof do
                Begin
                 for i:= 1 to IncomeCashF.DetailStringGrid.RowCount - 1 do
                  Begin
                     with IncomeCashF.DetailStringGrid  do
                      begin
                        Cells[0,i] := IntToStr(AppData.GetIncomeDetail.FieldByName('NUM_PREDM').AsInteger);
                        Cells[1,i] := AppData.GetIncomeDetail.FieldByName('UID_SHOP').AsString;
                        Cells[2,i] := AppData.GetIncomeDetail.FieldByName('NAME').AsString;
                        Cells[3,i] := AppData.GetIncomeDetail.FieldByName('ADRESS').AsString;
                        Cells[4,i] := FormatFloat('#,###,###.###', AppData.GetIncomeDetail.FieldByName('SUM_NAL').AsFloat);
                        Cells[5,i] := FormatFloat('#,###,###.###', AppData.GetIncomeDetail.FieldByName('SUM_NOT_NAL').AsFloat);
                        Cells[6,i] := AppData.GetIncomeDetail.FieldByName('Primech').AsString;
                        Sum_Nal     := Sum_Nal + AppData.GetIncomeDetail.FieldByName('SUM_NAL').AsFloat;
                        Sum_Not_Nal :=  Sum_Not_Nal + AppData.GetIncomeDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                        AppData.GetIncomeDetail.Next;
                      end;
                  end;
                end;

              with  IncomeCashF.Bar do
                Begin
                  Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetIncomeDetail.RecordCount);
                  Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                  Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                end;
             IncomeCashF.ShowModal();
            end
        else
                Exit;
   finally
        FreeAndNil(IncomeCashF);
   end;
end;

procedure TMainForm.DeleteIncomeCashDocActionExecute(Sender: TObject);
var
    QDel, QRes:  word;
begin

   if not (ReestrIncomeCash.IsEmpty) then
     Begin
        AppData.GetIncomeDetail.Active := False;
        AppData.GetIncomeDetail.CommandText := Format(SSQLGetIncomeDetail, [ReestrIncomeCash.FieldByName('UNICUM_NUM').AsInteger]);
        AppData.GetIncomeDetail.Active := True;

         if AppData.GetIncomeDetail.FieldByName('StatusDoc').AsString = '*' then
           begin
              MessageBox(Handle, PChar('Документ: ' + AppData.GetIncomeDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
              Exit;
           end
         else
           Begin
              QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
              if QDel=IDYES then
                begin
                  AppData.DeleteIncomeDocum.Active := False;
                  AppData.DeleteIncomeDocum.CommandText := FOrmat (SSQLD_DeleteIncomeDocum, [ReestrIncomeCash.FieldByName('UNICUM_NUM').AsInteger,
                                                                                           ReestrIncomeCash.FieldByName('NUMDOC').AsInteger]);
                  AppData.DeleteIncomeDocum.Active := True;
                  QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

                  ReestrIncomeCash.Active := False;
                  ReestrIncomeCash.Active := True;
                  BarCalc(TAB_IncomeCash);
                end
              else
                  Exit;
           end;
     end
   else
                Exit;
end;

procedure TMainForm.ReestrIncomeCashPopClick(Sender: TObject);
begin
    ReestrIncomeCash.DisableControls;
    Report.Template := SIncomeCashReestr;
    Report.Run;
    ReestrIncomeCash.First;
    ReestrIncomeCash.EnableControls;
end;

procedure TMainForm.DocIncomeCashPopClick(Sender: TObject);
begin
  AppData.Report.Template := SIncomeCashTotalDoc;
  AppData.Report.Run;
end;

procedure TMainForm.RefershReestrTimerTimer(Sender: TObject);
//var
//    StrNumDoc: string;
begin

  {  case Tabs.TabIndex of
      TAB_Income: Begin
                      if not CreateDocumentForm.Showing then
                      Begin
                        StrNumDoc := ReestrIncome.FieldByName('UNICUM_NUM').AsString;
                        ReestrIncome.Active := False;
                        ReestrIncome.Active := True;
                        ReestrIncome.Locate('UNICUM_NUM', StrNumDoc, [loCaseInsensitive, loPartialKey]);
                      end;
                  end;

      TAB_Expense: Begin
                     if not ExpenseForm.Showing then
                     begin
                       StrNumDoc := ReestrExpense.FieldByName('UNICUM_NUM').AsString;
                       ReestrExpense.Active := False;
                       ReestrExpense.Active := True;
                       ReestrExpense.Locate('UNICUM_NUM', StrNumDoc, [loCaseInsensitive, loPartialKey]);
                     end;
                   end;

      TAB_ExpenseZP: Begin
                        if not ExpenseForm.Showing then
                        begin
                          StrNumDoc := ReestrExpenseZp.FieldByName('UNICUM_NUM').AsString;
                          ReestrExpenseZp.Active := False;
                          ReestrExpenseZp.Active := True;
                          ReestrExpenseZp.Locate('UNICUM_NUM', StrNumDoc, [loCaseInsensitive, loPartialKey]);
                        end;
                     end;

      TAB_ExpenseOther: Begin
                          if not ExpenseForm.Showing then
                          begin
                            StrNumDoc := ReestrExpenseOther.FieldByName('UNICUM_NUM').AsString;
                            ReestrExpenseOther.Active := False;
                            ReestrExpenseOther.Active := True;
                            ReestrExpenseOther.Locate('UNICUM_NUM', StrNumDoc, [loCaseInsensitive, loPartialKey]);
                          end;
                        end;
                        
      TAB_ZpAup:      Begin
                        if not ZpAupForm.Showing then
                        Begin
                          StrNumDoc := ReestrZpAup.FieldByName('UNICUM_NUM').AsString;
                          ReestrZpAup.Active := False;
                          ReestrZpAup.Active := True;
                          ReestrZpAup.Locate('UNICUM_NUM', StrNumDoc, [loCaseInsensitive, loPartialKey]);
                        end;
                      end;

      TAB_TaxToZp:    Begin
                        if not TaxToZpForm.Showing then
                          Begin
                            StrNumDoc := ReestrTaxToZp.FieldByName('UNICUM_NUM').AsString;
                            ReestrTaxToZp.Active := False;
                            ReestrTaxToZp.Active := True;
                            ReestrTaxToZp.Locate('UNICUM_NUM', StrNumDoc, [loCaseInsensitive, loPartialKey]);
                          end;
                      end;

      TAB_IncomeCash: Begin
                        if not IncomeCashForm.Showing then
                        Begin
                          StrNumDoc := ReestrIncomeCash.FieldByName('UNICUM_NUM').AsString;
                          ReestrIncomeCash.Active := False;
                          ReestrIncomeCash.Active := True;
                          ReestrIncomeCash.Locate('UNICUM_NUM', StrNumDoc, [loCaseInsensitive, loPartialKey]);
                        end;  
                      end;

    end;     }
end;

procedure TMainForm.TaxToZpActionExecute(Sender: TObject);
var
    i: integer;
    TaxF: TTaxToZpForm;
begin
  TaxF := TTaxToZpForm.Create(MainForm);

   try
      TypeSaveTaxToZp := g_CreateDoc;
      TaxF.SettingTaxToZp(g_CreateDoc);

      AppData.Organiz.Active := False;
      AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
      AppData.Organiz.Active := True;

      AppData.Organiz.First;
      with TaxF.TaxZpStringGrid do
      Begin
        RowCount := AppData.Organiz.RecordCount+1;
        while not AppData.Organiz.Eof do
         Begin
          For i := 1 to RowCount-1 do
           Begin
              Cells[0,i] := IntToStr(i);
              Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
              Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
              Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
              AppData.Organiz.Next;
           end;
         end;
      end;

        with  TaxF.Bar do
        Begin
          Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
          Panels[1].Text := 'Сумма (нал): ' + '0';
          Panels[2].Text := 'Сумма (безнал): ' + '0';
        end;

      TaxF.ShowModal();
   finally
        FreeAndNil(TaxF);
   end;
end;

procedure TMainForm.CorrTaxToZpActionExecute(Sender: TObject);
var
    i, RecordCountTaxToZpDetail: integer;
    Sum_Not_Nal: real;
    TaxF: TTaxToZpForm;
begin
  TaxF := TTaxToZpForm.Create(MainForm);
  try
      if not (ReestrTaxToZp.IsEmpty) then
          Begin
            AppData.GetTaxToZpDetail.Active := False;
            AppData.GetTaxToZpDetail.Active := True;

            if AppData.GetTaxToZpDetail.FieldByName('StatusDoc').AsString = '*' then
              Begin
                MessageBox(Handle, PChar('Документ: ' + Appdata.GetTaxToZpDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                Exit;
              end
            else
            Begin
               AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
               if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.GetTaxToZpDetail.FieldByName('OTMETKA').AsString = '*') then
                  Begin
                    MessageBox(Handle, PChar('Документ № ' + AppData.GetTaxToZpDetail.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                    Exit;
                  end
               else
                  Begin
                      Sum_Not_Nal := 0;
                      TypeSaveTaxToZp := g_CorrDoc;
                      TaxF.SettingTaxToZp(g_CorrDoc);

                      AppData.AdoCmd.CommandText := Format(SSQLUpdateZpAupStatusCorrDoc, [Appdata.GetTaxToZpDetail.FieldByName('UNICUM_NUM').AsInteger, 1]);
                      AppData.AdoCmd.Execute;

                      RecordCountTaxToZpDetail := AppData.GetTaxToZpDetail.RecordCount + 1;
                      with  TaxF do
                      Begin
                         Caption := 'Корректировка документа (ЗП АУП)';
                         NumDocEdit.Text := ReestrTaxToZp.FieldByName('NUMDOC').AsString;
                         TaxZpPicker.Date := ReestrTaxToZp.FieldByName('DATE_P_POR').AsDateTime;
                         PrimechEdit.Text := ReestrTaxToZp.FieldByName('PRIMECH').AsString;
                         TaxZpStringGrid.RowCount := RecordCountTaxToZpDetail;
                      end;

                      AppData.GetTaxToZpDetail.First;
                      while not  AppData.GetTaxToZpDetail.Eof do
                      Begin
                       for i:= 1 to TaxF.TaxZpStringGrid.RowCount-1 do
                        Begin
                           with TaxF.TaxZpStringGrid do
                            begin
                              Cells[0,i] := IntToStr(AppData.GetTaxToZpDetail.FieldByName('NUM_PREDM').AsInteger);
                              Cells[1,i] := AppData.GetTaxToZpDetail.FieldByName('UID_SHOP').AsString;
                              Cells[2,i] := AppData.GetTaxToZpDetail.FieldByName('NAME').AsString;
                              Cells[3,i] := AppData.GetTaxToZpDetail.FieldByName('ADRESS').AsString;
                              Cells[4,i] := AppData.GetTaxToZpDetail.FieldByName('SUM_NOT_NAL').AsString;
                              Cells[5,i] := AppData.GetTaxToZpDetail.FieldByName('PRIMECH').AsString;

                              Sum_Not_Nal     := Sum_Not_Nal + AppData.GetTaxToZpDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                              AppData.GetTaxToZpDetail.Next;
                            end;
                        end;
                      end;

                      with  TaxF.Bar do
                      Begin
                        Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetTaxToZpDetail.RecordCount);
                        Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                      end;

                      TaxF.ShowModal();
               end;
           end;
          end
      else
                Exit;
  finally
        FreeAndNil(TaxF);
  end;
end;

procedure TMainForm.DeleteTaxToZpActionExecute(Sender: TObject);
var
    QDel, QRes: Word;
begin

  if not (ReestrTaxToZp.IsEmpty) then
     Begin
        AppData.GetTaxToZpDetail.Active := False;
        AppData.GetTaxToZpDetail.Active := True;

        if AppData.GetTaxToZpDetail.FieldByName('StatusDoc').AsString = '*' then
          Begin
            MessageBox(Handle, PChar('Документ: ' + Appdata.GetTaxToZpDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
            Exit;
          end
        else
          Begin
            QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
            if QDel=IDYES then
              begin
                AppData.DeleteZpAupDoc.Active := False;
                AppData.DeleteZpAupDoc.CommandText := Format(SSQLDeleteZpAupDocum, [ReestrTaxToZp.FieldByName('UNICUM_NUM').AsInteger]);
                AppData.DeleteZpAupDoc.Active := True;
                QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

                ReestrTaxToZp.Active := False;
                ReestrTaxToZp.Active := True;
                BarCalc(TAB_TaxToZp);
              end
            else
                Exit;
          end;
     end
  else
                Exit;
end;

procedure TMainForm.RefreshTaxToZpPopClick(Sender: TObject);
begin
    Screen.Cursor := crSQLWait;
    ReestrTaxToZp.Active := False;
    ReestrTaxToZp.Active := True;
    Screen.Cursor := crDefault;
end;

procedure TMainForm.PreviewTaxToZpActionExecute(Sender: TObject);
var
    i, RecordCountTaxToZpDetail: integer;
    Sum_Not_Nal: real;
    TaxF: TTaxToZpForm;
begin
  TaxF := TTaxToZpForm.Create(MainForm);

  try
       if not (ReestrTaxToZp.IsEmpty) then
          Begin
                  AppData.GetTaxToZpDetail.Active := False;
                  AppData.GetTaxToZpDetail.Active := True;

                    Sum_Not_Nal := 0;
                    TaxF.SettingTaxToZp(g_Preview);
                    TypeSaveTaxToZp := g_Preview;

                    RecordCountTaxToZpDetail := AppData.GetTaxToZpDetail.RecordCount + 1;
                    with  TaxF do
                    Begin
                       Caption := 'Корректировка документа (ЗП АУП)';
                       NumDocEdit.Text := ReestrTaxToZp.FieldByName('NUMDOC').AsString;
                       TaxZpPicker.Date := ReestrTaxToZp.FieldByName('DATE_P_POR').AsDateTime;
                       PrimechEdit.Text := ReestrTaxToZp.FieldByName('PRIMECH').AsString;
                       TaxZpStringGrid.RowCount := RecordCountTaxToZpDetail;
                    end;

                    AppData.GetTaxToZpDetail.First;
                    while not  AppData.GetTaxToZpDetail.Eof do
                    Begin
                     for i:= 1 to TaxF.TaxZpStringGrid.RowCount-1 do
                      Begin
                         with TaxF.TaxZpStringGrid do
                          begin
                            Cells[0,i] := IntToStr(AppData.GetTaxToZpDetail.FieldByName('NUM_PREDM').AsInteger);
                            Cells[1,i] := AppData.GetTaxToZpDetail.FieldByName('UID_SHOP').AsString;
                            Cells[2,i] := AppData.GetTaxToZpDetail.FieldByName('NAME').AsString;
                            Cells[3,i] := AppData.GetTaxToZpDetail.FieldByName('ADRESS').AsString;
                            Cells[4,i] := FormatFloat('#,###,###.###', AppData.GetTaxToZpDetail.FieldByName('SUM_NOT_NAL').AsFloat);
                            Cells[5,i] := AppData.GetTaxToZpDetail.FieldByName('PRIMECH').AsString;

                            Sum_Not_Nal     := Sum_Not_Nal + AppData.GetTaxToZpDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                            AppData.GetTaxToZpDetail.Next;
                          end;
                      end;
                    end;

                    with  TaxF.Bar do
                    Begin
                      Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetTaxToZpDetail.RecordCount);
                      Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                    end;

                  TaxF.ShowModal();
          end
       else
                  Exit;
  finally
        FreeAndNil(TaxF);
  end;
end;

procedure TMainForm.PrintTaxToZpReestrPopClick(Sender: TObject);
begin
    ReestrTaxToZp.DisableControls;
    Report.Template := STaxToZpReestr;
    Report.Run;

    ReestrTaxToZp.First;
    ReestrTaxToZp.EnableControls;
end;

procedure TMainForm.PrintTaxToZpDocPopClick(Sender: TObject);
begin
    fl_TypeReport := TAB_TaxToZp;
    AppData.GetTaxToZpDetail.Active := False;
    AppData.GetTaxToZpDetail.Active := True;

    AppData.Report.Template := STaxToZpTotalDoc;
    AppData.Report.Run;
end;

procedure TMainForm.IncomeDifference(BegDate, EndDate: TDateTime);
var
    s_Income_Difference_Nal_Curr, s_Income_Difference_Not_Nul_Curr: string;
    s_Income_Difference_Nal_Range, s_Income_Difference_Not_Nul_Range: string;

    f_Income_Difference_Nal_Curr, f_Income_Difference_Not_Nul_Curr: Double;
    f_Income_Difference_Nal_Range, f_Income_Difference_Not_Nul_Range: Double;

begin
   if Tabs.TabIndex in [TAB_Income, TAB_IncomeCash] then
      Begin
             AppData.IncomeDifference.Active := False;
             AppData.IncomeDifference.CommandText := Format(SSQLIncomeDifference, [FormatDateTime('yyyy-mm-dd', BegDate),
                                                                                   FormatDateTime('yyyy-mm-dd', EndDate)]);
             AppData.IncomeDifference.Active := True;

             f_Income_Difference_Nal_Curr := AppData.IncomeDifference.FieldByName('Income_Difference_Nal_Curr').AsFloat;
             f_Income_Difference_Not_Nul_Curr := AppData.IncomeDifference.FieldByName('Income_Difference_Not_Nal_Curr').AsFloat;
             f_Income_Difference_Nal_Range  := AppData.IncomeDifference.FieldByName('Income_Difference_Nal_Range').AsFloat;
             f_Income_Difference_Not_Nul_Range := AppData.IncomeDifference.FieldByName('Income_Difference_Not_Nal_Range').AsFloat;


            if  f_Income_Difference_Nal_Curr > 0 then
                  s_Income_Difference_Nal_Curr := ' Выр > Выр(Бух): '
            else
                 if f_Income_Difference_Nal_Curr < 0 then
                    begin
                      s_Income_Difference_Nal_Curr := ' Выр(Бух)> Выр: ';
                      f_Income_Difference_Nal_Curr := f_Income_Difference_Nal_Curr * (-1);
                    end
                  else
                       s_Income_Difference_Nal_Curr :=  EmptyStr;


            if f_Income_Difference_Not_Nul_Curr > 0 then
              s_Income_Difference_Not_Nul_Curr := ' Выр>Выр(Бух): '
            else
              if f_Income_Difference_Not_Nul_Curr < 0 then
                  begin
                     s_Income_Difference_Not_Nul_Curr := ' Выр(Бух) > Выр: ';
                     f_Income_Difference_Not_Nul_Curr := f_Income_Difference_Not_Nul_Curr * (-1);
                  end
               else
                     s_Income_Difference_Not_Nul_Curr := EmptyStr;


            if f_Income_Difference_Nal_Range > 0 then
                s_Income_Difference_Nal_Range := ' Выр>Выр(Бух): '
            else
                if f_Income_Difference_Nal_Range < 0 then
                    begin
                        s_Income_Difference_Nal_Range := ' Выр(Бух)>Выр ';
                        f_Income_Difference_Nal_Range := f_Income_Difference_Nal_Range * (-1);
                    end
                else
                         s_Income_Difference_Nal_Range := EmptyStr;


            if f_Income_Difference_Not_Nul_Range > 0 then
                s_Income_Difference_Not_Nul_Range := ' Выр>Выр(Бух): '
            else
                if f_Income_Difference_Not_Nul_Range < 0 then
                    Begin
                        s_Income_Difference_Not_Nul_Range := ' Выр(Бух)>Выр: ';
                        f_Income_Difference_Not_Nul_Range := f_Income_Difference_Not_Nul_Range * (-1);
                    end
                 else
                       s_Income_Difference_Not_Nul_Range := EmptyStr;

             Bar2.Panels[3].Text := 'День - ' + s_Income_Difference_Nal_Curr + ' | ' + 'Нал:  ' + FormatFloat('#,###,###.###', f_Income_Difference_Nal_Curr) + ' | ' + s_Income_Difference_Not_Nul_Curr +  ' | ' + 'Безнал: ' + FormatFloat('#,###,###.###', f_Income_Difference_Not_Nul_Curr)+ ' | ';
             Bar2.Panels[4].Text := 'Период - ' + s_Income_Difference_Nal_Range + ' | ' + 'Нал:  ' + FormatFloat('#,###,###.###', f_Income_Difference_Nal_Range) + ' | ' + s_Income_Difference_Not_Nul_Range + ' | ' +  'Безнал: ' + FormatFloat('#,###,###.###', f_Income_Difference_Not_Nul_Range)+ ' | ';
      end
    else
      Begin
             Bar2.Panels[3].Text := EmptyStr;
             Bar2.Panels[4].Text := EmptyStr;
      end;
end;

procedure TMainForm.Bar2DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
    if Panel = Bar2.Panels[3] then
      Begin
        Bar2.Canvas.Font.Color := clRed;
        Bar2.Canvas.TextOut(Rect.Left, Rect.Top, '');
      end;

end;

procedure TMainForm.RefreshPercentOfTerminalPopClick(Sender: TObject);
begin
    Screen.Cursor := crSQLWait;
    ReestrPercentOfTerminal.Active := False;
    ReestrPercentOfTerminal.Active := True;
    Screen.Cursor := crDefault;
end;

procedure TMainForm.PercentOfTerminalActionExecute(Sender: TObject);
var
    i: integer;
    PercentF: TPercentOfTerminalForm;
begin

  PercentF := TPercentOfTerminalForm.Create(MainForm);

   try
      TypeSavePercent := g_CreateDoc;
      PercentF.SettingPercentOfTerminal(g_CreateDoc);

      AppData.Organiz.Active := False;
      AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
      AppData.Organiz.Active := True;

      AppData.Organiz.First;
      with PercentF.PercentOfTerminalStringGrid do
      Begin
        RowCount := AppData.Organiz.RecordCount+1;
        while not AppData.Organiz.Eof do
         Begin
          For i := 1 to RowCount-1 do
           Begin
              Cells[0,i] := IntToStr(i);
              Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
              Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
              Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
              AppData.Organiz.Next;
           end;
         end;
      end;

        with  PercentF.Bar do
        Begin
            Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
            Panels[1].Text := 'Сумма (нал): ' + '0';
            Panels[2].Text := 'Сумма (безнал): ' + '0';
        end;

      PercentF.ShowModal();
   finally
      FreeAndNil(PercentF);
   end;
end;

procedure TMainForm.DeletePercentOfTerminalActionExecute(Sender: TObject);
var
    QDel, QRes: Word;
begin

  if not (ReestrPercentOfTerminal.IsEmpty) then
    Begin
        AppData.GetPercentOfTerminalDetail.Active := False;
        AppData.GetPercentOfTerminalDetail.Active := True;

      if AppData.GetPercentOfTerminalDetail.FieldByName('StatusDoc').AsString = '*' then
        Begin
          MessageBox(Handle, PChar('Документ: ' + Appdata.GetPercentOfTerminalDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
          Exit;
        end
      else
        Begin
          QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
          if QDel=IDYES then
            begin
              AppData.DeletePercentOfTerminalDoc.Active := False;
              AppData.DeletePercentOfTerminalDoc.CommandText := Format(SSQLDeletePercentOfTerminalDocum, [MainForm.ReestrPercentOfTerminal.FieldByName('UNICUM_NUM').AsInteger]);
              AppData.DeletePercentOfTerminalDoc.Active := True;
              QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

              ReestrPercentOfTerminal.Active := False;
              ReestrPercentOfTerminal.Active := True;
              BarCalc(TAB_PercentOfTerminal);
            end
          else
              Exit;
        end;
    end
  else
              Exit;
end;


procedure TMainForm.CorrPercentOfTerminalActionExecute(Sender: TObject);
var
    i, RecordCountPercentOfTerminalDetail: integer;
    Sum_Not_Nal: real;
    PercentF: TPercentOfTerminalForm;
begin
   PercentF := TPercentOfTerminalForm.Create(MainForm);

   try
       if not (ReestrPercentOfTerminal.IsEmpty) then
          Begin
              TypeSavePercent := g_CorrDoc;

              AppData.GetPercentOfTerminalDetail.Active := False;
              AppData.GetPercentOfTerminalDetail.Active := True;

            if AppData.GetPercentOfTerminalDetail.FieldByName('StatusDoc').AsString = '*' then
              Begin
                MessageBox(Handle, PChar('Документ: ' + Appdata.GetPercentOfTerminalDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                Exit;
              end
            else
            Begin
               if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.GetPercentOfTerminalDetail.FieldByName('OTMETKA').AsString = '*') then
                  Begin
                     MessageBox(Handle, PChar('Документ № ' + AppData.GetPercentOfTerminalDetail.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                      Exit;
                   end
               else
                   Begin
                      Sum_Not_Nal := 0;
                      TypeSavePercent := g_CorrDoc;
                      PercentOfTerminalForm.SettingPercentOfTerminal(g_CorrDoc);

                      AppData.AdoCmd.CommandText := Format(SSQLUpdatePercentOfTerminalStatusCorrDoc, [Appdata.GetPercentOfTerminalDetail.FieldByName('UNICUM_NUM').AsInteger, 1]);
                      AppData.AdoCmd.Execute;

                      RecordCountPercentOfTerminalDetail := AppData.GetPercentOfTerminalDetail.RecordCount + 1;
                      with  PercentOfTerminalForm do
                      Begin
                         Caption := 'Корректировка документа (Коммунальные услуги)';
                         NumDocEdit.Text := ReestrPercentOfTerminal.FieldByName('NUMDOC').AsString;
                         PercentOfTerminalPicker.Date := ReestrPercentOfTerminal.FieldByName('DATE_P_POR').AsDateTime;
                         PrimechEdit.Text := ReestrPercentOfTerminal.FieldByName('PRIMECH').AsString;
                         PercentOfTerminalStringGrid.RowCount := RecordCountPercentOfTerminalDetail;
                      end;

                      AppData.GetPercentOfTerminalDetail.First;
                      while not  AppData.GetPercentOfTerminalDetail.Eof do
                      Begin
                       for i:= 1 to PercentOfTerminalForm.PercentOfTerminalStringGrid.RowCount-1 do
                        Begin
                           with PercentOfTerminalForm.PercentOfTerminalStringGrid do
                            begin
                              Cells[0,i] := IntToStr(AppData.GetPercentOfTerminalDetail.FieldByName('NUM_PREDM').AsInteger);
                              Cells[1,i] := AppData.GetPercentOfTerminalDetail.FieldByName('UID_SHOP').AsString;
                              Cells[2,i] := AppData.GetPercentOfTerminalDetail.FieldByName('NAME').AsString;
                              Cells[3,i] := AppData.GetPercentOfTerminalDetail.FieldByName('ADRESS').AsString;
                              Cells[4,i] := AppData.GetPercentOfTerminalDetail.FieldByName('SUM_NOT_NAL').AsString;
                              Cells[5,i] := AppData.GetPercentOfTerminalDetail.FieldByName('PRIMECH').AsString;

                              Sum_Not_Nal     := Sum_Not_Nal + AppData.GetPercentOfTerminalDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                              AppData.GetPercentOfTerminalDetail.Next;
                            end;
                        end;
                      end;

                      with  PercentOfTerminalForm.Bar do
                      Begin
                        Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetPercentOfTerminalDetail.RecordCount);
                        Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                      end;

                      PercentOfTerminalForm.ShowModal();
                    end;
                 end;
         end
       else
                    Exit;
   finally
        FreeAndNil(PercentF);
   end;
end;

procedure TMainForm.ViewPercentOfTerminateActionExecute(Sender: TObject);
var
    i, RecordCountPercentOfTerminalDetail: integer;
    Sum_Not_Nal: real;
    PercentF: TPercentOfTerminalForm;
begin
    PercentF := TPercentOfTerminalForm.Create(MainForm);

    try
        if not (ReestrPercentOfTerminal.IsEmpty) then
            Begin
                AppData.GetPercentOfTerminalDetail.Active := False;
                AppData.GetPercentOfTerminalDetail.Active := True;

                Sum_Not_Nal := 0;
                PercentF.SettingPercentOfTerminal(g_Preview);
                TypeSavePercent := g_Preview;

                RecordCountPercentOfTerminalDetail := AppData.GetPercentOfTerminalDetail.RecordCount + 1;
                with  PercentF do
                Begin
                   Caption := 'Корректировка документа (ЗП АУП)';
                   NumDocEdit.Text := ReestrPercentOfTerminal.FieldByName('NUMDOC').AsString;
                   PercentOfTerminalPicker.Date := ReestrPercentOfTerminal.FieldByName('DATE_P_POR').AsDateTime;
                   PrimechEdit.Text := ReestrPercentOfTerminal.FieldByName('PRIMECH').AsString;
                   PercentOfTerminalStringGrid.RowCount := RecordCountPercentOfTerminalDetail;
                end;

                AppData.GetPercentOfTerminalDetail.First;
                while not  AppData.GetPercentOfTerminalDetail.Eof do
                Begin
                 for i:= 1 to PercentF.PercentOfTerminalStringGrid.RowCount-1 do
                  Begin
                     with PercentF.PercentOfTerminalStringGrid do
                      begin
                        Cells[0,i] := IntToStr(AppData.GetPercentOfTerminalDetail.FieldByName('NUM_PREDM').AsInteger);
                        Cells[1,i] := AppData.GetPercentOfTerminalDetail.FieldByName('UID_SHOP').AsString;
                        Cells[2,i] := AppData.GetPercentOfTerminalDetail.FieldByName('NAME').AsString;
                        Cells[3,i] := AppData.GetPercentOfTerminalDetail.FieldByName('ADRESS').AsString;
                        Cells[4,i] := FormatFloat('#,###,###.###', AppData.GetPercentOfTerminalDetail.FieldByName('SUM_NOT_NAL').AsFloat);
                        Cells[5,i] := AppData.GetPercentOfTerminalDetail.FieldByName('PRIMECH').AsString;

                        Sum_Not_Nal := Sum_Not_Nal + AppData.GetPercentOfTerminalDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                        AppData.GetPercentOfTerminalDetail.Next;
                      end;
                  end;
                end;

                with  PercentF.Bar do
                Begin
                  Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetPercentOfTerminalDetail.RecordCount);
                  Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                end;

              PercentF.ShowModal();
            end
        else
              Exit;
    finally
          FreeAndNil(PercentF);
    end;
 end;

procedure TMainForm.PrintReestrPercentOfTerminalPopClick(Sender: TObject);
begin
    ReestrPercentOfTerminal.DisableControls;
    Report.Template := SPercentOfTerminalReestr;
    Report.Run;
    ReestrPercentOfTerminal.EnableControls;
end;

procedure TMainForm.PrintDocPercentOfTerminalPopClick(Sender: TObject);
begin
    fl_TypeReport := TAB_PercentOfTerminal;
    AppData.Report.Template := SPercentOfTerminalTotalDoc;
    AppData.Report.Run;
end;

procedure TMainForm.BarRange;
begin
    Bar1.Panels[3].Text :=  BegDate + ' - ' + EndDate;
end;

procedure TMainForm.ReportMonthActionExecute(Sender: TObject);
begin
  fl_TypeReport := 0;
  ReportForm.SettingReportForm(fl_TypeReport);

  Case Tabs.TabIndex of
      TAB_Income:       ReportIncomeMonthActionExecute(Self);
      TAB_Expense:      ReportExpenseMonthActionExecute(Self);
      TAB_ExpenseZP:    ReportExpenseZpMonthActionExecute(Self);
      TAB_ExpenseOther: ReportExpenseOtherMonthActionExecute(Self);
      TAB_ZpAup:        ReportZpAupMonthActionExecute(Self);
      TAB_TaxToZp:      ReportTaxToZpMonthActionExecute(Self);
      TAB_PercentOfTerminal: ReportPercentOfTerminalMonthActionExecute(Self);
      TAB_ShipmentVostok: ReportShipmentVostokMonthActionExecute(Self);
      TAB_ShipmentOther:  ReportShipmentOtherMonthActionExecute(Self);
      TAB_Offs:           ReportOffsMonthActionExecute(Self);
      TAB_Return:         ReportReturnMonthActionExecute(Self);
      TAB_ENVD:           ReportEnvdMonthActionExecute(Self);
      TAB_PublicUtilities: ReportPublicUtilitiesMonthActionExecute(Self);
      TAB_IncomeCash:      ReportIncomeCashMonthActionExecute(Self);
  end;
end;

procedure TMainForm.ReportBtnClick(Sender: TObject);
begin
    PopupReportMenu.Popup(ReportBtn.ClientOrigin.X, ReportBtn.ClientOrigin.Y);
end;

procedure TMainForm.ReportDayActionExecute(Sender: TObject);
begin
  fl_TypeReport := 1;
  ReportForm.SettingReportForm(1);

  Case Tabs.TabIndex of
     TAB_Income:  ReportIncomeDayActionExecute(Self);
     TAB_Expense: ReportExpenseDayActionExecute(Self);
     TAB_ExpenseZP: ReportExpenseZpDayActionExecute(Self);
     TAB_ExpenseOther: ReportExpenseOtherDayActionExecute(Self);
     TAB_ZpAup: ReportZpAupDayActionExecute(Self);
     TAB_TaxToZp: ReportTaxToZpDayActionExecute(Self);
     TAB_PercentOfTerminal: ReportPercentOfTerminalDayActionExecute(Self);
     TAB_ShipmentVostok: ReportShipmentVostokDayActionExecute(Self);
     TAB_ShipmentOther:  ReportShipmentOtherDayActionExecute(Self);
     TAB_Offs:           ReportOffsDayActionExecute(Self);
     TAB_Return:         ReportReturnDayActionExecute(Self);
     TAB_ENVD:           ReportEnvdDayActionExecute(Self);
     TAB_PublicUtilities: ReportPublicUtilitiesDayActionExecute(Self);
     TAB_IncomeCash: ReportIncomeCashDayActionExecute (Self);
  end;
end;

procedure TMainForm.ReportIncomeMonthActionExecute(Sender: TObject);
begin
    TypeReport := TAB_Income;
    ReportForm.Caption := 'Отчет по магазинам -> Выручка -> За месяц';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportIncomeCashMonthActionExecute(Sender: TObject);
begin
    TypeReport := TAB_IncomeCash;
    ReportForm.Caption := 'Отчет по магазинам -> Выручка (Касса) - За месяц';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportExpenseMonthActionExecute(Sender: TObject);
begin
    TypeReport := TAB_Expense;
    ReportForm.Caption := 'Отчет по магазинам -> Расходы -> За месяц';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportExpenseZpMonthActionExecute(Sender: TObject);
begin
    TypeReport := TAB_ExpenseZP;
    ReportForm.Caption := 'Отчет по магазинам -> Расходы (ЗП) -> За месяц';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportExpenseOtherMonthActionExecute(Sender: TObject);
begin
     TypeReport := TAB_ExpenseOther;
     ReportForm.Caption := 'Отчет по магазинам -> Расходы (прочие) -> За месяц';
     ReportForm.ShowModal();
end;

procedure TMainForm.ReportZpAupMonthActionExecute(Sender: TObject);
begin
    TypeReport := TAB_ZpAup;
    ReportForm.Caption := 'Отчет по магазинам -> ЗП АУП -> За месяц';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportTaxToZpMonthActionExecute(Sender: TObject);
begin
      TypeReport := TAB_TaxToZp;
      ReportForm.Caption := 'Отчет по магазинам -> Налоги по ЗП -> За месяц';
      ReportForm.ShowModal();
end;

procedure TMainForm.ReportPercentOfTerminalMonthActionExecute(
  Sender: TObject);
begin
    TypeReport := TAB_PercentOfTerminal;
    ReportForm.Caption := 'Отчет по магазинам -> Процент по терминалу -> За месяц';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportIncomeDayActionExecute(Sender: TObject);
begin
    TypeReport := TAB_Income;
    ReportForm.Caption := 'Отчет по магазинам -> Выручка -> За дату';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportIncomeCashDayActionExecute(Sender: TObject);
begin
    TypeReport := TAB_IncomeCash;
    ReportForm.Caption := 'Отчет по магазинам -> Выручка (Касса) - За дату';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportExpenseDayActionExecute(Sender: TObject);
begin
    TypeReport := TAB_Expense;
    ReportForm.Caption := 'Отчет по магазинам -> Расходы -> За дату';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportExpenseZpDayActionExecute(Sender: TObject);
begin
    TypeReport := TAB_ExpenseZP;
    ReportForm.Caption := 'Отчет по магазинам -> Расходы (ЗП) -> За дату';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportExpenseOtherDayActionExecute(Sender: TObject);
begin
     TypeReport := TAB_ExpenseOther;
     ReportForm.Caption := 'Отчет по магазинам -> Расходы (прочие) -> За дату';
     ReportForm.ShowModal();
end;

procedure TMainForm.ReportZpAupDayActionExecute(Sender: TObject);
begin
    TypeReport := TAB_ZpAup;
    ReportForm.Caption := 'Отчет по магазинам -> ЗП АУП -> За дату';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportTaxToZpDayActionExecute(Sender: TObject);
begin
    TypeReport := TAB_TaxToZp;
    ReportForm.Caption := 'Отчет по магазинам -> Налоги по ЗП -> За дату';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportPercentOfTerminalDayActionExecute(
  Sender: TObject);
begin
    TypeReport := TAB_PercentOfTerminal;
    ReportForm.Caption := 'Отчет по магазинам -> Процент по терминалу -> За дату';
    ReportForm.ShowModal();
end;

procedure TMainForm.CheckOtmetkaIncomeActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin

  if not (ReestrIncome.IsEmpty) then
    Begin
        AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrIncome.FieldByName('UNICUM_NUM').AsInteger,
                                                                 1,
                                                                 TAB_Income]);
        AppData.AdoCmd.Execute;

        s_UnicumNum :=  ReestrIncome.FieldByName('UNICUM_NUM').AsString;
        ReestrIncome.Active := False;
        ReestrIncome.Active := True;
        ReestrIncome.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
        Exit;

end;

procedure TMainForm.UncheckOtmetkaIncomeActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrIncome.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrIncome.FieldByName('UNICUM_NUM').AsInteger,
                                                               0,
                                                               TAB_Income]);
      AppData.AdoCmd.Execute;

      s_UnicumNum :=  ReestrIncome.FieldByName('UNICUM_NUM').AsString;
      ReestrIncome.Active := False;
      ReestrIncome.Active := True;
      ReestrIncome.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
        Exit;
end;

procedure TMainForm.CheckOtmetkaExpenseActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrExpense.IsEmpty) then
     Begin
        AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrExpense.FieldByName('UNICUM_NUM').AsInteger,
                                                                 1,
                                                                 TAB_Expense]);
        AppData.AdoCmd.Execute;

        s_UnicumNum := ReestrExpense.FieldByName('UNICUM_NUM').AsString;
        ReestrExpense.Active := False;
        ReestrExpense.Active := True;
        ReestrExpense.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
     end
  else
        Exit;
end;

procedure TMainForm.UncheckOtmetkaExpenseActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrExpense.IsEmpty) then
     Begin
        AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrExpense.FieldByName('UNICUM_NUM').AsInteger,
                                                                 0,
                                                                 TAB_Expense]);
        AppData.AdoCmd.Execute;

        s_UnicumNum := ReestrExpense.FieldByName('UNICUM_NUM').AsString;
        ReestrExpense.Active := False;
        ReestrExpense.Active := True;
        ReestrExpense.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
     end
  else
        Exit;
end;

procedure TMainForm.CheckOtmetkaExpenseZPActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrExpenseZp.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrExpenseZp.FieldByName('UNICUM_NUM').AsInteger,
                                                               1,
                                                               TAB_ExpenseZP]);
      AppData.AdoCmd.Execute;

      s_UnicumNum := ReestrExpenseZp.FieldByName('UNICUM_NUM').AsString;
      ReestrExpenseZp.Active := False;
      ReestrExpenseZp.Active := True;
      ReestrExpenseZp.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
        Exit;

end;

procedure TMainForm.UncheckOtmetkaExpenseZpActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrExpenseZp.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrExpenseZp.FieldByName('UNICUM_NUM').AsInteger,
                                                               0,
                                                               TAB_ExpenseZP]);
      AppData.AdoCmd.Execute;

      s_UnicumNum := ReestrExpenseZp.FieldByName('UNICUM_NUM').AsString;
      ReestrExpenseZp.Active := False;
      ReestrExpenseZp.Active := True;
      ReestrExpenseZp.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
        Exit;
end;

procedure TMainForm.CheckOtmetkaExpenseOtherActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrExpenseOther.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrExpenseOther.FieldByName('UNICUM_NUM').AsInteger,
                                                               1,
                                                               TAB_ExpenseOther]);
      AppData.AdoCmd.Execute;

      s_UnicumNum := ReestrExpenseOther.FieldByName('UNICUM_NUM').AsString;
      ReestrExpenseOther.Active := False;
      ReestrExpenseOther.Active := True;
      ReestrExpenseOther.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
        Exit;
end;

procedure TMainForm.UncheckOtmetkaExpenseOtherActionExecute(
  Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrExpenseOther.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrExpenseOther.FieldByName('UNICUM_NUM').AsInteger,
                                                               0,
                                                               TAB_ExpenseOther]);
      AppData.AdoCmd.Execute;

      s_UnicumNum := ReestrExpenseOther.FieldByName('UNICUM_NUM').AsString;
      ReestrExpenseOther.Active := False;
      ReestrExpenseOther.Active := True;
      ReestrExpenseOther.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
        Exit;
end;

procedure TMainForm.CheckOtmetkaZpAupActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrZpAup.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrZpAup.FieldByName('UNICUM_NUM').AsInteger,
                                                               1,
                                                               TAB_ZpAup]);
      AppData.AdoCmd.Execute;

      s_UnicumNum := ReestrZpAup.FieldByName('UNICUM_NUM').AsString;
      ReestrZpAup.Active := False;
      ReestrZpAup.Active := True;
      ReestrZpAup.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
      Exit;
end;

procedure TMainForm.UncheckOtmetkaZpAupActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrZpAup.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrZpAup.FieldByName('UNICUM_NUM').AsInteger,
                                                               0,
                                                               TAB_ZpAup]);
      AppData.AdoCmd.Execute;

      s_UnicumNum := ReestrZpAup.FieldByName('UNICUM_NUM').AsString;
      ReestrZpAup.Active := False;
      ReestrZpAup.Active := True;
      ReestrZpAup.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
      Exit;
end;

procedure TMainForm.CheckOtmetkaTaxToZpActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrTaxToZp.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrTaxToZp.FieldByName('UNICUM_NUM').AsInteger,
                                                               1,
                                                               TAB_TaxToZp]);
      AppData.AdoCmd.Execute;

      s_UnicumNum := ReestrTaxToZp.FieldByName('UNICUM_NUM').AsString;
      ReestrTaxToZp.Active := False;
      ReestrTaxToZp.Active := True;
      ReestrTaxToZp.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
      Exit;
end;

procedure TMainForm.UncheckOtmetkaTaxToZpActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrTaxToZp.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrTaxToZp.FieldByName('UNICUM_NUM').AsInteger,
                                                               0,
                                                               TAB_TaxToZp]);
      AppData.AdoCmd.Execute;

      s_UnicumNum := ReestrTaxToZp.FieldByName('UNICUM_NUM').AsString;
      ReestrTaxToZp.Active := False;
      ReestrTaxToZp.Active := True;
      ReestrTaxToZp.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
      Exit;
end;

procedure TMainForm.CheckPercentOfTerminalActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrPercentOfTerminal.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrPercentOfTerminal.FieldByName('UNICUM_NUM').AsInteger,
                                                               1,
                                                               TAB_PercentOfTerminal]);
      AppData.AdoCmd.Execute;

      s_UnicumNum := ReestrPercentOfTerminal.FieldByName('UNICUM_NUM').AsString;
      ReestrPercentOfTerminal.Active := False;
      ReestrPercentOfTerminal.Active := True;
      ReestrPercentOfTerminal.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
      Exit;
end;

procedure TMainForm.UncheckPercentOfTerminalActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrPercentOfTerminal.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrPercentOfTerminal.FieldByName('UNICUM_NUM').AsInteger,
                                                               0,
                                                               TAB_PercentOfTerminal]);
      AppData.AdoCmd.Execute;
      
      s_UnicumNum := ReestrPercentOfTerminal.FieldByName('UNICUM_NUM').AsString;
      ReestrPercentOfTerminal.Active := False;
      ReestrPercentOfTerminal.Active := True;
      ReestrPercentOfTerminal.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
      Exit;
end;

procedure TMainForm.CheckOtmetkaIncomeCashActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrIncomeCash.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrIncomeCash.FieldByName('UNICUM_NUM').AsInteger,
                                                               1,
                                                               TAB_Income]);
      AppData.AdoCmd.Execute;

        s_UnicumNum := ReestrIncomeCash.FieldByName('UNICUM_NUM').AsString;
        ReestrIncomeCash.Active := False;
        ReestrIncomeCash.Active := True;
        ReestrIncomeCash.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
      Exit;

end;

procedure TMainForm.UncheckOtmetkaIncomeCashActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrIncomeCash.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrIncomeCash.FieldByName('UNICUM_NUM').AsInteger,
                                                               0,
                                                               TAB_Income]);
      AppData.AdoCmd.Execute;

        s_UnicumNum := ReestrIncomeCash.FieldByName('UNICUM_NUM').AsString;
        ReestrIncomeCash.Active := False;
        ReestrIncomeCash.Active := True;
        ReestrIncomeCash.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
      end
    else
        Exit;

end;



procedure TMainForm.IncomeGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ReestrIncome.FieldByName('OTMETKA').AsString = '*' then
    begin
      with IncomeGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.ExpenseGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ReestrExpense.FieldByName('OTMETKA').AsString = '*' then
    begin
      with ExpenseGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.ExpenseZPGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ReestrExpenseZP.FieldByName('OTMETKA').AsString = '*' then
    begin
      with ExpenseZPGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.ExpenseOtherGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ReestrExpenseOther.FieldByName('OTMETKA').AsString = '*' then
    begin
      with ExpenseOtherGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.ZpAupGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ReestrZpAup.FieldByName('OTMETKA').AsString = '*' then
    begin
      with ZpAupGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left, Rect.Top, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.TaxToZpGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If (ReestrTaxToZp.FieldByName('OTMETKA').AsString = '*') then//and (Column.Index = 12) then
    Begin
       with TaxToZpGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.PercentOfTerminalGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ReestrPercentOfTerminal.FieldByName('OTMETKA').AsString = '*' then
    begin
      with PercentOfTerminalGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.IncomeCashGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ReestrIncomeCash.FieldByName('OTMETKA').AsString = '*' then
    begin
      with IncomeCashGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.PopupIncomeMenuPopup(Sender: TObject);
var
   Loc_AccessMode: integer;
begin
   AppData.UserAccess.Locate('MODULE_UID', IntToStr(Tabs.TabIndex), [loCaseInsensitive, loPartialKey]);
   Loc_AccessMode := AppData.UserAccess.FieldByName('Mode').AsInteger;
    If (ReestrIncome.FieldByName('OTMETKA').AsString = '*') or (Loc_AccessMode = 1) then
       CheckOtmetkaIncomePop.Enabled := False
    else
       CheckOtmetkaIncomePop.Enabled := True;


    {AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
    if AppData.Users.FieldByName('Admin').AsString <> '*' then
        Begin
          If ReestrIncome.FieldByName('OTMETKA').AsString <> '*' then
            UncheckOtmetkaIncomePop.Enabled := False
          else
            UncheckOtmetkaIncomePop.Enabled := True;
        end
    else
            UncheckOtmetkaIncomePop.Enabled := False;  }

end;

procedure TMainForm.PopupExpenseMenuPopup(Sender: TObject);
var
   Loc_AccessMode: integer;
begin
   AppData.UserAccess.Locate('MODULE_UID', IntToStr(Tabs.TabIndex), [loCaseInsensitive, loPartialKey]);
   Loc_AccessMode := AppData.UserAccess.FieldByName('Mode').AsInteger;
    If (ReestrExpense.FieldByName('OTMETKA').AsString = '*') or (Loc_AccessMode = 1) then
          CheckOtmetkaExpensePop.Enabled := False
    else
          CheckOtmetkaExpensePop.Enabled := True;

 {   AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
    if (AppData.Users.FieldByName('Admin').AsString <> '*') then
        Begin
          if ReestrExpense.FieldByName('OTMETKA').AsString <> '*' then
              UncheckOtmetkaExpensePop.Enabled := False
          else
              UncheckOtmetkaExpensePop.Enabled := True;
        end;   }
end;

procedure TMainForm.PopupExpenseOtherMenuPopup(Sender: TObject);
var
   Loc_AccessMode: integer;
begin
   AppData.UserAccess.Locate('MODULE_UID', IntToStr(Tabs.TabIndex), [loCaseInsensitive, loPartialKey]);
   Loc_AccessMode := AppData.UserAccess.FieldByName('Mode').AsInteger;
    If (ReestrExpenseOther.FieldByName('OTMETKA').AsString = '*') or (Loc_AccessMode = 1) then
        CheckOtmetkaExpenseOtherPop.Enabled := False
    else
        CheckOtmetkaExpenseOtherPop.Enabled := True;

  {  if ReestrExpenseOther.FieldByName('OTMETKA').AsString <> '*' then
        UncheckOtmetkaExpenseOtherPop.Enabled := False
    else
        UncheckOtmetkaExpenseOtherPop.Enabled := True;   }
end;

procedure TMainForm.PopupExpenseZPMenuPopup(Sender: TObject);
var
   Loc_AccessMode: integer;
begin
   AppData.UserAccess.Locate('MODULE_UID', IntToStr(Tabs.TabIndex), [loCaseInsensitive, loPartialKey]);
   Loc_AccessMode := AppData.UserAccess.FieldByName('Mode').AsInteger;
    If (ReestrExpenseZP.FieldByName('OTMETKA').AsString = '*') or (Loc_AccessMode = 1) then
        CheckOtmetkaExpenseZPAction.Enabled := False
    else
        CheckOtmetkaExpenseZPAction.Enabled := True;

   { If ReestrExpenseZP.FieldByName('OTMETKA').AsString <> '*' then
        UncheckOtmetkaExpenseZpPop.Enabled := False
    else
        UncheckOtmetkaExpenseZpPop.Enabled := True;  }
end;

procedure TMainForm.PopupZpAupMenuPopup(Sender: TObject);
var
   Loc_AccessMode: integer;
begin
   AppData.UserAccess.Locate('MODULE_UID', IntToStr(Tabs.TabIndex), [loCaseInsensitive, loPartialKey]);
   Loc_AccessMode := AppData.UserAccess.FieldByName('Mode').AsInteger;
    If (ReestrZpAup.FieldByName('OTMETKA').AsString = '*') or (Loc_AccessMode = 1) then
        CheckOtmetkaZpAupPop.Enabled := False
    else
        CheckOtmetkaZpAupPop.Enabled := True;

   { If ReestrZpAup.FieldByName('OTMETKA').AsString <> '*' then
        UncheckOtmetkaZpAupPop.Enabled := False
    else
        UncheckOtmetkaZpAupPop.Enabled := True;  }
end;

procedure TMainForm.PopupTaxToZpMenuPopup(Sender: TObject);
var
   Loc_AccessMode: integer;
begin
   AppData.UserAccess.Locate('MODULE_UID', IntToStr(Tabs.TabIndex), [loCaseInsensitive, loPartialKey]);
   Loc_AccessMode := AppData.UserAccess.FieldByName('Mode').AsInteger;
  if (ReestrTaxToZp.FieldByName('OTMETKA').AsString = '*') or (Loc_AccessMode = 1)  then
      CheckOtmetkaTaxToZpPop.Enabled := False
  else
      CheckOtmetkaTaxToZpPop.Enabled := True;

  { if ReestrTaxToZp.FieldByName('OTMETKA').AsString <> '*'  then
       UncheckOtmetkaTaxToZpPop.Enabled := False
   else
       UncheckOtmetkaTaxToZpPop.Enabled := True;  }
end;

procedure TMainForm.PopupPercentOfTerminalMenuPopup(Sender: TObject);
var
   Loc_AccessMode: integer;
begin
   AppData.UserAccess.Locate('MODULE_UID', IntToStr(Tabs.TabIndex), [loCaseInsensitive, loPartialKey]);
   Loc_AccessMode := AppData.UserAccess.FieldByName('Mode').AsInteger;
   if (ReestrPercentOfTerminal.FieldByName('OTMETKA').AsString = '*') or (Loc_AccessMode = 1)  then
       CheckPercentOfTerminalPop.Enabled := False
   else
         CheckPercentOfTerminalPop.Enabled := True;

 {  if ReestrPercentOfTerminal.FieldByName('OTMETKA').AsString <> '*'  then
       UncheckPercentOfTerminalPop.Enabled := False
   else
       UncheckPercentOfTerminalPop.Enabled := True; }
end;

procedure TMainForm.PopupIncomeCashMenuPopup(Sender: TObject);
begin
   if ReestrIncomeCash.FieldByName('OTMETKA').AsString = '*'  then
        CheckOtmetkaIncomeCashPop.Enabled := False
   else
        CheckOtmetkaIncomeCashPop.Enabled := True;

  { if ReestrIncomeCash.FieldByName('OTMETKA').AsString <> '*'  then
       UncheckOtmetkaIncomeCashPop.Enabled := False
   else
       UncheckOtmetkaIncomeCashPop.Enabled := True; }
end;

procedure TMainForm.TotalSummMenuClick(Sender: TObject);
begin
    KassaSumForm.ShowModal();
end;

procedure TMainForm.CallRangeForm(TabIndex: integer);
begin
          

            Case TabIndex of
                TAB_Income:            RangeTabIndex := TAB_Income;
                TAB_Expense:           RangeTabIndex := TAB_Expense;
                TAB_ExpenseZP:         RangeTabIndex := TAB_ExpenseZP;
                TAB_ExpenseOther:      RangeTabIndex := TAB_ExpenseOther;
                TAB_TaxToZp:           RangeTabIndex := TAB_TaxToZp;
                TAB_ZpAup:             RangeTabIndex := TAB_ZpAup;
                TAB_PercentOfTerminal: RangeTabIndex := TAB_PercentOfTerminal;
                TAB_ShipmentVostok:    RangeTabIndex := TAB_ShipmentVostok;
                TAB_ShipmentOther:     RangeTabIndex := TAB_ShipmentOther;
                TAB_Offs:              RangeTabIndex := TAB_Offs;
                TAB_PublicUtilities:   RangeTabIndex := TAB_PublicUtilities;
                TAB_Return:            RangeTabIndex := TAB_Return;
                TAB_ENVD:              RangeTabIndex := TAB_ENVD;
                TAB_IncomeCash:        RangeTabIndex := TAB_IncomeCash;
            end;
    with RangeForm do
        Begin
            BeginPicker.Date := Now();
            EndPicker.Date   := BeginPicker.Date+1;
            ShowModal();
        end;
end;

procedure TMainForm.ViewBtnClick(Sender: TObject);
begin
  case Tabs.TabIndex of
      TAB_Income: ViewIncomeDocActionExecute(Self);
      TAB_Expense: ViewExpenceDocActionExecute(Self);
      TAB_ExpenseZP: ViewExpenceZpDocActionExecute(Self);
      TAB_ExpenseOther: ViewExpenceOtherDocActionExecute(Self);
      TAB_ZpAup: ViewZpAupActionExecute(Self);
      TAB_TaxToZp: PreviewTaxToZpActionExecute(Self);
      TAB_PercentOfTerminal: ViewPercentOfTerminateActionExecute(Self);
      TAB_ShipmentVostok: ViewShipmentVostokActionExecute(Self);
      TAB_ShipmentOther:  ViewShipmentOtherActionExecute(Self);
      TAB_Offs: ViewOffsActionExecute(Self);
      TAB_PublicUtilities: ViewPublicUtilitiesActionExecute(Self);
      TAB_Return: ViewReturnActionExecute(Self);
      TAB_ENVD: ViewEnvdActionExecute(Self);
      TAB_IncomeCash: ViewIncomeCashActionExecute(Self);
  end;
end;

procedure TMainForm.CorrBtnClick(Sender: TObject);
begin
   case Tabs.TabIndex of
      TAB_Income: CorrIncomActionExecute(Self);
      TAB_Expense: CorrExpenceActionExecute(Self);
      TAB_ExpenseZP: CorrExpenseZpActionExecute(Self);
      TAB_ExpenseOther: CorrExpenseOtherActionExecute(Self);
      TAB_ZpAup: CorrZpAupActionExecute(Self);
      TAB_TaxToZp: CorrTaxToZpActionExecute(Self);
      TAB_PercentOfTerminal: CorrPercentOfTerminalActionExecute(Self);
      TAB_ShipmentVostok: CorrShipmentVostokActionExecute(Self);
      TAB_ShipmentOther:  CorrShipmentOtherActionExecute(Self);
      TAB_Offs: CorrOffsActionExecute(Self);
      TAB_PublicUtilities: CorrPublicUtilitiesActionExecute(Self);
      TAB_Return: CorrReturnActionExecute(Self);
      TAB_ENVD: CorrEnvdActionExecute(Self);
      TAB_IncomeCash: CorrIncomeCashActionExecute(Self);
   end;
end;

procedure TMainForm.DeleteBtnClick(Sender: TObject);
begin
   case Tabs.TabIndex of
      TAB_Income: DeleteDocumnActionExecute(Self);
      TAB_Expense: DeleteExpenceDocumActionExecute(Self);
      TAB_ExpenseZP: DeleteExpenceZpDocActionExecute(Self);
      TAB_ExpenseOther: DeleteExpenceOtherDocActionExecute(Self);
      TAB_ZpAup: DeleteZpAupDocActionExecute(Self);
      TAB_TaxToZp: DeleteTaxToZpActionExecute(Self);
      TAB_PercentOfTerminal: DeletePercentOfTerminalActionExecute(Self);
      TAB_ShipmentVostok: DeleteShipmentVostokDocActionExecute(Self);
      TAB_ShipmentOther:  DeleteShipmentOtherDocActionExecute(Self);
      TAB_Offs: DeleteOffsActionExecute(Self);
      TAB_PublicUtilities: DeletePublicUtilitiesDocActionExecute(Self);
      TAB_Return: DeleteReturnActionExecute(Self);
      TAB_ENVD: DeleteEnvdActionExecute(Self);
      TAB_IncomeCash: DeleteIncomeCashDocActionExecute(Self);
   end;
end;

procedure TMainForm.CheckOtmetkaBtnClick(Sender: TObject);
begin
   case Tabs.TabIndex of
      TAB_Income: CheckOtmetkaIncomeActionExecute(Self);
      TAB_Expense: CheckOtmetkaExpenseActionExecute(Self);
      TAB_ExpenseZP: CheckOtmetkaExpenseZPActionExecute(Self);
      TAB_ExpenseOther: CheckOtmetkaExpenseOtherActionExecute(Self);
      TAB_ZpAup: CheckOtmetkaZpAupActionExecute(Self);
      TAB_TaxToZp: CheckOtmetkaTaxToZpActionExecute(Self);
      TAB_PercentOfTerminal: CheckPercentOfTerminalActionExecute(Self);
      TAB_ShipmentVostok: CheckOtmetkaShipmentVostokActionExecute(Self);
      TAB_ShipmentOther:  CheckOtmetkaShipmentOtherActionExecute(Self);
      TAB_Offs: CheckOtmetkaOffsActionExecute(Self);
      TAB_PublicUtilities: CheckOtmetkaPublicUtilitiesActionExecute(Self);
      TAB_Return: CheckOtmetkaReturnActionExecute(Self);
      TAB_ENVD: CheckOtmetkaEnvdActionExecute(Self);
      TAB_IncomeCash: CheckOtmetkaIncomeCashActionExecute(Self);
   end;
end;

procedure TMainForm.RefreshBtnClick(Sender: TObject);
begin
   case Tabs.TabIndex of
      TAB_Income: RefreshIncomePopClick(Self);
      TAB_Expense: RefreshExpensePopClick(Self);
      TAB_ExpenseZP: RefreshExpenseZpPopClick(Self);
      TAB_ExpenseOther: RefreshExpenseOtherPopClick(Self);
      TAB_ZpAup: RefreshZpAupPopClick(Self);
      TAB_TaxToZp: RefreshTaxToZpPopClick(Self);
      TAB_PercentOfTerminal: RefreshPercentOfTerminalPopClick(Self);
      TAB_ShipmentVostok: RefreshShipmentVostokPopClick(Self);
      TAB_ShipmentOther:  ;
      TAB_Offs: RefreshShipmentVostokPopClick(Self);
      TAB_PublicUtilities: RefreshPublicUtilitiesPopClick(Self);
      TAB_Return: RefreshReturnPopClick(Self);
      TAB_ENVD: RefreshEnvdPopClick(Self);      
      TAB_IncomeCash: RefreshCashPopClick(Self);
   end;
end;

procedure TMainForm.RefreshCashPopClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  ReestrIncomeCash.Active := False;
  ReestrIncomeCash.Active := True;
  Screen.Cursor := crDefault;
end;

procedure TMainForm.SearchBtnClick(Sender: TObject);
var
    SearchF: TSearchForm;
begin
  SearchF := TSearchForm.Create(MainForm);

    try
      with SearchF do
          Begin
              TypeNacl := 0;
              Tabs.TabIndex := 0;
              CheckShowPanel := False;

              AddModulsInCombo();
              UsePicker();
              BegPicker.Date := Now();
              EndPicker.Date := BegPicker.Date + 1;

              GetShop();
              ShowModal();
          end;
      finally
          FreeAndNil(SearchF);
    end;
end;

procedure TMainForm.SuppliersMenuClick(Sender: TObject);
var
    SupplierF: TSupplierForm;
begin
    SupplierF := TSupplierForm.Create(MainForm);

    Try
      with SupplierF do
        Begin
          SuppliersSet.Active := False;
          SuppliersSet.CommandText := Format(SSQLGetSupplier, [Byte(ReserveCheck.Checked)]);
          SuppliersSet.Active := True;
          ShowModal();
        end;
    finally
          FreeAndNil(SupplierForm);
    end;
end;

procedure TMainForm.ShipmentVostokActionExecute(Sender: TObject);
var
    i: integer;
    ShipmentF: TShipmentForm;
begin
    ShipmentF := TShipmentForm.Create(MainForm);

    try
        TypeSaveShipment := g_CreateDoc;
        TypeShipment := TAB_ShipmentVostok;
        ShipmentF.SettingShipmentForm(TAB_ShipmentVostok, g_CreateDoc);

        AppData.Organiz.Active := False;
        AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
        AppData.Organiz.Active := True;

        AppData.Organiz.First;
         with ShipmentF.ShipmentStringGrid do
          Begin
            RowCount := AppData.Organiz.RecordCount+1;
            while not AppData.Organiz.Eof do
             Begin
              For i := 1 to RowCount-1 do
               Begin
                  Cells[0,i] := IntToStr(i);
                  Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
                  Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
                  Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
                  AppData.Organiz.Next;
               end;
             end;
          end;

      with  ShipmentF.Bar do
        Begin
          Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
          Panels[1].Text := 'Сумма (нал): ' + '0';
          Panels[2].Text := 'Сумма (безнал): ' + '0';
        end;
      ShipmentF.ShowModal();

    finally
        FreeAndNil(ShipmentF);
    end;
end;

procedure TMainForm.CorrShipmentVostokActionExecute(Sender: TObject);
var
    i, RecordCountShipmentDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
    ShipmentF: TShipmentForm;
begin
   ShipmentF := TShipmentForm.Create(MainForm);

   try
        if not (ReestrShipmentVostok.IsEmpty) then
           Begin
              AppData.ShipmentDetail.Active := False;
              AppData.ShipmentDetail.CommandText := Format(SSQLGetShipmentDetail, [ReestrShipmentVostok.FieldByName('UNICUM_NUM').AsInteger]);
              AppData.ShipmentDetail.Active := True;

             if AppData.ShipmentDetail.FieldByName('StatusDoc').AsString = '*' then
                Begin
                  MessageBox(Handle, PChar('Документ: ' + AppData.ShipmentDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                  Exit;
                end
             else
              Begin
                  AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                  if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.ShipmentDetail.FieldByName('OTMETKA').AsString = '*') then
                      Begin
                        MessageBox(Handle, PChar('Документ № ' + AppData.ShipmentDetail.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                        Exit;
                      end
                  else
                      Begin

                        TypeSaveShipment := g_CorrDoc;
                        TypeShipment := TAB_ShipmentVostok;
                        ShipmentF.SettingShipmentForm(TAB_ShipmentVostok, g_CorrDoc);

                        Sum_Nal     := 0;
                        Sum_Not_Nal := 0;

                        with AppData do
                          Begin
                             AdoCmd.CommandText := Format(SSQLUpdateShipmentStatusCorrDoc, [ReestrShipmentVostok.FieldByName('UNICUM_NUM').AsInteger, 1]);
                             AdoCmd.Execute;
                          end;

                        RecordCountShipmentDetail := AppData.ShipmentDetail.RecordCount+1;

                        with ShipmentF do
                          Begin
                             NumDocEdit.Text := ReestrShipmentVostok.FieldByName('NUMDOC').AsString;
                             ShipmentPicker.Date := DateOf(ReestrShipmentVostok.FieldByName('DATE_P_POR').AsDateTime);
                             PrimechEdit.Text := ReestrShipmentVostok.FieldByName('PRIMECH').AsString;
                             ShipmentStringGrid.RowCount := RecordCountShipmentDetail;
                          end;

                        AppData.ShipmentDetail.First;
                        while not  AppData.ShipmentDetail.Eof do
                        Begin
                          for i:= 1 to ShipmentF.ShipmentStringGrid.RowCount-1 do
                          Begin
                           with ShipmentF.ShipmentStringGrid  do
                            begin
                              Cells[0,i] := IntToStr(AppData.ShipmentDetail.FieldByName('NUM_PREDM').AsInteger);
                              Cells[1,i] := AppData.ShipmentDetail.FieldByName('UID_SHOP').AsString;
                              Cells[2,i] := AppData.ShipmentDetail.FieldByName('NAME').AsString;
                              Cells[3,i] := AppData.ShipmentDetail.FieldByName('ADRESS').AsString;
                              Cells[4,i] := AppData.ShipmentDetail.FieldByName('SUM_NAL').AsString;
                              Cells[5,i] := AppData.ShipmentDetail.FieldByName('SUM_NOT_NAL').AsString;
                              Cells[6,i] := AppData.ShipmentDetail.FieldByName('SUPPLIER').AsString;
                              Cells[7,i] := AppData.ShipmentDetail.FieldByName('PRIMECH').AsString;
                              Sum_Nal     := Sum_Nal + AppData.ShipmentDetail.FieldByName('SUM_NAL').AsFloat;
                              Sum_Not_Nal :=  Sum_Not_Nal + AppData.ShipmentDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                              AppData.ShipmentDetail.Next;
                            end;
                          end;
                        end;

                        with  ShipmentF.Bar do
                        Begin
                          Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.ShipmentDetail.RecordCount);
                          Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                          Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                        end;
                  ShipmentF.ShowModal();
              end;
            end;
           end
        else
                        Exit;
   finally
        FreeAndNil(ShipmentF);
   end;
end;

procedure TMainForm.ViewShipmentVostokActionExecute(Sender: TObject);
var
    i, RecordCountShipmentDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
begin

  if not (ReestrShipmentVostok.IsEmpty) then
      Begin
          AppData.ShipmentDetail.Active := False;
          AppData.ShipmentDetail.CommandText := Format(SSQLGetShipmentDetail, [ReestrShipmentVostok.FieldByName('UNICUM_NUM').AsInteger]);
          AppData.ShipmentDetail.Active := True;

              TypeSaveShipment := g_Preview;
              ShipmentForm.SettingShipmentForm(TAB_ShipmentVostok, g_Preview);

              Sum_Nal     := 0;
              Sum_Not_Nal := 0;

              RecordCountShipmentDetail := AppData.ShipmentDetail.RecordCount+1;

              with ShipmentForm do
                Begin
                   NumDocEdit.Text := ReestrShipmentVostok.FieldByName('NUMDOC').AsString;
                   ShipmentPicker.Date := DateOf(ReestrShipmentVostok.FieldByName('DATE_P_POR').AsDateTime);
                   PrimechEdit.Text := ReestrShipmentVostok.FieldByName('PRIMECH').AsString;
                   ShipmentStringGrid.RowCount := RecordCountShipmentDetail;
                end;

              AppData.ShipmentDetail.First;
              while not  AppData.ShipmentDetail.Eof do
              Begin
                for i:= 1 to ShipmentForm.ShipmentStringGrid.RowCount-1 do
                Begin
                 with ShipmentForm.ShipmentStringGrid  do
                  begin
                    Cells[0,i] := IntToStr(AppData.ShipmentDetail.FieldByName('NUM_PREDM').AsInteger);
                    Cells[1,i] := AppData.ShipmentDetail.FieldByName('UID_SHOP').AsString;
                    Cells[2,i] := AppData.ShipmentDetail.FieldByName('NAME').AsString;
                    Cells[3,i] := AppData.ShipmentDetail.FieldByName('ADRESS').AsString;
                    Cells[4,i] := FormatFloat('#,###,###.###', AppData.ShipmentDetail.FieldByName('SUM_NAL').AsFloat);
                    Cells[5,i] := FormatFloat('#,###,###.###', AppData.ShipmentDetail.FieldByName('SUM_NOT_NAL').AsFloat);
                    Cells[6,i] := AppData.ShipmentDetail.FieldByName('SUPPLIER').AsString;
                    Cells[7,i] := AppData.ShipmentDetail.FieldByName('PRIMECH').AsString;
                    Sum_Nal     := Sum_Nal + AppData.ShipmentDetail.FieldByName('SUM_NAL').AsFloat;
                    Sum_Not_Nal :=  Sum_Not_Nal + AppData.ShipmentDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                    AppData.ShipmentDetail.Next;
                  end;
                end;
              end;

              with  ShipmentForm.Bar do
              Begin
                Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.ShipmentDetail.RecordCount);
                Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
              end;
            ShipmentForm.ShowModal();
      end
  else
            Exit;
end;

procedure TMainForm.ShipmentOtherActionExecute(Sender: TObject);
var
    i: integer;
begin
  TypeSaveShipment := g_CreateDoc;
  TypeShipment := TAB_ShipmentOther;
  ShipmentForm.SettingShipmentForm(TAB_ShipmentOther, g_CreateDoc);

  AppData.Organiz.Active := False;
  AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
  AppData.Organiz.Active := True;

    AppData.Organiz.First;
     with ShipmentForm.ShipmentStringGrid do
      Begin
        RowCount := AppData.Organiz.RecordCount+1;
        while not AppData.Organiz.Eof do
         Begin
          For i := 1 to RowCount-1 do
           Begin
              Cells[0,i] := IntToStr(i);
              Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
              Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
              Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
              AppData.Organiz.Next;
           end;
         end;
      end;

  with  ShipmentForm.Bar do
    Begin
      Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
      Panels[1].Text := 'Сумма (нал): ' + '0';
      Panels[2].Text := 'Сумма (безнал): ' + '0';
    end;          

  ShipmentForm.ShowModal();
end;

procedure TMainForm.CorrShipmentOtherActionExecute(Sender: TObject);
var                                        
    i, RecordCountShipmentDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
begin
    if not (ReestrShipmentOther.IsEmpty) then
        Begin
              AppData.ShipmentDetail.Active := False;
              AppData.ShipmentDetail.CommandText := Format(SSQLGetShipmentDetail, [ReestrShipmentOther.FieldByName('UNICUM_NUM').AsInteger]);
              AppData.ShipmentDetail.Active := True;

             if AppData.ShipmentDetail.FieldByName('StatusDoc').AsString = '*' then
                Begin
                  MessageBox(Handle, PChar('Документ: ' + AppData.ShipmentDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                  Exit;
                end
             else
              Begin
                  AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                  if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.ShipmentDetail.FieldByName('OTMETKA').AsString = '*') then
                      Begin
                        MessageBox(Handle, PChar('Документ № ' + AppData.ShipmentDetail.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                        Exit;
                      end
                  else
                      Begin
                        TypeSaveShipment := g_CorrDoc;
                        TypeShipment := TAB_ShipmentOther;
                        ShipmentForm.SettingShipmentForm(TAB_ShipmentOther, g_CorrDoc);

                        Sum_Nal     := 0;
                        Sum_Not_Nal := 0;

                        with AppData do
                          Begin
                             AdoCmd.CommandText := Format(SSQLUpdateShipmentStatusCorrDoc, [ReestrShipmentOther.FieldByName('UNICUM_NUM').AsInteger, 1]);
                             AdoCmd.Execute;
                          end;

                        RecordCountShipmentDetail := AppData.ShipmentDetail.RecordCount+1;

                        with ShipmentForm do
                          Begin
                             NumDocEdit.Text := ReestrShipmentOther.FieldByName('NUMDOC').AsString;
                             ShipmentPicker.Date := DateOf(ReestrShipmentOther.FieldByName('DATE_P_POR').AsDateTime);
                             PrimechEdit.Text := ReestrShipmentOther.FieldByName('PRIMECH').AsString;
                             ShipmentStringGrid.RowCount := RecordCountShipmentDetail;
                          end;

                        AppData.ShipmentDetail.First;
                        while not  AppData.ShipmentDetail.Eof do
                        Begin
                          for i:= 1 to ShipmentForm.ShipmentStringGrid.RowCount-1 do
                          Begin
                           with ShipmentForm.ShipmentStringGrid  do
                            begin
                              Cells[0,i] := IntToStr(AppData.ShipmentDetail.FieldByName('NUM_PREDM').AsInteger);
                              Cells[1,i] := AppData.ShipmentDetail.FieldByName('UID_SHOP').AsString;
                              Cells[2,i] := AppData.ShipmentDetail.FieldByName('NAME').AsString;
                              Cells[3,i] := AppData.ShipmentDetail.FieldByName('ADRESS').AsString;
                              Cells[4,i] := AppData.ShipmentDetail.FieldByName('SUM_NAL').AsString;
                              Cells[5,i] := AppData.ShipmentDetail.FieldByName('SUM_NOT_NAL').AsString;
                              Cells[6,i] := AppData.ShipmentDetail.FieldByName('SUPPLIER').AsString;
                              Cells[7,i] := AppData.ShipmentDetail.FieldByName('PRIMECH').AsString;
                              Sum_Nal     := Sum_Nal + AppData.ShipmentDetail.FieldByName('SUM_NAL').AsFloat;
                              Sum_Not_Nal :=  Sum_Not_Nal + AppData.ShipmentDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                              AppData.ShipmentDetail.Next;
                            end;
                          end;
                        end;

                        with  ShipmentForm.Bar do
                        Begin
                          Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.ShipmentDetail.RecordCount);
                          Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                          Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                        end;
                  ShipmentForm.ShowModal();
              end;
            end;
        end
    else
                  Exit;
end;


procedure TMainForm.ViewShipmentOtherActionExecute(Sender: TObject);
var
    i, RecordCountShipmentDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
begin

   if not (ReestrShipmentOther.IsEmpty) then
      Begin
          AppData.ShipmentDetail.Active := False;
          AppData.ShipmentDetail.CommandText := Format(SSQLGetShipmentDetail, [ReestrShipmentOther.FieldByName('UNICUM_NUM').AsInteger]);
          AppData.ShipmentDetail.Active := True;

              TypeSaveShipment := g_Preview;
              ShipmentForm.SettingShipmentForm(TAB_ShipmentOther, g_Preview);
              Sum_Nal     := 0;
              Sum_Not_Nal := 0;

              RecordCountShipmentDetail := AppData.ShipmentDetail.RecordCount+1;

              with ShipmentForm do
                Begin
                   NumDocEdit.Text := ReestrShipmentOther.FieldByName('NUMDOC').AsString;
                   ShipmentPicker.Date := DateOf(ReestrShipmentOther.FieldByName('DATE_P_POR').AsDateTime);
                   PrimechEdit.Text := ReestrShipmentOther.FieldByName('PRIMECH').AsString;
                   ShipmentStringGrid.RowCount := RecordCountShipmentDetail;
                end;

              AppData.ShipmentDetail.First;
              while not  AppData.ShipmentDetail.Eof do
              Begin
                for i:= 1 to ShipmentForm.ShipmentStringGrid.RowCount-1 do
                Begin
                 with ShipmentForm.ShipmentStringGrid  do
                  begin
                    Cells[0,i] := IntToStr(AppData.ShipmentDetail.FieldByName('NUM_PREDM').AsInteger);
                    Cells[1,i] := AppData.ShipmentDetail.FieldByName('UID_SHOP').AsString;
                    Cells[2,i] := AppData.ShipmentDetail.FieldByName('NAME').AsString;
                    Cells[3,i] := AppData.ShipmentDetail.FieldByName('ADRESS').AsString;
                    Cells[4,i] := FormatFloat('#,###,###.###', AppData.ShipmentDetail.FieldByName('SUM_NAL').AsFloat);
                    Cells[5,i] := FormatFloat('#,###,###.###', AppData.ShipmentDetail.FieldByName('SUM_NOT_NAL').AsFloat);
                    Cells[6,i] := AppData.ShipmentDetail.FieldByName('SUPPLIER').AsString;
                    Cells[7,i] := AppData.ShipmentDetail.FieldByName('PRIMECH').AsString;
                    Sum_Nal     := Sum_Nal + AppData.ShipmentDetail.FieldByName('SUM_NAL').AsFloat;
                    Sum_Not_Nal :=  Sum_Not_Nal + AppData.ShipmentDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                    AppData.ShipmentDetail.Next;
                  end;
                end;
              end;

              with  ShipmentForm.Bar do
              Begin
                Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.ShipmentDetail.RecordCount);
                Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
              end;
            ShipmentForm.ShowModal();
      end
   else
            Exit;
end;

procedure TMainForm.RefreshShipmentVostokPopClick(Sender: TObject);
begin
    Screen.Cursor := crSQLWait;
    ReestrShipmentVostok.Active := False;
    ReestrShipmentVostok.Active := True;
    Screen.Cursor := crDefault;
end;

procedure TMainForm.DeleteShipmentVostokDocActionExecute(Sender: TObject);
var
    QDel, QRes:  word;
begin

  if not (ReestrShipmentVostok.IsEmpty) then
     Begin
        AppData.ShipmentDetail.Active := False;
        AppData.ShipmentDetail.CommandText := Format(SSQLGetShipmentDetail, [ReestrShipmentVostok.FieldByName('UNICUM_NUM').AsInteger]);
        AppData.ShipmentDetail.Active := True;

       if AppData.ShipmentDetail.FieldByName('StatusDoc').AsString = '*' then
          Begin
            MessageBox(Handle, PChar('Документ: ' + AppData.ShipmentDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
            Exit;
          end
       else
          Begin
            QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
            if QDel=IDYES then
              begin
                AppData.DeleteShipment.Active := False;
                AppData.DeleteShipment.CommandText := Format(SSQLDeleteShipmentDocum, [ReestrShipmentVostok.FieldByName('UNICUM_NUM').AsInteger]);
                AppData.DeleteShipment.Active := True;
                QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

                ReestrShipmentVostok.Active := False;
                ReestrShipmentVostok.Active := True;
                BarCalc(TAB_ShipmentVostok);
          end
          else
                Exit;
          end;
       end
     else
                Exit;

end;

procedure TMainForm.DeleteShipmentOtherDocActionExecute(Sender: TObject);
var
    QDel, QRes:  word;
begin

 if not (ReestrShipmentOther.IsEmpty) then
   Begin
        AppData.ShipmentDetail.Active := False;
        AppData.ShipmentDetail.CommandText := Format(SSQLGetShipmentDetail, [ReestrShipmentOther.FieldByName('UNICUM_NUM').AsInteger]);
        AppData.ShipmentDetail.Active := True;

       if AppData.ShipmentDetail.FieldByName('StatusDoc').AsString = '*' then
          Begin
            MessageBox(Handle, PChar('Документ: ' + AppData.ShipmentDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
            Exit;
          end
       else
          Begin
            QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
            if QDel=IDYES then
              begin
                AppData.DeleteShipment.Active := False;
                AppData.DeleteShipment.CommandText := Format(SSQLDeleteShipmentDocum, [ReestrShipmentOther.FieldByName('UNICUM_NUM').AsInteger]);
                AppData.DeleteShipment.Active := True;
                QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

                ReestrShipmentOther.Active := False;
                ReestrShipmentOther.Active := True;
                BarCalc(TAB_ShipmentOther);
          end
          else
                Exit;
          end;
   end
 else
                Exit;
end;

procedure TMainForm.CheckOtmetkaShipmentVostokActionExecute(
  Sender: TObject);
var
    s_UnicumNum: string;
begin
if  not (ReestrShipmentVostok.IsEmpty) then
   Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrShipmentVostok.FieldByName('UNICUM_NUM').AsInteger,
                                                               1,
                                                               TAB_ShipmentVostok]);
      AppData.AdoCmd.Execute;

      s_UnicumNum := ReestrShipmentVostok.FieldByName('UNICUM_NUM').AsString;
      ReestrShipmentVostok.Active := False;
      ReestrShipmentVostok.Active := True;
      ReestrShipmentVostok.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
   end
else
      Exit;
end;

procedure TMainForm.CheckOtmetkaShipmentOtherActionExecute(
  Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrShipmentOther.IsEmpty) then
     Begin
        AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrShipmentOther.FieldByName('UNICUM_NUM').AsInteger,
                                                                 1,
                                                                 TAB_ShipmentOther]);
        AppData.AdoCmd.Execute;

        s_UnicumNum := ReestrShipmentOther.FieldByName('UNICUM_NUM').AsString;
        ReestrShipmentOther.Active := False;
        ReestrShipmentOther.Active := True;
        ReestrShipmentOther.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
     end
  else
        Exit;
end;

procedure TMainForm.UncheckOtmetkaShipmentVostokActionExecute(
  Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrShipmentVostok.IsEmpty) then
     Begin
        AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrShipmentVostok.FieldByName('UNICUM_NUM').AsInteger,
                                                                 0,
                                                                 TAB_ShipmentVostok]);
        AppData.AdoCmd.Execute;

        s_UnicumNum := ReestrShipmentVostok.FieldByName('UNICUM_NUM').AsString;
        ReestrShipmentVostok.Active := False;
        ReestrShipmentVostok.Active := True;
        ReestrShipmentVostok.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
     end
  else
      Exit;
end;

procedure TMainForm.UnheckOtmetkaShipmentOtherActionExecute(
  Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrShipmentOther.IsEmpty) then
     Begin
        AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrShipmentOther.FieldByName('UNICUM_NUM').AsInteger,
                                                                 0,
                                                                 TAB_ShipmentOther]);
        AppData.AdoCmd.Execute;

        s_UnicumNum := ReestrShipmentOther.FieldByName('UNICUM_NUM').AsString;
        ReestrShipmentOther.Active := False;
        ReestrShipmentOther.Active := True;
        ReestrShipmentOther.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
     end
  else
        Exit;
end;

procedure TMainForm.ShipmentVostokGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ReestrShipmentVostok.FieldByName('OTMETKA').AsString = '*' then
    begin
      with ShipmentVostokGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.ShipmentOtherGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Begin
  if ReestrShipmentOther.FieldByName('OTMETKA').AsString = '*' then
    begin
      with ShipmentOtherGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.PopupShipmentVostokMenuPopup(Sender: TObject);
var
   Loc_AccessMode: integer;
begin
   AppData.UserAccess.Locate('MODULE_UID', IntToStr(Tabs.TabIndex), [loCaseInsensitive, loPartialKey]);
   Loc_AccessMode := AppData.UserAccess.FieldByName('Mode').AsInteger;
   if (ReestrShipmentVostok.FieldByName('OTMETKA').AsString = '*') or (Loc_AccessMode = 1) then
        CheckOtmetkaShipmentVostokPopup.Enabled := False
   else
        CheckOtmetkaShipmentVostokPopup.Enabled := True;
end;

procedure TMainForm.PopupShipmentOtherMenuPopup(Sender: TObject);
var
   Loc_AccessMode: integer;
begin
   AppData.UserAccess.Locate('MODULE_UID', IntToStr(Tabs.TabIndex), [loCaseInsensitive, loPartialKey]);
   Loc_AccessMode := AppData.UserAccess.FieldByName('Mode').AsInteger;
   if (ReestrShipmentOther.FieldByName('OTMETKA').AsString = '*') or (Loc_AccessMode = 1) then
        CheckOtmetkaShipmentOtherPopup.Enabled := False
   else
        CheckOtmetkaShipmentOtherPopup.Enabled := True;
end;

procedure TMainForm.PrintReestrShipmentVostokPopClick(Sender: TObject);
begin
    ReestrShipmentVostok.DisableControls;
    Report.Template := SShipmentVostokReestr;
    Report.Run;

    ReestrShipmentVostok.First;
    ReestrShipmentVostok.EnableControls;
end;

procedure TMainForm.PrintReestrShipmentOtherPopClick(Sender: TObject);
begin
    ReestrShipmentOther.DisableControls;
    Report.Template := SShipmentOtherReestr;
    Report.Run;

    ReestrShipmentOther.First;
    ReestrShipmentOther.EnableControls;
end;

procedure TMainForm.PrintDocShipmentVostokPopClick(Sender: TObject);
begin
    fl_TypeReport := TAB_ShipmentVostok;
    AppData.ShipmentDetail.Active := False;
    AppData.ShipmentDetail.CommandText := Format(SSQLGetShipmentDetail, [ReestrShipmentVostok.FieldByName('UNICUM_NUM').AsInteger]);
    AppData.Report.Template := SShipmentVostokTotalDoc;
    AppData.Report.Run;
end;

procedure TMainForm.PrintDocShipmentOtherPopClick(Sender: TObject);
begin
    fl_TypeReport := TAB_ShipmentOther;
    AppData.ShipmentDetail.Active := False;
    AppData.ShipmentDetail.CommandText := Format(SSQLGetShipmentDetail, [ReestrShipmentOther.FieldByName('UNICUM_NUM').AsInteger]);
    AppData.Report.Template := SShipmentOtherTotalDoc;
    AppData.Report.Run;
end;

procedure TMainForm.ReportShipmentVostokMonthActionExecute(
  Sender: TObject);
begin
    TypeReport := TAB_ShipmentVostok;
    ReportForm.Caption := 'Отчет по магазинам -> Отгрузка(Восток) -> За месяц';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportShipmentOtherMonthActionExecute(Sender: TObject);
begin
    TypeReport := TAB_ShipmentOther;
    ReportForm.Caption := 'Отчет по магазинам -> Отгрузка(Прочие) -> За месяц';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportShipmentVostokDayActionExecute(Sender: TObject);
begin
    TypeReport := TAB_ShipmentVostok;
    ReportForm.Caption := 'Отчет по магазинам -> Расходы -> За дату';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportShipmentOtherDayActionExecute(Sender: TObject);
begin
    TypeReport := TAB_ShipmentOther;
    ReportForm.Caption := 'Отчет по магазинам -> Расходы -> За дату';
    ReportForm.ShowModal();
end;

procedure TMainForm.OffsActionExecute(Sender: TObject);
var
    i: integer;
begin
      AppData.Organiz.Active := False;
      AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
      AppData.Organiz.Active := True;

      TypeOffs := TAB_Offs;
      TypeSaveOffs  := g_CreateDoc;
      OffsForm.SettingOffsForm(TAB_Offs, g_CreateDoc);

    AppData.Organiz.First;
     with OffsForm.OffsStringGrid do
      Begin
        RowCount := AppData.Organiz.RecordCount+1;
        while not AppData.Organiz.Eof do
         Begin
          For i := 1 to RowCount-1 do
           Begin
              Cells[0,i] := IntToStr(i);
              Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
              Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
              Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
              AppData.Organiz.Next;
           end;
         end;
      end;

      with  OffsForm.Bar do
        Begin
          Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
          Panels[1].Text := 'Сумма (нал): ' + '0';
          Panels[2].Text := 'Сумма (безнал): ' + '0';
        end;

      OffsForm.ShowModal();
end;

procedure TMainForm.CorrOffsActionExecute(Sender: TObject);
var
    i, RecordCountDetail: integer;
    Sum_Nal: real;
    Year, Month, Day, Mes: Word;
begin

   if not (ReestrOffs.IsEmpty) then
     Begin
        Sum_Nal := 0;
        TypeOffs := TAB_Offs;
        TypeSaveOffs  := g_CorrDoc;
        OffsForm.SettingOffsForm(TAB_Offs, g_CorrDoc);

        AppData.GetDetailOffs.Active := False;
        AppData.GetDetailOffs.CommandText := Format(SSQLGetOffsDetail, [MainForm.ReestrOffs.FieldByName('UNICUM_NUM').AsInteger]);
        AppData.GetDetailOffs.Active := True;


        if AppData.GetDetailOffs.FieldByName('StatusDoc').AsString = '*' then
           begin
              MessageBox(Handle, PChar('Документ: ' + AppData.GetDetailOffs.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
              Exit;
           end
        else
          Begin
            AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
              if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.GetDetailOffs.FieldByName('OTMETKA').AsString = '*') then
                  Begin
                    MessageBox(Handle, PChar('Документ № ' + AppData.GetDetailOffs.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                    Exit;
                  end
              else
                  Begin
                    with AppData do
                     Begin
                        AdoCmd.CommandText := Format(SSQLUpdateOffsStatusCorrDoc, [GetDetailOffs.FieldByName('UNICUM_NUM').AsInteger, 1]);
                        AdoCmd.Execute;
                      end;

                    RecordCountDetail := AppData.GetDetailOffs.RecordCount+1;
                    DecodeDate(ReestrOffs.FieldByName('DATE_P_POR').AsDateTime, Year, Month, Day);

                     with OffsForm do
                      Begin
                        OffsStringGrid.RowCount := RecordCountDetail;
                        NumDocEdit.Text := ReestrOffs.FieldByName('NUMDOC').AsString;
                        MonthCombo.ItemIndex := Month;
                        YearSpinEdit.Value := Year;
                        DatePicker.Date := AppData.GetDetailOffs.FieldByName('DATE_P_POR').AsDateTime;
                        PrimechEdit.Text :=  ReestrOffs.FieldByName('PRIMECH').AsString;
                      end;

                      AppData.GetDetailOffs.First;
                      while not  AppData.GetDetailOffs.Eof do
                      Begin
                        for i:= 1 to OffsForm.OffsStringGrid.RowCount -1 do
                        Begin
                          OffsForm.OffsStringGrid.Cells[0,i] := IntToStr(i);
                          OffsForm.OffsStringGrid.Cells[0,0] := '№';
                         with OffsForm.OffsStringGrid  do
                          begin
                           // Cells[0,i] := AppData.GetDetailOffs.FieldByName('NUM_PREDM').AsString;
                            Cells[1,i] := AppData.GetDetailOffs.FieldByName('UID_SHOP').AsString;
                            Cells[2,i] := AppData.GetDetailOffs.FieldByName('NAME').AsString;
                            Cells[3,i] := AppData.GetDetailOffs.FieldByName('ADRESS').AsString;
                            Cells[4,i] := AppData.GetDetailOffs.FieldByName('SUM_NAL').AsString;
                            Cells[5,i] := AppData.GetDetailOffs.FieldByName('PRIMECH').AsString;
                            Sum_Nal    := Sum_Nal + AppData.GetDetailOffs.FieldByName('SUM_NAL').AsFloat;
                            AppData.GetDetailOffs.Next;
                          end;
                        end;
                      end;

                      with  OffsForm.Bar do
                      Begin
                        Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetDetailOffs.RecordCount);
                        Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                        Panels[2].Text := EmptyStr;
                      end;
                    OffsForm.ShowModal();
                    end;
                  end;
     end
   else
                        Exit;
end;

procedure TMainForm.ViewOffsActionExecute(Sender: TObject);
var
    i, RecordCountDetail: integer;
    Sum_Nal: real;
    Year, Month, Day, Mes: Word;
begin

    if not (ReestrOffs.IsEmpty) then
        Begin
          Sum_Nal := 0;

          TypeOffs := TAB_Offs;
          TypeSaveOffs  := g_Preview;
          OffsForm.SettingOffsForm(TAB_Offs, g_Preview);

          AppData.GetDetailOffs.Active := False;
          AppData.GetDetailOffs.CommandText := Format( SSQLGetOffsDetail, [MainForm.ReestrOffs.FieldByName('UNICUM_NUM').AsInteger]);
          AppData.GetDetailOffs.Active := True;


                  RecordCountDetail := AppData.GetDetailOffs.RecordCount+1;
                  DecodeDate(ReestrOffs.FieldByName('DATE_P_POR').AsDateTime, Year, Month, Day);

                   with OffsForm do
                    Begin
                      OffsStringGrid.RowCount := RecordCountDetail;
                      NumDocEdit.Text := ReestrOffs.FieldByName('NUMDOC').AsString;
                      MonthCombo.ItemIndex := Month;
                      DatePicker.Date := AppData.GetDetailOffs.FieldByName('DATE_P_POR').AsDateTime;
                      YearSpinEdit.Value := Year;
                      PrimechEdit.Text :=  ReestrOffs.FieldByName('PRIMECH').AsString;
                    end;

                    AppData.GetDetailOffs.First;
                    while not  AppData.GetDetailOffs.Eof do
                    Begin
                      for i:= 1 to OffsForm.OffsStringGrid.RowCount -1 do
                      Begin
                        OffsForm.OffsStringGrid.Cells[0,i] := IntToStr(i);
                        OffsForm.OffsStringGrid.Cells[0,0] := '№';
                         with OffsForm.OffsStringGrid  do
                          begin
                           // Cells[0,i] := AppData.GetDetailOffs.FieldByName('NUM_PREDM').AsString;
                            Cells[1,i] := AppData.GetDetailOffs.FieldByName('UID_SHOP').AsString;
                            Cells[2,i] := AppData.GetDetailOffs.FieldByName('NAME').AsString;
                            Cells[3,i] := AppData.GetDetailOffs.FieldByName('ADRESS').AsString;
                            Cells[4,i] := FormatFloat('#,###,###.###', AppData.GetDetailOffs.FieldByName('SUM_NAL').AsFloat);
                            Cells[5,i] := AppData.GetDetailOffs.FieldByName('PRIMECH').AsString;
                            Sum_Nal     := Sum_Nal + AppData.GetDetailOffs.FieldByName('SUM_NAL').AsFloat;
                            AppData.GetDetailOffs.Next;
                          end;
                      end;
                    end;

                    with  OffsForm.Bar do
                    Begin
                      Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetDetailOffs.RecordCount);
                      Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                      Panels[2].Text := EmptyStr;
                    end;
              OffsForm.ShowModal();
        end
    else
              Exit;
end;

procedure TMainForm.DeleteOffsActionExecute(Sender: TObject);
var
    QDel, QRes:  word;
begin

  if not (ReestrOffs.IsEmpty) then
     Begin
        AppData.GetDetailOffs.Active := False;
        AppData.GetDetailOffs.CommandText := Format(SSQLGetShipmentDetail, [ReestrOffs.FieldByName('UNICUM_NUM').AsInteger]);
        AppData.GetDetailOffs.Active := True;

       if AppData.GetDetailOffs.FieldByName('StatusDoc').AsString = '*' then
          Begin
            MessageBox(Handle, PChar('Документ: ' + AppData.GetDetailOffs.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
            Exit;
          end
       else
          Begin
            QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
            if QDel=IDYES then
              begin
                AppData.DeleteOffsDoc.Active := False;
                AppData.DeleteOffsDoc.CommandText := Format(SSQLDeleteOffsDocum, [ReestrOffs.FieldByName('UNICUM_NUM').AsInteger]);
                AppData.DeleteOffsDoc.Active := True;
                QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

                ReestrOffs.Active := False;
                ReestrOffs.Active := True;
                BarCalc(TAB_Offs);
          end
          else
                Exit;
          end;
     end
  else
                Exit;
end;

procedure TMainForm.PrintReestrOffsPopClick(Sender: TObject);
begin
    ReestrOffs.DisableControls;
    Report.Template := SOffsReestr;
    Report.Run;
    ReestrOffs.First;
    ReestrOffs.EnableControls;
end;

procedure TMainForm.CheckOtmetkaOffsActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrOffs.IsEmpty) then
     Begin
        AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrOffs.FieldByName('UNICUM_NUM').AsInteger,
                                                                 1,
                                                                 TAB_Offs]);
        AppData.AdoCmd.Execute;

        s_UnicumNum :=  ReestrOffs.FieldByName('UNICUM_NUM').AsString;
        ReestrOffs.Active := False;
        ReestrOffs.Active := True;
        ReestrOffs.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
        Exit;
end;

procedure TMainForm.UnCheckOtmetkaOffsActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrOffs.IsEmpty) then
     Begin
        AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrOffs.FieldByName('UNICUM_NUM').AsInteger,
                                                                 0,
                                                                 TAB_Offs]);
        AppData.AdoCmd.Execute;

        s_UnicumNum :=  ReestrOffs.FieldByName('UNICUM_NUM').AsString;
        ReestrOffs.Active := False;
        ReestrOffs.Active := True;
        ReestrOffs.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
     end
  else
        Exit;
end;

procedure TMainForm.PopupOffsMenuPopup(Sender: TObject);
var
   Loc_AccessMode: integer;
begin
   AppData.UserAccess.Locate('MODULE_UID', IntToStr(Tabs.TabIndex), [loCaseInsensitive, loPartialKey]);
   Loc_AccessMode := AppData.UserAccess.FieldByName('Mode').AsInteger;
   if (ReestrOffs.FieldByName('OTMETKA').AsString = '*') or (Loc_AccessMode = 1) then
        CheckOtmetkaOffsPop.Enabled := False
   else
        CheckOtmetkaOffsPop.Enabled := True;
end;

procedure TMainForm.OffsGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ReestrOffs.FieldByName('OTMETKA').AsString = '*' then
    begin
      with OffsGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.PrintDocOffsPopClick(Sender: TObject);
begin
    fl_TypeReport := TAB_Offs;
    AppData.GetDetailOffs.Active := False;
    AppData.GetDetailOffs.CommandText := Format(SSQLGetOffsDetail, [ReestrOffs.FieldByName('UNICUM_NUM').AsInteger]);
    AppData.Report.Template := SOffsTotalDoc;
    AppData.Report.Run;
end;

procedure TMainForm.ReturnActionExecute(Sender: TObject);
var
    i: integer;
    ReturnF: TOffsForm;
begin
   ReturnF := TOffsForm.Create(MainForm);
   try
      AppData.Organiz.Active := False;
      AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
      AppData.Organiz.Active := True;

      TypeOffs := TAB_Return;
      TypeSaveOffs  := g_CreateDoc;
      ReturnF.SettingOffsForm(TAB_Return, g_CreateDoc);

     AppData.Organiz.First;
     with ReturnF.OffsStringGrid do
      Begin
        RowCount := AppData.Organiz.RecordCount+1;
        while not AppData.Organiz.Eof do
         Begin
          For i := 1 to RowCount-1 do
           Begin
              Cells[0,i] := IntToStr(i);
              Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
              Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
              Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
              AppData.Organiz.Next;
           end;
         end;
      end;

      with  ReturnF.Bar do
        Begin
          Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
          Panels[1].Text := 'Сумма (нал): ' + '0';
          Panels[2].Text := 'Сумма (безнал): ' + '0';
        end;

      ReturnF.ShowModal();
   finally
      FreeAndNil(ReturnF);
   end;
end;

procedure TMainForm.CorrReturnActionExecute(Sender: TObject);
var
    i, RecordCountDetail: integer;
    Sum_Nal: real;
    Year, Month, Day, Mes: Word;
    ReturnF: TOffsForm;
begin
  ReturnF := TOffsForm.Create(MainForm);
  try
       if not (ReestrReturn.IsEmpty) then
          Begin
            Sum_Nal := 0;
            TypeOffs := TAB_Return;
            TypeSaveOffs  := g_CorrDoc;
            ReturnF.SettingOffsForm(TAB_Return, g_CorrDoc);

            AppData.GetDetailOffs.Active := False;
            AppData.GetDetailOffs.CommandText := Format( SSQLGetOffsDetail, [ReestrReturn.FieldByName('UNICUM_NUM').AsInteger]);
            AppData.GetDetailOffs.Active := True;


            if AppData.GetDetailOffs.FieldByName('StatusDoc').AsString = '*' then
               begin
                  MessageBox(Handle, PChar('Документ: ' + AppData.GetDetailOffs.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                  Exit;
               end
            else
              Begin
                AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                  if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.GetDetailOffs.FieldByName('OTMETKA').AsString = '*') then
                      Begin
                        MessageBox(Handle, PChar('Документ № ' + AppData.GetDetailOffs.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                        Exit;
                      end
                  else
                      Begin
                        with AppData do
                         Begin
                            AdoCmd.CommandText := Format(SSQLUpdateOffsStatusCorrDoc, [GetDetailOffs.FieldByName('UNICUM_NUM').AsInteger, 1]);
                            AdoCmd.Execute;
                          end;

                        RecordCountDetail := AppData.GetDetailOffs.RecordCount+1;
                        DecodeDate(ReestrReturn.FieldByName('DATE_P_POR').AsDateTime, Year, Month, Day);

                         with ReturnF do
                          Begin
                            OffsStringGrid.RowCount := RecordCountDetail;
                            NumDocEdit.Text := ReestrReturn.FieldByName('NUMDOC').AsString;
                            MonthCombo.ItemIndex := Month;
                            YearSpinEdit.Value := Year;
                            DatePicker.Date := AppData.GetDetailOffs.FieldByName('DATE_P_POR').AsDateTime;
                            PrimechEdit.Text :=  ReestrReturn.FieldByName('PRIMECH').AsString;
                          end;

                          AppData.GetDetailOffs.First;
                          while not  AppData.GetDetailOffs.Eof do
                          Begin
                             with ReturnF.OffsStringGrid  do
                              begin
                                Cells[0,i] := IntToStr(i);
                                Cells[0,0] := '№';
                                for i:= 1 to OffsForm.OffsStringGrid.RowCount -1 do
                                Begin
                                    Cells[1,i] := AppData.GetDetailOffs.FieldByName('UID_SHOP').AsString;
                                    Cells[2,i] := AppData.GetDetailOffs.FieldByName('NAME').AsString;
                                    Cells[3,i] := AppData.GetDetailOffs.FieldByName('ADRESS').AsString;
                                    Cells[4,i] := AppData.GetDetailOffs.FieldByName('SUM_NAL').AsString;
                                    Cells[5,i] := AppData.GetDetailOffs.FieldByName('PRIMECH').AsString;
                                    Sum_Nal    := Sum_Nal + AppData.GetDetailOffs.FieldByName('SUM_NAL').AsFloat;
                                    AppData.GetDetailOffs.Next;
                                  end;
                            end;
                          end;

                          with  ReturnF.Bar do
                          Begin
                              Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetDetailOffs.RecordCount);
                              Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                              Panels[2].Text := EmptyStr;
                          end;
                          ReturnF.ShowModal();
                        end;
                      end;
          end
       else
                      Exit;
  finally
      FreeAndNil(ReturnF);
  end;
end;

procedure TMainForm.ViewReturnActionExecute(Sender: TObject);
var
    i, RecordCountDetail: integer;
    Sum_Nal: real;
    Year, Month, Day, Mes: Word;
    ReturnF: TOffsForm;
begin

   ReturnF := TOffsForm.Create(MainForm);
   try
        if not (ReestrReturn.IsEmpty) then
            Begin
                Sum_Nal := 0;

                 TypeOffs := TAB_Return;
                 TypeSaveOffs  := g_Preview;
                 ReturnF.SettingOffsForm(TAB_Return, g_Preview);

                 AppData.GetDetailOffs.Active := False;
                 AppData.GetDetailOffs.CommandText := Format( SSQLGetOffsDetail, [ReestrReturn.FieldByName('UNICUM_NUM').AsInteger]);
                 AppData.GetDetailOffs.Active := True;


                        RecordCountDetail := AppData.GetDetailOffs.RecordCount+1;
                        DecodeDate(ReestrReturn.FieldByName('DATE_P_POR').AsDateTime, Year, Month, Day);

                         with ReturnF do
                          Begin
                            OffsStringGrid.RowCount := RecordCountDetail;
                            NumDocEdit.Text := ReestrReturn.FieldByName('NUMDOC').AsString;
                            MonthCombo.ItemIndex := Month;
                            DatePicker.Date := AppData.GetDetailOffs.FieldByName('DATE_P_POR').AsDateTime;
                            YearSpinEdit.Value := Year;
                            PrimechEdit.Text :=  ReestrReturn.FieldByName('PRIMECH').AsString;
                          end;

                          AppData.GetDetailOffs.First;
                          while not  AppData.GetDetailOffs.Eof do
                          Begin
                            with ReturnF.OffsStringGrid  do
                             begin
                              Cells[0,i] := IntToStr(i);
                              Cells[0,0] := '№';
                              for i:= 1 to RowCount -1 do
                              Begin
                                Cells[1,i] := AppData.GetDetailOffs.FieldByName('UID_SHOP').AsString;
                                Cells[2,i] := AppData.GetDetailOffs.FieldByName('NAME').AsString;
                                Cells[3,i] := AppData.GetDetailOffs.FieldByName('ADRESS').AsString;
                                Cells[4,i] := FormatFloat('#,###,###.###', AppData.GetDetailOffs.FieldByName('SUM_NAL').AsFloat);
                                Cells[5,i] := AppData.GetDetailOffs.FieldByName('PRIMECH').AsString;
                                Sum_Nal    := Sum_Nal + AppData.GetDetailOffs.FieldByName('SUM_NAL').AsFloat;
                                AppData.GetDetailOffs.Next;
                              end;
                            end;
                          end;

                          with  ReturnF.Bar do
                          Begin
                            Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetDetailOffs.RecordCount);
                            Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                            Panels[2].Text := '';
                          end;
                    ReturnF.ShowModal();
          end
        else
                          Exit;
   finally
        FreeAndNil(ReturnF);
   end;
end;

procedure TMainForm.PrintReestrReturnPopClick(Sender: TObject);
begin
    ReestrReturn.DisableControls;
    Report.Template := SReturReestr;
    Report.Run;
    ReestrReturn.First;
    ReestrReturn.EnableControls;
end;

procedure TMainForm.PrintReturnDocPopClick(Sender: TObject);
begin
    fl_TypeReport := TAB_Return;
    AppData.GetDetailOffs.Active := False;
    AppData.GetDetailOffs.CommandText := Format(SSQLGetOffsDetail, [ReestrReturn.FieldByName('UNICUM_NUM').AsInteger]);
    AppData.Report.Template := SReturnTotalDoc;
    AppData.Report.Run;
end;

procedure TMainForm.ReturnGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ReestrReturn.FieldByName('OTMETKA').AsString = '*' then
    begin
      with ReturnGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.CheckOtmetkaReturnActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrReturn.IsEmpty) then
     Begin
        AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrReturn.FieldByName('UNICUM_NUM').AsInteger,
                                                                 1,
                                                                 TAB_Return]);
        AppData.AdoCmd.Execute;

        s_UnicumNum :=  ReestrReturn.FieldByName('UNICUM_NUM').AsString;
        ReestrReturn.Active := False;
        ReestrReturn.Active := True;
        ReestrReturn.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
     end
  else
        Exit;
end;

procedure TMainForm.UnCheckOtmetkaReturnActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrReturn.IsEmpty) then
     Begin
        AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrReturn.FieldByName('UNICUM_NUM').AsInteger,
                                                                 0,
                                                                 TAB_Return]);
        AppData.AdoCmd.Execute;

        s_UnicumNum :=  ReestrReturn.FieldByName('UNICUM_NUM').AsString;
        ReestrReturn.Active := False;
        ReestrReturn.Active := True;
        ReestrReturn.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
     end
  else
        Exit;
end;

procedure TMainForm.DeleteReturnActionExecute(Sender: TObject);
var
    QDel, QRes:  word;
begin

  if not (ReestrReturn.IsEmpty) then
     Begin
        AppData.GetDetailOffs.Active := False;
        AppData.GetDetailOffs.CommandText := Format(SSQLGetOffsDetail, [ReestrReturn.FieldByName('UNICUM_NUM').AsInteger]);
        AppData.GetDetailOffs.Active := True;

       if AppData.GetDetailOffs.FieldByName('StatusDoc').AsString = '*' then
          Begin
            MessageBox(Handle, PChar('Документ: ' + AppData.GetDetailOffs.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
            Exit;
          end
       else
          Begin
            QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
            if QDel=IDYES then
              begin
                AppData.DeleteOffsDoc.Active := False;
                AppData.DeleteOffsDoc.CommandText := Format(SSQLDeleteOffsDocum, [ReestrReturn.FieldByName('UNICUM_NUM').AsInteger]);
                AppData.DeleteOffsDoc.Active := True;
                QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

                ReestrReturn.Active := False;
                ReestrReturn.Active := True;
                BarCalc(TAB_Return);
          end
          else
                Exit;
          end;
     end
  else
                Exit;
end;

procedure TMainForm.PopupReturnMenuPopup(Sender: TObject);
var
   Loc_AccessMode: integer;
begin
   AppData.UserAccess.Locate('MODULE_UID', IntToStr(Tabs.TabIndex), [loCaseInsensitive, loPartialKey]);
   Loc_AccessMode := AppData.UserAccess.FieldByName('Mode').AsInteger;
   if (ReestrReturn.FieldByName('OTMETKA').AsString = '*') or (Loc_AccessMode = 1) then
        CheckOtmReturnPop.Enabled := False
   else
        CheckOtmReturnPop.Enabled := True;
end;

procedure TMainForm.ReportOffsMonthActionExecute(Sender: TObject);
begin
    TypeReport := TAB_Offs;
    ReportForm.Caption := 'Отчет по магазинам -> Списание -> За дату';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportReturnMonthActionExecute(Sender: TObject);
begin
    TypeReport := TAB_Return;
    ReportForm.Caption := 'Отчет по магазинам -> Возврат -> За дату';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportOffsDayActionExecute(Sender: TObject);
begin
    TypeReport := TAB_Offs;
    ReportForm.Caption := 'Отчет по магазинам -> Списание -> За день';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportReturnDayActionExecute(Sender: TObject);
begin
    TypeReport := TAB_Return;
    ReportForm.Caption := 'Отчет по магазинам -> Возврат -> За день';
    ReportForm.ShowModal();
end;

procedure TMainForm.RefreshReturnPopClick(Sender: TObject);
begin
    Screen.Cursor := crSQLWait;
    ReestrReturn.Active := False;
    ReestrReturn.Active := True;
    Screen.Cursor := crDefault;
end;

procedure TMainForm.RefreshOffsPopClick(Sender: TObject);
begin
    Screen.Cursor := crSQLWait;
    ReestrOffs.Active := False;
    ReestrOffs.Active := True;
    Screen.Cursor := crDefault;
end;


procedure TMainForm.EnvdActionExecute(Sender: TObject);
var
    i: integer;
    EnvdF: TOffsForm;
begin

   EnvdF := TOffsForm.Create(MainForm);
   try
      AppData.Organiz.Active := False;
      AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
      AppData.Organiz.Active := True;

      TypeOffs := TAB_ENVD;
      TypeSaveOffs  := g_CreateDoc;
      EnvdF.SettingOffsForm(TAB_ENVD, g_CreateDoc);

      AppData.Organiz.First;
       with EnvdF.OffsStringGrid do
        Begin
          RowCount := AppData.Organiz.RecordCount+1;
          while not AppData.Organiz.Eof do
           Begin
            For i := 1 to RowCount-1 do
             Begin
                Cells[0,i] := IntToStr(i);
                Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
                Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
                Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
                AppData.Organiz.Next;
             end;
           end;
        end;

        with  EnvdF.Bar do
          Begin
            Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
            Panels[1].Text := 'Сумма (нал): ' + '0';
            Panels[2].Text := 'Сумма (безнал): ' + '0';
          end;

        EnvdF.ShowModal();
   finally
        FreeAndNil(EnvdF);
   end;
   
end;

procedure TMainForm.CorrEnvdActionExecute(Sender: TObject);
var
    i, RecordCountDetail: integer;
    Sum_Not_Nal: real;
    Year, Month, Day, Mes: Word;
    EnvdF: TOffsForm;
begin
   EnvdF := TOffsForm.Create(MainForm);
   try
       if not (ReestrENVD.IsEmpty) then
         Begin
            Sum_Not_Nal := 0;
            TypeOffs := TAB_ENVD;
            TypeSaveOffs  := g_CorrDoc;
            EnvdF.SettingOffsForm(TAB_ENVD, g_CorrDoc);

            AppData.GetDetailOffs.Active := False;
            AppData.GetDetailOffs.CommandText := Format( SSQLGetOffsDetail, [MainForm.ReestrENVD.FieldByName('UNICUM_NUM').AsInteger]);
            AppData.GetDetailOffs.Active := True;


            if AppData.GetDetailOffs.FieldByName('StatusDoc').AsString = '*' then
               begin
                  MessageBox(Handle, PChar('Документ: ' + AppData.GetDetailOffs.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                  Exit;
               end
            else
              Begin
                AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                  if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.GetDetailOffs.FieldByName('OTMETKA').AsString = '*') then
                      Begin
                        MessageBox(Handle, PChar('Документ № ' + AppData.GetDetailOffs.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                        Exit;
                      end
                  else
                      Begin
                        with AppData do
                         Begin
                            AdoCmd.CommandText := Format(SSQLUpdateOffsStatusCorrDoc, [GetDetailOffs.FieldByName('UNICUM_NUM').AsInteger, 1]);
                            AdoCmd.Execute;
                          end;

                        RecordCountDetail := AppData.GetDetailOffs.RecordCount+1;
                        DecodeDate(ReestrENVD.FieldByName('DATE_P_POR').AsDateTime, Year, Month, Day);

                         with EnvdF do
                          Begin
                            OffsStringGrid.RowCount := RecordCountDetail;
                            NumDocEdit.Text := ReestrENVD.FieldByName('NUMDOC').AsString;
                            MonthCombo.ItemIndex := Month;
                            YearSpinEdit.Value := Year;
                            DatePicker.Date := AppData.GetDetailOffs.FieldByName('DATE_P_POR').AsDateTime;
                            PrimechEdit.Text :=  ReestrENVD.FieldByName('PRIMECH').AsString;
                          end;

                          AppData.GetDetailOffs.First;
                          while not  AppData.GetDetailOffs.Eof do
                          Begin
                            for i:= 1 to EnvdF.OffsStringGrid.RowCount -1 do
                            Begin
                              EnvdF.OffsStringGrid.Cells[0,i] := IntToStr(i);
                              EnvdF.OffsStringGrid.Cells[0,0] := '№';
                             with EnvdF.OffsStringGrid  do
                              begin
                                Cells[1,i] := AppData.GetDetailOffs.FieldByName('UID_SHOP').AsString;
                                Cells[2,i] := AppData.GetDetailOffs.FieldByName('NAME').AsString;
                                Cells[3,i] := AppData.GetDetailOffs.FieldByName('ADRESS').AsString;
                                Cells[4,i] := AppData.GetDetailOffs.FieldByName('SUM_NOT_NAL').AsString;
                                Cells[5,i] := AppData.GetDetailOffs.FieldByName('PRIMECH').AsString;
                                Sum_Not_Nal := Sum_Not_Nal + AppData.GetDetailOffs.FieldByName('SUM_NOT_NAL').AsFloat;
                                AppData.GetDetailOffs.Next;
                              end;
                            end;
                          end;

                          with  EnvdF.Bar do
                          Begin
                            Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetDetailOffs.RecordCount);
                            Panels[1].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                            Panels[2].Text := '';
                          end;
                          EnvdF.ShowModal();
                        end;
                      end;
         end
       else
                        Exit;
   finally
        FreeAndNil(EnvdF);
   end;
end;

procedure TMainForm.ViewEnvdActionExecute(Sender: TObject);
var
    i, RecordCountDetail: integer;
    Sum_Not_Nal: real;
    Year, Month, Day, Mes: Word;
    EnvdF: TOffsForm;
begin

  EnvdF := TOffsForm.Create(MainForm);
  try
        if not (ReestrENVD.IsEmpty) then
          Begin
              Sum_Nal := 0;

              TypeOffs := TAB_ENVD;
              TypeSaveOffs  := g_Preview;
              EnvdF.SettingOffsForm(TAB_ENVD, g_Preview);

              AppData.GetDetailOffs.Active := False;
              AppData.GetDetailOffs.CommandText := Format( SSQLGetOffsDetail, [ReestrENVD.FieldByName('UNICUM_NUM').AsInteger]);
              AppData.GetDetailOffs.Active := True;


                      RecordCountDetail := AppData.GetDetailOffs.RecordCount+1;
                      DecodeDate(ReestrENVD.FieldByName('DATE_P_POR').AsDateTime, Year, Month, Day);

                       with EnvdF do
                        Begin
                          OffsStringGrid.RowCount := RecordCountDetail;
                          NumDocEdit.Text := ReestrENVD.FieldByName('NUMDOC').AsString;
                          MonthCombo.ItemIndex := Month;
                          DatePicker.Date := AppData.GetDetailOffs.FieldByName('DATE_P_POR').AsDateTime;
                          YearSpinEdit.Value := Year;
                          PrimechEdit.Text :=  ReestrENVD.FieldByName('PRIMECH').AsString;
                        end;

                        AppData.GetDetailOffs.First;
                        while not  AppData.GetDetailOffs.Eof do
                        Begin
                          with EnvdF.OffsStringGrid  do
                           begin
                              Cells[0,i] := IntToStr(i);
                              Cells[0,0] := '№';
                              for i:= 1 to RowCount -1 do
                              Begin
                                  Cells[1,i] := AppData.GetDetailOffs.FieldByName('UID_SHOP').AsString;
                                  Cells[2,i] := AppData.GetDetailOffs.FieldByName('NAME').AsString;
                                  Cells[3,i] := AppData.GetDetailOffs.FieldByName('ADRESS').AsString;
                                  Cells[4,i] := FormatFloat('#,###,###.###', AppData.GetDetailOffs.FieldByName('SUM_NOT_NAL').AsFloat);
                                  Cells[5,i] := AppData.GetDetailOffs.FieldByName('PRIMECH').AsString;
                                  Sum_Not_Nal     := Sum_Not_Nal + AppData.GetDetailOffs.FieldByName('SUM_NOT_NAL').AsFloat;
                                  AppData.GetDetailOffs.Next;
                                end;
                           end;
                        end;

                            with  EnvdF.Bar do
                            Begin
                              Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetDetailOffs.RecordCount);
                              Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                              Panels[2].Text := EmptyStr;
                            end;
                      EnvdF.ShowModal();
              end
        else
                     Exit;
  finally
        FreeAndNil(EnvdF);
  end;
end;

procedure TMainForm.DeleteEnvdActionExecute(Sender: TObject);
var
    QDel, QRes:  word;
begin

  if not (ReestrENVD.IsEmpty) then
      Begin
          AppData.GetDetailOffs.Active := False;
          AppData.GetDetailOffs.CommandText := Format(SSQLGetOffsDetail, [ReestrENVD.FieldByName('UNICUM_NUM').AsInteger]);
          AppData.GetDetailOffs.Active := True;

         if AppData.GetDetailOffs.FieldByName('StatusDoc').AsString = '*' then
            Begin
              MessageBox(Handle, PChar('Документ: ' + AppData.GetDetailOffs.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
              Exit;
            end
         else
            Begin
              QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
              if QDel=IDYES then
                begin
                  AppData.DeleteOffsDoc.Active := False;
                  AppData.DeleteOffsDoc.CommandText := Format(SSQLDeleteOffsDocum, [ReestrENVD.FieldByName('UNICUM_NUM').AsInteger]);
                  AppData.DeleteOffsDoc.Active := True;
                  QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

                  ReestrENVD.Active := False;
                  ReestrENVD.Active := True;
                  BarCalc(TAB_ENVD);
            end
            else
                  Exit;
            end;
      end
  else
                  Exit;
end;

procedure TMainForm.CheckOtmetkaEnvdActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrENVD.IsEmpty) then
     Begin
        AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrENVD.FieldByName('UNICUM_NUM').AsInteger,
                                                                 1,
                                                                 TAB_ENVD]);
        AppData.AdoCmd.Execute;

        s_UnicumNum :=  ReestrENVD.FieldByName('UNICUM_NUM').AsString;
        ReestrENVD.Active := False;
        ReestrENVD.Active := True;
        ReestrENVD.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
     end
  else
        Exit;
end;

procedure TMainForm.UnCheckOtmetkaEnvdActionExecute(Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrENVD.IsEmpty) then
     Begin
        AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrENVD.FieldByName('UNICUM_NUM').AsInteger,
                                                                 0,
                                                                 TAB_ENVD]);
        AppData.AdoCmd.Execute;

        s_UnicumNum :=  ReestrENVD.FieldByName('UNICUM_NUM').AsString;
        ReestrENVD.Active := False;
        ReestrENVD.Active := True;
        ReestrENVD.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
     end
  else
        Exit;
end;

procedure TMainForm.ENVDGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ReestrENVD.FieldByName('OTMETKA').AsString = '*' then
    begin
      with ENVDGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.RefreshEnvdPopClick(Sender: TObject);
begin
    Screen.Cursor := crSQLWait;
    ReestrENVD.Active := False;
    ReestrENVD.Active := True;
    Screen.Cursor := crDefault;
end;

procedure TMainForm.ReportEnvdDayActionExecute(Sender: TObject);
begin
    TypeReport := TAB_ENVD;
    ReportForm.Caption := 'Отчет по магазинам -> ЕНВД -> За дату';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportEnvdMonthActionExecute(Sender: TObject);
begin
    TypeReport := TAB_ENVD;
    ReportForm.Caption := 'Отчет по магазинам -> ЕНВД -> За месяц';
    ReportForm.ShowModal();
end;

procedure TMainForm.PrintReestrEnvdPopClick(Sender: TObject);
begin
    ReestrENVD.DisableControls;
    Report.Template := SEnvdReestr;
    Report.Run;
    ReestrENVD.First;
    ReestrENVD.EnableControls;
end;

procedure TMainForm.PrintDocEnvdPopClick(Sender: TObject);
begin
    fl_TypeReport := TAB_ENVD;
    AppData.GetDetailOffs.Active := False;
    AppData.GetDetailOffs.CommandText := Format(SSQLGetOffsDetail, [ReestrENVD.FieldByName('UNICUM_NUM').AsInteger]);
    AppData.Report.Template := SEnvdTotalDoc;
    AppData.Report.Run;
end;

procedure TMainForm.TypeEnergyMenuClick(Sender: TObject);
  var
      TypeEnergyF: TTypeEnergyForm;
begin
  TypeEnergyF := TTypeEnergyForm.Create(MainForm);

    try
      TypeEnergyF.ShowModal();
    finally
      FreeAndNil(TypeEnergyF);
    end;

end;

procedure TMainForm.PublicUtilitiesActionExecute(Sender: TObject);
var
    i: integer;
begin
  TypeSavePublicUtilities := g_CreateDoc;
  PublicUtilitiesForm.SettingPublicUtilitiesForm(g_CreateDoc);

  AppData.Organiz.First;
  with PublicUtilitiesForm.PublicUtilitesStringGrid do
  Begin
    RowCount := AppData.Organiz.RecordCount+1;
    while not AppData.Organiz.Eof do
     Begin
      For i := 1 to RowCount-1 do
       Begin
          Cells[0,i] := IntToStr(i);
          Cells[1,i] := AppData.Organiz.FieldByName('UID').AsString;
          Cells[2,i] := AppData.Organiz.FieldByName('Name').AsString;
          Cells[3,i] := AppData.Organiz.FieldByName('Adress').AsString;
          AppData.Organiz.Next;
       end;
     end;
  end;

  with  PublicUtilitiesForm.Bar do
    Begin
      Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.Organiz.RecordCount);
      Panels[1].Text := 'Сумма (нал): ' + '0';
      Panels[2].Text := 'Сумма (безнал): ' + '0';
    end;
    
  PublicUtilitiesForm.ShowModal();
end;

procedure TMainForm.DeletePublicUtilitiesDocActionExecute(Sender: TObject);
var
    QDel, QRes:  word;
begin
{ DONE 3 -opmp -cTuesdey : Удаление документа (Коммунальные услуги) }
  if not (ReestrPublicUtilities.IsEmpty) then
     Begin
       AppData.GetPublicUtilitiesDetail.Active := False;
       AppData.GetPublicUtilitiesDetail.CommandText := Format(SSQLGetPublicUtilitiesDetail, [ReestrPublicUtilities.FieldByName('UNICUM_NUM').AsInteger]);
       AppData.GetPublicUtilitiesDetail.Active := True;

       if AppData.GetPublicUtilitiesDetail.FieldByName('StatusDoc').AsString = '*' then
          Begin
             MessageBox(Handle, PChar('Документ: ' + AppData.GetPublicUtilitiesDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Удаление документа'), MB_ICONWARNING+MB_OK);
             Exit;
          end
       else
          Begin
            QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
            if QDel=IDYES then
              begin
                AppData.DeletePublicUtilitiesDoc.Active := False;
                AppData.DeletePublicUtilitiesDoc.CommandText := Format(SSQLDeletePublicUtilitiesDoc, [ReestrPublicUtilities.FieldByName('UNICUM_NUM').AsInteger]);
                AppData.DeletePublicUtilitiesDoc.Active := True;
                QRes := MessageBox(Handle, PChar('Документ успешно удален (копия сохранена в архиве)!'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_OK);

                ReestrPublicUtilities.Active := False;
                ReestrPublicUtilities.Active := True;
                BarCalc(TAB_PublicUtilities);
              end
          else
                Exit;
          end;
     end
  else
                Exit;
end;

procedure TMainForm.CorrPublicUtilitiesActionExecute(Sender: TObject);
var
    i, RecordCountDetail: integer;
    Sum_NAl, Sum_NOt_Nal: real;
begin
{ DONE 3 -opmp -cTuesdey : Корректировка документа (Коммунальные услуги) }

    if not (ReestrPublicUtilities.IsEmpty) then
        Begin
           Sum_NAl := 0;
           Sum_NOt_Nal := 0;
           TypeSavePublicUtilities := g_CorrDoc;
           PublicUtilitiesForm.SettingPublicUtilitiesForm(g_CorrDoc);

           AppData.GetPublicUtilitiesDetail.Active := False;
           AppData.GetPublicUtilitiesDetail.CommandText := Format(SSQLGetPublicUtilitiesDetail, [ReestrPublicUtilities.FieldByName('UNICUM_NUM').AsInteger]);
           AppData.GetPublicUtilitiesDetail.Active := True;

             if AppData.GetPublicUtilitiesDetail.FieldByName('StatusDoc').AsString = '*' then
               begin
                  MessageBox(Handle, PChar('Документ: ' + AppData.GetPublicUtilitiesDetail.FieldByName('NUMDOC').AsString + ' занят другим пользователем!'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                  Exit;
               end
             else
               Begin
                 AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);
                   if (AppData.Users.FieldByName('Admin').AsString <> '*') and (AppData.GetPublicUtilitiesDetail.FieldByName('OTMETKA').AsString = '*') then
                       Begin
                         MessageBox(Handle, PChar('Документ № ' + AppData.GetPublicUtilitiesDetail.FieldByName('NUMDOC').AsString + ' отмечен.' + #13#10 + 'Корректировка невозможна. Обратитесь к администратору'), PChar('Корректировка документа'), MB_ICONWARNING+MB_OK);
                         Exit;
                       end
                   else
                       Begin
                           AppData.AdoCmd.CommandText := Format(SSQLUpdateOffsStatusCorrDoc, [AppData.GetPublicUtilitiesDetail.FieldByName('UNICUM_NUM').AsInteger, 1]);
                           AppData.AdoCmd.Execute;

                           RecordCountDetail := AppData.GetPublicUtilitiesDetail.RecordCount+1;
                           with PublicUtilitiesForm do
                            Begin
                              PublicUtilitesStringGrid.RowCount := RecordCountDetail;
                              NumDocEdit.Text := ReestrPublicUtilities.FieldByName('NUMDOC').AsString;
                              Picker.Date := ReestrPublicUtilities.FieldByName('DATE_P_POR').AsDateTime;
                              PrimechEdit.Text :=  ReestrPublicUtilities.FieldByName('PRIMECH').AsString;

                              AppData.GetPublicUtilitiesDetail.First;
                              while not  AppData.GetPublicUtilitiesDetail.Eof do
                                  begin
                                   for i := 1 to PublicUtilitesStringGrid.RowCount-1 do
                                    Begin
                                      with PublicUtilitesStringGrid do
                                        Begin
                                          Cells[0,i] := AppData.GetPublicUtilitiesDetail.FieldByName('NUM_PREDM').AsString;
                                          Cells[1,i] := AppData.GetPublicUtilitiesDetail.FieldByName('UID_SHOP').AsString;
                                          Cells[2,i] := AppData.GetPublicUtilitiesDetail.FieldByName('NAME').AsString;
                                          Cells[3,i] := AppData.GetPublicUtilitiesDetail.FieldByName('ADRESS').AsString;
                                          Cells[4,i] := AppData.GetPublicUtilitiesDetail.FieldByName('SUPPLIER_NAME').AsString;
                                          Cells[5,i] := AppData.GetPublicUtilitiesDetail.FieldByName('TypeEnergy_NAME').AsString;
                                          Cells[6,i] := AppData.GetPublicUtilitiesDetail.FieldByName('SUM_NAL').AsString;
                                          Cells[7,i] := AppData.GetPublicUtilitiesDetail.FieldByName('SUM_NOT_NAL').AsString;
                                          Cells[8,i] := AppData.GetPublicUtilitiesDetail.FieldByName('PRIMECH').AsString;
                                          Sum_NAl := Sum_NAl + AppData.GetPublicUtilitiesDetail.FieldByName('SUM_NAL').AsFloat;
                                          Sum_NOt_Nal    := Sum_NOt_Nal + AppData.GetPublicUtilitiesDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                                          AppData.GetPublicUtilitiesDetail.Next;
                                       end;
                                    end;
                                  end;
                              Bar.Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetPublicUtilitiesDetail.RecordCount);
                              Bar.Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_NAl);
                              Bar.Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_NOt_Nal);
                           end;
                            PublicUtilitiesForm.ShowModal();
                       end;
               end;
        end
    else
                            Exit;
end;

procedure TMainForm.ViewPublicUtilitiesActionExecute(Sender: TObject);
var
    i, RecordCountDetail: integer;
    Sum_NAl, Sum_NOt_Nal: real;
begin
  { DONE 3 -opmp -cTuesdey : Просмотр документа (Коммунальные услуги) }

    if not (ReestrPublicUtilities.IsEmpty) then
       Begin
         Sum_NAl := 0;
         Sum_NOt_Nal := 0;
         PublicUtilitiesForm.SettingPublicUtilitiesForm(g_Preview);

         AppData.GetPublicUtilitiesDetail.Active := False;
         AppData.GetPublicUtilitiesDetail.CommandText := Format(SSQLGetPublicUtilitiesDetail, [ReestrPublicUtilities.FieldByName('UNICUM_NUM').AsInteger]);
         AppData.GetPublicUtilitiesDetail.Active := True;


         RecordCountDetail := AppData.GetPublicUtilitiesDetail.RecordCount+1;
         with PublicUtilitiesForm do
          Begin
            PublicUtilitesStringGrid.RowCount := RecordCountDetail;
            NumDocEdit.Text := ReestrPublicUtilities.FieldByName('NUMDOC').AsString;
            Picker.Date := ReestrPublicUtilities.FieldByName('DATE_P_POR').AsDateTime;
            PrimechEdit.Text :=  ReestrPublicUtilities.FieldByName('PRIMECH').AsString;

            AppData.GetPublicUtilitiesDetail.First;
            while not  AppData.GetPublicUtilitiesDetail.Eof do
                begin
                 for i := 1 to PublicUtilitesStringGrid.RowCount-1 do
                  Begin
                    with PublicUtilitesStringGrid do
                      Begin
                        Cells[0,i] := AppData.GetPublicUtilitiesDetail.FieldByName('NUM_PREDM').AsString;
                        Cells[1,i] := AppData.GetPublicUtilitiesDetail.FieldByName('UID_SHOP').AsString;
                        Cells[2,i] := AppData.GetPublicUtilitiesDetail.FieldByName('NAME').AsString;
                        Cells[3,i] := AppData.GetPublicUtilitiesDetail.FieldByName('ADRESS').AsString;
                        Cells[4,i] := AppData.GetPublicUtilitiesDetail.FieldByName('SUPPLIER_NAME').AsString;
                        Cells[5,i] := AppData.GetPublicUtilitiesDetail.FieldByName('TypeEnergy_NAME').AsString;
                        Cells[6,i] := FormatFloat('#,###,###.###',AppData.GetPublicUtilitiesDetail.FieldByName('SUM_NAL').AsFloat);
                        Cells[7,i] := FormatFloat('#,###,###.###',AppData.GetPublicUtilitiesDetail.FieldByName('SUM_NOT_NAL').AsFloat);
                        Cells[8,i] := AppData.GetPublicUtilitiesDetail.FieldByName('PRIMECH').AsString;
                        Sum_NAl := Sum_NAl + AppData.GetPublicUtilitiesDetail.FieldByName('SUM_NAL').AsFloat;
                        Sum_NOt_Nal    := Sum_NOt_Nal + AppData.GetPublicUtilitiesDetail.FieldByName('SUM_NOT_NAL').AsFloat;
                        AppData.GetPublicUtilitiesDetail.Next;
                     end;
                  end;
                end;
            Bar.Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetPublicUtilitiesDetail.RecordCount);
            Bar.Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_NAl);
            Bar.Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_NOt_Nal);
         end;
          PublicUtilitiesForm.ShowModal();
      end
    else
            Exit;
end;

procedure TMainForm.RefreshPublicUtilitiesPopClick(Sender: TObject);
begin
    Screen.Cursor := crSQLWait;
    ReestrPublicUtilities.Active := False;
    ReestrPublicUtilities.Active := True;
    Screen.Cursor := crDefault;
end;

procedure TMainForm.RefreshShipmentOtherPopClick(Sender: TObject);
begin
    Screen.Cursor := crSQLWait;
    ReestrShipmentOther.Active := False;
    ReestrShipmentOther.Active := True;
    Screen.Cursor := crDefault;
end;

procedure TMainForm.CheckOtmetkaPublicUtilitiesActionExecute(
  Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrPublicUtilities.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrPublicUtilities.FieldByName('UNICUM_NUM').AsInteger,
                                                               1,
                                                               TAB_PublicUtilities]);
      AppData.AdoCmd.Execute;

      s_UnicumNum :=  ReestrPublicUtilities.FieldByName('UNICUM_NUM').AsString;
      ReestrPublicUtilities.Active := False;
      ReestrPublicUtilities.Active := True;
      ReestrPublicUtilities.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
       Exit;
end;

procedure TMainForm.UnCheckOtmetkaPublicUtilitiesActionExecute(
  Sender: TObject);
var
    s_UnicumNum: string;
begin
  if not (ReestrPublicUtilities.IsEmpty) then
    Begin
      AppData.AdoCmd.CommandText := Format(SSQLSetOtmetkaDoc, [ReestrPublicUtilities.FieldByName('UNICUM_NUM').AsInteger,
                                                               0,
                                                               TAB_PublicUtilities]);
      AppData.AdoCmd.Execute;

      s_UnicumNum :=  ReestrPublicUtilities.FieldByName('UNICUM_NUM').AsString;
      ReestrPublicUtilities.Active := False;
      ReestrPublicUtilities.Active := True;
      ReestrPublicUtilities.Locate('UNICUM_NUM', s_UnicumNum, [loPartialKey, loCaseInsensitive]);
    end
  else
        Exit;
end;

procedure TMainForm.PopupPublicUtilitiesMenuPopup(Sender: TObject);
var
   Loc_AccessMode: integer;
begin
   AppData.UserAccess.Locate('MODULE_UID', IntToStr(Tabs.TabIndex), [loCaseInsensitive, loPartialKey]);
   Loc_AccessMode := AppData.UserAccess.FieldByName('Mode').AsInteger;
   if (ReestrPublicUtilities.FieldByName('OTMETKA').AsString = '*') or (Loc_AccessMode = 1) then
        CheckOtmetkaPublicUtilitiesPop.Enabled := False
   else
        CheckOtmetkaPublicUtilitiesPop.Enabled := True;
end;

procedure TMainForm.PublicUtilitiesGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ReestrPublicUtilities.FieldByName('OTMETKA').AsString = '*' then
    begin
      with PublicUtilitiesGrid.Canvas do
        Begin
          Brush.Color := clScrollBar;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TMainForm.PrintReestrPublicUtilitiesClick(Sender: TObject);
begin
    ReestrPublicUtilities.DisableControls;
    Report.Template := SPublicUtilitiesReestr;
    Report.Run;
    ReestrPublicUtilities.First;
    ReestrPublicUtilities.EnableControls;
end;

procedure TMainForm.PrintDocPublicUtilitiesClick(Sender: TObject);
begin
    fl_TypeReport := TAB_PublicUtilities;
     AppData.GetPublicUtilitiesDetail.Active := False;
     AppData.GetPublicUtilitiesDetail.CommandText := Format(SSQLGetPublicUtilitiesDetail, [ReestrPublicUtilities.FieldByName('UNICUM_NUM').AsInteger]);
     AppData.Report.Template := SPublicUtilitiesTotalDoc;
     AppData.Report.Run;
end;

procedure TMainForm.ReportPublicUtilitiesDayActionExecute(Sender: TObject);
begin
    TypeReport := TAB_PublicUtilities;
    ReportForm.Caption := 'Отчет по магазинам -> Коммунальные услуги -> За дату';
    ReportForm.ShowModal();
end;

procedure TMainForm.ReportPublicUtilitiesMonthActionExecute(
  Sender: TObject);
begin
    TypeReport := TAB_PublicUtilities;
    ReportForm.Caption := 'Отчет по магазинам -> Коммунальные услуги -> За месяц';
    ReportForm.ShowModal();
end;

procedure TMainForm.StateMenuClick(Sender: TObject);
var
    StateBuhF: TStateBuhForm;
begin
   StateBuhF := TStateBuhForm.Create(MainForm);

      try
         StateBuhF.ShowModal();
      finally
         FreeAndNil(StateBuhF);
      end;
end;

procedure TMainForm.DownloadBtnClick(Sender: TObject);
var
    DownloadFileF: TDownloadFileForm;
begin
  DownloadFileF := TDownloadFileForm.Create(MainForm);

    try
        DownloadFileF.ShowModal();
    finally
       FreeAndNil(DownloadFileF);
    end;
end;

procedure TMainForm.CashBoxBtnClick(Sender: TObject);
var
    KassaF: TKassaSumForm;
begin

  KassaF := TKassaSumForm.Create(MainForm);
  AppData.Users.Locate('Login', g_User, [loCaseInsensitive, loPartialKey]);

  if (AppData.Users.FieldByName('Admin').AsString = '*') then
        Begin
          Try
            with KassaF do
              Begin
                  PageControl.TabIndex := 0;

                  BegKassaPicker.Date := Now();
                  EndKassaPicker.Date := BegKassaPicker.Date + 1;

                  AppData.GetSumCashBox.Active := False;
                  AppData.GetSumCashBox.Active := True;
                  Sum_Nal_Actuale := AppData.GetSumCashBox.FieldbyName('SUM_NAL').AsFloat;
                  if Sum_Nal_Actuale > 0 then
                      CashBoxActualLabel.Font.Color := clLime
                  else
                  if Sum_Nal_Actuale < 0 then
                      CashBoxActualLabel.Font.Color := clRed
                  else
                      CashBoxActualLabel.Font.Color := clLtGray;

                  CashBoxActualLabel.Caption := FormatFloat('#,###,###.###', Sum_Nal_Actuale);
                  ShowModal();
              end;
          finally
              FreeAndNil(KassaF);
          end;
      end
  else
      MessageBox(Handle, PChar('Модуль Касса недоступен. Обратитесь к администратору'), PChar('Касса'), MB_OK+MB_ICONINFORMATION); 
end;

end.




