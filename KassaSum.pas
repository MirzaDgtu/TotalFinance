unit KassaSum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB,
  UExcelAdapter, OLEAdapter, UCustomFlexCelReport, UFlexCelReport, Menus;

type
  TKassaSumForm = class(TForm)
    TotalSummSet: TADODataSet;
    DS_TotalSumm: TDataSource;
    PageControl: TPageControl;
    TabSh1: TTabSheet;
    TabSh2: TTabSheet;
    Panel2: TPanel;
    KassaDetailBar: TStatusBar;
    KassaSumGrid: TDBGrid;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    BegKassaPicker: TDateTimePicker;
    EndKassaPicker: TDateTimePicker;
    GetSumBtn: TBitBtn;
    BarSum: TStatusBar;
    ReestrDetailBar: TStatusBar;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    DetailGrid: TDBGrid;
    ReestrHeadDoc: TADODataSet;
    DS_ReestrHeadDoc: TDataSource;
    Panel4: TPanel;
    Bevel2: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    DTBegPicker: TDateTimePicker;
    DTEndPicker: TDateTimePicker;
    DetailBtn: TBitBtn;
    ReestrHeadDocUNICUM_NUM: TIntegerField;
    ReestrHeadDocDate_P_Por: TDateTimeField;
    ReestrHeadDocFAMILY: TStringField;
    ReestrHeadDocWho_Corr: TStringField;
    ReestrHeadDocDate_Corr: TDateTimeField;
    TotalSummSetUNICUM_NUM: TIntegerField;
    TotalSummSetSUM_NAL: TFloatField;
    TotalSummSetTYPE_DOC: TStringField;
    CashBoxActualLabel: TLabel;
    ReestrHeadDocNUMDOC: TIntegerField;
    ReestrHeadDocSum_NAL: TFloatField;
    ReestrHeadDocSUM_NOT_NAL: TFloatField;
    ReestrHeadDocTYPE_DOC: TStringField;
    ReestrHeadDocCREATE_DATE: TDateTimeField;
    Label5: TLabel;
    DifferenceLabel: TLabel;
    Label6: TLabel;
    TotalSummSetCREATE_DATE: TDateTimeField;
    RefreshBtn: TBitBtn;
    PrintBtn: TBitBtn;
    Report: TFlexCelReport;
    Adapter: TOLEAdapter;
    RefreshDetailBtn: TBitBtn;
    PrintDetailBtn: TBitBtn;
    TotalSummSetSumFDayMonth: TFloatField;
    TotalSummSetSumBegGetDay: TFloatField;
    TotalSummSetSumIncome: TFloatField;
    TotalSummSetSumExpense: TFloatField;
    DetailPopMenu: TPopupMenu;
    PreviewPop: TMenuItem;
    PrintPop: TMenuItem;
    RefreshPop: TMenuItem;
    ReestrHeadDocPRIMECH: TStringField;
    procedure GetSumBtnClick(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
    procedure DetailGridTitleClick(Column: TColumn);
    procedure KassaSumGridTitleClick(Column: TColumn);
    procedure PageControlChange(Sender: TObject);
    procedure BegKassaPickerChange(Sender: TObject);
    procedure EndKassaPickerChange(Sender: TObject);
    procedure DTBegPickerChange(Sender: TObject);
    procedure DTEndPickerChange(Sender: TObject);
    procedure KassaSumGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DetailGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RefreshBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure RefreshDetailBtnClick(Sender: TObject);
    procedure PrintDetailBtnClick(Sender: TObject);
    procedure PreviewPopClick(Sender: TObject);
  private
    { Private declarations }
    FBegDate: variant;
    FEndDate: variant;
    FColDoc: integer;
    FSum_Nal: real;
    FSum_Nal_Actuale: real;

    function CheckDate(BegDate, EndDate: variant): Boolean;
    function GetDate: variant;

    procedure BarSumValues;
    procedure KassaDetailBarValues;
    procedure DetailReestrBar;
    procedure SetBegDate(const Value: variant);
    procedure SetEndDate(const Value: variant);
    procedure SetColDoc(const Value: integer);
    procedure SetSum_Nal(const Value: real);
    procedure SetSum_Nal_Actuale(const Value: real);

    procedure Preview(Unicum_Num: integer; Type_Doc: Byte);
    procedure PreviewIncome(Unicum_Num: integer);
    procedure PreviewExpenses(Unicum_Num: integer);
    procedure PreviewExpensesZp(Unicum_Num: integer);
    procedure PreviewExpensesOther(Unicum_Num: integer);

  public
    { Public declarations }

    property BegDate: variant read FBegDate write SetBegDate;
    property EndDate: variant read FEndDate write SetEndDate;
    property ColDoc:  integer read FColDoc write SetColDoc;
    property Sum_Nal: real read FSum_Nal write SetSum_Nal;
    property Sum_Nal_Actuale: real read FSum_Nal_Actuale write SetSum_Nal_Actuale;

  published
    property BDate: variant read FBegDate;
    property EDate: variant read FEndDate;

  end;

var
  KassaSumForm: TKassaSumForm;

implementation

uses Main, ModuleData, sConst, Globals, CreateDoc, Expenses, Module;

{$R *.dfm}

procedure TKassaSumForm.GetSumBtnClick(Sender: TObject);
begin
 if CheckDate(BegDate, EndDate) then
    Begin
        TotalSummSet.Active := False;
        TotalSummSet.CommandText := Format(SSQLGetOperCashBox, [FormatDateTime('yyyy-mm-dd', BegDate), FormatDateTime('yyyy-mm-dd', EndDate)]);
        TotalSummSet.Active := True;

        ColDoc := TotalSummSet.RecordCount;
        KassaDetailBarValues();
        BarSumValues();
    end
  else
      MessageBox(Handle, PChar('Выбран некорректный диапазон дат!'), PChar('Дата'), MB_OK+MB_ICONSTOP);
end;

procedure TKassaSumForm.BarSumValues;
begin
    BarSum.Panels[0].Text := 'Нач. месяца: ' + FormatFloat('#,###,###.###', TotalSummSet.FieldByName('SumFDayMonth').AsFloat);
    BarSum.Panels[1].Text := 'Нач. дня: ' + FormatFloat('#,###,###.###', TotalSummSet.FieldByName('SumBegGetDay').AsFloat);
    BarSum.Panels[2].Text := 'Прибыль: ' + FormatFloat('#,###,###.###', TotalSummSet.FieldbyName('SumIncome').AsFloat);
    BarSum.Panels[3].Text := 'Расходы: ' + FormatFloat('#,###,###.###',TotalSummSet.FieldByName('SumExpense').AsFloat);
end;

procedure TKassaSumForm.KassaDetailBarValues;
begin
    KassaDetailBar.Panels[0].Text := 'Операций: '  + IntToStr(ColDoc);
    KassaDetailBar.Panels[1].Text :=  FormatDateTime('dd.mm.yyyy', BegDate) + ' г.' + ' - ' + FormatDateTime('dd.mm.yyyy', EndDate) + ' г.';
   // KassaDetailBar.Panels[2].Text := 'Сумма: ' + FormatFloat('#,###,###.###', Sum_Nal);
end;

procedure TKassaSumForm.DetailBtnClick(Sender: TObject);
begin
  if CheckDate(BegDate, EndDate) then
    Begin
        ReestrHeadDoc.Active := False;
        ReestrHeadDoc.CommandText := Format(SSQLGetHeaderDocCashBox, [FormatDateTime('yyyy-mm-dd', BegKassaPicker.Date),
                                                                       FormatDateTime('yyyy-mm-dd', EndKassaPicker.Date)]);
        ReestrHeadDoc.Active := True;
        DetailReestrBar();
    end
  else
    MessageBox(Handle, PChar('Выбран некорректный диапазон дат!'), PChar('Дата'), MB_OK+MB_ICONSTOP);
end;

procedure TKassaSumForm.DetailGridTitleClick(Column: TColumn);
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


procedure TKassaSumForm.KassaSumGridTitleClick(Column: TColumn);
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

procedure TKassaSumForm.DetailReestrBar;
var
    Inc_Sum, Exp_Sum: real;
begin
   Inc_Sum := 0;
   Exp_Sum := 0;

 if ReestrHeadDoc.Active then
  Begin
      ReestrHeadDoc.First;
      while not ReestrHeadDoc.Eof do
        Begin
            if (ReestrHeadDoc.FieldByName('TYPE_DOC').AsString = 'Выручка') and
               (ReestrHeadDoc.FieldByName('SUM_NAL').AsString <> EmptyStr) then
                  Inc_Sum := Inc_Sum + ReestrHeadDoc.FieldByName('SUM_NAL').AsFloat;

            if (ReestrHeadDoc.FieldByName('TYPE_DOC').AsString = 'Расходы') or
                (ReestrHeadDoc.FieldByName('TYPE_DOC').AsString = 'Расходы(ЗП)') or
                  (ReestrHeadDoc.FieldByName('TYPE_DOC').AsString = 'Расходы(Прочие)') and
               (ReestrHeadDoc.FieldByName('SUM_NAL').AsString <> EmptyStr) then
                  Exp_Sum := Exp_Sum + ReestrHeadDoc.FieldByName('SUM_NAL').AsFloat;
            ReestrHeadDoc.Next;
        end;

        DifferenceLabel.Caption := FloatToStr(Inc_Sum - Exp_Sum);
        if StrToFloat(StringReplace(DifferenceLabel.Caption, ' ', '', [rfReplaceAll, rfIgnoreCase])) < 0 then
            DifferenceLabel.Font.Color := clRed
        else
        if StrToFloat(StringReplace(DifferenceLabel.Caption, ' ', '', [rfReplaceAll, rfIgnoreCase])) > 0 then
            DifferenceLabel.Font.Color := clLime;

        DifferenceLabel.Caption := FormatFloat('#,###,###.###', StrToFloat(DifferenceLabel.Caption));
  end;

   with ReestrDetailBar do
    Begin
        Panels[0].Text := 'Количество документов: ' + IntToStr(ReestrHeadDoc.RecordCount);
        Panels[1].Text := 'Выручка(нал): ' + FormatFloat('#,###,####.###', Inc_Sum);
        Panels[2].Text := 'Расходы(нал): ' + FormatFloat('#,###,####.###', Exp_Sum);
    end;
end;

procedure TKassaSumForm.SetBegDate(const Value: variant);
begin
  FBegDate := Value;
end;

procedure TKassaSumForm.SetEndDate(const Value: variant);
begin
  FEndDate := Value;
end;

procedure TKassaSumForm.PageControlChange(Sender: TObject);
begin
    BegKassaPicker.Date := BegDate;
    EndKassaPicker.Date := EndDate;

    DTBegPicker.Date := BegDate;
    DTEndPicker.Date := EndDate;
end;

procedure TKassaSumForm.BegKassaPickerChange(Sender: TObject);
begin
    BegDate := BegKassaPicker.Date;
end;

procedure TKassaSumForm.EndKassaPickerChange(Sender: TObject);
begin
  EndDate := EndKassaPicker.Date;
end;

procedure TKassaSumForm.DTBegPickerChange(Sender: TObject);
begin
  if CheckDate(BegDate, EndDate) then
    Begin
      BegDate := DTBegPicker.Date;
      DetailBtn.Enabled := True;
      DetailBtn.Default := True;
    end
  else
      DetailBtn.Enabled := False;
end;

procedure TKassaSumForm.DTEndPickerChange(Sender: TObject);
begin
    EndDate := DTEndPicker.Date;
end;

function TKassaSumForm.CheckDate(BegDate, EndDate: variant): Boolean;
begin
    if BegDate <= EndDate then
      Result := True
    else
      Result := False;
end;

procedure TKassaSumForm.KassaSumGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if KassaSumGrid.Fields[1].AsFloat > 0 then
       KassaSumGrid.Canvas.Brush.Color := clLime
  else
  if KassaSumGrid.Fields[1].AsFloat < 0 then
       KassaSumGrid.Canvas.Brush.Color := clRed;

  KassaSumGrid.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TKassaSumForm.SetColDoc(const Value: integer);
begin
  FColDoc := Value;
end;

procedure TKassaSumForm.SetSum_Nal(const Value: real);
begin
  FSum_Nal := Value;
end;

procedure TKassaSumForm.SetSum_Nal_Actuale(const Value: real);
begin
  FSum_Nal_Actuale := Value;
end;

procedure TKassaSumForm.DetailGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if DetailGrid.Fields[7].AsString = 'Выручка' then
       DetailGrid.Canvas.Brush.Color := clLime
  else
  if (DetailGrid.Fields[7].AsString = 'Расходы') or
     (DetailGrid.Fields[7].AsString = 'Расходы(ЗП)') or
     (DetailGrid.Fields[7].AsString = 'Расходы(Прочие)') then
       DetailGrid.Canvas.Brush.Color := clRed;

  DetailGrid.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TKassaSumForm.RefreshBtnClick(Sender: TObject);
begin
       if CheckDate(BegDate, EndDate) then
          Begin
              TotalSummSet.Active := False;
              TotalSummSet.CommandText := Format(SSQLGetOperCashBox, [FormatDateTime('yyyy-mm-dd', BegDate),
                                                                      FormatDateTime('yyyy-mm-dd', EndDate)]);
              TotalSummSet.Active := True;
          end
        else
            MessageBox(Handle, PChar('Выбран некорректный диапазон дат!'), PChar('Дата'), MB_OK+MB_ICONSTOP);
end;

function TKassaSumForm.GetDate: variant;
begin
    Result := FormatDateTime('yyyy-mm-dd', BegKassaPicker.Date) + FormatDateTime('yyyy-mm-dd', EndKassaPicker.Date);
end;

procedure TKassaSumForm.PrintBtnClick(Sender: TObject);
begin
    TotalSummSet.DisableControls;
    Report.Template := SOperationsCashBox;
    Report.Run;
    TotalSummSet.EnableControls;
end;

procedure TKassaSumForm.RefreshDetailBtnClick(Sender: TObject);
begin
        if CheckDate(BegDate, EndDate) then
          Begin
              ReestrHeadDoc.Active := False;
              ReestrHeadDoc.CommandText := Format(SSQLGetHeaderDocCashBox, [FormatDateTime('yyyy-mm-dd', BegDate),
                                                                            FormatDateTime('yyyy-mm-dd', EndDate)]);
              ReestrHeadDoc.Active := True;
              DetailReestrBar();
          end
        else
          MessageBox(Handle, PChar('Выбран некорректный диапазон дат!'), PChar('Дата'), MB_OK+MB_ICONSTOP);
end;

procedure TKassaSumForm.PrintDetailBtnClick(Sender: TObject);
begin
    ReestrHeadDoc.DisableControls;
    Report.Template := SDetailCashBox;
    Report.Run;
    ReestrHeadDoc.EnableControls;
end;

procedure TKassaSumForm.Preview(Unicum_Num: integer; Type_Doc: Byte);
begin                   
    case Type_Doc of
      TAB_Income: PreviewIncome(Unicum_Num);

      TAB_Expense:  PreviewExpenses(Unicum_Num);

      TAB_ExpenseZP:  PreviewExpensesZp(Unicum_Num);

      TAB_ExpenseOther:  PreviewExpensesOther(Unicum_Num);
    end;
end;

procedure TKassaSumForm.PreviewIncome(Unicum_Num: integer);
var
    i, RecordCountDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
    Mes: Word;
begin

   if not (ReestrHeadDoc.IsEmpty) then
    Begin
        Sum_Nal     := 0;
        Sum_Not_Nal := 0;
        TypeSaveIncome := g_Preview;

              AppData.GetIncomeDetail.Active := False;
              AppData.GetIncomeDetail.CommandText := Format( SSQLGetIncomeDetail, [Unicum_Num]);
              AppData.GetIncomeDetail.Active := True;
              RecordCountDetail := AppData.GetIncomeDetail.RecordCount+1;

            with CreateDocumentForm do
             begin
              DetailStringGridSetting(g_Preview);
              Caption := 'Просмотр документа';
              DetailStringGrid.RowCount := RecordCountDetail;
              NumDocEdit.Text := ReestrHeadDoc.FieldByName('NUMDOC').AsString;
              DateIncomePicker.Date := AppData.GetIncomeDetail.FieldByName('DATE_P_POR').AsDateTime;
              PrimechEdit.Text :=  ReestrHeadDoc.FieldByName('PRIMECH').AsString;
             end;

              AppData.GetIncomeDetail.First;
              while not  AppData.GetIncomeDetail.Eof do
                Begin
                 for i:= 1 to CreateDocumentForm.DetailStringGrid.RowCount - 1 do
                  Begin
                     with CreateDocumentForm.DetailStringGrid  do
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

              with  CreateDocumentForm.Bar do
                Begin
                  Panels[0].Text := 'Магазинов: ' + IntToStr(AppData.GetIncomeDetail.RecordCount);
                  Panels[1].Text := 'Сумма (нал): ' + FormatFloat('#,###,###.###', Sum_Nal);
                  Panels[2].Text := 'Сумма (безнал): ' + FormatFloat('#,###,###.###', Sum_Not_Nal);
                end;
             CreateDocumentForm.ShowModal();

    end
  else
          Exit;
end;

procedure TKassaSumForm.PreviewExpenses(Unicum_Num: integer);
var
    i, RecordCountExpenceDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
begin

  if not (ReestrHeadDoc.IsEmpty) then
    Begin
            ExpenseForm.ExpenceSetting(TAB_Expense, g_Preview);
            TypeExpense := TAB_Expense;
            TypeSaveExpence := g_Preview;

            Sum_Nal     := 0;
            Sum_Not_Nal := 0;

             AppData.ExpenceDetail.Active := False;
             AppData.ExpenceDetail.CommandText :=  Format(SSQLGetExpenceDetail, [Unicum_Num]);
             AppData.ExpenceDetail.Active := True;

             RecordCountExpenceDetail := AppData.ExpenceDetail.RecordCount+1;

                 ExpenseForm.Caption := 'Просмотр документа';
                 ExpenseForm.NumDocEdit.Text := ReestrHeadDoc.FieldByName('NUMDOC').AsString;
                 ExpenseForm.ExpencePicker.Date := ReestrHeadDoc.FieldByName('DATE_P_POR').AsDateTime;
                 ExpenseForm.PrimechEdit.Text := ReestrHeadDoc.FieldByName('PRIMECH').AsString;
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

procedure TKassaSumForm.PreviewExpensesOther(Unicum_Num: integer);
var
    i, RecordCountExpenceDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
begin

    if not (ReestrHeadDoc.IsEmpty) then
       Begin
          ExpenseForm.ExpenceSetting(TAB_ExpenseOther, g_Preview);
          TypeExpense := TAB_ExpenseOther;
          TypeSaveExpence := g_Preview;
          Sum_Nal     := 0;
          Sum_Not_Nal := 0;

           AppData.CorrExpenceDoc.Active := False;
           AppData.CorrExpenceDoc.CommandText := Format(SSQLGetExpenceDetail, [Unicum_Num]);

           AppData.CorrExpenceDoc.Active := True;

           RecordCountExpenceDetail := AppData.CorrExpenceDoc.RecordCount+1;

               ExpenseForm.Caption := 'Просмотр документа';
               ExpenseForm.NumDocEdit.Text := ReestrHeadDoc.FieldByName('NUMDOC').AsString;
               ExpenseForm.ExpencePicker.Date := ReestrHeadDoc.FieldByName('DATE_P_POR').AsDateTime;
               ExpenseForm.PrimechEdit.Text := ReestrHeadDoc.FieldByName('PRIMECH').AsString;
               ExpenseForm.MonthCombo.Visible := False;
               ExpenseForm.YearSpinEdit.Visible := False;
               ExpenseForm.ExpenseStringGrid.RowCount := RecordCountExpenceDetail;

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

procedure TKassaSumForm.PreviewExpensesZp(Unicum_Num: integer);
var
    i, RecordCountExpenceDetail: integer;
    Sum_Nal, Sum_Not_Nal: real;
    Year, Month, Day: Word;
begin

if not (ReestrHeadDoc.IsEmpty) then
    Begin
        ExpenseForm.ExpenceSetting(TAB_ExpenseZP, g_Preview);
        TypeExpense := TAB_ExpenseZP;
        TypeSaveExpence := g_Preview;
        Sum_Nal     := 0;
        Sum_Not_Nal := 0;

         AppData.CorrExpenceZPDoc.Active := False;
         AppData.CorrExpenceZPDoc.CommandText := Format(SSQLGetExpenceZPDetail, [Unicum_Num]);
         AppData.CorrExpenceZPDoc.Active := True;

         DecodeDate(ReestrHeadDoc.FieldByName('DATE_P_POR').AsDateTime, Year, Month, Day);


         RecordCountExpenceDetail := AppData.CorrExpenceZPDoc.RecordCount+1;
           with  ExpenseForm do
           begin
             NumDocEdit.Text := ReestrHeadDoc.FieldByName('NUMDOC').AsString;
             ExpencePicker.Date := ReestrHeadDoc.FieldByName('DATE_P_POR').AsDateTime;
             PrimechEdit.Text := ReestrHeadDoc.FieldByName('PRIMECH').AsString;
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


procedure TKassaSumForm.PreviewPopClick(Sender: TObject);
var
    type_Doc: Byte;
begin

    if ReestrHeadDoc.FieldByName('Type_Doc').AsString = 'Выручка' then
         type_Doc := TAB_Income
    else
    if ReestrHeadDoc.FieldByName('Type_Doc').AsString = 'Расходы' then
         type_Doc := TAB_Expense
    else
    if ReestrHeadDoc.FieldByName('Type_Doc').AsString = 'Расходы(ЗП)' then
         type_Doc := TAB_ExpenseZP
    else
    if ReestrHeadDoc.FieldByName('Type_Doc').AsString = 'Расходы(Прочие)' then
        type_Doc := TAB_ExpenseOther;

    Preview(ReestrHeadDoc.FieldByName('UNICUM_NUM').AsInteger, type_Doc);
end;


end.
