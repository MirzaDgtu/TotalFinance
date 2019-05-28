unit ModuleData;

interface

uses
  SysUtils, Classes, DB, ADODB, UCustomFlexCelReport, UFlexCelReport, ComCtrls, Variants, Dialogs, Forms;



type
  TAppData = class(TDataModule)
    Connection: TADOConnection;
    User: TADODataSet;
    UserUID: TIntegerField;
    UserLOGIN: TStringField;
    UserEmployeeName: TStringField;
    Module: TADODataSet;
    DS_Organiz: TDataSource;
    DS_Module: TDataSource;
    DS_User: TDataSource;
    ExpenseDocHead: TADODataSet;
    ExpenseDocDetail: TADODataSet;
    InsertNewShop: TADODataSet;
    InsertHeaderIncome: TADODataSet;
    DeleteShop: TADODataSet;
    InsertIncomeDetail: TADODataSet;
    MaxUnicumNumInc: TADODataSet;
    MaxUnicumNumIncUNICUM_NUM: TIntegerField;
    GetIncomeDetail: TADODataSet;
    GetIncomeDetailNUM_PREDM: TSmallintField;
    GetIncomeDetailUNICUM_NUM: TIntegerField;
    GetIncomeDetailADRESS: TStringField;
    GetIncomeDetailSUM_NAL: TFloatField;
    GetIncomeDetailSUM_NOT_NAL: TFloatField;
    GetIncomeDetailDATE_P_POR: TDateTimeField;
    DeleteIncomeDocum: TADODataSet;
    GetIncomeDetailNAME: TStringField;
    TransferToReserve: TADODataSet;
    CorrShop: TADODataSet;
    MaxUnicumNumExpense: TADODataSet;
    ExpenceDetail: TADODataSet;
    ExpenceDetailUNICUM_NUM: TIntegerField;
    ExpenceDetailDATE_P_POR: TDateTimeField;
    ExpenceDetailNUM_PREDM: TSmallintField;
    ExpenceDetailAdress: TStringField;
    ExpenceDetailSUM_NAL: TFloatField;
    ExpenceDetailSUM_NOT_NAL: TFloatField;
    ExpenceDetailFAMILY: TStringField;
    ExpenceDetailCREATE_DATE: TDateTimeField;
    ExpenceDetailNAZNACHENIE: TStringField;
    ExpenceDetailTYPE_DOC: TStringField;
    GetIncomeDetailUID_SHOP: TIntegerField;
    CorrIncomeDoc: TADODataSet;
    Report: TFlexCelReport;
    ExpenceDetailNAME: TStringField;
    ExpenceDetailUID_SHOP: TIntegerField;
    GetIncomeDetailNUMDOC: TIntegerField;
    MaxUnicumNumIncNUMDOC: TIntegerField;
    MaxUnicumNumExpenseUNICUM_NUM: TIntegerField;
    MaxUnicumNumExpenseNUMDOC: TIntegerField;
    ExpenceDetailNUMDOC: TIntegerField;
    DeleteExpenceDoc: TADODataSet;
    CorrExpenceDoc: TADODataSet;
    CorrExpenceZPDoc: TADODataSet;
    ExpenceDetailPRIMECH: TStringField;
    ExpenceDetailZp: TADODataSet;
    UserAdmin: TStringField;
    UserRESERVE: TStringField;
    Users: TADODataSet;
    TypeAccess: TADODataSet;
    UserAccess: TADODataSet;
    ZpAupDocHead: TADODataSet;
    ZpAupDocDetail: TADODataSet;
    MaxUnicumNumZpAup: TADODataSet;
    MaxUnicumNumZpAupUNICUM_NUM: TIntegerField;
    MaxUnicumNumZpAupNUMDOC: TIntegerField;
    DeleteZpAupDoc: TADODataSet;
    ZpAupDetail: TADODataSet;
    CorrZpAupH: TADODataSet;
    UsersUID: TIntegerField;
    UsersLOGIN: TStringField;
    UsersRESERVE: TStringField;
    UsersAdmin: TStringField;
    UserAccessMODULE_UID: TIntegerField;
    UserAccessUSER_UID: TIntegerField;
    UserAccessLOGIN: TStringField;
    UserAccessMode: TIntegerField;
    ZpAupDetailUNICUM_NUM: TIntegerField;
    ZpAupDetailNUMDOC: TIntegerField;
    ZpAupDetailDATE_P_POR: TDateTimeField;
    ZpAupDetailNUM_PREDM: TIntegerField;
    ZpAupDetailUID_SHOP: TIntegerField;
    ZpAupDetailName: TStringField;
    ZpAupDetailAdress: TStringField;
    ZpAupDetailSUM_NAL: TFloatField;
    ZpAupDetailFAMILY: TStringField;
    ZpAupDetailCREATE_DATE: TDateTimeField;
    ZpAupDetailNAZNACHENIE: TStringField;
    ZpAupDetailPRIMECH: TStringField;
    ExpenseOtherDetail: TADODataSet;
    ExpenseOtherDetailUNICUM_NUM: TIntegerField;
    ExpenseOtherDetailNUMDOC: TIntegerField;
    ExpenseOtherDetailDATE_P_POR: TDateTimeField;
    ExpenseOtherDetailNUM_PREDM: TIntegerField;
    ExpenseOtherDetailUID_SHOP: TIntegerField;
    ExpenseOtherDetailNAME: TStringField;
    ExpenseOtherDetailAdress: TStringField;
    ExpenseOtherDetailSUM_NAL: TFloatField;
    ExpenseOtherDetailSUM_NOT_NAL: TFloatField;
    ExpenseOtherDetailPRIMECH: TStringField;
    ExpenseOtherDetailCREATE_DATE: TDateTimeField;
    ExpenseOtherDetailNAZNACHENIE: TStringField;
    ExpenseOtherDetailTYPE_DOC: TStringField;
    ExpenseOtherDetailFAMILY: TStringField;
    UserIsAdmin: TBooleanField;
    GetIncomeCashDetail: TADODataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    SmallintField1: TSmallintField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    AdoCmd: TADOCommand;
    GetIncomeDetailStatusDoc: TStringField;
    ExpenceDetailStatusDoc: TStringField;
    CorrExpenceZPDocUNICUM_NUM: TIntegerField;
    CorrExpenceZPDocNUMDOC: TIntegerField;
    CorrExpenceZPDocDATE_P_POR: TDateTimeField;
    CorrExpenceZPDocNUM_PREDM: TIntegerField;
    CorrExpenceZPDocUID_SHOP: TIntegerField;
    CorrExpenceZPDocNAME: TStringField;
    CorrExpenceZPDocAdress: TStringField;
    CorrExpenceZPDocSUM_NAL: TFloatField;
    CorrExpenceZPDocSUM_NOT_NAL: TFloatField;
    CorrExpenceZPDocPRIMECH: TStringField;
    CorrExpenceZPDocFAMILY: TStringField;
    CorrExpenceZPDocCREATE_DATE: TDateTimeField;
    CorrExpenceZPDocNAZNACHENIE: TStringField;
    CorrExpenceZPDocTYPE_DOC: TStringField;
    CorrExpenceZPDocStatusDoc: TStringField;
    ZpAupDetailStatusDoc: TStringField;
    TaxToZpHeadDoc: TADODataSet;
    TaxToZpDetail: TADODataSet;
    GetTaxToZpDetail: TADODataSet;
    GetTaxToZpDetailUNICUM_NUM: TIntegerField;
    GetTaxToZpDetailNUMDOC: TIntegerField;
    GetTaxToZpDetailDATE_P_POR: TDateTimeField;
    GetTaxToZpDetailNUM_PREDM: TIntegerField;
    GetTaxToZpDetailUID_SHOP: TIntegerField;
    GetTaxToZpDetailName: TStringField;
    GetTaxToZpDetailAdress: TStringField;
    GetTaxToZpDetailSUM_NOT_NAL: TFloatField;
    GetTaxToZpDetailFAMILY: TStringField;
    GetTaxToZpDetailCREATE_DATE: TDateTimeField;
    GetTaxToZpDetailPRIMECH: TStringField;
    GetTaxToZpDetailStatusDoc: TStringField;
    CorrTaxToZpH: TADODataSet;
    IncomeDifference: TADODataSet;
    IncomeDifferenceIncome_Difference_Nal_Curr: TFloatField;
    IncomeDifferenceIncome_Difference_Nal_Range: TFloatField;
    IncomeDifferenceIncome_Difference_Not_Nal_Curr: TFloatField;
    IncomeDifferenceIncome_Difference_Not_Nal_Range: TFloatField;
    GetIncomeCashDetailStatusDoc: TStringField;
    PercentOfTerminalHeadDoc: TADODataSet;
    PercentOfTerminalDetail: TADODataSet;
    GetPercentOfTerminalDetail: TADODataSet;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    DateTimeField2: TDateTimeField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField3: TFloatField;
    StringField5: TStringField;
    DateTimeField3: TDateTimeField;
    StringField6: TStringField;
    StringField7: TStringField;
    CorrPercentOfTerminalH: TADODataSet;
    MaxUnicumNumPercentOfTerminal: TADODataSet;
    MaxUnicumNumPercentOfTerminalUNICUM_NUM: TIntegerField;
    MaxUnicumNumPercentOfTerminalNUMDOC: TIntegerField;
    DeletePercentOfTerminalDoc: TADODataSet;
    GetIncomeDetailPrimech: TStringField;
    GetIncomeCashDetailPRIMECH: TStringField;
    Organiz: TADODataSet;
    OrganizUID: TIntegerField;
    OrganizName: TStringField;
    OrganizAdress: TStringField;
    OrganizINN: TStringField;
    OrganizKPP: TStringField;
    OrganizRESERVE: TStringField;
    ExpenceDetailRECIPIENT: TStringField;
    ExpenceDetailZpIntegerField: TIntegerField;
    ExpenceDetailZpIntegerField2: TIntegerField;
    ExpenceDetailZpDateTimeField: TDateTimeField;
    ExpenceDetailZpSmallintField: TSmallintField;
    ExpenceDetailZpStringField: TStringField;
    ExpenceDetailZpStringField2: TStringField;
    ExpenceDetailZpFloatField: TFloatField;
    ExpenceDetailZpFloatField2: TFloatField;
    ExpenceDetailZpStringField3: TStringField;
    ExpenceDetailZpDateTimeField2: TDateTimeField;
    ExpenceDetailZpStringField4: TStringField;
    ExpenceDetailZpStringField5: TStringField;
    ExpenceDetailZpIntegerField3: TIntegerField;
    ExpenceDetailZpStringField6: TStringField;
    ExpenceDetailZpStringField7: TStringField;
    ExpenceDetailZpStringField8: TStringField;
    GetIncomeDetailOTMETKA: TStringField;
    ExpenceDetailZpOTMETKA: TStringField;
    ExpenceDetailOTMETKA: TStringField;
    ExpenseOtherDetailOTMETKA: TStringField;
    ZpAupDetailOTMETKA: TStringField;
    GetTaxToZpDetailOTMETKA: TStringField;
    GetPercentOfTerminalDetailOTMETKA: TStringField;
    CorrExpenceZPDocOTMETKA: TStringField;
    ShipmentHeadDoc: TADODataSet;
    ShipmentDetailDoc: TADODataSet;
    MaxUnicumNumShipment: TADODataSet;
    MaxUnicumNumShipmentUNICUM_NUM: TIntegerField;
    MaxUnicumNumShipmentNUMDOC: TIntegerField;
    ShipmentDetail: TADODataSet;
    DeleteShipment: TADODataSet;
    CorrShipmentH: TADODataSet;
    ShipmentDetailUNICUM_NUM: TIntegerField;
    ShipmentDetailNUMDOC: TIntegerField;
    ShipmentDetailDATE_P_POR: TDateTimeField;
    ShipmentDetailNUM_PREDM: TSmallintField;
    ShipmentDetailNAME: TStringField;
    ShipmentDetailAdress: TStringField;
    ShipmentDetailSUM_NAL: TFloatField;
    ShipmentDetailSUM_NOT_NAL: TFloatField;
    ShipmentDetailFAMILY: TStringField;
    ShipmentDetailCREATE_DATE: TDateTimeField;
    ShipmentDetailTYPE_DOC: TStringField;
    ShipmentDetailUID_SHOP: TIntegerField;
    ShipmentDetailPRIMECH: TStringField;
    ShipmentDetailStatusDoc: TStringField;
    ShipmentDetailOTMETKA: TStringField;
    ShipmentDetailSUPPLIER: TStringField;
    OffsHeadDoc: TADODataSet;
    OffsDetailDoc: TADODataSet;
    MaxUnicumNumOffs: TADODataSet;
    MaxUnicumNumOffsUNICUM_NUM: TIntegerField;
    MaxUnicumNumOffsNUMDOC: TIntegerField;
    GetDetailOffs: TADODataSet;
    DeleteOffsDoc: TADODataSet;
    GetDetailOffsUNICUM_NUM: TIntegerField;
    GetDetailOffsNUMDOC: TIntegerField;
    GetDetailOffsUID_SHOP: TIntegerField;
    GetDetailOffsNAME: TStringField;
    GetDetailOffsADRESS: TStringField;
    GetDetailOffsSUM_NAL: TFloatField;
    GetDetailOffsDATE_P_POR: TDateTimeField;
    GetDetailOffsStatusDoc: TStringField;
    GetDetailOffsOTMETKA: TStringField;
    GetDetailOffsPRIMECH: TStringField;
    CorrOffHeadDoc: TADODataSet;
    GetDetailOffsNUM_PREDM: TIntegerField;
    ExpenseOtherDetailRECIPIENT: TStringField;
    GetDetailOffsSUM_NOT_NAL: TFloatField;
    PublicUtilitiesHeadDoc: TADODataSet;
    PublicUtilitiesDetailDoc: TADODataSet;
    PublicUtilitiesHeadDocUNICUM_NUM: TIntegerField;
    PublicUtilitiesHeadDocNUMDOC: TIntegerField;
    PublicUtilitiesHeadDocCREATE_DATE: TDateTimeField;
    GetPublicUtilitiesDetail: TADODataSet;
    GetPublicUtilitiesDetailUNICUM_NUM: TIntegerField;
    GetPublicUtilitiesDetailNUMDOC: TIntegerField;
    GetPublicUtilitiesDetailDATE_P_POR: TDateTimeField;
    GetPublicUtilitiesDetailSUM_NAL: TFloatField;
    GetPublicUtilitiesDetailSUM_NOT_NAL: TFloatField;
    GetPublicUtilitiesDetailUID_SHOP: TIntegerField;
    GetPublicUtilitiesDetailName: TStringField;
    GetPublicUtilitiesDetailAdress: TStringField;
    GetPublicUtilitiesDetailSUPPLIER_NAME: TStringField;
    GetPublicUtilitiesDetailTypeEnergy_NAME: TStringField;
    GetPublicUtilitiesDetailNUM_PREDM: TIntegerField;
    GetPublicUtilitiesDetailFAMILY: TStringField;
    GetPublicUtilitiesDetailPRIMECH: TStringField;
    GetPublicUtilitiesDetailStatusDoc: TStringField;
    GetPublicUtilitiesDetailOTMETKA: TStringField;
    DeletePublicUtilitiesDoc: TADODataSet;
    TypeEnergySet: TADODataSet;
    TypeEnergySetUID: TIntegerField;
    TypeEnergySetName: TStringField;
    TypeEnergySetReserve: TStringField;
    StateBuh: TADODataSet;
    StateBuhUID: TIntegerField;
    StateBuhsName: TStringField;
    StateBuhReserve: TStringField;
    GetInfoAccess: TADODataSet;
    DeleteShopRes: TIntegerField;
    GetSumCashBox: TADODataSet;
    GetSumCashBoxSUM_NAL: TFloatField;
    CorrSumCashBox: TADODataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure MaxUnicumNumIncBeforeOpen(DataSet: TDataSet);
    procedure MaxUnicumNumExpenseBeforeOpen(DataSet: TDataSet);
    procedure ExpenceDetailZpBeforeOpen(DataSet: TDataSet);
    procedure MaxUnicumNumZpAupBeforeOpen(DataSet: TDataSet);
    procedure UserAccessBeforeOpen(DataSet: TDataSet);
    procedure UsersBeforeOpen(DataSet: TDataSet);
    procedure ExpenseOtherDetailBeforeOpen(DataSet: TDataSet);
    procedure UserAfterScroll(DataSet: TDataSet);
    procedure GetIncomeCashDetailBeforeOpen(DataSet: TDataSet);
    procedure GetTaxToZpDetailBeforeOpen(DataSet: TDataSet);
    procedure MaxUnicumNumPercentOfTerminalBeforeOpen(DataSet: TDataSet);
    procedure GetPercentOfTerminalDetailBeforeOpen(DataSet: TDataSet);
    procedure MaxUnicumNumShipmentBeforeOpen(DataSet: TDataSet);
    procedure MaxUnicumNumOffsBeforeOpen(DataSet: TDataSet);
    procedure GetSumCashBoxBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure QuitApplication(const Msg: string);
    function CheckStatus: Boolean;
    function GetNum: variant;
    function GetDate: variant;
    function GetBegDate: variant;
    function GetEndDate: variant;

  public
    { Public declarations }
    procedure AccessArraySetting;

  published
    property Num: variant read GetNum;
    property Date: variant read GetDate;
    property BegDate: variant read GetBegDate;
    property EndDate: variant read GetEndDate;
  end;

var
  AppData: TAppData;
  AccessM: set of Byte;

implementation

uses sConst, Main, Range, User, Login, Globals, Access;

{$R *.dfm}

resourcestring
  
  SServerConnect   = 'Provider=SQLOLEDB.1;' +
                     'Persist Security Info=False;' +
                     'Initial Catalog=FOLIOBASE2;'+
                     'Data Source=%s';
{ TReportData }




procedure TAppData.DataModuleCreate(Sender: TObject);
var
  Str: string;
begin
  if RegisterUser(g_User, Str, g_Server) then
  try
    Connection.ConnectionString := Format(SServerConnect, [g_Server]);
    Connection.Open(g_User, Str);
    CheckStatus();
  except
    on E: Exception do QuitApplication(Format(SConnectError, [E.Message]));
  end
  else
  begin
    QuitApplication(EmptyStr);
    Exit;
  end;
end;

procedure TAppData.QuitApplication(const Msg: string);
begin
  if Msg <> '' then
    MessageDlg(Msg, mtError, [mbOk], 0);
  Application.Terminate();
end;

function TAppData.CheckStatus: Boolean;
begin
  try
    Users.Active := True;
    // Проверка пользователя
    if not Users.Locate('Login', g_User, []) then
      QuitApplication(Format(SUserNotRegistered, [g_User]))
    else
    begin
      g_UserUID  := Users.FieldByName('UID').AsInteger;
    end;
  finally
    Users.Active := False;
    TypeAccess.Active := False;
  end;
end;



procedure TAppData.MaxUnicumNumIncBeforeOpen(DataSet: TDataSet);
begin
  MaxUnicumNumInc.CommandText := SSQLGetMaxUnicumNumInc;
end;

procedure TAppData.MaxUnicumNumExpenseBeforeOpen(DataSet: TDataSet);
begin
   MaxUnicumNumExpense.CommandText := SSQLGetMaxUnicumNumExpense;
end;

function TAppData.GetBegDate: variant;
begin
   if f_GetDate = 0 then
    Result := FormatDateTime('dd.mm.yyyy', DBeg)+ ' ' + 'г.'
  else
  if f_GetDate = 1 then
    Result := FormatDateTime('dd.mm.yyyy', RangeForm.BeginPicker.Date)+ ' ' + 'г.';
end;

function TAppData.GetEndDate: variant;
begin
   if f_GetDate = 0 then
      Result := FormatDateTime('dd.mm.yyyy',DEnd)+ ' ' + 'г.'
   else
   if f_GetDate = 1 then
       Result := FormatDateTime('dd.mm.yyyy', RangeForm.EndPicker.Date)+ ' ' + 'г.';
end;

procedure TAppData.ExpenceDetailZpBeforeOpen(DataSet: TDataSet);
begin
   ExpenceDetailZp.CommandText := Format(SSQLGetExpenceZPDetail, [MainForm.ReestrExpenseZP.FieldByName('UNICUM_NUM').AsInteger]);
end;

procedure TAppData.MaxUnicumNumZpAupBeforeOpen(DataSet: TDataSet);
begin
   MaxUnicumNumZpAup.CommandText := SSQLGetMaxUnicumNumZpAup;
end;

procedure TAppData.UserAccessBeforeOpen(DataSet: TDataSet);
begin
  UserAccess.CommandText := Format(SSQLGetUserAccessModule, [g_UserUID]);
end;

procedure TAppData.UsersBeforeOpen(DataSet: TDataSet);
begin
 Users.CommandText := SSQLGetAllUser;
end;

procedure TAppData.AccessArraySetting;
var
    i: integer;
begin
  UserAccess.Active := False;
  UserAccess.Active := True;

  if UserAccess.RecordCount = 0 then
    Begin
       QuitApplication(Format(SModuleError, [g_User]));
       Exit;
    end
  else
    Begin
      UserAccess.First;
      while not UserAccess.Eof do
        Begin
          For i := 1 to UserAccess.RecordCount do
          Begin
            AccessM := AccessM + [UserAccess.FieldByName('Module_UID').AsInteger];
            UserAccess.Next;
          end;
        end;
    end;
end;

procedure TAppData.ExpenseOtherDetailBeforeOpen(DataSet: TDataSet);
begin
  ExpenseOtherDetail.CommandText := Format(SSQLGetExpenceOtherDetail, [MainForm.ReestrExpenseOther.FieldByName('UNICUM_NUM').AsInteger]);
end;

procedure TAppData.UserAfterScroll(DataSet: TDataSet);
begin
  if Assigned(UserForm) and UserForm.Showing then
    UserForm.AdminBox.Checked := User.FieldByName('IsAdmin').AsBoolean;

 GetInfoAccess.Active := False;
 GetInfoAccess.CommandText := Format(SSQLGetInfoAccess, [User.FieldByName('UID').AsInteger]);
 GetInfoAccess.Active := True;

 if Assigned(AccessForm) and AccessForm.Showing then
    Begin 
       with AccessForm do
       begin
        Bar.Panels[0].Text := EmptyStr;
        Bar.Panels[1].Text := EmptyStr;

        Bar.Panels[0].Text := Bar.Panels[0].Text + 'Модулей: ' + AppDAta.GetInfoAccess.FieldByName('ColModuls').AsString;
        Bar.Panels[1].Text := Bar.Panels[1].Text  + 'Назначений: ' + AppDAta.GetInfoAccess.FieldByName('ColNaznachenie').AsString;
       end;
    end;
end;

procedure TAppData.GetIncomeCashDetailBeforeOpen(DataSet: TDataSet);
begin
  GetIncomeCashDetail.CommandText := Format( SSQLGetIncomeDetail, [MainForm.ReestrIncomeCash.FieldByName('UNICUM_NUM').AsInteger]);
end;

procedure TAppData.GetTaxToZpDetailBeforeOpen(DataSet: TDataSet);
begin
  GetTaxToZpDetail.CommandText := Format(SSQLGetTaxToZpDocDetail, [MainForm.ReestrTaxToZp.FieldByName('UNICUM_NUM').AsInteger]);
end;

procedure TAppData.MaxUnicumNumPercentOfTerminalBeforeOpen(
  DataSet: TDataSet);
begin
   MaxUnicumNumPercentOfTerminal.CommandText := SSQLGetMaxUnicumNumPercentOfTerminal;
end;

procedure TAppData.GetPercentOfTerminalDetailBeforeOpen(DataSet: TDataSet);
begin
   GetPercentOfTerminalDetail.CommandText := Format(SSQLGetPercentOfTerminalDocDetail, [MainForm.ReestrPercentOfTerminal.FieldByName('UNICUM_NUM').AsInteger]);
end;

procedure TAppData.MaxUnicumNumShipmentBeforeOpen(DataSet: TDataSet);
begin
  MaxUnicumNumShipment.CommandText := SSQLGetMaxUnicumNumShipment;
end;

procedure TAppData.MaxUnicumNumOffsBeforeOpen(DataSet: TDataSet);
begin
   MaxUnicumNumOffs.CommandText := SSQLGetMaxUnicumNumOffs;
end;

function TAppData.GetNum: variant;
begin
   case fl_TypeReport of
      TAB_Income: Result := 'Номер: ' + MainForm.ReestrIncome.FieldByName('NUMDOC').AsString;
      TAB_Expense: Result := 'Номер: ' + MainForm.ReestrExpense.FieldByName('NUMDOC').AsString;
      TAB_ExpenseZP: Result := 'Номер: ' +   ExpenceDetailZp.FieldByName('NUMDOC').AsString;
      TAB_ExpenseOther: Result := 'Номер: ' +  MainForm.ReestrExpenseOther.FieldByName('NUMDOC').AsString;
      TAB_ZpAup:  Result := 'Номер: ' +  ZpAupDetail.FieldByName('NUMDOC').AsString;
      TAB_TaxToZp: Result := 'Номер: ' +  GetTaxToZpDetail.FieldByName('NUMDOC').AsString;
      TAB_PercentOfTerminal: Result := 'Номер: ' +   GetPercentOfTerminalDetail.FieldByName('NUMDOC').AsString;
      TAB_ShipmentVostok: Result := 'Номер: ' +  MainForm.ReestrShipmentVostok.FieldByName('NUMDOC').AsString;
      TAB_ShipmentOther:  Result := 'Номер: ' +  MainForm.ReestrShipmentOther.FieldByName('NUMDOC').AsString;
      TAB_Offs:   Result := 'Номер: ' +  MainForm.ReestrOffs.FieldByName('NUMDOC').AsString;
      TAB_Return: Result := 'Номер: ' +  MainForm.ReestrReturn.FieldByName('NUMDOC').AsString;
      TAB_ENVD:   Result := 'Номер: ' +  MainForm.ReestrENVD.FieldByName('NUMDOC').AsString;
      TAB_PublicUtilities: Result := 'Номер: ' +  MainForm.ReestrPublicUtilities.FieldByName('NUMDOC').AsString;
      TAB_IncomeCash: Result := 'Номер: ' + MainForm.ReestrIncomeCash.FieldByName('NUMDOC').AsString;
   end;
end;

function TAppData.GetDate: variant;
begin
   case fl_TypeReport of
      TAB_Income: Result := GetIncomeDetail.FieldByName('DATE_P_POR').AsString;
      TAB_Expense: Result := AppData.ExpenceDetail.FieldByName('DATE_P_POR').AsString;
      TAB_ExpenseZP: Result := ExpenceDetailZp.FieldByName('DATE_P_POR').AsString;
      TAB_ExpenseOther: Result := MainForm.ReestrExpenseOther.FieldByName('Date_P_Por').AsString;
      TAB_ZpAup: Result := ZpAupDetail.FieldByName('Date_P_Por').AsString;
      TAB_TaxToZp: Result := GetTaxToZpDetail.FieldByName('DATE_P_POR').AsString;
      TAB_PercentOfTerminal: Result :=  GetPercentOfTerminalDetail.FieldByName('DATE_P_POR').AsString;
      TAB_ShipmentVostok: Result := MainForm.ReestrShipmentVostok.FieldByName('DATE_P_POR').AsString;
      TAB_ShipmentOther: Result := MainForm.ReestrShipmentOther.FieldByName('DATE_P_POR').AsString;
      TAB_Offs: Result := MainForm.ReestrOffs.FieldByName('DATE_P_POR').AsString;
      TAB_Return: Result := MainForm.ReestrReturn.FieldByName('DATE_P_POR').AsString;
      TAB_ENVD:   Result := MainForm.ReestrENVD.FieldByName('DATE_P_POR').AsString;
      TAB_PublicUtilities: Result := 'Номер: ' +  MainForm.ReestrPublicUtilities.FieldByName('Date_P_Por').AsString;
      TAB_IncomeCash: Result := MainForm.ReestrIncomeCash.FieldByName('Date_P_Por').AsString;
   end;
end;

procedure TAppData.GetSumCashBoxBeforeOpen(DataSet: TDataSet);
begin
    GetSumCashBox.CommandText := SSQLCashActualeSumCashBox;
end;

end.
