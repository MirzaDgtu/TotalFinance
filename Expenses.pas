unit Expenses;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, ExtCtrls, StdCtrls, Buttons, Menus, DateUtils,
  Spin, DB, ADODB, ComObj;

type
  TExpenseForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Bar: TStatusBar;
    ExpenseStringGrid: TStringGrid;
    Label1: TLabel;
    MonthCombo: TComboBox;
    ExpencePicker: TDateTimePicker;
    NaznachenieCombo: TComboBox;
    Label2: TLabel;
    NumDocEdit: TEdit;
    SaveExpenseBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    PopupSaveMenu: TPopupMenu;
    SavePop: TMenuItem;
    AddBtn: TBitBtn;
    Label3: TLabel;
    PrimechEdit: TEdit;
    YearSpinEdit: TSpinEdit;
    NaznachenieAccess: TADODataSet;
    NaznachenieAccessUID: TIntegerField;
    NaznachenieAccesssName: TStringField;
    PopupRowMenu: TPopupMenu;
    AddPopup: TMenuItem;
    DeletePopup: TMenuItem;
    SaveNoPop: TMenuItem;
    PrintBtn: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure SaveExpenseBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NaznachenieComboChange(Sender: TObject);
    procedure NaznachenieComboExit(Sender: TObject);
    procedure ExpenseStringGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure ExpenseStringGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MonthComboChange(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure NaznachenieAccessBeforeOpen(DataSet: TDataSet);
    procedure SaveNoPopClick(Sender: TObject);
    procedure SavePopClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
  private
    FOldSumNalDoc: real;
    FSumNalCashBox: real;
    FNewSumNalDoc: real;
    { Private declarations }
    procedure  DeleteRow(StringGrid: TStringGrid; ARow: Integer);
    procedure  SaveNewExpenseDoc;
    procedure  SaveCorrExpenseDoc;
    procedure  SaveNewExpenseZPDoc;
    procedure  SaveCorrExpenseZPDoc;
    procedure  SaveNewExpenseOtherDoc;
    procedure  SaveCorrExpenseOtherDoc;
    procedure  GetNaznachenie;
    function   CalcValueCellsVB(StringCalc: string): string;
    procedure SetNewSumNalDoc(const Value: real);
    procedure SetOldSumNalDoc(const Value: real);
    procedure SetSumNalCashBox(const Value: real);
  public
    { Public declarations }
    procedure ExpenceSetting(Type_Expense, Type_ExpenseView: integer);
    procedure ExpenseSaveDoc(Type_Expense, Type_ExpenseSave: integer);

     property SumNalCashBox: real read FSumNalCashBox write SetSumNalCashBox;
     property OldSumNalDoc: real read FOldSumNalDoc write SetOldSumNalDoc;
     property NewSumNalDoc: real read FNewSumNalDoc write SetNewSumNalDoc;
  end;

var
  ExpenseForm: TExpenseForm;

implementation

uses Main, sConst, ModuleData, Globals, Types, Shop, Naznachenie;

{$R *.dfm}

{ TExpenseForm }
     
procedure TExpenseForm.FormActivate(Sender: TObject);
begin
  if (TypeExpense = TAB_ExpenseZP) and (TypeSaveExpence = g_CreateDoc) then
  begin
    if MonthCombo.ItemIndex = 0 then
      SaveExpenseBtn.Enabled := False;
  end
  else
    SaveExpenseBtn.Enabled := True;
  GetNaznachenie();
end;

procedure TExpenseForm.MonthComboChange(Sender: TObject);
var
    d_Date: TDateTime;
begin
  if TypeExpense = TAB_ExpenseZP then
  begin
    if (TypeSaveExpence = g_CreateDoc) or (TypeSaveExpence = g_CorrDoc) then
    begin
      if MonthCombo.ItemIndex <> 0 then
        begin
          SavePop.Enabled := True;
          SaveExpenseBtn.Enabled := True;
          d_Date := EndOfTheMonth(StrToDateTime('01.' + IntToStr(MonthCombo.ItemIndex) + '.' + IntToStr(YearSpinEdit.Value)));
          ExpencePicker.Date := EndOfTheMonth (d_Date);
        end
      else
        Begin
          if MonthCombo.ItemIndex = 0 then
            Begin
              SaveExpenseBtn.Enabled := False;
              SavePop.Enabled := False;
            end;
        end;
    end;
  end
  else
     SavePop.Enabled := True;
     SaveExpenseBtn.Enabled := True;
end;

// �������� �������� �� ���������
procedure TExpenseForm.DeleteRow(StringGrid: TStringGrid; ARow: Integer);
var i, j: Integer;
begin
  with ExpenseStringGrid do
  begin
    for i:=ARow+1 to RowCount-1 do
      for j:=0 to ColCount-1 do
        Cells[j, i-1]:=Cells[j, i];
    for i:=1 to ColCount-1 do
      Cells[i, RowCount-1]:='';
    RowCount:=RowCount-1;
  end;
end;

procedure TExpenseForm.DeleteBtnClick(Sender: TObject);
var
    i:integer;
begin
      If ExpenseStringGrid.Row <> 0 then
       Begin
          DeleteRow(ExpenseStringGrid, ExpenseStringGrid.Row);
          For i:= 1 to ExpenseStringGrid.RowCount do
            ExpenseStringGrid.Cells[0,i] := IntToStr(i);
          ExpenseStringGrid.Cells[0,0] := 'NN';
       end
      else
          Exit;
end;

procedure TExpenseForm.SaveExpenseBtnClick(Sender: TObject);
begin
    PopupSaveMenu.Popup(SaveExpenseBtn.ClientOrigin.X, SaveExpenseBtn.ClientOrigin.Y);
end;

procedure TExpenseForm.FormCreate(Sender: TObject);
begin
    ExpenseStringGrid.DefaultRowHeight := NaznachenieCombo.Height;
    YearSpinEdit.Value := CurrentYear;
end;

procedure TExpenseForm.NaznachenieComboChange(Sender: TObject);
begin
    ExpenseStringGrid.Cells[ExpenseStringGrid.Col, ExpenseStringGrid.Row] := NaznachenieCombo.Items[NaznachenieCombo.ItemIndex];
    NaznachenieCombo.Visible := False;
end;

procedure TExpenseForm.NaznachenieComboExit(Sender: TObject);
begin
    ExpenseStringGrid.Cells[ExpenseStringGrid.Col, ExpenseStringGrid.Row] := NaznachenieCombo.Items[NaznachenieCombo.ItemIndex];
    NaznachenieCombo.Visible := False;
end;

procedure TExpenseForm.ExpenseStringGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
    R: TRECT;
begin
    { DONE -cCombobox : ����������� ����������� ������ ���������� ��� ����������� ����������� ������ ��������� ���� }
 if TypeSaveExpence <> g_Preview then
   Begin
    If ACol in [4,5,6,7,8] then
        ExpenseStringGrid.Options := ExpenseStringGrid.Options  + [goEditing]
    else
        ExpenseStringGrid.Options := ExpenseStringGrid.Options  - [goEditing];

    if ((ACol = 6) and (ARow <> 0)) then
      Begin
        NaznachenieCombo.ItemIndex :=  NaznachenieCombo.Items.IndexOf(ExpenseStringGrid.Cells[ACol, ARow]);
        R:= ExpenseStringGrid.CellRect(ACol, ARow);
        R.Left  := R.Left + ExpenseStringGrid.Left;
        R.Right := R.Right + ExpenseStringGrid.Left;
        R.Top   := R.Top + ExpenseStringGrid.Top;
        R.Bottom := R.Bottom + ExpenseStringGrid.Top;
        NaznachenieCombo.Left := R.Left +1;
        NaznachenieCombo.Top  := R.Top + 1;
        NaznachenieCombo.Width := (R.Right + 1) - R.Left;
        NaznachenieCombo.Height := (R.Bottom + 1) - R.Top;

        NaznachenieCombo.Visible := True;
        NaznachenieCombo.SetFocus;
      end;
    CanSelect := True;
   end;
end;

procedure TExpenseForm.ExpenseStringGridKeyPress(Sender: TObject;
  var Key: Char);
var
  vrPos, vrLength: byte;
begin
    with Sender as TStringGrid do
        Begin
         vrLength := Length(Cells[Col, Row]);
         vrPos := Pos(',',Cells[Col,Row]);

          if (Col = 4) or (Col = 5) then
          Begin
        //  ����������� �� ���������� ��������
            case Key of
              '0'..'9','+','-','*','/':  ;
              '=':  Begin
                      if Pos('=', Cells[Col, Row]) > 0 then
                          Key := #0;
                    end;
              '.',',' :  {Begin
                            if (vrPos >0) or (vrLength = 0) then
                               Key := #0
                            else
                               Key := DecimalSeparator;
                         end};
              #8      :  ;
              // ��� ESC ����� ������������ Ctrl+z
              #27     : begin
                          keybd_event(VK_LCONTROL, 0, 0, 0);               // ������� ������� Ctrl
                          keybd_event(Ord('Z'), 0, 0, 0);                  // ������� ������� Z
                          keybd_event(Ord('Z'), 0, KEYEVENTF_KEYUP, 0);    // ���������� ������� Ctrl
                          keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0); // ���������� ������� Z
                        end;
              #26     :  ; 
              #13     :  Begin
                           with Sender as TStringGrid do
                           Begin
                              if ExpenseStringGrid.Col in [4,5] then
                                Begin
                                  try
                                    if Pos('=', Cells[Col, Row]) <> 0 then
                                       ExpenseStringGrid.Cells[Col, Row] :=  CalcValueCellsVB(ExpenseStringGrid.Cells[Col, Row]);
                                  except
                                    MessageBox(Handle, PChar('������� ������������ ������!'), PChar(ExpenseForm.Caption), MB_ICONERROR+MB_OK);
                                  end;
                                end;
                           end;
                         end;
              else
              Key := chr(0);
             end;
          end;
    end;
end;

procedure TExpenseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    i: integer;
begin
  for i := 0 to ExpenseStringGrid.ColCount - 1 do
    Begin
      ExpenseStringGrid.Cols[i].Clear;
    end;

  for i := 0 to ExpenseStringGrid.RowCount - 1 do
    Begin
      ExpenseStringGrid.Rows[i].Clear;
    end;

  if TypeSaveExpence <> g_Preview then
     Begin
        Case TypeExpense of
          TAB_Expense:  Begin
                          AppData.AdoCmd.CommandText := Format(SSQLUpdateExpStatusCorrDoc, [MainForm.ReestrExpense.FieldByName('UNICUM_NUM').AsInteger, 0]);
                          AppData.AdoCmd.Execute;
                          MainForm.ReestrExpense.Active := False;
                          MainForm.ReestrExpense.Active := True;
                        end;

         TAB_ExpenseZP: Begin
                          AppData.AdoCmd.CommandText := Format(SSQLUpdateExpStatusCorrDoc, [MainForm.ReestrExpenseZP.FieldByName('UNICUM_NUM').AsInteger, 0]);
                          AppData.AdoCmd.Execute;
                          MainForm.ReestrExpenseZp.Active := False;
                          MainForm.ReestrExpenseZp.Active := True;
                        end;

         TAB_ExpenseOther: Begin
                             AppData.AdoCmd.CommandText := Format(SSQLUpdateExpStatusCorrDoc, [MainForm.ReestrExpenseOther.FieldByName('UNICUM_NUM').AsInteger, 0]);
                             AppData.AdoCmd.Execute;
                             MainForm.ReestrExpenseOther.Active := False;
                             MainForm.ReestrExpenseOther.Active := True;
                           end;
        end;
     end;
end;

  // ������������� ���������� ���������
procedure TExpenseForm.SaveCorrExpenseDoc;
var
    I: integer;
    Sum_Nal, Sum_Not_nal: real;
Begin
 Sum_Nal := 0;
 Sum_Not_Nal := 0;

 for i := 1 to ExpenseStringGrid.RowCount-1 do
  Begin
    if ExpenseStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Nal     := Sum_Nal +  StrToFloat(StringReplace(ExpenseStringGrid.Cells[4,i], '.', ',',  [rfReplaceAll, rfIgnoreCase]));
    if ExpenseStringGrid.Cells[5,i] <> EmptyStr then
      Sum_Not_Nal := Sum_Not_Nal +StrToFloat(StringReplace(ExpenseStringGrid.Cells[5,i], '.', ',',  [rfReplaceAll, rfIgnoreCase]));
  end;

  // �������� ������ ������ ��������� ��������� � ������� ��������� � �����
   AppData.DeleteExpenceDoc.Active := False;
   AppData.DeleteExpenceDoc.CommandText  := Format(SSQLDeleteExpenceDocum, [MainForm.ReestrExpense.FieldByName('UNICUM_NUM').AsInteger]);
   AppData.DeleteExpenceDoc.Active := True;


  // ����� ��������� ���������
   AppData.CorrExpenceDoc.Active := False;
   AppData.CorrExpenceDoc.CommandText := Format(SSQLCorrExpenceDoc_h, [     StrToInt(NumDocEdit.Text),
                                                                            FormatDateTime('yyyy-mm-dd', ExpencePicker.Date),
                                                                            PrimechEdit.Text,
                                                                            MainForm.ReestrExpense.FieldByName('FAMILY').AsString,
                                                                            FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz', MainForm.ReestrExpense.FieldByName('CREATE_DATE').AsDateTime),
                                                                            StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            s_Expense,
                                                                            g_User]);
  AppData.CorrExpenceDoc.Active := True;


  AppData.MaxUnicumNumExpense.Active := False;
  AppData.MaxUnicumNumExpense.Active := True;


  // �������� ��������� ���������
    for i := 1 to ExpenseStringGrid.RowCount-1 do
  Begin
    AppData.ExpenseDocDetail.Active := False;
    AppData.ExpenseDocDetail.CommandText := Format(SSQLCreateExpenseDocDetail, [AppData.MaxUnicumNumExpense.FieldByName('UNICUM_NUM').AsInteger,
                                                                                StrToInt(NumDocEdit.Text),
                                                                                FormatDateTime('yyyy-mm-dd',ExpencePicker.Date),
                                                                                StrToInt(ExpenseStringGrid.Cells[0,i]),
                                                                                StrToInt(ExpenseStringGrid.Cells[1,i]),
                                                                                StringReplace(ExpenseStringGrid.Cells[4,i], ',', '.',   [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(ExpenseStringGrid.Cells[5,i], ',', '.',   [rfReplaceAll, rfIgnoreCase]),
                                                                                ExpenseStringGrid.Cells[6,i],
                                                                                ExpenseStringGrid.Cells[8,i],
                                                                                g_User,
                                                                                s_Expense,
                                                                                ExpenseStringGrid.Cells[7,i]
                                                                                ]);
    AppData.ExpenseDocDetail.Active := True;
  end;

  NewSumNalDoc := Sum_Nal;
  MainForm.ReestrExpense.Active := False;
  MainForm.ReestrExpense.Active := True;
  MainForm.Tabs.TabIndex := TAB_Expense;

end;



// ���������� ������ ���������� ���������
procedure TExpenseForm.SaveNewExpenseDoc;
var
    I: integer;
    Sum_Nal, Sum_Not_nal: real;
begin

 Sum_Nal := 0;
 Sum_Not_Nal := 0;

 for i := 1 to ExpenseStringGrid.RowCount-1 do
  Begin
    if ExpenseStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Nal     := Sum_Nal +  StrToFloat(StringReplace(ExpenseStringGrid.Cells[4,i],  '.', ',', [rfReplaceAll, rfIgnoreCase]));
    if ExpenseStringGrid.Cells[5,i] <> EmptyStr then
      Sum_Not_Nal := Sum_Not_Nal +StrToFloat(StringReplace(ExpenseStringGrid.Cells[5,i], '.', ',',  [rfReplaceAll, rfIgnoreCase]));
  end;


  AppData.ExpenseDocHead.Active := False;
  AppData.ExpenseDocHead.CommandText := Format(SSQLCreateExpenseDocHead,[FormatDateTime('yyyy-mm-dd', ExpencePicker.Date),
                                                                         PrimechEdit.Text,
                                                                         g_User,
                                                                         StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                         StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                         s_Expense]);
  AppData.ExpenseDocHead.Active := True;


  AppData.MaxUnicumNumExpense.Active := False;
  AppData.MaxUnicumNumExpense.Active := True;

  for i := 1 to ExpenseStringGrid.RowCount-1 do
  Begin
    AppData.ExpenseDocDetail.Active := False;
    AppData.ExpenseDocDetail.CommandText := Format(SSQLCreateExpenseDocDetail, [AppData.MaxUnicumNumExpense.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumExpense.FieldByName('NUMDOC').AsInteger,
                                                                                FormatDateTime('yyyy-mm-dd',ExpencePicker.Date),
                                                                                StrToInt(ExpenseStringGrid.Cells[0,i]),
                                                                                StrToInt(ExpenseStringGrid.Cells[1,i]),
                                                                                StringReplace(ExpenseStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(ExpenseStringGrid.Cells[5,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                ExpenseStringGrid.Cells[6,i],
                                                                                ExpenseStringGrid.Cells[8,i],
                                                                                g_User,
                                                                                s_Expense,
                                                                                ExpenseStringGrid.Cells[7,i]
                                                                                ]);
    AppData.ExpenseDocDetail.Active := True;
  end;
  

    MainForm.ReestrExpense.Active := False;
    MainForm.ReestrExpense.Active := True;
    MainForm.Tabs.TabIndex := TAB_Expense;
    NewSumNalDoc := Sum_Nal;
end;

// ���������� ������ ���������� (��) ���������
procedure TExpenseForm.SaveNewExpenseZPDoc;
var
    I: integer;
    Sum_Nal, Sum_Not_nal: real;
begin

 Sum_Nal := 0;
 Sum_Not_Nal := 0;


 for i := 1 to ExpenseStringGrid.RowCount-1 do
  Begin
    if ExpenseStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Nal     := Sum_Nal +  StrToFloat(StringReplace(ExpenseStringGrid.Cells[4,i], '.', ',',  [rfReplaceAll, rfIgnoreCase]));
    if ExpenseStringGrid.Cells[5,i] <> EmptyStr then
      Sum_Not_Nal := Sum_Not_Nal + StrToFloat(StringReplace(ExpenseStringGrid.Cells[5,i], '.', ',',  [rfReplaceAll, rfIgnoreCase]));
  end;


  AppData.ExpenseDocHead.Active := False;
  AppData.ExpenseDocHead.CommandText := Format(SSQLCreateExpenseDocHead,[FormatDateTime('yyyy-mm-dd', ExpencePicker.Date),
                                                                         PrimechEdit.Text,
                                                                         g_User,
                                                                         StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                         StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                         s_ExpenseZp]);
  AppData.ExpenseDocHead.Active := True;

  AppData.MaxUnicumNumExpense.Active := False;
  AppData.MaxUnicumNumExpense.Active := True;

  for i := 1 to ExpenseStringGrid.RowCount-1 do
  Begin
    AppData.ExpenseDocDetail.Active := False;
    AppData.ExpenseDocDetail.CommandText := Format(SSQLCreateExpenseDocDetail, [AppData.MaxUnicumNumExpense.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumExpense.FieldByName('NUMDOC').AsInteger,
                                                                                FormatDateTime('yyyy-mm-dd', ExpencePicker.Date),
                                                                                StrToInt(ExpenseStringGrid.Cells[0,i]),
                                                                                StrToInt(ExpenseStringGrid.Cells[1,i]),
                                                                                StringReplace(ExpenseStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(ExpenseStringGrid.Cells[5,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                ExpenseStringGrid.Cells[6,i],
                                                                                ExpenseStringGrid.Cells[8,i],
                                                                                g_User,
                                                                                s_ExpenseZp,
                                                                                Null
                                                                                ]);
    AppData.ExpenseDocDetail.Active := True;
  end;
  MainForm.ReestrExpenseZP.Active := False;
  MainForm.ReestrExpenseZP.Active := True;
  MainForm.Tabs.TabIndex := TAB_ExpenseZP;
  NewSumNalDoc := Sum_Nal;
end;


// ���������� ������������������� ���������� (��) ���������
procedure TExpenseForm.SaveCorrExpenseZPDoc;
var
    I: integer;
    Sum_Nal, Sum_Not_nal: real;
Begin
 Sum_Nal := 0;
 Sum_Not_Nal := 0;

 for i := 1 to ExpenseStringGrid.RowCount-1 do
  Begin
    if ExpenseStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Nal     := Sum_Nal +  StrToFloat(StringReplace(ExpenseStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
    if ExpenseStringGrid.Cells[5,i] <> EmptyStr then
      Sum_Not_Nal := Sum_Not_Nal +StrToFloat(StringReplace(ExpenseStringGrid.Cells[5,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
  end;

  // �������� ������ ������ ��������� ��������� � ������� ��������� � �����
   AppData.DeleteExpenceDoc.Active := False;
   AppData.DeleteExpenceDoc.CommandText  := Format(SSQLDeleteExpenceDocum, [MainForm.ReestrExpenseZP.FieldByName('UNICUM_NUM').AsInteger]);
   AppData.DeleteExpenceDoc.Active := True;

  // ����� ��������� ���������
   AppData.CorrExpenceDoc.Active := False;
   AppData.CorrExpenceDoc.CommandText := Format(SSQLCorrExpenceDoc_h, [     StrToInt(NumDocEdit.Text),
                                                                            FormatDateTime('yyyy-mm-dd', ExpencePicker.Date),
                                                                            PrimechEdit.Text,
                                                                            MainForm.ReestrExpenseZP.FieldByName('FAMILY').AsString,
                                                                            FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz', MainForm.ReestrExpenseZP.FieldByName('CREATE_DATE').AsDateTime),
                                                                            StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            s_ExpenseZp,
                                                                            g_User]);
  AppData.CorrExpenceDoc.Active := True;

  AppData.MaxUnicumNumExpense.Active := False;
  AppData.MaxUnicumNumExpense.Active := True;

  // �������� ��������� ���������
    for i := 1 to ExpenseStringGrid.RowCount-1 do
  Begin
    AppData.ExpenseDocDetail.Active := False;
    AppData.ExpenseDocDetail.CommandText := Format(SSQLCreateExpenseDocDetail, [AppData.MaxUnicumNumExpense.FieldByName('UNICUM_NUM').AsInteger,
                                                                                StrToInt(NumDocEdit.Text),
                                                                                FormatDateTime('yyyy-mm-dd',ExpencePicker.Date),
                                                                                StrToInt(ExpenseStringGrid.Cells[0,i]),
                                                                                StrToInt(ExpenseStringGrid.Cells[1,i]),
                                                                                StringReplace(ExpenseStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(ExpenseStringGrid.Cells[5,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                Null,
                                                                                ExpenseStringGrid.Cells[8,i],
                                                                                g_User,
                                                                                s_ExpenseZp,
                                                                                Null
                                                                                ]);
    AppData.ExpenseDocDetail.Active := True;
  end;

  NewSumNalDoc := Sum_Nal;
  MainForm.ReestrExpenseZp.Active := False;
  MainForm.ReestrExpenseZp.Active := True;
  MainForm.Tabs.TabIndex := TAB_ExpenseZp;
end;

procedure TExpenseForm.AddBtnClick(Sender: TObject);
begin
    fl_ShopInDoc := 2;
    ShopForm.SettingShopForm(1);
    ShopForm.ShowModal();
end;


// �������� ������ ���������� (������) ���������
procedure TExpenseForm.SaveNewExpenseOtherDoc;
var
    I: integer;
    Sum_Nal, Sum_Not_nal: real;
begin

 Sum_Nal := 0;
 Sum_Not_Nal := 0;

 for i := 1 to ExpenseStringGrid.RowCount-1 do
  Begin
    if ExpenseStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Nal     := Sum_Nal +  StrToFloat(StringReplace(ExpenseStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
    if ExpenseStringGrid.Cells[5,i] <> EmptyStr then
      Sum_Not_Nal := Sum_Not_Nal +StrToFloat(StringReplace(ExpenseStringGrid.Cells[5,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
  end;


  AppData.ExpenseDocHead.Active := False;
  AppData.ExpenseDocHead.CommandText := Format(SSQLCreateExpenseDocHead,[FormatDateTime('yyyy-mm-dd', ExpencePicker.Date),
                                                                         PrimechEdit.Text,
                                                                         g_User,
                                                                         StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                         StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                         s_ExpenseOther]);
  AppData.ExpenseDocHead.Active := True;

  AppData.MaxUnicumNumExpense.Active := False;
  AppData.MaxUnicumNumExpense.Active := True;

  for i := 1 to ExpenseStringGrid.RowCount-1 do
  Begin
    AppData.ExpenseDocDetail.Active := False;
    AppData.ExpenseDocDetail.CommandText := Format(SSQLCreateExpenseDocDetail, [AppData.MaxUnicumNumExpense.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumExpense.FieldByName('NUMDOC').AsInteger,
                                                                                FormatDateTime('yyyy-mm-dd',ExpencePicker.Date),
                                                                                StrToInt(ExpenseStringGrid.Cells[0,i]),
                                                                                StrToInt(ExpenseStringGrid.Cells[1,i]),
                                                                                StringReplace(ExpenseStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(ExpenseStringGrid.Cells[5,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                ExpenseStringGrid.Cells[6,i],
                                                                                ExpenseStringGrid.Cells[8,i],
                                                                                g_User,
                                                                                s_ExpenseOther,
                                                                                ExpenseStringGrid.Cells[7,i]
                                                                                ]);
    AppData.ExpenseDocDetail.Active := True;
  end;

    MainForm.ReestrExpenseOther.Active := False;
    MainForm.ReestrExpenseOther.Active := True;
    MainForm.Tabs.TabIndex := TAB_ExpenseOther;
    NewSumNalDoc := Sum_Nal;
end;

// ���������� ������������������� ���������� (������) ���������
procedure TExpenseForm.SaveCorrExpenseOtherDoc;
var
    I: integer;
    Sum_Nal, Sum_Not_nal: real;
Begin
 Sum_Nal := 0;
 Sum_Not_Nal := 0;

 for i := 1 to ExpenseStringGrid.RowCount-1 do
  Begin
    if ExpenseStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Nal     := Sum_Nal +  StrToFloat(StringReplace(ExpenseStringGrid.Cells[4,i], '.', ',',  [rfReplaceAll, rfIgnoreCase]));
    if ExpenseStringGrid.Cells[5,i] <> EmptyStr then
      Sum_Not_Nal := Sum_Not_Nal +StrToFloat(StringReplace(ExpenseStringGrid.Cells[5,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
  end;

  // �������� ������ ������ ��������� ��������� � ������� ��������� � �����
   AppData.DeleteExpenceDoc.Active := False;
   AppData.DeleteExpenceDoc.CommandText  := Format(SSQLDeleteExpenceDocum, [MainForm.ReestrExpenseOther.FieldByName('UNICUM_NUM').AsInteger]);
   AppData.DeleteExpenceDoc.Active := True;

  // ����� ��������� ���������
   AppData.CorrExpenceDoc.Active := False;
   AppData.CorrExpenceDoc.CommandText := Format(SSQLCorrExpenceDoc_h, [     StrToInt(NumDocEdit.Text),
                                                                            FormatDateTime('yyyy-mm-dd', ExpencePicker.Date),
                                                                            PrimechEdit.Text,
                                                                            MainForm.ReestrExpenseOther.FieldByName('FAMILY').AsString,
                                                                            FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz', MainForm.ReestrExpenseOther.FieldByName('CREATE_DATE').AsDateTime),
                                                                            StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            s_ExpenseOther,
                                                                            g_User]);
  AppData.CorrExpenceDoc.Active := True;

  AppData.MaxUnicumNumExpense.Active := False;
  AppData.MaxUnicumNumExpense.Active := True;

  // �������� ��������� ���������
    for i := 1 to ExpenseStringGrid.RowCount-1 do
  Begin
    AppData.ExpenseDocDetail.Active := False;
    AppData.ExpenseDocDetail.CommandText := Format(SSQLCreateExpenseDocDetail, [AppData.MaxUnicumNumExpense.FieldByName('UNICUM_NUM').AsInteger,
                                                                                StrToInt(NumDocEdit.Text),
                                                                                FormatDateTime('yyyy-mm-dd',ExpencePicker.Date),
                                                                                StrToInt(ExpenseStringGrid.Cells[0,i]),
                                                                                StrToInt(ExpenseStringGrid.Cells[1,i]),
                                                                                StringReplace(ExpenseStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(ExpenseStringGrid.Cells[5,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                ExpenseStringGrid.Cells[6,i],
                                                                                ExpenseStringGrid.Cells[8,i],
                                                                                g_User,
                                                                                s_ExpenseOther,
                                                                                ExpenseStringGrid.Cells[7,i]
                                                                                ]);
    AppData.ExpenseDocDetail.Active := True;
  end;

  MainForm.ReestrExpenseOther.Active := False;
  MainForm.ReestrExpenseOther.Active := True;
  MainForm.Tabs.TabIndex := TAB_ExpenseOther;
  NewSumNalDoc := Sum_Nal;
end;

procedure TExpenseForm.GetNaznachenie;
begin

  NaznachenieAccess.Active := False;
  NaznachenieAccess.Active := True;

  NaznachenieCombo.Items.Clear;
  NaznachenieAccess.First;
  while not NaznachenieAccess.Eof do
    Begin
      NaznachenieCombo.Items.Add(NaznachenieAccess.FieldByName('sName').AsString);
      NaznachenieAccess.Next;
    end;
end;

procedure TExpenseForm.NaznachenieAccessBeforeOpen(DataSet: TDataSet);
begin
   NaznachenieAccess.CommandText := Format(SSQLGetUserNaznachenieAccess, [g_UserUID]);
end;


// ��������� ��� ��������� ����������


procedure TExpenseForm.ExpenceSetting(Type_Expense,
  Type_ExpenseView: integer);
var
    i: integer;
begin

  case Type_Expense of
    // ������
     TAB_Expense:   begin
                      case Type_ExpenseView of
                         g_CreateDoc:  // ��������
                                        begin
                                          with ExpenseStringGrid do
                                          Begin
                                            ColCount := 9;
                                            Cells[0,0] := 'NN';
                                            Cells[1,0] := 'UID';
                                            Cells[2,0] := '��������';
                                            Cells[3,0] := '�����';
                                            Cells[4,0] := '����� (���)';
                                            Cells[5,0] := '����� (������)';
                                            Cells[6,0] := '����������';
                                            Cells[7,0] := '����������';
                                            Cells[8,0] := '����������';

                                            ColWidths[0] := 25;
                                            ColWidths[1] := 50;
                                            ColWidths[2] := 110;
                                            ColWidths[3] := 200;
                                            ColWidths[4] := 70;
                                            ColWidths[5] := 80;
                                            ColWidths[6] := 130;
                                            ColWidths[7] := 150;
                                            ColWidths[8] := 200;
                                          end;

                                          ExpenseForm.Caption := '�������� ��������� (�������)';
                                          ExpenseForm.Width := 1050;
                                          Label1.Caption := '��';
                                          PrimechEdit.Enabled := True;

                                          NumDocEdit.Text := EmptyStr;
                                          PrimechEdit.Text := EmptyStr;
                                          ExpencePicker.Date := Now();

                                          MonthCombo.Visible := False;
                                          YearSpinEdit.Visible := False;
                                          ExpencePicker.Enabled := True;
                                          ExpencePicker.Visible := True;

                                          SaveExpenseBtn.Enabled := True;
                                          SavePop.Enabled := True;
                                          SaveNoPop.Enabled := True;
                                          AddBtn.Enabled := True;
                                          AddPopup.Enabled := True;
                                          DeleteBtn.Enabled := True;
                                          DeletePopup.Enabled := True;
                                          PrintBtn.Enabled := False;

                                          ExpenseStringGrid.Options := ExpenseStringGrid.Options + [goEditing];
                                        end;

                         g_CorrDoc:    // �������������
                                        begin
                                           with ExpenseStringGrid do
                                           Begin
                                              ColCount := 9;
                                              Cells[0,0] := 'NN';
                                              Cells[1,0] := 'UID';
                                              Cells[2,0] := '��������';
                                              Cells[3,0] := '�����';
                                              Cells[4,0] := '����� (���)';
                                              Cells[5,0] := '����� (������)';
                                              Cells[6,0] := '����������';
                                              Cells[7,0] := '����������';
                                              Cells[8,0] := '����������';

                                              ColWidths[0] := 25;
                                              ColWidths[1] := 50;
                                              ColWidths[2] := 110;
                                              ColWidths[3] := 200;
                                              ColWidths[4] := 70;
                                              ColWidths[5] := 80;
                                              ColWidths[6] := 130;
                                              ColWidths[7] := 150;
                                              ColWidths[8] := 200;
                                           end;

                                          ExpenseForm.Caption := '������������� ��������� (�������)';
                                          ExpenseForm.Width := 1050;
                                          Label1.Caption := '��';
                                          PrimechEdit.Enabled := True;

                                          MonthCombo.Visible := False;
                                          YearSpinEdit.Visible := False;
                                          ExpencePicker.Enabled := True;

                                          SaveExpenseBtn.Enabled := True;
                                          SavePop.Enabled := True;
                                          SaveNoPop.Enabled := True;
                                          AddBtn.Enabled := True;
                                          AddPopup.Enabled := True;
                                          DeleteBtn.Enabled := True;
                                          DeletePopup.Enabled := True;
                                          PrintBtn.Enabled := True;

                                          ExpenseStringGrid.Options := ExpenseStringGrid.Options + [goEditing];
                                        end;

                         g_Preview:    // ��������
                                        Begin
                                          with ExpenseStringGrid do
                                          Begin
                                            ColCount := 9;
                                            Cells[0,0] := 'NN';
                                            Cells[1,0] := 'UID';
                                            Cells[2,0] := '��������';
                                            Cells[3,0] := '�����';
                                            Cells[4,0] := '����� (���)';
                                            Cells[5,0] := '����� (������)';
                                            Cells[6,0] := '����������';
                                            Cells[7,0] := '����������';
                                            Cells[8,0] := '����������';

                                            ColWidths[0] := 25;
                                            ColWidths[1] := 50;
                                            ColWidths[2] := 110;
                                            ColWidths[3] := 200;
                                            ColWidths[4] := 70;
                                            ColWidths[5] := 80;
                                            ColWidths[6] := 130;
                                            ColWidths[7] := 150;
                                            ColWidths[8] := 200;
                                          end;

                                          ExpenseForm.Caption := '�������� ��������� (�������)';
                                          ExpenseForm.Width := 1050;
                                          Label1.Caption := '��';

                                          NumDocEdit.Enabled := False;
                                          PrimechEdit.Enabled := False;
                                          ExpencePicker.Enabled := False;

                                          MonthCombo.Visible := False;
                                          YearSpinEdit.Visible := False;

                                          SaveExpenseBtn.Enabled := False;
                                          SavePop.Enabled := False;
                                          SaveNoPop.Enabled := False;
                                          AddBtn.Enabled := False;
                                          AddPopup.Enabled := False;
                                          DeleteBtn.Enabled := False;
                                          DeletePopup.Enabled := False;
                                          PrintBtn.Enabled := True;

                                          ExpenseStringGrid.Options := ExpenseStringGrid.Options - [goEditing];
                                        end;
                      end;
                    end;

              // ������� (������)      
     TAB_ExpenseOther: Begin
                       case Type_ExpenseView of
                        g_CreateDoc:   // ��������
                                            Begin
                                               with ExpenseStringGrid do
                                                Begin
                                                    ColCount := 9;
                                                    Cells[0,0] := 'NN';
                                                    Cells[1,0] := 'UID';
                                                    Cells[2,0] := '��������';
                                                    Cells[3,0] := '�����';
                                                    Cells[4,0] := '����� (���)';
                                                    Cells[5,0] := '����� (������)';
                                                    Cells[6,0] := '����������';
                                                    Cells[7,0] := '����������';
                                                    Cells[8,0] := '����������';

                                                    ColWidths[0] := 25;
                                                    ColWidths[1] := 50;
                                                    ColWidths[2] := 110;
                                                    ColWidths[3] := 200;
                                                    ColWidths[4] := 70;
                                                    ColWidths[5] := 80;
                                                    ColWidths[6] := 130;
                                                    ColWidths[7] := 150;
                                                    ColWidths[8] := 200;
                                                end;

                                                ExpenseForm.Caption := '�������� ��������� (������� (������))';
                                                ExpenseForm.Width := 1050;
                                                Label1.Caption := '��';

                                                NumDocEdit.Text := EmptyStr;
                                                PrimechEdit.Text := EmptyStr;
                                                PrimechEdit.Enabled := True;
                                                ExpencePicker.Date := Now();

                                                MonthCombo.Visible := False;
                                                YearSpinEdit.Visible := False;

                                                SaveExpenseBtn.Enabled := True;
                                                AddBtn.Enabled := True;
                                                AddPopup.Enabled := True;
                                                DeleteBtn.Enabled := True;
                                                DeletePopup.Enabled := True;
                                                PrintBtn.Enabled := False;

                                                SavePop.Enabled := True;
                                                SaveNoPop.Enabled := True;

                                                ExpenseStringGrid.Options := ExpenseStringGrid.Options + [goEditing];
                                            end;

                        g_CorrDoc:    // �������������
                                            Begin
                                                      with ExpenseStringGrid do
                                                      Begin
                                                          ColCount := 9;
                                                          Cells[0,0] := 'NN';
                                                          Cells[1,0] := 'UID';
                                                          Cells[2,0] := '��������';
                                                          Cells[3,0] := '�����';
                                                          Cells[4,0] := '����� (���)';
                                                          Cells[5,0] := '����� (������)';
                                                          Cells[6,0] := '����������';
                                                          Cells[7,0] := '����������';
                                                          Cells[8,0] := '����������';

                                                          ColWidths[0] := 25;
                                                          ColWidths[1] := 50;
                                                          ColWidths[2] := 110;
                                                          ColWidths[3] := 200;
                                                          ColWidths[4] := 70;
                                                          ColWidths[5] := 80;
                                                          ColWidths[6] := 130;
                                                          ColWidths[7] := 150;
                                                          ColWidths[8] := 200;
                                                      end;

                                                      ExpenseForm.Caption := '������������� ��������� (�������(������))';
                                                      ExpenseForm.Width := 1050;
                                                      Label1.Caption := '��';

                                                      MonthCombo.Visible := False;
                                                      YearSpinEdit.Visible := False;

                                                      SaveExpenseBtn.Enabled := True;
                                                      AddBtn.Enabled := True;
                                                      AddPopup.Enabled := True;
                                                      DeleteBtn.Enabled := True;
                                                      DeletePopup.Enabled := True;
                                                      PrintBtn.Enabled := True;

                                                      SavePop.Enabled := True;
                                                      SaveNoPop.Enabled := True;

                                                      ExpenseStringGrid.Options := ExpenseStringGrid.Options + [goEditing];
                                            end;

                        g_Preview:    // ��������
                                            Begin
                                                      with ExpenseStringGrid do
                                                      Begin
                                                          ColCount := 9;
                                                          Cells[0,0] := 'NN';
                                                          Cells[1,0] := 'UID';
                                                          Cells[2,0] := '��������';
                                                          Cells[3,0] := '�����';
                                                          Cells[4,0] := '����� (���)';
                                                          Cells[5,0] := '����� (������)';
                                                          Cells[6,0] := '����������';
                                                          Cells[7,0] := '����������';
                                                          Cells[8,0] := '����������';

                                                          ColWidths[0] := 25;
                                                          ColWidths[1] := 50;
                                                          ColWidths[2] := 110;
                                                          ColWidths[3] := 200;
                                                          ColWidths[4] := 70;
                                                          ColWidths[5] := 80;
                                                          ColWidths[6] := 130;
                                                          ColWidths[7] := 150;
                                                          ColWidths[8] := 200;
                                                      end;

                                                      ExpenseForm.Caption := '�������� ��������� (������� (������))';
                                                      ExpenseForm.Width := 1050;
                                                      Label1.Caption := '��';

                                                      NumDocEdit.Enabled := False;
                                                      PrimechEdit.Enabled := False;
                                                      ExpencePicker.Enabled := False;

                                                      MonthCombo.Visible := False;
                                                      YearSpinEdit.Visible := False;

                                                      SaveExpenseBtn.Enabled := False;
                                                      AddBtn.Enabled := False;
                                                      AddPopup.Enabled := False;
                                                      DeleteBtn.Enabled := False;
                                                      DeletePopup.Enabled := False;
                                                      PrintBtn.Enabled := True;

                                                      SavePop.Enabled := False;
                                                      SaveNoPop.Enabled := False;

                                                      ExpenseStringGrid.Options := ExpenseStringGrid.Options - [goEditing];
                                            end;
                       end;
                     end;

           // (������� (��))
     TAB_ExpenseZP:  Begin
                      Case Type_ExpenseView of
                         g_CreateDoc:    // ��������
                                        Begin
                                           with ExpenseStringGrid do
                                           Begin
                                              ColCount := 9;
                                              Cells[0,0] := 'NN';
                                              Cells[1,0] := 'UID';
                                              Cells[2,0] := '��������';
                                              Cells[3,0] := '�����';
                                              Cells[4,0] := '����� (���)';
                                              Cells[5,0] := '����� (������)';
                                              Cells[6,0] := '';
                                              Cells[7,0] := '';
                                              Cells[8,0] := '����������';

                                              ColWidths[0] := 25;
                                              ColWidths[1] := 50;
                                              ColWidths[2] := 110;
                                              ColWidths[3] := 200;
                                              ColWidths[4] := 70;
                                              ColWidths[5] := 80;
                                              ColWidths[6] := 0;
                                              ColWidths[7] := 0;
                                              ColWidths[8] := 200;
                                           end;

                                           Width := 1050;
                                           Caption := '������� �������� (������� �� ��)';
                                           NumDocEdit.Text := EmptyStr;
                                           ExpencePicker.Enabled := False;
                                           PrimechEdit.Text  := EmptyStr;
                                           Label1.Caption := '��';
                                           MonthCombo.Visible := True;
                                           YearSpinEdit.Visible := True;

                                           NumDocEdit.Enabled := False;
                                           ExpencePicker.Enabled := False;
                                           PrimechEdit.Enabled := True;

                                           MonthCombo.Enabled := True;
                                           YearSpinEdit.Enabled := True;

                                           SaveExpenseBtn.Enabled := True;

                                           SavePop.Enabled := True;
                                           SaveNoPop.Enabled := True;
                                           AddBtn.Enabled := True;
                                           AddPopup.Enabled := True;
                                           DeleteBtn.Enabled := True;
                                           DeletePopup.Enabled := True;
                                           PrintBtn.Enabled := False;

                                           ExpenseStringGrid.Options := ExpenseStringGrid.Options + [goEditing];
                                        end;

                        g_CorrDoc:  // �������������
                                       Begin
                                          with ExpenseStringGrid do
                                          Begin
                                              ColCount := 9;
                                              Cells[0,0] := 'NN';
                                              Cells[1,0] := 'UID';
                                              Cells[2,0] := '��������';
                                              Cells[3,0] := '�����';
                                              Cells[4,0] := '����� (���)';
                                              Cells[5,0] := '����� (������)';
                                              Cells[6,0] := '';
                                              Cells[7,0] := '';
                                              Cells[8,0] := '����������';

                                              ColWidths[0] := 25;
                                              ColWidths[1] := 50;
                                              ColWidths[2] := 110;
                                              ColWidths[3] := 200;
                                              ColWidths[4] := 70;
                                              ColWidths[5] := 80;
                                              ColWidths[6] := 0;
                                              ColWidths[7] := 0;
                                              ColWidths[8] := 200;
                                          end;

                                          Width := 1050;
                                          Caption := '�������������� �������� (������� �� ��)';
                                          ExpencePicker.Enabled := False;
                                          Label1.Caption := '��';
                                          MonthCombo.Visible := True;
                                          YearSpinEdit.Visible := True;

                                          NumDocEdit.Enabled := False;
                                          ExpencePicker.Enabled := False;
                                          PrimechEdit.Enabled := True;

                                          MonthCombo.Enabled := True;
                                          YearSpinEdit.Enabled := True;

                                          SaveExpenseBtn.Enabled := True;

                                          SavePop.Enabled := True;
                                          SaveNoPop.Enabled := True;
                                          AddBtn.Enabled := True;
                                          AddPopup.Enabled := True;
                                          DeleteBtn.Enabled := True;
                                          DeletePopup.Enabled := True;
                                          PrintBtn.Enabled := True;

                                          ExpenseStringGrid.Options := ExpenseStringGrid.Options + [goEditing];
                                       end;
                        g_Preview:  // ��������
                                       Begin
                                          with ExpenseStringGrid do
                                          Begin
                                              ColCount := 9;
                                              Cells[0,0] := 'NN';
                                              Cells[1,0] := 'UID';
                                              Cells[2,0] := '��������';
                                              Cells[3,0] := '�����';
                                              Cells[4,0] := '����� (���)';
                                              Cells[5,0] := '����� (������)';
                                              Cells[6,0] := '';
                                              Cells[7,0] := '';
                                              Cells[8,0] := '����������';

                                              ColWidths[0] := 25;
                                              ColWidths[1] := 50;
                                              ColWidths[2] := 110;
                                              ColWidths[3] := 200;
                                              ColWidths[4] := 70;
                                              ColWidths[5] := 80;
                                              ColWidths[6] := 0;
                                              ColWidths[7] := 0;
                                              ColWidths[8] := 200;
                                          end;

                                          Width := 1050;
                                          Caption := '�������� ��������� (������� �� ��)';
                                          Label1.Caption := '��';

                                          NumDocEdit.Enabled := False;
                                          ExpencePicker.Enabled := False;
                                          PrimechEdit.Enabled := False;

                                          MonthCombo.Enabled := False;
                                          YearSpinEdit.Enabled := False;

                                          SaveExpenseBtn.Enabled := False;

                                          SavePop.Enabled := False;
                                          SaveNoPop.Enabled := False;
                                          AddBtn.Enabled := False;
                                          AddPopup.Enabled := False;
                                          DeleteBtn.Enabled := False;
                                          DeletePopup.Enabled := False;
                                          PrintBtn.Enabled := True;

                                          ExpenseStringGrid.Options := ExpenseStringGrid.Options - [goEditing];
                                       end;
                      end;
                     end;
  end;

  ExpenseStringGrid.DefaultRowHeight := NaznachenieCombo.Height;
  NaznachenieCombo.Visible := False;

  for i:= 1 to ExpenseStringGrid.RowCount do
      ExpenseStringGrid.Cells[0,i] := IntToStr(i);
 end;


procedure TExpenseForm.SaveNoPopClick(Sender: TObject);
begin
    Close();
end;

procedure TExpenseForm.SavePopClick(Sender: TObject);
begin
  ExpenseSaveDoc(TypeExpense ,TypeSaveExpence);

  MessageBox(Handle,PChar('��������� �������� ������� ��������!'),PChar('��������� ��������'), MB_ICONINFORMATION+MB_OK);
  Close();
end;

procedure TExpenseForm.ExpenseSaveDoc(Type_Expense,
  Type_ExpenseSave: integer);
begin

     Case Type_Expense of
     // �������
        TAB_Expense:    Begin
                            Case Type_ExpenseSave of
                               g_CreateDoc: Begin
                                              SaveNewExpenseDoc();                                // ����� ��������

                                              AppData.GetSumCashBox.Active := False;
                                              AppData.GetSumCashBox.Active := True;
                                              SumNalCashBox := AppData.GetSumCashBox.FieldByName('SUM_NAL').AsFloat;

                                              SumNalCashBox := SumNalCashBox - NewSumNalDoc;


                                              AppData.CorrSumCashBox.Active := False;
                                              AppData.CorrSumCashBox.CommandText := Format(SSQLCorrCashBoxSum, [StringReplace(FloatToStr(SumNalCashBox),   ',', '.', [rfReplaceAll, rfIgnoreCase]), s_Expense]);
                                              AppData.CorrSumCashBox.Active := True;

                                              MainForm.ReestrExpense.Active := False;
                                              MainForm.ReestrExpense.Active := True;
                                            end;

                               g_CorrDoc:   Begin
                                              OldSumNalDoc := MainForm.ReestrExpense.FieldByName('SUM_NAL').AsFloat;
                                              SaveCorrExpenseDoc();           // ������������������ ��������

                                              AppData.GetSumCashBox.Active := False;
                                              AppData.GetSumCashBox.Active := True;
                                              SumNalCashBox := AppData.GetSumCashBox.FieldByName('SUM_NAL').AsFloat;
                                              SumNalCashBox := (SumNalCashBox + OldSumNalDoc) - NewSumNalDoc;

                                              AppData.CorrSumCashBox.Active := False;
                                              AppData.CorrSumCashBox.CommandText := Format(SSQLCorrCashBoxSum, [StringReplace(FloatToStr(SumNalCashBox),   ',', '.', [rfReplaceAll, rfIgnoreCase]), s_Expense]);
                                              AppData.CorrSumCashBox.Active := True;

                                              MainForm.ReestrExpense.Active := False;
                                              MainForm.ReestrExpense.Active := True;
                                            end;
                            end;
                            MainForm.BarCalc(TAB_Expense);
                        end;

     // ������� (��)
        TAB_ExpenseZP:  Begin
                            Case Type_ExpenseSave of
                               g_CreateDoc:  Begin
                                              SaveNewExpenseZPDoc();        // ����� ��������


                                              AppData.GetSumCashBox.Active := False;
                                              AppData.GetSumCashBox.Active := True;
                                              SumNalCashBox := AppData.GetSumCashBox.FieldByName('SUM_NAL').AsFloat;

                                              SumNalCashBox := SumNalCashBox - NewSumNalDoc;


                                              AppData.CorrSumCashBox.Active := False;
                                              AppData.CorrSumCashBox.CommandText := Format(SSQLCorrCashBoxSum, [StringReplace(FloatToStr(SumNalCashBox),   ',', '.', [rfReplaceAll, rfIgnoreCase]), s_ExpenseZp]);
                                              AppData.CorrSumCashBox.Active := True;


                                              MainForm.ReestrExpenseZP.Active := False;
                                              MainForm.ReestrExpenseZP.Active := True;
                                             end;
                               g_CorrDoc:    Begin

                                              OldSumNalDoc := MainForm.ReestrExpenseZP.FieldByName('SUM_NAL').AsFloat;
                                              SaveCorrExpenseZPDoc();       // ������������������ ��������

                                              AppData.GetSumCashBox.Active := False;
                                              AppData.GetSumCashBox.Active := True;
                                              SumNalCashBox := AppData.GetSumCashBox.FieldByName('SUM_NAL').AsFloat;
                                              SumNalCashBox := (SumNalCashBox + OldSumNalDoc) - NewSumNalDoc;

                                              AppData.CorrSumCashBox.Active := False;
                                              AppData.CorrSumCashBox.CommandText := Format(SSQLCorrCashBoxSum, [StringReplace(FloatToStr(SumNalCashBox),   ',', '.', [rfReplaceAll, rfIgnoreCase]), s_ExpenseZp]);
                                              AppData.CorrSumCashBox.Active := True;


                                              MainForm.ReestrExpenseZP.Active := False;
                                              MainForm.ReestrExpenseZP.Active := True;
                                             end;
                            end;
                            MainForm.BarCalc(TAB_ExpenseZP);
                        end;

     //  ������� (������)
        TAB_ExpenseOther: Begin
                              Case Type_ExpenseSave of
                                g_CreateDoc:  Begin
                                                SaveNewExpenseOtherDoc();   // ����� ��������


                                                AppData.GetSumCashBox.Active := False;
                                                AppData.GetSumCashBox.Active := True;
                                                SumNalCashBox := AppData.GetSumCashBox.FieldByName('SUM_NAL').AsFloat;

                                                SumNalCashBox := SumNalCashBox - NewSumNalDoc;


                                                AppData.CorrSumCashBox.Active := False;
                                                AppData.CorrSumCashBox.CommandText := Format(SSQLCorrCashBoxSum, [StringReplace(FloatToStr(SumNalCashBox),   ',', '.', [rfReplaceAll, rfIgnoreCase]), s_ExpenseOther]);
                                                AppData.CorrSumCashBox.Active := True;

                                                MainForm.ReestrExpenseOther.Active := False;
                                                MainForm.ReestrExpenseOther.Active := True;
                                              end;

                                g_CorrDoc:    Begin

                                               OldSumNalDoc := MainForm.ReestrExpenseOther.FieldByName('SUM_NAL').AsFloat;
                                               SaveCorrExpenseOtherDoc();  // ������������������ ��������

                                               AppData.GetSumCashBox.Active := False;
                                               AppData.GetSumCashBox.Active := True;
                                               SumNalCashBox := AppData.GetSumCashBox.FieldByName('SUM_NAL').AsFloat;
                                               SumNalCashBox := (SumNalCashBox + OldSumNalDoc) - NewSumNalDoc;

                                               AppData.CorrSumCashBox.Active := False;
                                               AppData.CorrSumCashBox.CommandText := Format(SSQLCorrCashBoxSum, [StringReplace(FloatToStr(SumNalCashBox),   ',', '.', [rfReplaceAll, rfIgnoreCase]), s_ExpenseOther]);
                                               AppData.CorrSumCashBox.Active := True;

                                               MainForm.ReestrExpenseOther.Active := False;
                                               MainForm.ReestrExpenseOther.Active := True;
                                              end;
                              end;
                            MainForm.BarCalc(TAB_ExpenseOther);
                          end;

     end;
end;

procedure TExpenseForm.PrintBtnClick(Sender: TObject);
begin
    Case TypeExpense of
        TAB_Expense:  Begin
                          AppData.Report.Template := SExpenseTotalDoc;
                          AppData.Report.Run;
                      end;

        TAB_ExpenseZP:  Begin
                           AppData.Report.Template := SExpenseTotalDocZp;
                           AppData.Report.Run;
                        end;

        TAB_ExpenseOther: Begin
                            AppData.Report.Template := SExpenseOtherTotalDoc;
                            AppData.Report.Run;
                          end;
    end;
end;

function TExpenseForm.CalcValueCellsVB(StringCalc: string): string;
var
    msc: Variant;
begin
  msc := CreateOleObject('MSScriptControl.ScriptControl');

  try
      msc.Language := 'VBScript';
      Result := msc.Eval(Copy(StringReplace(StringCalc, ',', '.', [rfReplaceAll, rfIgnoreCase]), 2, Length(StringCalc)));
  finally
      FreeAndNil(msc);
  end;
end;

procedure TExpenseForm.SetNewSumNalDoc(const Value: real);
begin
  FNewSumNalDoc := Value;
end;

procedure TExpenseForm.SetOldSumNalDoc(const Value: real);
begin
  FOldSumNalDoc := Value;
end;

procedure TExpenseForm.SetSumNalCashBox(const Value: real);
begin
  FSumNalCashBox := Value;
end;

end.
