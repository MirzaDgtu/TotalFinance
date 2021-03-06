unit Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, Grids, DBGrids, DB, ADODB,
  UExcelAdapter, OLEAdapter, UCustomFlexCelReport, UFlexCelReport, ShellApi;

type
  TSearchForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ModulsCombo: TComboBox;
    Label5: TLabel;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    GroupBox4: TGroupBox;
    Panel1: TPanel;
    Bar: TStatusBar;
    HeaderSet: TADODataSet;
    DS_Header: TDataSource;
    ModulsSet: TADODataSet;
    ModulsSetUID: TIntegerField;
    ModulsSetNAME: TStringField;
    Naznachenie: TADODataSet;
    NaznachenieUID: TIntegerField;
    NaznacheniesName: TStringField;
    PanelTimer: TTimer;
    DopSettFindBtn: TBitBtn;
    DopSettingPanel: TPanel;
    GroupBox2: TGroupBox;
    HintPanelBtn: TBitBtn;
    ColumnCombo: TComboBox;
    Label2: TLabel;
    HeaderSetUNICUM_NUM: TIntegerField;
    HeaderSetNUMDOC: TIntegerField;
    HeaderSetDATE_P_POR: TDateTimeField;
    HeaderSetSUM_NAL: TFloatField;
    HeaderSetSUM_NOT_NAL: TFloatField;
    HeaderSetFAMILY: TStringField;
    HeaderSetFAMILY_1: TStringField;
    HeaderSetCREATE_DATE: TDateTimeField;
    HeaderSetWHO_CORR: TStringField;
    HeaderSetWHO_CORR_1: TStringField;
    HeaderSetDATE_CORR: TDateTimeField;
    HeaderSetTYPE_DOC: TStringField;
    HeaderSetPRIMECH: TStringField;
    ColumnSet: TADODataSet;
    ColumnSetCOLUMN_NAME: TStringField;
    RadioGroup: TRadioGroup;
    NaclRBtn: TRadioButton;
    DetailRBtn: TRadioButton;
    Tabs: TPageControl;
    TabHeader: TTabSheet;
    TabDetails: TTabSheet;
    SearchGrid: TDBGrid;
    DetailSet: TADODataSet;
    DetailSetUNICUM_NUM: TIntegerField;
    DetailSetNUMDOC: TIntegerField;
    DetailSetDATE_P_POR: TDateTimeField;
    DetailSetUID_SHOP: TIntegerField;
    DetailSetNAME: TStringField;
    DetailSetAdress: TStringField;
    DetailSetSUM_NAL: TFloatField;
    DetailSetSUM_NOT_NAL: TFloatField;
    DetailSetPRIMECH: TStringField;
    DetailSetCREATE_DATE: TDateTimeField;
    DetailSetTYPE_DOC: TStringField;
    DS_Detail: TDataSource;
    DetailGrid: TDBGrid;
    DetailSetFAMILY: TStringField;
    DetailSetRECIPIENT: TStringField;
    DetailSetNAZNACHENIE: TStringField;
    DetailSetNUM_PREDM: TIntegerField;
    DetailSetFAMILY_1: TStringField;
    DetailSetSUPPLIER: TStringField;
    DetailSetTYPE_ENERGY: TStringField;
    Report: TFlexCelReport;
    Adapter: TOLEAdapter;
    GroupBox5: TGroupBox;
    AccuracyRadio: TRadioButton;
    EntryRadio: TRadioButton;
    PrintBtn: TBitBtn;
    Bevel1: TBevel;
    Label6: TLabel;
    NaznachenieCombo: TComboBox;
    Label9: TLabel;
    SupplierCombo: TComboBox;
    SuppliersSet: TADODataSet;
    TypeEnergySet: TADODataSet;
    SuppliersSetUID: TIntegerField;
    SuppliersSetsName: TStringField;
    TypeEnergySetUID: TIntegerField;
    TypeEnergySetName: TStringField;
    Label10: TLabel;
    TypeEnergyCombo: TComboBox;
    GroupBox6: TGroupBox;
    UidLabel: TLabel;
    AdressLabel: TLabel;
    ShopView: TListView;
    ShopCheck: TCheckBox;
    Bevel2: TBevel;
    OnRbtn: TRadioButton;
    OffRbtn: TRadioButton;
    BegPicker: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    EndPicker: TDateTimePicker;
    procedure ModulsSetBeforeOpen(DataSet: TDataSet);
    procedure ModulsComboChange(Sender: TObject);
    procedure ColumnComboChange(Sender: TObject);
    procedure HintPanelBtnClick(Sender: TObject);
    procedure DopSettFindBtnClick(Sender: TObject);
    procedure PanelTimerTimer(Sender: TObject);
    procedure OnRbtnClick(Sender: TObject);
    procedure OffRbtnClick(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure SearchGridTitleClick(Column: TColumn);
    procedure NaclRBtnClick(Sender: TObject);
    procedure DetailRBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure ShopCheckClick(Sender: TObject);
  private
    { Private declarations }

    procedure BarInfo(TabIndex: integer);
    procedure SqlText(Module_UID, TypeNacl: integer);
    procedure SettingDetailGrid(Module_UID: integer);
    procedure PrintHeaderDoc();
    procedure PrintDetailNacl(Module_UID: integer);
//    procedure AddColumnsInCombo;
    procedure AddNaznachenieInCombo;
    procedure GetColumnName(ModuleUID: integer);
    procedure GetTypeEnergy;
    procedure GetSupplier;
    procedure IncomeSqlText(ParamNacl: integer);
    procedure ExpenseSqlText(ParamNacl: integer);
    procedure ZpAupSqlText(ParamNacl: integer);
    procedure TaxToZpSqlText(ParamNacl: integer);
    procedure PercentOfTerminalSqlText(ParamNacl: integer);
    procedure ShipmentVostokSqlText(ParamNacl: integer);
    procedure PublicUtilitiesSqlText(ParamNacl: integer);


    function ExistObj(Obj: TObject): boolean;
    function GetModuleUid(ModuleUID: integer): integer;
    function GetTypeDoc(ModuleUID: integer): string;
    function GetShopUid: string;
    function GetSupplierDoc: string;
    function GetNaznachenieDoc: string;
    function GetTypeEnergyDoc: string;
    function GetModuleName: variant;
    function GetFiledName: variant;
    function GetFindText: variant;
    function TypeSimbol: string;
    function TypeEntry: string;
    function TypeDate: string;

  public
    { Public declarations }
    procedure AddModulsInCombo;
    procedure UsePicker;
    procedure GetShop;
    
  published
    property Module: variant read GetModuleName;
    property Field: variant read GetFiledName;
    property Find: variant read GetFindText;
  end;

{const
  IncomeArr: array [0..8] of String [9] = ('����. �����', '����� �����.', '����', '�������', '�����(���)', '�����(������)', '����������',
                                          '��� ���������', '���� ��������');

  ExpenseArr: array [0..10] of String [11] = ('����. �����', '����� �����.', '����', '�������', '�����(���)', '�����(������)', '����������',
                                              '����������', '����������', '��� ���������', '���� ��������');

  ZpAupArr: array [0..9] of String [10] = ('����. �����', '����� �����.', '����', '�������', '�����(���)', '�����(������)', '����������',
                                           '����������', '��� ���������', '���� ��������');

  PercentOfTerminalArr: array [0..6] of String [7] = ('����. �����', '����� �����.', '����', '�������', '�����(������)', '����������', '���� ��������');

  IncomeCashArr: array [0..8] of String [9] = ('����. �����', '����� �����.', '����', '�������', '�����(���)', '�����(������)', '����������',
                                               '��� ���������', '���� ��������');
 }

var
  SearchForm: TSearchForm;
  SQLMemo: TStringList;
  Item: TListItem;
  CheckShowPanel: Boolean;
  TypeNacl: integer;

implementation


uses Main, ModuleData, sConst, Globals;

{$R *.dfm}

procedure TSearchForm.AddModulsInCombo;
begin
    ModulsSet.Active := False;
    ModulsSet.Active := True;
    ModulsCombo.Items.Clear;

    ModulsSet.First;
    while not ModulsSet.Eof do
      Begin
        ModulsCombo.Items.Add(ModulsSet.FieldByName('NAME').AsString);
        ModulsSet.Next;
      end;
end;

procedure TSearchForm.ModulsSetBeforeOpen(DataSet: TDataSet);
begin
  ModulsSet.CommandText := SSQlGetModule;
end;

{procedure TSearchForm.AddColumnsInCombo;
var
    i: integer;
begin
  case ModulsCombo.ItemIndex of
    0:  Begin
          ColumnCombo.Clear;
          For i := 0 to 9 do
            Begin
              ColumnCombo.Items.Add(IncomeArr[i]);
            end;
             ColumnCombo.ItemIndex := 0;
        end;

    1:  Begin
          ColumnCombo.Clear;
          For i := 0 to 11 do
            Begin
              ColumnCombo.Items.Add(ExpenseArr[i]);
            end;
             ColumnCombo.ItemIndex := 0;
        end;

    2:  Begin
          ColumnCombo.Clear;
          For i := 0 to 11 do
            Begin
              ColumnCombo.Items.Add(ExpenseArr[i]);
            end;
             ColumnCombo.ItemIndex := 0;
        end;

    3:  Begin
          ColumnCombo.Clear;
          For i := 0 to 11 do
            Begin
              ColumnCombo.Items.Add(ExpenseArr[i]);
            end;
             ColumnCombo.ItemIndex := 0;
        end;

    4:  Begin
          ColumnCombo.Clear;
          For i := 0 to 10 do
            Begin
              ColumnCombo.Items.Add(ZpAupArr[i]);
            end;
             ColumnCombo.ItemIndex := 0;
        end;

    5:  Begin
          ColumnCombo.Clear;
          For i := 0 to 10 do
            Begin
              ColumnCombo.Items.Add(PercentOfTerminalArr[i]);
            end;
             ColumnCombo.ItemIndex := 0;
        end;

    6:  Begin
          ColumnCombo.Clear;
        end;

    7:  Begin
          ColumnCombo.Clear;
        end;

    8:  Begin
          ColumnCombo.Clear;
        end;

    9:  Begin
          ColumnCombo.Clear;
        end;

    10: Begin
          ColumnCombo.Clear;
        end;

    11: Begin
          ColumnCombo.Clear;
        end;

    12: Begin
          ColumnCombo.Clear;
        end;

    13: Begin
          ColumnCombo.Clear;
          For i := 0 to 9 do
            Begin
              ColumnCombo.Items.Add(IncomeCashArr[i]);
            end;
             ColumnCombo.ItemIndex := 0;
        end;
  end;

  NaznachenieCombo.Clear;
end;}

procedure TSearchForm.ModulsComboChange(Sender: TObject);
begin
  if ModulsCombo.ItemIndex <> (-1) then
    Begin
       Screen.Cursor := crSQLWait;
//       AddColumnsInCombo();

       GetColumnName(ModulsCombo.ItemIndex);
       ColumnCombo.Enabled := True;
       FindEdit.Enabled := True;
       
       Screen.Cursor := crDefault;
    end;
end;

procedure TSearchForm.ColumnComboChange(Sender: TObject);
begin
  case ModulsCombo.ItemIndex of
    1..4: AddNaznachenieInCombo();
    7,8,10:  GetSupplier();
  end;

  GetTypeEnergy();
end;

procedure TSearchForm.AddNaznachenieInCombo;
begin
  if DetailRBtn.Checked then
    Begin
        if (ModulsCombo.ItemIndex in [1,2,3]) and
         (ColumnCombo.ItemIndex = ColumnCombo.Items.IndexOf('NAZNACHENIE')) then
          Begin
              Naznachenie.Active := False;
              Naznachenie.CommandText := Format(SSQLGetNaznachenie, [1]);
              Naznachenie.Active := True;
              NaznachenieCombo.Enabled := True;
              FindEdit.Clear;
              FindEdit.Enabled := False;

              NaznachenieCombo.Clear;
              Naznachenie.First;
              while not Naznachenie.Eof do
                Begin
                  NaznachenieCombo.Items.Add(Naznachenie.FieldByName('sName').AsString);
                  Naznachenie.Next;
                end;

              NaznachenieCombo.ItemIndex := -1;
              NaznachenieCombo.SetFocus;
          end
      else
      if (ModulsCombo.ItemIndex = ModulsCombo.Items.IndexOf('�� ���')) and
         (ColumnCombo.ItemIndex = ColumnCombo.Items.IndexOf('NAZNACHENIE')) then
          Begin
              Naznachenie.Active := False;
              Naznachenie.CommandText := SSQLGetNaznachenieZpAup;
              Naznachenie.Active := True;
              NaznachenieCombo.Enabled := True;
              FindEdit.Enabled := False;
              FindEdit.Clear;

              NaznachenieCombo.Clear;
              Naznachenie.First;
              while not Naznachenie.Eof do
                Begin
                  NaznachenieCombo.Items.Add(Naznachenie.FieldByName('sName').AsString);
                  Naznachenie.Next;
                end;
              NaznachenieCombo.ItemIndex := -1;
              NaznachenieCombo.SetFocus;
          end
      else
          if  ColumnCombo.ItemIndex <> ColumnCombo.Items.IndexOf('NAZNACHENIE') then
             Begin
                NaznachenieCombo.Clear;
                NaznachenieCombo.Enabled := False;
                FindEdit.Enabled := True;
                FindEdit.Clear;
                FindEdit.SetFocus;
             end;
   end
  else
      Begin
              NaznachenieCombo.Clear;
              NaznachenieCombo.Enabled := False;
              FindEdit.Enabled := True;
              FindEdit.Clear;
              FindEdit.SetFocus;
      end;

end;

procedure TSearchForm.HintPanelBtnClick(Sender: TObject);
begin
   CheckShowPanel := False;
end;

procedure TSearchForm.DopSettFindBtnClick(Sender: TObject);
begin
    CheckShowPanel := True;
end;

procedure TSearchForm.PanelTimerTimer(Sender: TObject);
begin
  if (CheckShowPanel) and (DopSettingPanel.Left < 0) then
    DopSettingPanel.Left := DopSettingPanel.Left + 7;
  if (not CheckShowPanel) and (DopSettingPanel.Left > -170) then
    DopSettingPanel.Left := DopSettingPanel.Left - 7;
end;

procedure TSearchForm.UsePicker;
begin
  if OnRbtn.Checked then
     Begin
        BegPicker.Enabled := True;
        EndPicker.Enabled:= True;
     end
  else
     Begin
        BegPicker.Enabled := False;
        EndPicker.Enabled:= False;
     end;
end;

procedure TSearchForm.OnRbtnClick(Sender: TObject);
begin
  UsePicker();
end;

procedure TSearchForm.OffRbtnClick(Sender: TObject);
begin
  UsePicker();
end;

procedure TSearchForm.FindBtnClick(Sender: TObject);
begin
  SqlText(ModulsCombo.ItemIndex, TypeNacl);

  if TypeNacl = 0 then
    Begin
      HeaderSet.Active := False;
      HeaderSet.CommandText := Format(SSQLExecSql, [SQLMemo.Text]);
      HeaderSet.Active := True;
    end
  else
    Begin
      SettingDetailGrid(ModulsCombo.ItemIndex);

      DetailSet.Active := False;
      DetailSet.CommandText := Format(SSQLExecSql, [SQLMemo.Text]);
      DetailSet.Active := True;
    end;

    //SQLMemo.SaveToFile('C:\Users\pmp.EAST24\Desktop\SQLMemo.txt');
    //ShellExecute(Handle, nil, 'C:\Users\pmp.EAST24\Desktop\SQLMemo.txt', nil, nil, SW_SHOW);

    BarInfo(Tabs.TabIndex);
    FreeAndNil(SQLMemo);
end;

function TSearchForm.GetTypeDoc(ModuleUID: integer): string;
begin
  case ModuleUID of
    0:  Result := s_Income;
    1:  Result := s_Expense;
    2:  Result := s_ExpenseZp;
    3:  Result := s_ExpenseOther;
    4:  Result := s_ZpAup;
    5:  Result := s_TaxToZp;
    6:  ;
    7:  Result := s_ShipmentVostok;
    8:  Result := s_ShipmentOther;
    9:  Result := s_Offs;
    10: ;
    11: Result := s_Return;
    12: Result := s_Envd;
    13: Result := s_IncomeCash;
  end;
end;

procedure TSearchForm.SearchGridTitleClick(Column: TColumn);
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

function TSearchForm.GetModuleUid(ModuleUID: integer): integer;
begin
  case ModuleUID of
    0:  Result := TAB_Income;
    1:  Result := TAB_Expense;
    2:  Result := TAB_ExpenseZP;
    3:  Result := TAB_ExpenseOther;
    4:  Result := TAB_ZpAup;
    5:  Result := TAB_TaxToZp;
    6:  Result := TAB_PercentOfTerminal;
    7:  Result := TAB_ShipmentVostok;
    8:  Result := TAB_ShipmentOther;
    9:  Result := TAB_Offs;
    10: Result := TAB_PublicUtilities;
    11: Result := TAB_Return;
    12: Result := TAB_ENVD;
    13: Result := TAB_IncomeCash;
  end;
end;

procedure TSearchForm.GetColumnName(ModuleUID: integer);
begin
    if NaclRBtn.Checked then
    Begin
       case ModuleUID of
              0:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_INCOME_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              1:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_EXPENSES_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              2:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_EXPENSES_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              3:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_EXPENSES_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              4:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_ZpAUP_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              5:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_ZpAUP_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              6:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_PercentOfTerminal_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              7:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_SHIPMENT_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              8:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_SHIPMENT_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              9:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_INCOME_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              10: Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_PublicUtilities_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              11: Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_INCOME_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              12: Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_INCOME_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              13: Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_INCOME_HEADER']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;
        end;
    end
  else
  if DetailRBtn.Checked then
      Begin
       case ModuleUID of
              0:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_INCOME_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              1:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_EXPENSES_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              2:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_EXPENSES_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              3:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_EXPENSES_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              4:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_ZpAUP_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              5:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_ZpAUP_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              6:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_PercentOfTerminal_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              7:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_SHIPMENT_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              8:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_SHIPMENT_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              9:  Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_INCOME_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              10: Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_PublicUtilities_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              11: Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_INCOME_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              12: Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_INCOME_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;

              13: Begin
                    ColumnCombo.Items.Clear;
                    ColumnSet.Active := False;
                    ColumnSet.CommandText := Format(SSQLGetColumnName, ['D_INCOME_DETAIL']);
                    ColumnSet.Active := True;

                    ColumnSet.First;
                    while not ColumnSet.Eof do
                      Begin
                        ColumnCombo.Items.Add(ColumnSet.FieldByName('COLUMN_NAME').AsString);
                        ColumnSet.Next;
                      end;
                  end;
        end;
    end;
end;

procedure TSearchForm.SqlText(Module_UID, TypeNacl: integer);
begin
  //SQLMemo.Clear;
      case Module_UID of
        0,9,11,12,13:      IncomeSqlText(TypeNacl);
        1,2,3:  ExpenseSqlText(TypeNacl);
        4:      ZpAupSqlText(TypeNacl);
        5:      TaxToZpSqlText(TypeNacl);
        6:      PercentOfTerminalSqlText(TypeNacl);
        7:      ShipmentVostokSqlText(TypeNacl);
        8:      ShipmentVostokSqlText(TypeNacl);
        10:     PublicUtilitiesSqlText(TypeNacl);
      end;
      
  if TypeNacl = 0 then
      Tabs.ActivePageIndex := 0
  else
      Tabs.ActivePageIndex := 1;
end;




function TSearchForm.TypeSimbol: string;
begin
  if AccuracyRadio.Checked then
      Result := '''''';
end;

function TSearchForm.TypeEntry: string;
begin
   if AccuracyRadio.Checked then
      Result := ' = '
   else
   if EntryRadio.Checked then
      Result := ' LIKE ';
end;

function TSearchForm.TypeDate: string;
begin
   if OnRbtn.Checked then
      Result := ' AND Date_P_Por BETWEEN ' + '''''' + FormatDateTime('yyyy-mm-dd', BegPicker.Date)+ '''''' + ' AND ' + '''''' + FormatDateTime('yyyy-mm-dd', EndPicker.Date) + ''''''
   else
   if OffRbtn.Checked then
      Result := EmptyStr;
end;

procedure TSearchForm.IncomeSqlText(ParamNacl: integer);
var
    i: integer;
begin
  Try
    SQLMemo := TStringList.Create();
    case ParamNacl of
         0:  Begin
                 SQLMemo.Add('SELECT  H.UNICUM_NUM,');
                 SQLMemo.Add('              H.NUMDOC,');
                 SQLMemo.Add('              H.DATE_P_POR,');
                 SQLMemo.Add('              H.SUM_NAL,');
                 SQLMemo.Add('              H.SUM_NOT_NAL,');
                 SQLMemo.Add('              H.FAMILY,');
                 SQLMemo.Add('              E.EmployeeName AS FAMILY_1,');
                 SQLMemo.Add('              H.CREATE_DATE,');
                 SQLMemo.Add('              H.WHO_CORR,');
                 SQLMemo.Add('              TT.EmployeeName AS WHO_CORR_1,');
                 SQLMemo.Add('              H.DATE_CORR,');
                 SQLMemo.Add('              H.TYPE_DOC,');
                 SQLMemo.Add('              H.PRIMECH');
                 SQLMemo.Add('FROM FINANCE..D_INCOME_HEADER H WITH (NOLOCK)');
                 SQLMemo.Add('FULL JOIN');
                 SQLMemo.Add('              (SELECT E.EmployeeName,');
                 SQLMemo.Add('                      E.sName');
                 SQLMemo.Add('               FROM DELIVERY..A_EMPLOYEES E WITH (NOLOCK)) TT ON TT.sName = H.WHO_CORR COLLATE  SQL_Latin1_General_CP1251_CI_AS,');
                 SQLMemo.Add('DELIVERY..A_EMPLOYEES E WITH (NOLOCK)');
                 if AccuracyRadio.Checked then
                    SQLMemo.Add('WHERE H.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
                 else
                 if  EntryRadio.Checked then
                    SQLMemo.Add('WHERE H.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
                 SQLMemo.Add(' AND E.sName = H.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS ');
                 SQLMemo.Add(' AND  TYPE_DOC = ''''' + GetTypeDoc(ModulsCombo.ItemIndex)+'''''');
                 SQLMemo.Add(TypeDate);
              end;

         1:   Begin
                SQLMemo.Add('SELECT  D.UNICUM_NUM,');
                SQLMemo.Add('              D.NUMDOC,');
                SQLMemo.Add('              D.DATE_P_POR,');
                SQLMemo.Add('              D.NUM_PREDM,');
                SQLMemo.Add('              D.UID_SHOP,');
                SQLMemo.Add('              C.NAME,');
                SQLMemo.Add('              C.ADRESS,');
                SQLMemo.Add('              D.SUM_NAL,');
                SQLMemo.Add('              D.SUM_NOT_NAL,');
                SQLMemo.Add('              D.Date_Create as Create_Date,');
                SQLMemo.Add('              D.TYPE_DOC,');
                SQLMemo.Add('              D.PRIMECH,');
                SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'Naznachenie' + '''''' + ',');
                SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'RECIPIENT' + '''''' + ',');
                SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'Type_Energy' + '''''' + ',');
                SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'Supplier' + '''''' + ',');
                SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'FAMILY' + '''''' + ',');
                SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'FAMILY_1' + '''''');
                SQLMemo.Add('FROM FINANCE..D_INCOME_DETAIL D WITH (NOLOCK),');
                SQLMemo.Add('FINANCE..D_CLIENTS C WITH (NOLOCK) ');
                SQLMemo.Add('WHERE ');
                SQLMemo.Add(' D.UID_SHOP = C.UID');
                SQLMemo.Add(' AND D.TYPE_DOC = ' + '''''' + GetTypeDoc(ModulsCombo.ItemIndex) + '''''');
                if AccuracyRadio.Checked then
                    SQLMemo.Add('AND D.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
                else
                If EntryRadio.Checked then
                   SQLMemo.Add('AND D.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
                SQLMemo.Add(TypeDate);
                SQLMemo.Add(GetShopUid());
              end;
    end;
  except
        FreeAndNil(SQLMemo);
  end;

end;

procedure TSearchForm.NaclRBtnClick(Sender: TObject);
begin
  TypeNacl  := 0;
  ModulsComboChange(Self);
end;


procedure TSearchForm.DetailRBtnClick(Sender: TObject);
begin
  TypeNacl  := 1;
  ModulsComboChange(Self);
end;

procedure TSearchForm.ExpenseSqlText(ParamNacl: integer);
begin
  Try
     SQLMemo := TStringList.Create();
     case ParamNacl of
         0:   Begin
                SQLMemo.Add('SELECT  EH.UNICUM_NUM,');
                SQLMemo.Add('              EH.NUMDOC,');
                SQLMemo.Add('              EH.DATE_P_POR,');
                SQLMemo.Add('              EH.SUM_NAL,');
                SQLMemo.Add('              EH.SUM_NOT_NAL,');
                SQLMemo.Add('              EH.FAMILY,');
                SQLMemo.Add('              E.EmployeeName AS FAMILY_1,');
                SQLMemo.Add('              EH.CREATE_DATE,');
                SQLMemo.Add('              EH.WHO_CORR,');
                SQLMemo.Add('              TT.EmployeeName AS WHO_CORR_1,');
                SQLMemo.Add('              EH.DATE_CORR,');
                SQLMemo.Add('              EH.TYPE_DOC,');
                SQLMemo.Add('              EH.PRIMECH');
                SQLMemo.Add('FROM FINANCE..D_EXPENSES_HEADER EH WITH (NOLOCK)');
                SQLMemo.Add('FULL JOIN');
                SQLMemo.Add('            (SELECT E.EmployeeName,');
                SQLMemo.Add('                    E.sName');
                SQLMemo.Add('             FROM DELIVERY..A_EMPLOYEES E WITH (NOLOCK)) TT ON TT.sName = EH.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS, ');
                SQLMemo.Add('DELIVERY..A_EMPLOYEES E WITH (NOLOCK)');
                if AccuracyRadio.Checked then
                    SQLMemo.Add('WHERE EH.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
                 else
                if  EntryRadio.Checked then
                    SQLMemo.Add('WHERE EH.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
                SQLMemo.Add(' AND E.sName = EH.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS ');
                SQLMemo.Add(' AND TYPE_DOC = '  + '''''' + GetTypeDoc(ModulsCombo.ItemIndex) + '''''');
                SQLMemo.Add(TypeDate);
              end;

         1:   Begin
                SQLMemo.Add('SELECT  D.UNICUM_NUM,');
                SQLMemo.Add('              D.NUMDOC,');
                SQLMemo.Add('              D.DATE_P_POR,');
                SQLMemo.Add('              D.NUM_PREDM,');
                SQLMemo.Add('              D.UID_SHOP,');
                SQLMemo.Add('              C.NAME,');
                SQLMemo.Add('              C.Adress,');
                SQLMemo.Add('              D.SUM_NAL,');
                SQLMemo.Add('              D.SUM_NOT_NAL,');
                SQLMemo.Add('              D.NAZNACHENIE,');
                SQLMemo.Add('              D.RECIPIENT,');
                SQLMemo.Add('              D.PRIMECH,');
                SQLMemo.Add('              D.FAMILY,');
                SQLMemo.Add('              E.EmployeeName AS FAMILY_1,');
                SQLMemo.Add('              D.CREATE_DATE,');
                SQLMemo.Add('              D.TYPE_DOC,');
                SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'Type_Energy' + '''''' + ',');
                SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'Supplier' + '''''');
                SQLMemo.Add('FROM FINANCE..D_EXPENSES_DETAIL D WITH (NOLOCK)');
                SQLMemo.Add('FULL JOIN');
                SQLMemo.Add('            (SELECT E.EmployeeName,');
                SQLMemo.Add('                     E.sName');
                SQLMemo.Add('             FROM DELIVERY..A_EMPLOYEES E WITH (NOLOCK)) TT ON TT.sName = D.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS,');
                SQLMemo.Add('DELIVERY..A_EMPLOYEES E WITH (NOLOCK),	');
                SQLMemo.Add('FINANCE..D_CLIENTS C WITH (NOLOCK)');
                SQLMemo.Add('WHERE D.UID_SHOP = C.UID');
                SQLMemo.Add('AND E.sName = D.FAMILY COLLATE SQL_Latin1_General_CP1251_CI_AS');
                if NaznachenieCombo.ItemIndex <> -1 then
                    SQLMemo.Add(GetNaznachenieDoc())
                else
                  Begin
                    if AccuracyRadio.Checked then
                        SQLMemo.Add('AND D.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
                    else
                    If EntryRadio.Checked then
                       SQLMemo.Add('AND D.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
                  end;
                SQLMemo.Add(' AND TYPE_DOC = '  + '''''' + GetTypeDoc(ModulsCombo.ItemIndex) + '''''');
                SQLMemo.Add(TypeDate);
                SQLMemo.Add(GetShopUid());
              end;
     end;
  except
        FreeAndNil(SQLMemo);
  end;
end;

procedure TSearchForm.ZpAupSqlText(ParamNacl: integer);
begin
  Try
    SQLMemo := TStringList.Create();
       case ParamNacl of
          0:  Begin
                  SQLMemo.Add('SELECT H.UNICUM_NUM,');
                  SQLMemo.Add('              H.NUMDOC,');
                  SQLMemo.Add('              H.DATE_P_POR,');
                  SQLMemo.Add('              H.SUM_NAL,');
                  SQLMemo.Add('              H.SUM_NOT_NAL,');
                  SQLMemo.Add('              H.FAMILY,');
                  SQLMemo.Add('              E.EmployeeName AS FAMILY_1,');
                  SQLMemo.Add('              H.CREATE_DATE,');
                  SQLMemo.Add('              H.WHO_CORR,');
                  SQLMemo.Add('              TT.EmployeeName AS WHO_CORR_1,');
                  SQLMemo.Add('              H.DATE_CORR,');
                  SQLMemo.Add('              H.PRIMECH,');
                  SQLMemo.Add('              H.TypeDoc as TYPE_DOC');
                  SQLMemo.Add('FROM FINANCE..D_ZpAUP_HEADER H WITH (NOLOCK)');
                  SQLMemo.Add('FULL JOIN');
                  SQLMemo.Add('             (SELECT E.EmployeeName,');
                  SQLMemo.Add('                       E.sName');
                  SQLMemo.Add('               FROM DELIVERY..A_EMPLOYEES E WITH (NOLOCK)) TT ON TT.sName = H.WHO_CORR COLLATE  SQL_Latin1_General_CP1251_CI_AS,');
                  SQLMemo.Add('DELIVERY..A_EMPLOYEES E WITH (NOLOCK)');
                  SQLMemo.Add('WHERE E.sName = H.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS');
                   if AccuracyRadio.Checked then
                      SQLMemo.Add('AND D.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
                   else
                   if  EntryRadio.Checked then
                      SQLMemo.Add('AND D.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
                  SQLMemo.Add(' AND TypeDoc = ' + '''''' + GetTypeDoc(ModulsCombo.ItemIndex) + '''''');
                  SQLMemo.Add(TypeDate);
              end;

          1:  Begin
                    SQLMemo.Add('SELECT  D.UNICUM_NUM,');
                    SQLMemo.Add('              D.NUMDOC,');
                    SQLMemo.Add('              D.DATE_P_POR,');
                    SQLMemo.Add('              D.NUM_PREDM,');
                    SQLMemo.Add('              D.UID_SHOP,');
                    SQLMemo.Add('              C.NAME,');
                    SQLMemo.Add('              C.Adress,');
                    SQLMemo.Add('              D.SUM_NAL,');
                    SQLMemo.Add('              0.0 as SUM_NOT_NAL,');
                    SQLMemo.Add('              D.NAZNACHENIE,');
                    SQLMemo.Add('              D.PRIMECH,');
                    SQLMemo.Add('              D.FAMILY,');
                    SQLMemo.Add('              D.CREATE_DATE,');
                    SQLMemo.Add('              D.TypeDoc as TYPE_DOC,');
                    SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'RECIPIENT' + '''''' + ',');
                    SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'Type_Energy' + '''''' + ',');
                    SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'Supplier' + '''''' + ',');
                    SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'FAMILY_1' + '''''');
                    SQLMemo.Add('FROM FINANCE..D_ZpAUP_DETAIL D WITH (NOLOCK)');
                    SQLMemo.Add('FULL JOIN');
                    SQLMemo.Add('          (SELECT E.EmployeeName,');
                    SQLMemo.Add('                      E.sName');
                    SQLMemo.Add('           FROM DELIVERY..A_EMPLOYEES E WITH (NOLOCK)) TT ON TT.sName = D.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS,');
                    SQLMemo.Add('FINANCE..D_CLIENTS C WITH (NOLOCK)');
                    SQLMemo.Add('WHERE D.UID_SHOP = C.UID');
                    if NaznachenieCombo.ItemIndex <> -1 then
                        SQLMemo.Add(GetNaznachenieDoc())
                    else
                      Begin
                        if AccuracyRadio.Checked then
                            SQLMemo.Add('AND D.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
                        else
                        If EntryRadio.Checked then
                           SQLMemo.Add('AND D.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
                      end;
                    SQLMemo.Add(' AND TypeDoc = '  + '''''' + GetTypeDoc(ModulsCombo.ItemIndex) + '''''');
                    SQLMemo.Add(TypeDate); 
                    SQLMemo.Add(GetShopUid());
              end;
       end;
  except
        FreeAndNil(SQLMemo);
  end;       
end;

procedure TSearchForm.TaxToZpSqlText(ParamNacl: integer);
begin
  Try
    SQLMemo := TStringList.Create();
       case ParamNacl of
          0:  Begin
                  SQLMemo.Add('SELECT H.UNICUM_NUM,');
                  SQLMemo.Add('              H.NUMDOC,');
                  SQLMemo.Add('              H.DATE_P_POR,');
                  SQLMemo.Add('              H.SUM_NAL,');
                  SQLMemo.Add('              H.SUM_NOT_NAL,');
                  SQLMemo.Add('              H.FAMILY,');
                  SQLMemo.Add('              E.EmployeeName AS FAMILY_1,');
                  SQLMemo.Add('              H.CREATE_DATE,');
                  SQLMemo.Add('              H.WHO_CORR,');
                  SQLMemo.Add('              TT.EmployeeName AS WHO_CORR_1,');
                  SQLMemo.Add('              H.DATE_CORR,');
                  SQLMemo.Add('              H.PRIMECH,');
                  SQLMemo.Add('              H.TypeDoc as TYPE_DOC');
                  SQLMemo.Add('FROM FINANCE..D_ZpAUP_HEADER H WITH (NOLOCK)');
                  SQLMemo.Add('FULL JOIN');
                  SQLMemo.Add('             (SELECT E.EmployeeName,');
                  SQLMemo.Add('                       E.sName');
                  SQLMemo.Add('               FROM DELIVERY..A_EMPLOYEES E WITH (NOLOCK)) TT ON TT.sName = H.WHO_CORR COLLATE  SQL_Latin1_General_CP1251_CI_AS,');
                  SQLMemo.Add('DELIVERY..A_EMPLOYEES E WITH (NOLOCK)');
                  SQLMemo.Add('WHERE E.sName = H.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS');
                   if AccuracyRadio.Checked then
                      SQLMemo.Add('AND H.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
                   else
                   if  EntryRadio.Checked then
                      SQLMemo.Add('AND H.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
                  SQLMemo.Add(' AND TypeDoc = ' + '''''' + GetTypeDoc(ModulsCombo.ItemIndex) + '''''');
                  SQLMemo.Add(TypeDate);
              end;

          1:  Begin
                    SQLMemo.Add('SELECT  D.UNICUM_NUM,');
                    SQLMemo.Add('              D.NUMDOC,');
                    SQLMemo.Add('              D.DATE_P_POR,');
                    SQLMemo.Add('              D.NUM_PREDM,');
                    SQLMemo.Add('              D.UID_SHOP,');
                    SQLMemo.Add('              C.NAME,');
                    SQLMemo.Add('              C.Adress,');
                    SQLMemo.Add('              0.0 as SUM_NAL,');
                    SQLMemo.Add('              D.SUM_NOT_NAL,');
                    SQLMemo.Add('              D.NAZNACHENIE,');
                    SQLMemo.Add('              D.PRIMECH,');
                    SQLMemo.Add('              D.FAMILY,');
                    SQLMemo.Add('              D.CREATE_DATE,');
                    SQLMemo.Add('              D.TypeDoc as TYPE_DOC,');
                    SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'RECIPIENT' + '''''' + ',');
                    SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'Type_Energy' + '''''' + ',');
                    SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'Supplier' + '''''' + ',');
                    SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'FAMILY_1' + '''''');
                    SQLMemo.Add('FROM FINANCE..D_ZpAUP_DETAIL D WITH (NOLOCK)');
                    SQLMemo.Add('FULL JOIN');
                    SQLMemo.Add('          (SELECT E.EmployeeName,');
                    SQLMemo.Add('                      E.sName');
                    SQLMemo.Add('           FROM DELIVERY..A_EMPLOYEES E WITH (NOLOCK)) TT ON TT.sName = D.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS,');
                    SQLMemo.Add('FINANCE..D_CLIENTS C WITH (NOLOCK)');
                    SQLMemo.Add('WHERE D.UID_SHOP = C.UID');
                    if AccuracyRadio.Checked then
                        SQLMemo.Add(' AND D.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
                    else
                    If EntryRadio.Checked then
                       SQLMemo.Add(' AND D.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
                    SQLMemo.Add(' AND TypeDoc = '  + '''''' + GetTypeDoc(ModulsCombo.ItemIndex) + '''''');
                    SQLMemo.Add(TypeDate);
                    SQLMemo.Add(GetShopUid());
              end;
       end;
  except
        FreeAndNil(SQLMemo);
  end;
end;






procedure TSearchForm.PercentOfTerminalSqlText(ParamNacl: integer);
begin
  Try
    SQLMemo := TStringList.Create();
    case ParamNacl  of
      0:  Begin
              SQLMemo.Add('SELECT H.UNICUM_NUM,');
              SQLMemo.Add('              H.NUMDOC,');
              SQLMemo.Add('              H.DATE_P_POR,');
              SQLMemo.Add('              0.0 as SUM_NAL,');
              SQLMemo.Add('              H.SUM_NOT_NAL,');
              SQLMemo.Add('              H.FAMILY,');
              SQLMemo.Add('              E.EmployeeName AS FAMILY_1,');
              SQLMemo.Add('              H.CREATE_DATE,');
              SQLMemo.Add('              H.WHO_CORR,');
              SQLMemo.Add('              TT.EmployeeName AS WHO_CORR_1,');
              SQLMemo.Add('              H.DATE_CORR,');
              SQLMemo.Add('              H.PRIMECH,');
              SQLMemo.Add('              ' + '''''' + '''''' + ' as TYPE_DOC');
              SQLMemo.Add('FROM FINANCE..D_PercentOfTerminal_HEADER H WITH (NOLOCK)');
              SQLMemo.Add('FULL JOIN');
              SQLMemo.Add('             (SELECT E.EmployeeName,');
              SQLMemo.Add('                       E.sName');
              SQLMemo.Add('               FROM DELIVERY..A_EMPLOYEES E WITH (NOLOCK)) TT ON TT.sName = H.WHO_CORR COLLATE  SQL_Latin1_General_CP1251_CI_AS,');
              SQLMemo.Add('DELIVERY..A_EMPLOYEES E WITH (NOLOCK)');
              SQLMemo.Add('WHERE E.sName = H.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS');
               if AccuracyRadio.Checked then
                  SQLMemo.Add('AND H.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
               else
               if  EntryRadio.Checked then
                  SQLMemo.Add('AND H.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
              SQLMemo.Add(TypeDate);
          end;

      1:  Begin
              SQLMemo.Add('SELECT  D.UNICUM_NUM,');
              SQLMemo.Add('              D.NUMDOC,');
              SQLMemo.Add('              D.DATE_P_POR,');
              SQLMemo.Add('              D.NUM_PREDM,');
              SQLMemo.Add('              D.UID_SHOP,');
              SQLMemo.Add('              C.NAME,');
              SQLMemo.Add('              C.ADRESS,');
              SQLMemo.Add('              0.0 as SUM_NAL,');
              SQLMemo.Add('              D.SUM_NOT_NAL,');
              SQLMemo.Add('              D.Create_Date,');
              SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'TYPE_DOC' + '''''' + ',');
              SQLMemo.Add('              D.PRIMECH,');
              SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'Naznachenie' + '''''' + ',');
              SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'RECIPIENT' + '''''' + ',');
              SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'Type_Energy' + '''''' + ',');
              SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'Supplier' + '''''' + ',');
              SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'FAMILY' + '''''' + ',');
              SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'FAMILY_1' + '''''');
              SQLMemo.Add('FROM FINANCE..D_PercentOfTerminal_DETAIL D WITH (NOLOCK)');
              SQLMemo.Add('           FULL JOIN');
              SQLMemo.Add('              (SELECT E.EmployeeName,');
              SQLMemo.Add('                      E.sName');
              SQLMemo.Add('FROM DELIVERY..A_EMPLOYEES E WITH (NOLOCK)) TT ON TT.sName = D.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS,');
              SQLMemo.Add('FINANCE..D_CLIENTS C WITH (NOLOCK) ');
              SQLMemo.Add('WHERE ');
              SQLMemo.Add(' D.UID_SHOP = C.UID');
              if AccuracyRadio.Checked then
                  SQLMemo.Add('AND D.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
              else
              If EntryRadio.Checked then
                 SQLMemo.Add('AND D.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
              SQLMemo.Add(TypeDate);
              SQLMemo.Add(GetShopUid());
          end;
    end;
  except
        FreeAndNil(SQLMemo);
  end;
end;



procedure TSearchForm.ShipmentVostokSqlText(ParamNacl: integer);
begin
  Try
    SQLMemo := TStringList.Create();
     case ParamNacl of
         0:   Begin
                SQLMemo.Add('SELECT  H.UNICUM_NUM,');
                SQLMemo.Add('              H.NUMDOC,');
                SQLMemo.Add('              H.DATE_P_POR,');
                SQLMemo.Add('              H.SUM_NAL,');
                SQLMemo.Add('              H.SUM_NOT_NAL,');
                SQLMemo.Add('              H.FAMILY,');
                SQLMemo.Add('              E.EmployeeName AS FAMILY_1,');
                SQLMemo.Add('              H.CREATE_DATE,');
                SQLMemo.Add('              H.WHO_CORR,');
                SQLMemo.Add('              TT.EmployeeName AS WHO_CORR_1,');
                SQLMemo.Add('              H.DATE_CORR,');
                SQLMemo.Add('              H.TYPE_DOC,');
                SQLMemo.Add('              H.PRIMECH');
                SQLMemo.Add('FROM FINANCE..D_SHIPMENT_HEADER H WITH (NOLOCK)');
                SQLMemo.Add('FULL JOIN');
                SQLMemo.Add('            (SELECT E.EmployeeName,');
                SQLMemo.Add('                    E.sName');
                SQLMemo.Add('             FROM DELIVERY..A_EMPLOYEES E WITH (NOLOCK)) TT ON TT.sName = H.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS, ');
                SQLMemo.Add('DELIVERY..A_EMPLOYEES E WITH (NOLOCK)');
                if AccuracyRadio.Checked then
                    SQLMemo.Add('WHERE H.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
                 else
                if  EntryRadio.Checked then
                    SQLMemo.Add('WHERE H.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
                SQLMemo.Add(' AND E.sName = H.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS ');
                SQLMemo.Add(' AND TYPE_DOC = '  + '''''' + GetTypeDoc(ModulsCombo.ItemIndex) + '''''');
                SQLMemo.Add(TypeDate);
              end;

         1:   Begin
                SQLMemo.Add('SELECT  D.UNICUM_NUM,');
                SQLMemo.Add('              D.NUMDOC,');
                SQLMemo.Add('              D.DATE_P_POR,');
                SQLMemo.Add('              D.NUM_PREDM,');
                SQLMemo.Add('              D.UID_SHOP,');
                SQLMemo.Add('              C.NAME,');
                SQLMemo.Add('              C.Adress,');
                SQLMemo.Add('              D.SUM_NAL,');
                SQLMemo.Add('              D.SUM_NOT_NAL,');
                SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'NAZNACHENIE' + '''''' + ',');
                SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'RECIPIENT' + '''''' + ',');
                SQLMemo.Add('              D.PRIMECH,');
                SQLMemo.Add('              D.FAMILY,');
                SQLMemo.Add('              E.EmployeeName AS FAMILY_1,');
                SQLMemo.Add('              D.CREATE_DATE,');
                SQLMemo.Add('              D.TYPE_DOC,');
                SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'Type_Energy' + '''''' + ',');
                SQLMemo.Add('              D.Supplier');
                SQLMemo.Add('FROM FINANCE..D_SHIPMENT_DETAIL D WITH (NOLOCK)');
                SQLMemo.Add('FULL JOIN');
                SQLMemo.Add('            (SELECT E.EmployeeName,');
                SQLMemo.Add('                     E.sName');
                SQLMemo.Add('             FROM DELIVERY..A_EMPLOYEES E WITH (NOLOCK)) TT ON TT.sName = D.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS,');
                SQLMemo.Add('DELIVERY..A_EMPLOYEES E WITH (NOLOCK),	');
                SQLMemo.Add('FINANCE..D_CLIENTS C WITH (NOLOCK)');
                SQLMemo.Add('WHERE D.UID_SHOP = C.UID');
                SQLMemo.Add('AND E.sName = D.FAMILY COLLATE SQL_Latin1_General_CP1251_CI_AS');
                if ColumnCombo.Text = 'SUPPLIER' then
                    SQLMemo.Add(GetSupplierDoc())
                else
                  Begin
                    if AccuracyRadio.Checked then
                        SQLMemo.Add('AND D.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
                    else
                    If EntryRadio.Checked then
                       SQLMemo.Add('AND D.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
                  end;

                SQLMemo.Add(' AND TYPE_DOC = '  + '''''' + GetTypeDoc(ModulsCombo.ItemIndex) + '''''');
                SQLMemo.Add(TypeDate);
                SQLMemo.Add(GetShopUid());
              end;
     end;
  except
        FreeAndNil(SQLMemo);
  end;
end;

procedure TSearchForm.PublicUtilitiesSqlText(ParamNacl: integer);
begin
  Try
    SQLMemo := TStringList.Create();
     case ParamNacl of
         0:   Begin
                SQLMemo.Add('SELECT  H.UNICUM_NUM,');
                SQLMemo.Add('              H.NUMDOC,');
                SQLMemo.Add('              H.DATE_P_POR,');
                SQLMemo.Add('              H.SUM_NAL,');
                SQLMemo.Add('              H.SUM_NOT_NAL,');
                SQLMemo.Add('              H.FAMILY,');
                SQLMemo.Add('              E.EmployeeName AS FAMILY_1,');
                SQLMemo.Add('              H.CREATE_DATE,');
                SQLMemo.Add('              H.WHO_CORR,');
                SQLMemo.Add('              TT.EmployeeName AS WHO_CORR_1,');
                SQLMemo.Add('              H.DATE_CORR,');
                SQLMemo.Add('              ' + '''''' + '''''' + ' as ' + '''''' + 'TYPE_DOC' + '''''' + ',');
                SQLMemo.Add('              H.PRIMECH');
                SQLMemo.Add('FROM FINANCE..D_PublicUtilities_HEADER H WITH (NOLOCK)');
                SQLMemo.Add('FULL JOIN');
                SQLMemo.Add(' (SELECT E.EmployeeName,');
                SQLMemo.Add('         E.sName');
                SQLMemo.Add(' FROM DELIVERY..A_EMPLOYEES E WITH (NOLOCK)) TT ON TT.sName = H.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS, ');
                SQLMemo.Add('DELIVERY..A_EMPLOYEES E WITH (NOLOCK)');
                if AccuracyRadio.Checked then
                    SQLMemo.Add('WHERE H.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
                 else
                if  EntryRadio.Checked then
                    SQLMemo.Add('WHERE H.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
                SQLMemo.Add(' AND E.sName = H.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS ');
                SQLMemo.Add(TypeDate);
              end;

         1:   Begin
                SQLMemo.Add('SELECT D.UNICUM_NUM,');
                SQLMemo.Add('       D.NUMDOC,');
                SQLMemo.Add('       D.DATE_P_POR,');
                SQLMemo.Add('       D.SUM_NAL,');
                SQLMemo.Add('       D.SUM_NOT_NAL,');
                SQLMemo.Add('       D.UID_SHOP,');
                SQLMemo.Add('       C.Name,');
                SQLMemo.Add('       C.Adress,');
                SQLMemo.Add('       S.sName AS SUPPLIER,');
                SQLMemo.Add('       T.Name AS Type_Energy,');
                SQLMemo.Add('       D.NUM_PREDM,');
                SQLMemo.Add('       D.FAMILY,');
                SQLMemo.Add('       TT.EmployeeName as FAMILY_1,');
                SQLMemo.Add('       D.PRIMECH,');
                SQLMemo.Add('       ' + '''''' + '''''' + ' as ' + '''''' + 'NAZNACHENIE' + '''''' + ',');
                SQLMemo.Add('       Cast(Null as smalldatetime) as Create_Date,');
                SQLMemo.Add('       ' + '''''' + '''''' + ' as ' + '''''' + 'RECIPIENT' + '''''' + ',');
                SQLMemo.Add('       ' + '''''' + '''''' + ' as ' + '''''' + 'TYPE_DOC' + '''''');
                SQLMemo.Add('FROM FINANCE..D_PublicUtilities_DETAIL D WITH (NOLOCK)');
                SQLMemo.Add('FULL JOIN FINANCE..D_CLIENTS C WITH (NOLOCK) ON C.UID = D.UID_SHOP');
                SQLMemo.Add('FULL JOIN FINANCE..D_SUPPLIERS S WITH (NOLOCK) ON S.UID = D.UID_SUPPLIER');
                SQLMemo.Add('FULL JOIN FINANCE..D_TypeEnergy T WITH (NOLOCK) ON T.UID = D.UID_TYPE_ENERGY');
                SQLMemo.Add('FULL JOIN');
                SQLMemo.Add('       (SELECT E.EmployeeName,');
                SQLMemo.Add('               E.sName');
                SQLMemo.Add('        FROM DELIVERY..A_EMPLOYEES E WITH (NOLOCK)) TT ON TT.sName = D.FAMILY COLLATE  SQL_Latin1_General_CP1251_CI_AS');
                if SupplierCombo.ItemIndex <> -1 then
                      SQLMemo.Add('WHERE ' + GetSupplierDoc())
                else
                if TypeEnergyCombo.ItemIndex <> -1 then
                      SQLMemo.Add('WHERE ' + GetTypeEnergyDoc())
                else
                  Begin
                      if AccuracyRadio.Checked then
                          SQLMemo.Add('WHERE D.' + ColumnCombo.Text + TypeEntry() + TypeSimbol() + Trim(FindEdit.Text) + TypeSimbol())
                      else
                      If EntryRadio.Checked then
                         SQLMemo.Add('WHERE D.' + ColumnCombo.Text + TypeEntry() + '''''' + '%' + Trim(FindEdit.Text) + '%' + '''''');
                  end;
                SQLMemo.Add(TypeDate);
                SQLMemo.Add(GetShopUid());
              end;
     end;
  except
        FreeAndNil(SQLMemo);
  end;     
end;


procedure TSearchForm.BarInfo(TabIndex: integer);
var
    Sum_Nal_bar, Sum_Not_Nal_bar: real;
begin
  Sum_Nal_bar := 0;
  Sum_Not_Nal_bar  := 0;

  case TabIndex of
     0:   Begin
            if not (HeaderSet.IsEmpty) and (HeaderSet.Active) then
              Begin
                HeaderSet.First;
                while not HeaderSet.Eof do
                  Begin
                      Sum_Nal_bar := Sum_Nal_bar + HeaderSet.FieldByName('SUM_NAL').AsFloat;
                      Sum_Not_Nal_bar := Sum_Not_Nal_bar + HeaderSet.FieldByName('SUM_NOT_NAL').AsFloat;
                      HeaderSet.Next;
                  end;
                Bar.Panels[0].Text := '������� ����������: ' + IntToStr(HeaderSet.RecordCount);
                Bar.Panels[1].Text := '����� (���): ' + FormatFloat('#,###,###.###', Sum_Nal_bar);
                Bar.Panels[2].Text := '����� (������): ' + FormatFloat('#,###,###.###', Sum_Not_Nal_bar);
              end;
          end;

     1:   Begin
            if not (DetailSet.IsEmpty) and (DetailSet.Active) then
              Begin
                DetailSet.First;
                while not DetailSet.Eof do
                  Begin
                      Sum_Nal_bar := Sum_Nal_bar + DetailSet.FieldByName('SUM_NAL').AsFloat;
                      Sum_Not_Nal_bar := Sum_Not_Nal_bar + DetailSet.FieldByName('SUM_NOT_NAL').AsFloat;
                      DetailSet.Next;
                  end;
                Bar.Panels[0].Text := '������� ����������: ' + IntToStr(DetailSet.RecordCount);
                Bar.Panels[1].Text := '����� (���): ' + FormatFloat('#,###,###.###', Sum_Nal_bar);
                Bar.Panels[2].Text := '����� (������): ' + FormatFloat('#,###,###.###', Sum_Not_Nal_bar);
              end;
          end;
  end;
end;


// ��������� ������� ����� DetailGrid
procedure TSearchForm.SettingDetailGrid(Module_UID: integer);
begin
    case Module_UID of
        TAB_Income: Begin
                       with DetailGrid do
                         Begin
                            Columns[0].Visible := True;
                            Columns[1].Visible := True;
                            Columns[2].Visible := True;
                            Columns[3].Visible := False;
                            Columns[4].Visible := False;
                            Columns[5].Visible := True;
                            Columns[6].Visible := True;
                            Columns[7].Visible := True;
                            Columns[8].Visible := True;
                            Columns[9].Visible := True;
                            Columns[10].Visible := True;
                            Columns[11].Visible := False;
                            Columns[12].Visible := False;
                            Columns[13].Visible := False;
                            Columns[14].Visible := False;
                            Columns[15].Visible := True;
                            Columns[16].Visible := False;
                            Columns[17].Visible := True;
                         end;
                    end;

        TAB_Expense:  Begin
                       with DetailGrid do
                         Begin
                            Columns[0].Visible := True;
                            Columns[1].Visible := True;
                            Columns[2].Visible := True;
                            Columns[3].Visible := False;
                            Columns[4].Visible := False;
                            Columns[5].Visible := True;
                            Columns[6].Visible := True;
                            Columns[7].Visible := True;
                            Columns[8].Visible := True;
                            Columns[9].Visible := True;
                            Columns[10].Visible := True;
                            Columns[11].Visible := True;
                            Columns[12].Visible := True;
                            Columns[13].Visible := False;
                            Columns[14].Visible := False;
                            Columns[15].Visible := True;
                            Columns[16].Visible := False;
                            Columns[17].Visible := True;
                         end;
                      end;

        TAB_ExpenseZP:  Begin
                           with DetailGrid do
                             Begin
                                Columns[0].Visible := True;
                                Columns[1].Visible := True;
                                Columns[2].Visible := True;
                                Columns[3].Visible := False;
                                Columns[4].Visible := False;
                                Columns[5].Visible := True;
                                Columns[6].Visible := True;
                                Columns[7].Visible := True;
                                Columns[8].Visible := True;
                                Columns[9].Visible := True;
                                Columns[10].Visible := True;
                                Columns[11].Visible := False;
                                Columns[12].Visible := True;
                                Columns[13].Visible := False;
                                Columns[14].Visible := False;
                                Columns[15].Visible := True;
                                Columns[16].Visible := False;
                                Columns[17].Visible := True;
                             end;
                        end;

        TAB_ExpenseOther: Begin
                             with DetailGrid do
                               Begin
                                  Columns[0].Visible := True;
                                  Columns[1].Visible := True;
                                  Columns[2].Visible := True;
                                  Columns[3].Visible := False;
                                  Columns[4].Visible := False;
                                  Columns[5].Visible := True;
                                  Columns[6].Visible := True;
                                  Columns[7].Visible := True;
                                  Columns[8].Visible := True;
                                  Columns[9].Visible := True;
                                  Columns[10].Visible := True;
                                  Columns[11].Visible := True;
                                  Columns[12].Visible := True;
                                  Columns[13].Visible := False;
                                  Columns[14].Visible := False;
                                  Columns[15].Visible := True;
                                  Columns[16].Visible := False;
                                  Columns[17].Visible := True;
                               end;
                          end;

        TAB_ZpAup:  Begin
                       with DetailGrid do
                         Begin
                            Columns[0].Visible := True;
                            Columns[1].Visible := True;
                            Columns[2].Visible := True;
                            Columns[3].Visible := False;
                            Columns[4].Visible := False;
                            Columns[5].Visible := True;
                            Columns[6].Visible := True;
                            Columns[7].Visible := True;
                            Columns[8].Visible := False;
                            Columns[9].Visible := True;
                            Columns[10].Visible := True;
                            Columns[11].Visible := True;
                            Columns[12].Visible := False;
                            Columns[13].Visible := False;
                            Columns[14].Visible := False;
                            Columns[15].Visible := True;
                            Columns[16].Visible := False;
                            Columns[17].Visible := True;
                         end;
                    end;

        TAB_TaxToZp:  Begin
                       with DetailGrid do
                         Begin
                            Columns[0].Visible := True;
                            Columns[1].Visible := True;
                            Columns[2].Visible := True;
                            Columns[3].Visible := False;
                            Columns[4].Visible := False;
                            Columns[5].Visible := True;
                            Columns[6].Visible := True;
                            Columns[7].Visible := False;
                            Columns[8].Visible := True;
                            Columns[9].Visible := True;
                            Columns[10].Visible := True;
                            Columns[11].Visible := False;
                            Columns[12].Visible := False;
                            Columns[13].Visible := False;
                            Columns[14].Visible := False;
                            Columns[15].Visible := True;
                            Columns[16].Visible := False;
                            Columns[17].Visible := True;
                         end;
                      end;

        TAB_PercentOfTerminal:  Begin
                                 with DetailGrid do
                                   Begin
                                      Columns[0].Visible := True;
                                      Columns[1].Visible := True;
                                      Columns[2].Visible := True;
                                      Columns[3].Visible := False;
                                      Columns[4].Visible := False;
                                      Columns[5].Visible := True;
                                      Columns[6].Visible := True;
                                      Columns[7].Visible := False;
                                      Columns[8].Visible := True;
                                      Columns[9].Visible := True;
                                      Columns[10].Visible := True;
                                      Columns[11].Visible := False;
                                      Columns[12].Visible := False;
                                      Columns[13].Visible := False;
                                      Columns[14].Visible := False;
                                      Columns[15].Visible := True;
                                      Columns[16].Visible := False;
                                      Columns[17].Visible := False;
                                   end;
                                end;

        TAB_ShipmentVostok: Begin
                                 with DetailGrid do
                                   Begin
                                      Columns[0].Visible := True;
                                      Columns[1].Visible := True;
                                      Columns[2].Visible := True;
                                      Columns[3].Visible := False;
                                      Columns[4].Visible := False;
                                      Columns[5].Visible := True;
                                      Columns[6].Visible := True;
                                      Columns[7].Visible := True;
                                      Columns[8].Visible := True;
                                      Columns[9].Visible := True;
                                      Columns[10].Visible := True;
                                      Columns[11].Visible := False;
                                      Columns[12].Visible := False;
                                      Columns[13].Visible := True;
                                      Columns[14].Visible := False;
                                      Columns[15].Visible := True;
                                      Columns[16].Visible := False;
                                      Columns[17].Visible := True;
                                   end;
                            end;

        TAB_ShipmentOther:  Begin
                                 with DetailGrid do
                                   Begin
                                      Columns[0].Visible := True;
                                      Columns[1].Visible := True;
                                      Columns[2].Visible := True;
                                      Columns[3].Visible := False;
                                      Columns[4].Visible := False;
                                      Columns[5].Visible := True;
                                      Columns[6].Visible := True;
                                      Columns[7].Visible := True;
                                      Columns[8].Visible := True;
                                      Columns[9].Visible := True;
                                      Columns[10].Visible := True;
                                      Columns[11].Visible := False;
                                      Columns[12].Visible := False;
                                      Columns[13].Visible := True;
                                      Columns[14].Visible := False;
                                      Columns[15].Visible := True;
                                      Columns[16].Visible := False;
                                      Columns[17].Visible := True;
                                   end;
                            end;

        TAB_Offs: Begin
                       with DetailGrid do
                         Begin
                            Columns[0].Visible := True;
                            Columns[1].Visible := True;
                            Columns[2].Visible := True;
                            Columns[3].Visible := False;
                            Columns[4].Visible := False;
                            Columns[5].Visible := True;
                            Columns[6].Visible := True;
                            Columns[7].Visible := True;
                            Columns[8].Visible := False;
                            Columns[9].Visible := True;
                            Columns[10].Visible := True;
                            Columns[11].Visible := False;
                            Columns[12].Visible := False;
                            Columns[13].Visible := False;
                            Columns[14].Visible := False;
                            Columns[15].Visible := True;
                            Columns[16].Visible := False;
                            Columns[17].Visible := True;
                         end;
                  end;

        TAB_PublicUtilities:  Begin
                                 with DetailGrid do
                                   Begin
                                      Columns[0].Visible := True;
                                      Columns[1].Visible := True;
                                      Columns[2].Visible := True;
                                      Columns[3].Visible := False;
                                      Columns[4].Visible := False;
                                      Columns[5].Visible := True;
                                      Columns[6].Visible := True;
                                      Columns[7].Visible := True;
                                      Columns[8].Visible := True;
                                      Columns[9].Visible := True;
                                      Columns[10].Visible := True;
                                      Columns[11].Visible := False;
                                      Columns[12].Visible := False;
                                      Columns[13].Visible := True;
                                      Columns[14].Visible := True;
                                      Columns[15].Visible := True;
                                      Columns[16].Visible := False;
                                      Columns[17].Visible := False;
                                   end;
                              end;

        TAB_Return: Begin
                       with DetailGrid do
                         Begin
                            Columns[0].Visible := True;
                            Columns[1].Visible := True;
                            Columns[2].Visible := True;
                            Columns[3].Visible := False;
                            Columns[4].Visible := False;
                            Columns[5].Visible := True;
                            Columns[6].Visible := True;
                            Columns[7].Visible := True;
                            Columns[8].Visible := False;
                            Columns[9].Visible := True;
                            Columns[10].Visible := True;
                            Columns[11].Visible := False;
                            Columns[12].Visible := False;
                            Columns[13].Visible := False;
                            Columns[14].Visible := False;
                            Columns[15].Visible := True;
                            Columns[16].Visible := False;
                            Columns[17].Visible := True;
                         end;
                    end;

        TAB_ENVD: Begin
                       with DetailGrid do
                         Begin
                            Columns[0].Visible := True;
                            Columns[1].Visible := True;
                            Columns[2].Visible := True;
                            Columns[3].Visible := False;
                            Columns[4].Visible := False;
                            Columns[5].Visible := True;
                            Columns[6].Visible := True;
                            Columns[7].Visible := False;
                            Columns[8].Visible := True;
                            Columns[9].Visible := True;
                            Columns[10].Visible := True;
                            Columns[11].Visible := False;
                            Columns[12].Visible := False;
                            Columns[13].Visible := False;
                            Columns[14].Visible := False;
                            Columns[15].Visible := True;
                            Columns[16].Visible := False;
                            Columns[17].Visible := True;
                         end;
                  end;

        TAB_IncomeCash:   Begin
                             with DetailGrid do
                               Begin
                                  Columns[0].Visible := True;
                                  Columns[1].Visible := True;
                                  Columns[2].Visible := True;
                                  Columns[3].Visible := False;
                                  Columns[4].Visible := False;
                                  Columns[5].Visible := True;
                                  Columns[6].Visible := True;
                                  Columns[7].Visible := True;
                                  Columns[8].Visible := True;
                                  Columns[9].Visible := True;
                                  Columns[10].Visible := True;
                                  Columns[11].Visible := False;
                                  Columns[12].Visible := False;
                                  Columns[13].Visible := False;
                                  Columns[14].Visible := False;
                                  Columns[15].Visible := True;
                                  Columns[16].Visible := False;
                                  Columns[17].Visible := True;
                               end;
                          end;

    end;
end;

procedure TSearchForm.PrintBtnClick(Sender: TObject);
begin
    case Tabs.TabIndex of
       0:   Begin
              if not (HeaderSet.IsEmpty) then
                PrintHeaderDoc();
            end;

       1:   Begin
             if not (DetailSet.IsEmpty) then
              PrintDetailNacl(ModulsCombo.ItemIndex);
            end;
    end;
end;

function TSearchForm.GetFiledName: variant;
begin
   Result := ColumnCombo.Text;
end;

function TSearchForm.GetFindText: variant;
begin
   Result := FindEdit.Text;
end;

function TSearchForm.GetModuleName: variant;
begin
  Result := ModulsCombo.Text;
end;

procedure TSearchForm.PrintDetailNacl(Module_UID: integer);
begin
    case Module_UID of
        0: Begin
            DetailSet.DisableControls;
            Report.Template := SSearchIncomeDetail;
            Report.Run;
            DetailSet.First;
            DetailSet.EnableControls;
           end;

        1:   Begin
                DetailSet.DisableControls;
                Report.Template := SSearchExpenseDetail;
                Report.Run;
                DetailSet.First;
                DetailSet.EnableControls;
             end;

        2:   Begin
                DetailSet.DisableControls;
                Report.Template := SSearchExpenseZpDetail;
                Report.Run;
                DetailSet.First;
                DetailSet.EnableControls;
             end;

        3:   Begin
                DetailSet.DisableControls;
                Report.Template := SSearchExpenseDetail;
                Report.Run;
                DetailSet.First;
                DetailSet.EnableControls;
             end;

        4:   Begin
                DetailSet.DisableControls;
                Report.Template := SSearchZpAupDetail;
                Report.Run;
                DetailSet.First;
                DetailSet.EnableControls;
             end;

        5:   Begin
                DetailSet.DisableControls;
                Report.Template := SSearchTaxToZpDetail;
                Report.Run;
                DetailSet.First;
                DetailSet.EnableControls;
             end;

        6:    Begin
                DetailSet.DisableControls;
                Report.Template := SSearchPercentOfTerminalDetail;
                Report.Run;
                DetailSet.First;
                DetailSet.EnableControls;
              end;

        7:    Begin
                DetailSet.DisableControls;
                Report.Template := SSearchShipmentDetail;
                Report.Run;
                DetailSet.First;
                DetailSet.EnableControls;
              end;

        8:    Begin
                DetailSet.DisableControls;
                Report.Template := SSearchShipmentDetail;
                Report.Run;
                DetailSet.First;
                DetailSet.EnableControls;
              end;

        9:   Begin
                DetailSet.DisableControls;
                Report.Template := SSearchOffsDetail;
                Report.Run;
                DetailSet.First;
                DetailSet.EnableControls;
             end;

        10:   Begin
                DetailSet.DisableControls;
                Report.Template := SSearchPublicUtilitiesDetail;
                Report.Run;
                DetailSet.First;
                DetailSet.EnableControls;
             end;

        11:  Begin
                DetailSet.DisableControls;
                Report.Template := SSearchReturnDetail;
                Report.Run;
                DetailSet.First;
                DetailSet.EnableControls;
             end;
             
        12:  Begin
                DetailSet.DisableControls;
                Report.Template := SSearchEnvdDetail;
                Report.Run;
                DetailSet.First;
                DetailSet.EnableControls;
             end;

        13:  Begin
                DetailSet.DisableControls;
                Report.Template := SSearchIncomeDetail;
                Report.Run;
                DetailSet.First;
                DetailSet.EnableControls;
           end;
    end;
end;

procedure TSearchForm.PrintHeaderDoc;
begin 
    HeaderSet.DisableControls;
    Report.Template := SSearchHeader;
    Report.Run;
    HeaderSet.First;
    HeaderSet.EnableControls;
end;

procedure TSearchForm.GetSupplier;
begin
  if DetailRBtn.Checked then
    Begin
        if (ModulsCombo.ItemIndex in [7,8]) and
         (ColumnCombo.ItemIndex = ColumnCombo.Items.IndexOf('Supplier')) then
        Begin
          SuppliersSet.Active := False;
          SuppliersSet.CommandText := Format(SSQLGetSupplier, [1]);
          SuppliersSet.Active := True;
          SupplierCombo.Enabled := True;

          SupplierCombo.Clear;
          SuppliersSet.First;
          while not SuppliersSet.Eof do
            Begin
              SupplierCombo.Items.Add(SuppliersSet.FieldByName('sName').AsString);
              SuppliersSet.Next;
            end;
          SupplierCombo.ItemIndex := -1;

          FindEdit.Clear;
          FindEdit.Enabled := False;
        end
  else
        if (ModulsCombo.ItemIndex = 10) and
         (ColumnCombo.ItemIndex = ColumnCombo.Items.IndexOf('UID_Supplier')) then
            Begin
              SuppliersSet.Active := False;
              SuppliersSet.CommandText := Format(SSQLGetSupplier, [1]);
              SuppliersSet.Active := True;
              SupplierCombo.Enabled := True;

              SupplierCombo.Clear;
              SuppliersSet.First;
              while not SuppliersSet.Eof do
                Begin
                  SupplierCombo.Items.Add(SuppliersSet.FieldByName('sName').AsString);
                  SuppliersSet.Next;
                end;
              SupplierCombo.ItemIndex := -1;

              FindEdit.Clear;
              FindEdit.Enabled := False;
            end
  else
      Begin
            SupplierCombo.Clear;
            SupplierCombo.Enabled := False;
            
            FindEdit.Clear;
            FindEdit.Enabled := True;
      end;
  end;

end;

procedure TSearchForm.GetTypeEnergy;
begin
  if DetailRBtn.Checked then
    Begin
        if (ModulsCombo.ItemIndex = 10) and
         (ColumnCombo.ItemIndex = ColumnCombo.Items.IndexOf('UID_TYPE_ENERGY')) then
        Begin
          TypeEnergySet.Active := False;
          TypeEnergySet.CommandText := Format(SSQLGetTypeEnergy, [i_ReserveWith]);
          TypeEnergySet.Active := True;
          TypeEnergyCombo.Enabled := True;

          TypeEnergyCombo.Clear;
          TypeEnergySet.First;
          while not TypeEnergySet.Eof do
            Begin
              TypeEnergyCombo.Items.Add(TypeEnergySet.FieldByName('Name').AsString);
              TypeEnergySet.Next;
            end;
          TypeEnergyCombo.ItemIndex := -1;
        end
  else
      Begin
            TypeEnergyCombo.Clear;
            TypeEnergyCombo.Enabled := False
      end;
    end;
end;

procedure TSearchForm.GetShop;
begin
  if (ShopCheck.Checked) then
    Begin
      ShopView.Enabled := True;
      ShopView.Items.Clear;
      AppData.Organiz.Active := False;
      AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [1]);
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
    end
  else
      Begin
        ShopView.Enabled := False;
        ShopView.Items.Clear;
      end;
end;

function TSearchForm.ExistObj(Obj: TObject): boolean;
begin
  if Assigned(Obj) then
    Result := True
  else
    Result := False;
end;

procedure TSearchForm.ShopCheckClick(Sender: TObject);
begin
    GetShop();
end;

function TSearchForm.GetShopUid: string;
var
    i: integer;
begin
     if (ShopCheck.Checked) then
       Begin
         for I := 0 to ShopView.Items.Count - 1 do
          begin
            Item := ShopView.Items[I];
            if Item.Checked then
               Result := 'AND UID_SHOP = ' + Item.Caption;
          end;
       end
     else
               Result := EmptyStr;
end;

function TSearchForm.GetSupplierDoc: string;
begin
  if ModulsCombo.ItemIndex in [7,8] then
    Begin
      if ColumnCombo.Text = 'SUPPLIER' then
         Begin
           if SupplierCombo.ItemIndex <> -1 then
              Result :=  ' AND SUPPLIER = ' + '''''' + SupplierCombo.Text + ''''''
           else
              Result := EmptyStr;
         end;
    end
  else
  if ModulsCombo.ItemIndex = 10 then
      Begin
        if ColumnCombo.Text = 'UID_SUPPLIER' then
          Begin
            if SupplierCombo.ItemIndex <> -1 then
               Result := ' UID_SUPPLIER = (SELECT DISTINCT(UID) ' +
                                                  'FROM FINANCE..D_SUPPLIERS WITH (NOLOCK) ' +
                                                  'WHERE sName = ' + '''''' + SupplierCombo.Text + '''''' + ')'
            else
               Result := EmptyStr;
          end;
      end;
end;

function TSearchForm.GetTypeEnergyDoc: string;
begin
    if ModulsCombo.ItemIndex = 10 then
      Begin
        if ColumnCombo.Text = 'UID_TYPE_ENERGY' then
          Result := ' UID_TYPE_ENERGY = (SELECT DISTINCT(UID)' +
                                            'FROM FINANCE..D_TypeEnergy WITH (NOLOCK)'  +
                                            'WHERE Name = ' + '''''' + TypeEnergyCombo.Text + '''''' + ')'
        else
          Result := EmptyStr;
      end;
end;


function TSearchForm.GetNaznachenieDoc: string;
begin
  if NaznachenieCombo.ItemIndex <> -1 then
      Result := ' AND NAZNACHENIE = ' + '''''' + NaznachenieCombo.Text + ''''''
  else
      Result := EmptyStr;
end;

end.
