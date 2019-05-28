unit IncomeReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, ADODB,  Menus,
  UExcelAdapter, OLEAdapter, UCustomFlexCelReport, UFlexCelReport, Spin;

type
  TReportForm = class(TForm)
    ShopView: TListView;
    Panel1: TPanel;
    AllBtn: TBitBtn;
    CloseBtn: TBitBtn;
    NoSelectBtn: TBitBtn;
    Panel2: TPanel;
    MonthCombo: TComboBox;
    Label1: TLabel;
    IncomeShopReport: TADODataSet;
    PrintBtn: TBitBtn;
    PrintPopupMenu: TPopupMenu;
    PrintPreview: TMenuItem;
    N2: TMenuItem;
    Report: TFlexCelReport;
    Adapter: TOLEAdapter;
    IncomeShopReportUNICUM_NUM: TIntegerField;
    IncomeShopReportUID_SHOP: TIntegerField;
    IncomeShopReportDATE_P_POR: TDateTimeField;
    IncomeShopReportDATE_CREATE: TDateTimeField;
    IncomeShopReportSUM_NAL: TFloatField;
    IncomeShopReportSUM_NOT_NAL: TFloatField;
    IncomeShopReportName: TStringField;
    IncomeShopReportAdress: TStringField;
    ExpenseTotalShop: TADODataSet;
    ExpenseZpTotalShop: TADODataSet;
    YearSpin: TSpinEdit;
    ZpAupTotalShop: TADODataSet;
    ExpenseOtherTotalShop: TADODataSet;
    IncomeCashShopReport: TADODataSet;
    TaxToZpTotalShop: TADODataSet;
    IncomeShopReportNUMDOC: TIntegerField;
    IncomeCashShopReportUNICUM_NUM: TIntegerField;
    IncomeCashShopReportNUMDOC: TIntegerField;
    IncomeCashShopReportUID_SHOP: TIntegerField;
    IncomeCashShopReportDATE_P_POR: TDateTimeField;
    IncomeCashShopReportDATE_CREATE: TDateTimeField;
    IncomeCashShopReportSUM_NAL: TFloatField;
    IncomeCashShopReportSUM_NOT_NAL: TFloatField;
    IncomeCashShopReportName: TStringField;
    IncomeCashShopReportAdress: TStringField;
    PercentOfTermanalTotalShop: TADODataSet;
    PercentOfTermanalTotalShopNUMDOC: TIntegerField;
    PercentOfTermanalTotalShopDATE_P_POR: TDateTimeField;
    PercentOfTermanalTotalShopUID_SHOP: TIntegerField;
    PercentOfTermanalTotalShopName: TStringField;
    PercentOfTermanalTotalShopAdress: TStringField;
    PercentOfTermanalTotalShopSUM_NOT_NAL: TFloatField;
    PercentOfTermanalTotalShopFAMILY: TStringField;
    PercentOfTermanalTotalShopCREATE_DATE: TDateTimeField;
    PercentOfTermanalTotalShopPRIMECH: TStringField;
    ExpenseTotalShopUNICUM_NUM: TIntegerField;
    ExpenseTotalShopNUMDOC: TIntegerField;
    ExpenseTotalShopDATE_P_POR: TDateTimeField;
    ExpenseTotalShopNUM_PREDM: TIntegerField;
    ExpenseTotalShopUID_SHOP: TIntegerField;
    ExpenseTotalShopSUM_NAL: TFloatField;
    ExpenseTotalShopSUM_NOT_NAL: TFloatField;
    ExpenseTotalShopNAZNACHENIE: TStringField;
    ExpenseTotalShopFAMILY: TStringField;
    ExpenseTotalShopCREATE_DATE: TDateTimeField;
    ExpenseTotalShopTYPE_DOC: TStringField;
    ExpenseTotalShopPRIMECH: TStringField;
    ExpenseTotalShopName: TStringField;
    ExpenseTotalShopAdress: TStringField;
    ReportPicker: TDateTimePicker;
    IncomeShopReportPRIMECH: TStringField;
    IncomeCashShopReportPRIMECH: TStringField;
    ReportEndPicker: TDateTimePicker;
    ExpenseTotalShopRECIPIENT: TStringField;
    ExpenseTotalShopFAMILY_1: TStringField;
    ExpenseOtherTotalShopUNICUM_NUM: TIntegerField;
    ExpenseOtherTotalShopNUMDOC: TIntegerField;
    ExpenseOtherTotalShopDATE_P_POR: TDateTimeField;
    ExpenseOtherTotalShopNUM_PREDM: TIntegerField;
    ExpenseOtherTotalShopUID_SHOP: TIntegerField;
    ExpenseOtherTotalShopSUM_NAL: TFloatField;
    ExpenseOtherTotalShopSUM_NOT_NAL: TFloatField;
    ExpenseOtherTotalShopNAZNACHENIE: TStringField;
    ExpenseOtherTotalShopFAMILY: TStringField;
    ExpenseOtherTotalShopCREATE_DATE: TDateTimeField;
    ExpenseOtherTotalShopTYPE_DOC: TStringField;
    ExpenseOtherTotalShopPRIMECH: TStringField;
    ExpenseOtherTotalShopName: TStringField;
    ExpenseOtherTotalShopAdress: TStringField;
    ExpenseOtherTotalShopRECIPIENT: TStringField;
    ExpenseOtherTotalShopFAMILY_1: TStringField;
    ZpAupTotalShopNUMDOC: TIntegerField;
    ZpAupTotalShopDATE_P_POR: TDateTimeField;
    ZpAupTotalShopUID_SHOP: TIntegerField;
    ZpAupTotalShopName: TStringField;
    ZpAupTotalShopAdress: TStringField;
    ZpAupTotalShopSUM_NAL: TFloatField;
    ZpAupTotalShopNAZNACHENIE: TStringField;
    ZpAupTotalShopFAMILY: TStringField;
    ZpAupTotalShopFAMILY_1: TStringField;
    ZpAupTotalShopCREATE_DATE: TDateTimeField;
    ZpAupTotalShopPRIMECH: TStringField;
    TaxToZpTotalShopNUMDOC: TIntegerField;
    TaxToZpTotalShopDATE_P_POR: TDateTimeField;
    TaxToZpTotalShopUID_SHOP: TIntegerField;
    TaxToZpTotalShopName: TStringField;
    TaxToZpTotalShopAdress: TStringField;
    TaxToZpTotalShopSUM_NAL: TFloatField;
    TaxToZpTotalShopNAZNACHENIE: TStringField;
    TaxToZpTotalShopFAMILY: TStringField;
    TaxToZpTotalShopFAMILY_1: TStringField;
    TaxToZpTotalShopCREATE_DATE: TDateTimeField;
    TaxToZpTotalShopPRIMECH: TStringField;
    ExpenseZpTotalShopUNICUM_NUM: TIntegerField;
    ExpenseZpTotalShopNUMDOC: TIntegerField;
    ExpenseZpTotalShopDATE_P_POR: TDateTimeField;
    ExpenseZpTotalShopNUM_PREDM: TIntegerField;
    ExpenseZpTotalShopUID_SHOP: TIntegerField;
    ExpenseZpTotalShopSUM_NAL: TFloatField;
    ExpenseZpTotalShopSUM_NOT_NAL: TFloatField;
    ExpenseZpTotalShopNAZNACHENIE: TStringField;
    ExpenseZpTotalShopFAMILY: TStringField;
    ExpenseZpTotalShopFAMILY_1: TStringField;
    ExpenseZpTotalShopCREATE_DATE: TDateTimeField;
    ExpenseZpTotalShopTYPE_DOC: TStringField;
    ExpenseZpTotalShopPRIMECH: TStringField;
    ExpenseZpTotalShopName: TStringField;
    ExpenseZpTotalShopAdress: TStringField;
    ExpenseZpTotalShopRECIPIENT: TStringField;
    PercentOfTermanalTotalShopFAMILY_1: TStringField;
    ShipmentVostokTotalShop: TADODataSet;
    ShipmentVostokTotalShopUNICUM_NUM: TIntegerField;
    ShipmentVostokTotalShopNUMDOC: TIntegerField;
    ShipmentVostokTotalShopDATE_P_POR: TDateTimeField;
    ShipmentVostokTotalShopNUM_PREDM: TIntegerField;
    ShipmentVostokTotalShopUID_SHOP: TIntegerField;
    ShipmentVostokTotalShopSUM_NAL: TFloatField;
    ShipmentVostokTotalShopSUM_NOT_NAL: TFloatField;
    ShipmentVostokTotalShopSUPPLIER: TStringField;
    ShipmentVostokTotalShopFAMILY: TStringField;
    ShipmentVostokTotalShopFAMILY_1: TStringField;
    ShipmentVostokTotalShopCREATE_DATE: TDateTimeField;
    ShipmentVostokTotalShopTYPE_DOC: TStringField;
    ShipmentVostokTotalShopName: TStringField;
    ShipmentVostokTotalShopAdress: TStringField;
    ShipmentVostokTotalShopPRIMECH: TStringField;
    ShipmentOtherTotalShop: TADODataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    DateTimeField1: TDateTimeField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateTimeField2: TDateTimeField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    OffsShopReport: TADODataSet;
    OffsShopReportUNICUM_NUM: TIntegerField;
    OffsShopReportUID_SHOP: TIntegerField;
    OffsShopReportDATE_P_POR: TDateTimeField;
    OffsShopReportDATE_CREATE: TDateTimeField;
    OffsShopReportSUM_NAL: TFloatField;
    OffsShopReportName: TStringField;
    OffsShopReportAdress: TStringField;
    OffsShopReportNUMDOC: TIntegerField;
    OffsShopReportPRIMECH: TStringField;
    ReturnShopReport: TADODataSet;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    FloatField3: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    IntegerField7: TIntegerField;
    StringField10: TStringField;
    EnvdShopReport: TADODataSet;
    EnvdShopReportSUM_NOT_NAL: TFloatField;
    EnvdShopReportUNICUM_NUM: TIntegerField;
    EnvdShopReportUID_SHOP: TIntegerField;
    EnvdShopReportDATE_P_POR: TDateTimeField;
    EnvdShopReportDATE_CREATE: TDateTimeField;
    EnvdShopReportName: TStringField;
    EnvdShopReportAdress: TStringField;
    EnvdShopReportNUMDOC: TIntegerField;
    EnvdShopReportPRIMECH: TStringField;
    PUShopReport: TADODataSet;
    PUShopReportUNICUM_NUM: TIntegerField;
    PUShopReportNUMDOC: TIntegerField;
    PUShopReportDATE_P_POR: TDateTimeField;
    PUShopReportNUM_PREDM: TIntegerField;
    PUShopReportUID_SHOP: TIntegerField;
    PUShopReportSUM_NAL: TFloatField;
    PUShopReportSUM_NOT_NAL: TFloatField;
    PUShopReportUID_SUPPLIER: TIntegerField;
    PUShopReportUID_TYPE_ENERGY: TIntegerField;
    PUShopReportSUPPLIER_NAME: TStringField;
    PUShopReportTypeEnergy_NAME: TStringField;
    PUShopReportFAMILY: TStringField;
    PUShopReportFAMILY_1: TStringField;
    PUShopReportPRIMECH: TStringField;
    PUShopReportName: TStringField;
    PUShopReportAdress: TStringField;
    procedure AllBtnClick(Sender: TObject);
    procedure CheckFClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure MonthComboChange(Sender: TObject);
    procedure PrintPreviewClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    function GetNameShop: variant;
    function GetAdressShop: variant;
    function GetMontnReport: variant;
    function GetYearSpin: variant;

    // Отчет по выбранному месяцу
    procedure ReportIncomeDoc;
    procedure ReportIncomeCashDoc;
    procedure ReportExpenceDoc;
    procedure ReportExpenceZpDoc;
    procedure ReportExpenceOtherDoc;
    procedure ReportZpAupDoc;
    procedure ReportTaxToZp;
    procedure ReportPercentOfTerminate;
    procedure ReportShipmentVostokDoc;
    procedure ReportShipmentOtherDoc;
    procedure ReportOffsDoc;
    procedure ReportReturnDoc;
    procedure ReportEnvdDoc;
    procedure ReportPublicUtilitiesDoc;

    // Отчет по дате
    procedure ReportIncomeDayDoc;
    procedure ReportIncomeCashDayDoc;
    procedure ReportExpenceDayDoc;
    procedure ReportExpenceZpDayDoc;
    procedure ReportExpenceOtherDayDoc;
    procedure ReportZpAupDayDoc;
    procedure ReportTaxToZpDayDoc;
    procedure ReportPercentOfTerminateDayDoc;
    procedure ReportShipmentVostokDayDoc;
    procedure ReportShipmentOtherDayDoc;
    procedure ReportOffsDayDoc;
    procedure ReportReturnDayDoc;
    procedure ReportEnvdDayDoc;
    procedure ReportPublicUtilitiesDayDoc;


  public
    { Public declarations }
    procedure SettingReportForm(TypeReport: integer);
  published
    property Name: variant read GetNameShop;
    property Adress: variant read GetAdressShop;
    property Month: variant read GetMontnReport;
    property Year:  variant read GetYearSpin;
  end;

var
  ReportForm: TReportForm;

implementation

uses ModuleData, Main, Shop, sConst, Globals;

{$R *.dfm}

procedure TReportForm.AllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  ShopView.Items.BeginUpdate();
  try
    for I := 0 to ShopView.Items.Count - 1 do
      ShopView.Items[I].Checked := True;
  finally
    ShopView.Items.EndUpdate();
  end;
end;

procedure TReportForm.CheckFClick(Sender: TObject);
var
  I: Integer;
begin
  ShopView.Items.BeginUpdate();
  try
    for I := 0 to ShopView.Items.Count - 1 do
      ShopView.Items[I].Checked := False;
  finally
    ShopView.Items.EndUpdate();
  end;
end;

procedure TReportForm.PrintBtnClick(Sender: TObject);
begin
    case fl_TypeReport of
    0: Begin
            case TypeReport of
              TAB_Income:       ReportIncomeDoc();
              TAB_Expense:      ReportExpenceDoc();
              TAB_ExpenseZP:    ReportExpenceZpDoc();
              TAB_ExpenseOther: ReportExpenceOtherDoc();
              TAB_ZpAup:        ReportZpAupDoc();
              TAB_TaxToZp:      ReportTaxToZp();
              TAB_PercentOfTerminal: ReportPercentOfTerminate();
              TAB_ShipmentVostok: ReportShipmentVostokDoc();
              TAB_ShipmentOther:  ReportShipmentOtherDoc();
              TAB_Offs:           ReportOffsDoc();
              TAB_Return:         ReportReturnDoc();
              TAB_ENVD:           ReportEnvdDoc();
              TAB_PublicUtilities:  ReportPublicUtilitiesDoc();
              TAB_IncomeCash:     ReportIncomeCashDoc();
            end;
          end;

    1:  Begin
          if ReportPicker.Date > ReportEndPicker.Date then
            Begin
                MessageBox(Handle, PChar('Выбранная дата больше конечной'), PChar('Отчет(за дату)'), MB_ICONWARNING+MB_OK);
                ReportPicker.Date := Now();
            end
          else
            Begin
              Case  TypeReport of
                  TAB_Income: ReportIncomeDayDoc();
                  TAB_Expense: ReportExpenceDayDoc();
                  TAB_ExpenseZP: ReportExpenceZpDayDoc();
                  TAB_ExpenseOther: ReportExpenceOtherDayDoc();
                  TAB_ZpAup: ReportZpAupDayDoc();
                  TAB_TaxToZp: ReportTaxToZpDayDoc();
                  TAB_PercentOfTerminal: ReportPercentOfTerminateDayDoc();
                  TAB_ShipmentVostok: ReportShipmentVostokDayDoc();
                  TAB_ShipmentOther:  ReportShipmentOtherDayDoc();
                  TAB_Offs:           ReportOffsDayDoc();
                  TAB_Return:         ReportReturnDayDoc();
                  TAB_ENVD:           ReportEnvdDayDoc();
                  TAB_PublicUtilities:  ReportPublicUtilitiesDayDoc();
                  TAB_IncomeCash: ReportIncomeCashDayDoc();
              end;
            end;
        end;
    end;
//  PrintPopupMenu.Popup(PrintBtn.ClientOrigin.X, PrintBtn.ClientOrigin.Y + PrintBtn.Height);
end;

function TReportForm.GetNameShop: variant;
begin
  case TypeReport of
     TAB_Income:       Result := 'Магазин: ' + IncomeShopReport.FieldByName('Name').AsString;
     TAB_Expense:      Result := 'Магазин: ' + ExpenseTotalShop.FieldByName('Name').AsString;
     TAB_ExpenseZP:    Result := 'Магазин: ' + ExpenseZpTotalShop.FieldByName('Name').AsString;
     TAB_ExpenseOther: Result := 'Магазин: ' + ExpenseOtherTotalShop.FieldByName('Name').AsString;
     TAB_ZpAup:        Result := 'Магазин: ' + ZpAupTotalShop.FieldByName('Name').AsString;
     TAB_TaxToZp:      Result := 'Магазин: ' + TaxToZpTotalShop.FieldByName('Name').AsString;
     TAB_PercentOfTerminal: Result := 'Магазин: ' + PercentOfTermanalTotalShop.FieldByName('Name').AsString;
     TAB_ShipmentVostok:  Result := 'Магазин: ' + ShipmentVostokTotalShop.FieldByName('Name').AsString;
     TAB_ShipmentOther:   Result := 'Магазин: ' + ShipmentOtherTotalShop.FieldByName('Name').AsString;
     TAB_Offs:            Result := 'Магазин: ' + OffsShopReport.FieldByName('Name').AsString;
     TAB_Return:          Result := 'Магазин: ' + ReturnShopReport.FieldByName('Name').AsString;
     TAB_ENVD:            Result := 'Магазин: ' + EnvdShopReport.FieldByName('Name').AsString;
     TAB_PublicUtilities: Result := 'Магазин: ' + PUShopReport.FieldByName('Name').AsString;
     TAB_IncomeCash:   Result := 'Магазин: ' + IncomeCashShopReport.FieldByName('Name').AsString;
  end;
end;

function TReportForm.GetAdressShop: variant;
begin
  case TypeReport of
    TAB_Income:       Result := 'Адрес: ' + IncomeShopReport.FieldByName('Adress').AsString;
    TAB_Expense:      Result := 'Адрес: ' + ExpenseTotalShop.FieldByName('Adress').AsString;
    TAB_ExpenseZP:    Result := 'Адрес: ' + ExpenseZpTotalShop.FieldByName('Adress').AsString;
    TAB_ExpenseOther: Result := 'Адрес: ' + ExpenseOtherTotalShop.FieldByName('Adress').AsString;
    TAB_ZpAup:        Result := 'Адрес: ' + ZpAupTotalShop.FieldByName('Adress').AsString;
    TAB_TaxToZp:      Result := 'Адрес: ' + TaxToZpTotalShop.FieldByName('Adress').AsString;
    TAB_PercentOfTerminal: Result := 'Адрес: ' + PercentOfTermanalTotalShop.FieldByName('Adress').AsString;
    TAB_ShipmentVostok:    Result := 'Адрес: ' + ShipmentVostokTotalShop.FieldByName('Adress').AsString;
    TAB_ShipmentOther:     Result := 'Адрес: ' + ShipmentOtherTotalShop.FieldByName('Adress').AsString;
    TAB_Offs:              Result := 'Адрес: ' + OffsShopReport.FieldByName('Adress').AsString;
    TAB_Return:            Result := 'Адрес: ' + ReturnShopReport.FieldByName('Adress').AsString;
    TAB_ENVD:              Result := 'Адрес: ' + EnvdShopReport.FieldByName('Adress').AsString;
    TAB_PublicUtilities:   Result := 'Адрес: ' + PUShopReport.FieldByName('Adress').AsString;
    TAB_IncomeCash:   Result := 'Адрес: ' + IncomeCashShopReport.FieldByName('Adress').AsString;
  end;
end;

procedure TReportForm.MonthComboChange(Sender: TObject);
begin
  if fl_TypeReport = 0 then
    Begin
      if MonthCombo.ItemIndex <> 0 then
        PrintBtn.Enabled := True
      else
      if MonthCombo.ItemIndex = 0 then
        PrintBtn.Enabled := False;
    end
  else
         PrintBtn.Enabled := True;
end;

function TReportForm.GetMontnReport: variant;
begin
  case fl_TypeReport of
      0:  Result := MonthCombo.Text;
      1:  Result := FormatDateTime('dd.mm.yyyy', ReportPicker.Date) + ' - ' + FormatDateTime('dd.mm.yyyy', ReportEndPicker.Date);
  end;
end;

procedure TReportForm.PrintPreviewClick(Sender: TObject);
begin
{  case TypeReport of
    TAB_Income:       ReportIncomeDoc();
    TAB_Expense:      ReportExpenceDoc();
    TAB_ExpenseZP:    ReportExpenceZpDoc();
    TAB_ExpenseOther: ReportExpenceOtherDoc();
    TAB_ZpAup:        ReportZpAupDoc();
    TAB_IncomeCash:   ReportIncomeCashDoc();
    TAB_TaxToZp:      ReportTaxToZp();
    TAB_PercentOfTerminal: ReportPercentOfTerminate();
  end; }
end;

procedure TReportForm.CloseBtnClick(Sender: TObject);
begin
  Close();
end;

procedure TReportForm.ReportExpenceDoc;
var
  I: Integer;
  Item: TListItem;
begin
  if  MonthCombo.ItemIndex = 0 then
  Begin
    ShowMessage('Выберите месяц');
    PrintBtn.Enabled := False;
  end
  else
  Begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ExpenseTotalShop.Active := False;
          ExpenseTotalShop.CommandText := Format(SSQLExpenseTotalShop, [StrToInt(Item.Caption), MonthCombo.ItemIndex, YearSpin.Value]);
          ExpenseTotalShop.Active :=  True;
          ExpenseTotalShop.DisableControls();
          Report.Template := SExpenseTotalShop;
          Report.Run;
          ExpenseTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
  end;
end;

procedure TReportForm.ReportIncomeDoc;
var
  I: Integer;
  Item: TListItem;
begin
  if  MonthCombo.ItemIndex = 0 then
  Begin
    ShowMessage('Выберите месяц');
    PrintBtn.Enabled := False;
  end
  else
  Begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          IncomeShopReport.Active := False;
          IncomeShopReport.CommandText := Format(SSQlIncomeShopReport, [StrToInt(Item.Caption), MonthCombo.ItemIndex, YearSpin.Value]);
          IncomeShopReport.Active :=  True;
          IncomeShopReport.DisableControls();
          Report.Template := SIncomeTotalShop;
          Report.Run;
          IncomeShopReport.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
  end;
end;

procedure TReportForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
    i:integer;
begin
  MonthCombo.ItemIndex := 0;
  for I := 0 to ShopView.Items.Count - 1 do
   ShopView.Items[I].Checked := False;
end;

procedure TReportForm.FormActivate(Sender: TObject);
var
    Item: TListItem;
begin
  YearSpin.Value := CurrentYear;

  if fl_TypeReport = 0 then
    begin
      if MonthCombo.ItemIndex = 0 then
        PrintBtn.Enabled := False
    end
  else
        PrintBtn.Enabled := True;

  ShopView.Items.Clear;
  AppData.Organiz.Active := True;
  ShopView.Items.BeginUpdate();
  AppData.Organiz.First;
  try
    while not AppData.Organiz.Eof do
    begin
      Item := ShopView.Items.Add;
      Item.Caption := AppData.Organiz.FieldByName('UID').AsString;
      Item.SubItems.Add(AppData.Organiz.FieldByName('Name').AsString);
      Item.SubItems.Add(AppData.Organiz.FieldByName('Adress').AsString);
      AppData.Organiz.Next;
    end;
   finally
    ShopView.Items.EndUpdate();
   end;
end;



procedure TReportForm.ReportExpenceZpDoc;
var
  I: Integer;
  Item: TListItem;
begin
  if  MonthCombo.ItemIndex = 0 then
  Begin
    ShowMessage('Выберите месяц');
    PrintBtn.Enabled := False;
  end
  else
  Begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ExpenseZpTotalShop.Active := False;
          ExpenseZpTotalShop.CommandText := Format(SSQLExpenseZPTotalShop, [StrToInt(Item.Caption), MonthCombo.ItemIndex, YearSpin.Value]);
          ExpenseZpTotalShop.Active :=  True;
          ExpenseZpTotalShop.DisableControls();
          Report.Template := SExpenseTotalShopZp;
          Report.Run;
          ExpenseTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
  end;
end;

function TReportForm.GetYearSpin: variant;
begin
  case  fl_TypeReport of
     0: Result := IntToStr(YearSpin.Value) + ' г.';
     1: Result := EmptyStr;
  end;
end;

procedure TReportForm.ReportZpAupDoc;
var
  I: Integer;
  Item: TListItem;
begin
  if  MonthCombo.ItemIndex = 0 then
  Begin
    ShowMessage('Выберите месяц');
    PrintBtn.Enabled := False;
  end
  else
  Begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ZpAupTotalShop.Active := False;
          ZpAupTotalShop.CommandText := Format(SSQLZpAupTotalShop, [StrToInt(Item.Caption), MonthCombo.ItemIndex, YearSpin.Value]);
          ZpAupTotalShop.Active :=  True;
          ZpAupTotalShop.DisableControls();
          Report.Template := SZpAUPTotalShop;
          Report.Run;
          ExpenseTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
  end;

end;

procedure TReportForm.ReportExpenceOtherDoc;
var
  I: Integer;
  Item: TListItem;
begin
  if  MonthCombo.ItemIndex = 0 then
  Begin
    ShowMessage('Выберите месяц');
    PrintBtn.Enabled := False;
  end
  else
  Begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ExpenseOtherTotalShop.Active := False;
          ExpenseOtherTotalShop.CommandText := Format(SSQLExpenseOtherTotalShop, [StrToInt(Item.Caption), MonthCombo.ItemIndex, YearSpin.Value]);
          ExpenseOtherTotalShop.Active :=  True;
          ExpenseOtherTotalShop.DisableControls();
          Report.Template := SExpenseOtherTotalShop;
          Report.Run;
          ExpenseOtherTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
  end;
end;

procedure TReportForm.ReportIncomeCashDoc;
var
  I: Integer;
  Item: TListItem;
begin
  if  MonthCombo.ItemIndex = 0 then
  Begin
    ShowMessage('Выберите месяц');
    PrintBtn.Enabled := False;
  end
  else
  Begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          IncomeCashShopReport.Active := False;
          IncomeCashShopReport.CommandText := Format(SSQlIncomeCashShopReport, [StrToInt(Item.Caption), MonthCombo.ItemIndex, YearSpin.Value]);
          IncomeCashShopReport.Active :=  True;
          IncomeCashShopReport.DisableControls();
          Report.Template := SIncomeCashTotalShop;
          Report.Run;
          IncomeCashShopReport.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
  end;
end;

procedure TReportForm.ReportTaxToZp;
var
  I: Integer;
  Item: TListItem;
begin
  if  MonthCombo.ItemIndex = 0 then
  Begin
    ShowMessage('Выберите месяц');
    PrintBtn.Enabled := False;
  end
  else
  Begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          TaxToZpTotalShop.Active := False;
          TaxToZpTotalShop.CommandText := Format(SSQLTaxToZpTotalShop, [StrToInt(Item.Caption), MonthCombo.ItemIndex, YearSpin.Value]);
          TaxToZpTotalShop.Active :=  True;
          TaxToZpTotalShop.DisableControls();
          Report.Template := STaxToZpTotalShop;
          Report.Run;
          TaxToZpTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
  end;

end;

procedure TReportForm.ReportPercentOfTerminate;
var
  I: Integer;
  Item: TListItem;
begin
  if  MonthCombo.ItemIndex = 0 then
  Begin
    ShowMessage('Выберите месяц');
    PrintBtn.Enabled := False;
  end
  else
  Begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          PercentOfTermanalTotalShop.Active := False;
          PercentOfTermanalTotalShop.CommandText := Format(SSQLPercentOfTerminalTotalShop, [StrToInt(Item.Caption), MonthCombo.ItemIndex, YearSpin.Value]);
          PercentOfTermanalTotalShop.Active :=  True;
          PercentOfTermanalTotalShop.DisableControls();
          Report.Template := SPercentOfTerminalTotalShop;
          Report.Run;
          PercentOfTermanalTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
  end;
end;

procedure TReportForm.SettingReportForm(TypeReport: integer);
begin
    case TypeReport of
      0:    begin
               YearSpin.Visible := True;
               MonthCombo.Visible := True;
               ReportPicker.Visible := False;
               ReportEndPicker.Visible  := False;
            end;

      1:    begin
               YearSpin.Visible := False;
               MonthCombo.Visible := False;

               ReportPicker.Date := Now();
               ReportPicker.Left :=  MonthCombo.Left;
               ReportPicker.Top := MonthCombo.Top;
               ReportPicker.Visible := True;

               ReportEndPicker.Date := ReportPicker.Date + 1;
               ReportEndPicker.Left := 150;
               ReportEndPicker.Top := ReportPicker.Top;
               ReportEndPicker.Visible := True;

            end;
    end;
end;


 // Отчеты по выбранной дате


procedure TReportForm.ReportIncomeDayDoc;
var
  I: Integer;
  Item: TListItem;
begin

    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          IncomeShopReport.Active := False;
          IncomeShopReport.CommandText := Format(SSQLIncomeDayShopReport, [StrToInt(Item.Caption),
                                                                           FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                           FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          IncomeShopReport.Active :=  True;
          IncomeShopReport.DisableControls();
          Report.Template := SIncomeTotalShop;
          Report.Run;
          IncomeShopReport.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TReportForm.ReportIncomeCashDayDoc;
var
  I: Integer;
  Item: TListItem;
begin

    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          IncomeCashShopReport.Active := False;
          IncomeCashShopReport.CommandText := Format(SSQLIncomeCashDayShopReport, [StrToInt(Item.Caption),
                                                                                   FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                                   FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          IncomeCashShopReport.Active :=  True;
          IncomeCashShopReport.DisableControls();
          Report.Template := SIncomeCashTotalShop;
          Report.Run;
          IncomeCashShopReport.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TReportForm.ReportExpenceDayDoc;
var
  I: Integer;
  Item: TListItem;
begin

    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ExpenseTotalShop.Active := False;
          ExpenseTotalShop.CommandText := Format(SSQLDExpenseDayTotalShop, [StrToInt(Item.Caption),
                                                                            FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                            FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          ExpenseTotalShop.Active :=  True;
          ExpenseTotalShop.DisableControls();
          Report.Template := SExpenseTotalShop;
          Report.Run;
          ExpenseTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TReportForm.ReportExpenceOtherDayDoc;
var
  I: Integer;
  Item: TListItem;
begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ExpenseOtherTotalShop.Active := False;
          ExpenseOtherTotalShop.CommandText := Format(SSQLExpenseOtherDayTotalShop, [StrToInt(Item.Caption),
                                                                                     FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                                     FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          ExpenseOtherTotalShop.Active :=  True;
          ExpenseOtherTotalShop.DisableControls();
          Report.Template := SExpenseOtherTotalShop;
          Report.Run;
          ExpenseOtherTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;



procedure TReportForm.ReportExpenceZpDayDoc;
var
  I: Integer;
  Item: TListItem;
begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ExpenseZpTotalShop.Active := False;
          ExpenseZpTotalShop.CommandText := Format(SSQLExpenseZPDayTotalShop, [StrToInt(Item.Caption),
                                                                               FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                               FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          ExpenseZpTotalShop.Active :=  True;
          ExpenseZpTotalShop.DisableControls();
          Report.Template := SExpenseTotalShopZp;
          Report.Run;
          ExpenseTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TReportForm.ReportZpAupDayDoc;
var
  I: Integer;
  Item: TListItem;
begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ZpAupTotalShop.Active := False;
          ZpAupTotalShop.CommandText := Format(SSQLZpAupDayTotalShop, [StrToInt(Item.Caption),
                                                                       FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                       FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          ZpAupTotalShop.Active :=  True;
          ZpAupTotalShop.DisableControls();
          Report.Template := SZpAUPTotalShop;
          Report.Run;
          ExpenseTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TReportForm.ReportTaxToZpDayDoc;
var
  I: Integer;
  Item: TListItem;
begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          TaxToZpTotalShop.Active := False;
          TaxToZpTotalShop.CommandText := Format(SSQLTaxToZpDayTotalShop, [StrToInt(Item.Caption),
                                                                           FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                           FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          TaxToZpTotalShop.Active :=  True;
          TaxToZpTotalShop.DisableControls();
          Report.Template := STaxToZpTotalShop;
          Report.Run;
          TaxToZpTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;



procedure TReportForm.ReportPercentOfTerminateDayDoc;
var
  I: Integer;
  Item: TListItem;
begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          PercentOfTermanalTotalShop.Active := False;
          PercentOfTermanalTotalShop.CommandText := Format(SSQLPercentOfTerminalDayTotalShop, [StrToInt(Item.Caption),
                                                                                               FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                                               FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          PercentOfTermanalTotalShop.Active :=  True;
          PercentOfTermanalTotalShop.DisableControls();
          Report.Template := SPercentOfTerminalTotalShop;
          Report.Run;
          PercentOfTermanalTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TReportForm.ReportShipmentVostokDoc;
var
  I: Integer;
  Item: TListItem;
begin
  if  MonthCombo.ItemIndex = 0 then
  Begin
    ShowMessage('Выберите месяц');
    PrintBtn.Enabled := False;
  end
  else
  Begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ShipmentVostokTotalShop.Active := False;
          ShipmentVostokTotalShop.CommandText := Format(SSQLShipmentVostokTotalShop, [StrToInt(Item.Caption), MonthCombo.ItemIndex, YearSpin.Value]);
          ShipmentVostokTotalShop.Active :=  True;
          ShipmentVostokTotalShop.DisableControls();
          Report.Template := SShipmentVostokTotalShop;
          Report.Run;
          ShipmentVostokTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
  end;
end;


procedure TReportForm.ReportShipmentOtherDoc;
var
  I: Integer;
  Item: TListItem;
begin
  if  MonthCombo.ItemIndex = 0 then
  Begin
    ShowMessage('Выберите месяц');
    PrintBtn.Enabled := False;
  end
  else
  Begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ShipmentOtherTotalShop.Active := False;
          ShipmentOtherTotalShop.CommandText := Format(SSQLShipmentOtherTotalShop, [StrToInt(Item.Caption),
                                                                                    MonthCombo.ItemIndex,
                                                                                    YearSpin.Value]);
          ShipmentOtherTotalShop.Active :=  True;
          ShipmentOtherTotalShop.DisableControls();
          Report.Template := SShipmentOtherTotalShop;
          Report.Run;
          ShipmentOtherTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
  end;
end;



procedure TReportForm.ReportShipmentVostokDayDoc;
var
  I: Integer;
  Item: TListItem;
begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ShipmentVostokTotalShop.Active := False;
          ShipmentVostokTotalShop.CommandText := Format(SSQLShipmentVostokDayTotalShop,  [StrToInt(Item.Caption),
                                                                                               FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                                               FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          ShipmentVostokTotalShop.Active :=  True;
          ShipmentVostokTotalShop.DisableControls();
          Report.Template := SShipmentVostokTotalShop;
          Report.Run;
          ShipmentVostokTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TReportForm.ReportShipmentOtherDayDoc;
var
  I: Integer;
  Item: TListItem;
begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ShipmentOtherTotalShop.Active := False;
          ShipmentOtherTotalShop.CommandText := Format(SSQLShipmentOtherDayTotalShop,  [StrToInt(Item.Caption),
                                                                                               FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                                               FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          ShipmentOtherTotalShop.Active :=  True;
          ShipmentOtherTotalShop.DisableControls();
          Report.Template := SShipmentOtherTotalShop;
          Report.Run;
          ShipmentOtherTotalShop.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;



procedure TReportForm.ReportOffsDoc;
var
  I: Integer;
  Item: TListItem;
begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          OffsShopReport.Active := False;
          OffsShopReport.CommandText := Format(SSQLOffsShopReport,                  [StrToInt(Item.Caption),
                                                                                    MonthCombo.ItemIndex,
                                                                                    YearSpin.Value]);
          OffsShopReport.Active :=  True;
          OffsShopReport.DisableControls();
          Report.Template := SOffsTotalShop;
          Report.Run;
          OffsShopReport.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TReportForm.ReportReturnDoc;
var
  I: Integer;
  Item: TListItem;
begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ReturnShopReport.Active := False;
          ReturnShopReport.CommandText := Format(SSQLReturnShopReport,              [StrToInt(Item.Caption),
                                                                                    MonthCombo.ItemIndex,
                                                                                    YearSpin.Value]);
          ReturnShopReport.Active :=  True;
          ReturnShopReport.DisableControls();
          Report.Template := SReturnTotalShop;
          Report.Run;
          ReturnShopReport.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TReportForm.ReportOffsDayDoc;
var
  I: Integer;
  Item: TListItem;
begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          OffsShopReport.Active := False;
          OffsShopReport.CommandText := Format(SSQLOffsDayShopReport,                [StrToInt(Item.Caption),
                                                                                     FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                                     FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          OffsShopReport.Active :=  True;
          OffsShopReport.DisableControls();
          Report.Template := SOffsTotalShop;
          Report.Run;
          OffsShopReport.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TReportForm.ReportReturnDayDoc;
var
  I: Integer;
  Item: TListItem;
begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          ReturnShopReport.Active := False;
          ReturnShopReport.CommandText := Format(SSQLReturnDayShopReport,            [StrToInt(Item.Caption),
                                                                                     FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                                     FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          ReturnShopReport.Active :=  True;
          ReturnShopReport.DisableControls();
          Report.Template := SReturnTotalShop;
          Report.Run;
          ReturnShopReport.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TReportForm.ReportEnvdDoc;
var
  I: Integer;
  Item: TListItem;
begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          EnvdShopReport.Active := False;
          EnvdShopReport.CommandText := Format(SSQLEnvdShopReport,              [StrToInt(Item.Caption),
                                                                                    MonthCombo.ItemIndex,
                                                                                    YearSpin.Value]);
          EnvdShopReport.Active :=  True;
          EnvdShopReport.DisableControls();
          Report.Template := SEnvdTotalShop;
          Report.Run;
          EnvdShopReport.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TReportForm.ReportEnvdDayDoc;
var
  I: Integer;
  Item: TListItem;
begin
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          EnvdShopReport.Active := False;
          EnvdShopReport.CommandText := Format(SSQLEnvdDayShopReport,            [StrToInt(Item.Caption),
                                                                                     FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                                     FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          EnvdShopReport.Active :=  True;
          EnvdShopReport.DisableControls();
          Report.Template := SEnvdTotalShop;
          Report.Run;
          EnvdShopReport.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TReportForm.ReportPublicUtilitiesDoc;
var
  I: Integer;
  Item: TListItem;
begin
  { DONE 1 -opmp -cTuesdey : Отчет по магазину за выбранный месяц (Коммунальные услуги) }
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          PUShopReport.Active := False;
          PUShopReport.CommandText := Format(SSQLPublicUtilitiesTotalShop,              [StrToInt(Item.Caption),
                                                                                         MonthCombo.ItemIndex,
                                                                                         YearSpin.Value]);
          PUShopReport.Active :=  True;
          PUShopReport.DisableControls();
          Report.Template := SPublicUtilitiesTotalShop;
          Report.Run;
          PUShopReport.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TReportForm.ReportPublicUtilitiesDayDoc;
var
  I: Integer;
  Item: TListItem;
begin
   { DONE 1 -opmp -cTuesdey : Отчет по магазину за выбранную дату (Коммунальные услуги) }
    PrintBtn.Enabled := True;
    Screen.Cursor := crSQLWait;
    ShopView.SetFocus();
    try
      for I := 0 to ShopView.Items.Count - 1 do
      begin
        Item := ShopView.Items[I];
        if Item.Checked then
        begin
          Item.Selected := True;
          InvalidateRect(ShopView.Handle, nil, True);
          Application.ProcessMessages();
          PUShopReport.Active := False;
          PUShopReport.CommandText := Format(SSQLPublicUtilitiesDayTotalShop,            [StrToInt(Item.Caption),
                                                                                          FormatDateTime('yyyy-mm-dd', ReportPicker.Date),
                                                                                          FormatDateTime('yyyy-mm-dd', ReportEndPicker.Date)]);
          PUShopReport.Active :=  True;
          PUShopReport.DisableControls();
          Report.Template := SPublicUtilitiesTotalShop;
          Report.Run;
          PUShopReport.EnableControls();
          Item.Checked := False;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;


end.


