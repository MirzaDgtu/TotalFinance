unit IncomeCash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, Grids, Buttons, ExtCtrls, ComObj;

type
  TIncomeCashForm = class(TForm)
    Panel1: TPanel;
    SaveBtn: TBitBtn;
    AddBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    Bar: TStatusBar;
    DetailStringGrid: TStringGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DateIncomePicker: TDateTimePicker;
    NumDocEdit: TEdit;
    PopupGridMenu: TPopupMenu;
    AddPop: TMenuItem;
    DelPop: TMenuItem;
    PopupSaveMenu: TPopupMenu;
    SavePop: TMenuItem;
    SaveNoPop: TMenuItem;
    PrintBtn: TBitBtn;
    Label3: TLabel;
    PrimechEdit: TEdit;
    procedure SaveBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailStringGridKeyPress(Sender: TObject; var Key: Char);
    procedure DetailStringGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure SavePopClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure  DeleteRow(StringGrid: TStringGrid; ARow: Integer);
    procedure  SaveNewIncomeCashDoc;
    procedure  SaveCorrIncomeCashDoc;
    function   CalcValueCellsVB(StringCalc: string): string;    
  public
    { Public declarations }
    procedure SettingIncomeCash (TypeIncomeSetting:integer);
  end;

var
  IncomeCashForm: TIncomeCashForm;
  Sum_Nal, Sum_NotNal: real;
  
implementation

uses Main, ModuleData, sConst, Globals, Shop;

{$R *.dfm}

procedure TIncomeCashForm.SaveBtnClick(Sender: TObject);
begin
   PopupSaveMenu.Popup(SaveBtn.ClientOrigin.X, SaveBtn.ClientOrigin.Y);
end;

procedure TIncomeCashForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    i: integer;
begin
  for i := 0 to DetailStringGrid.ColCount - 1 do
    Begin
      DetailStringGrid.Cols[i].Clear;
    end;

  for i := 0 to DetailStringGrid.RowCount - 1 do
    Begin
      DetailStringGrid.Rows[i].Clear;
    end;

  PrimechEdit.Text := EmptyStr;

  AppData.AdoCmd.CommandText := Format(SSQLUpdateIncStatusCorrDoc, [MainForm.ReestrIncomeCash.FieldByName('UNICUM_NUM').AsInteger, 0]);
  AppData.AdoCmd.Execute;
end;

procedure TIncomeCashForm.DetailStringGridKeyPress(Sender: TObject;
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
        //  Ограничение по допустимым символам
            case Key of
              '0'..'9','+','-','*','/':  ;
              '=':  Begin
                      if Pos('=', Cells[Col, Row]) > 0 then
                          Key := #0;
                    end;
              '.',',' :  Begin
                            if (vrPos >0) or (vrLength = 0) then
                               Key := #0
                            else
                               Key := DecimalSeparator;
                         end;
              #8      :  ;
              // При ESC будет отрабатывать Ctrl+z
              #27     : begin
                          keybd_event(VK_LCONTROL, 0, 0, 0);               // Нажатие клавищи Ctrl
                          keybd_event(Ord('Z'), 0, 0, 0);                  // Нажатие клавищи Z
                          keybd_event(Ord('Z'), 0, KEYEVENTF_KEYUP, 0);    // Отпускание клавищи Ctrl
                          keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0); // Отпускание клавищи Z
                        end;
              #26     :  ;
              #13     :  Begin
                           with Sender as TStringGrid do
                           Begin
                              if DetailStringGrid.Col in [4,5] then
                                Begin
                                  try
                                    if Pos('=', Cells[Col, Row]) <> 0 then
                                       DetailStringGrid.Cells[Col, Row] :=  CalcValueCellsVB(DetailStringGrid.Cells[Col, Row]);
                                  except
                                    MessageBox(Handle, PChar('Введены некорректные данные!'), PChar(IncomeCashForm.Caption), MB_ICONERROR+MB_OK);
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

procedure TIncomeCashForm.DetailStringGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  If TypeSaveIncome <> g_Preview  Then
    Begin
      If ACol in [4,5,6]  then
          DetailStringGrid.Options := DetailStringGrid.Options  + [goEditing]
      else
          DetailStringGrid.Options := DetailStringGrid.Options  - [goEditing];
    end;
end;


procedure TIncomeCashForm.SettingIncomeCash(TypeIncomeSetting: integer);
var
    i: integer;
begin
   case TypeIncomeSetting of
      g_CreateDoc:   // Создание
            begin
               with DetailStringGrid do
               Begin
                 ColCount := 7;
                  Cells[0,0] := 'NN';
                  Cells[1,0] := 'UID';
                  Cells[2,0] := 'Магазин';
                  Cells[3,0] := 'Адрес';
                  Cells[4,0] := 'Сумма нал';
                  Cells[5,0] := 'Сумма безнал';
                  Cells[6,0] := 'Примечание';

                  ColWidths[0] := 25;
                  ColWidths[1] := 35;
                  ColWidths[2] := 110;
                  ColWidths[3] := 200;
                  ColWidths[4] := 70;
                  ColWidths[5] := 80;
                  ColWidths[6] := 137;
               end;

               DateIncomePicker.Enabled := True;

               // Использование кнопок
               SaveBtn.Enabled := True;
               AddBtn.Enabled := True;
               DeleteBtn.Enabled := True;
               PrintBtn.Enabled := False;

               // Использование PopupSaveMenu
               SavePop.Enabled := True;
               SaveNoPop.Enabled := True;

               // Использование PopupGridMenu
               AddPop.Enabled := True;
               DelPop.Enabled := True;

              DetailStringGrid.Options := DetailStringGrid.Options + [goEditing];
            end;

      g_CorrDoc:    // Корректировка
            Begin
               with DetailStringGrid do
               Begin
                 ColCount := 7;
                  Cells[0,0] := 'NN';
                  Cells[1,0] := 'UID';
                  Cells[2,0] := 'Магазин';
                  Cells[3,0] := 'Адрес';
                  Cells[4,0] := 'Сумма нал';
                  Cells[5,0] := 'Сумма безнал';
                  Cells[6,0] := 'Примечание';

                  ColWidths[0] := 25;
                  ColWidths[1] := 35;
                  ColWidths[2] := 110;
                  ColWidths[3] := 200;
                  ColWidths[4] := 70;
                  ColWidths[5] := 80;
                  ColWidths[6] := 137;
               end;

               DateIncomePicker.Enabled := True;

               // Использование кнопок
               SaveBtn.Enabled := True;
               AddBtn.Enabled := True;
               DeleteBtn.Enabled := True;
               PrintBtn.Enabled := True;

               // Использование PopupSaveMenu
               SavePop.Enabled := True;
               SaveNoPop.Enabled := True;

               // Использование PopupGridMenu
               AddPop.Enabled := True;
               DelPop.Enabled := True;

              DetailStringGrid.Options := DetailStringGrid.Options + [goEditing];
            end;

      g_Preview:    // Просмотр
              begin
                with DetailStringGrid do
                Begin
                   ColCount := 7;
                    Cells[0,0] := 'NN';
                    Cells[1,0] := 'UID';
                    Cells[2,0] := 'Магазин';
                    Cells[3,0] := 'Адрес';
                    Cells[4,0] := 'Сумма нал';
                    Cells[5,0] := 'Сумма безнал';
                    Cells[6,0] := 'Примечание';

                    ColWidths[0] := 25;
                    ColWidths[1] := 35;
                    ColWidths[2] := 110;
                    ColWidths[3] := 200;
                    ColWidths[4] := 70;
                    ColWidths[5] := 80;
                    ColWidths[6] := 137;
                end;

                DateIncomePicker.Enabled := False;

                // Использование кнопок
                SaveBtn.Enabled := False;
                AddBtn.Enabled := False;
                DeleteBtn.Enabled := False;
                PrintBtn.Enabled := True;

                // Использование PopupSaveMenu
                SavePop.Enabled := False;
                SaveNoPop.Enabled := False;

                // Использование PopupGridMenu
                AddPop.Enabled := False;
                DelPop.Enabled := False;

                DetailStringGrid.Options := DetailStringGrid.Options - [goEditing];
              end;
   end;

 for i := 0 to DetailStringGrid.RowCount - 1 do
    DetailStringGrid.RowHeights[i] := 20;

end;

procedure TIncomeCashForm.SaveNewIncomeCashDoc;
var
    i: integer;
begin
  Sum_Nal := 0;
  Sum_NotNal := 0;

    for i:= 1 to DetailStringGrid.RowCount do
      Begin
    // Сумма (нал)
        if DetailStringGrid.Cells[4,i] <> EmptyStr then
          Sum_Nal := Sum_Nal + StrToFloat(StringReplace(DetailStringGrid.Cells[4,i], '.',  ',',[rfReplaceAll, rfIgnoreCase]));
    // Сумма (безнал)
        if DetailStringGrid.Cells[5,i] <> EmptyStr then
          Sum_NotNal := Sum_NotNal + StrToFloat(StringReplace(DetailStringGrid.Cells[5,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
      end;

  // Шапка документа
    AppData.InsertHeaderIncome.Active := False;
    AppData.InsertHeaderIncome.CommandText := Format(SSQLD_InsertHeaderIncome, [FormatDateTime('yyyy-mm-dd', DateIncomePicker.Date),
                                                                                g_User,
                                                                                Null,
                                                                                Null,
                                                                                StringReplace(FloatToStr(Sum_Nal),  ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(FloatToStr(Sum_NotNal),  ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                s_IncomeCash,
                                                                                PrimechEdit.Text
                                                                                ]);
    AppData.InsertHeaderIncome.Active := True;

  // Элементы документа (Выручка)
  AppData.MaxUnicumNumInc.Active := False;
  AppData.MaxUnicumNumInc.Active := True;
  For i := 1 to DetailStringGrid.RowCount-1 do
    Begin
      AppData.InsertIncomeDetail.Active := False;
      AppData.InsertIncomeDetail.CommandText := Format(SSQLD_InsertIncomeDetail, [AppData.MaxUnicumNumInc.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumInc.FieldByName('NUMDOC').AsInteger,
                                                                                StrToInt(DetailStringGrid.Cells[0,i]),
                                                                                StrToInt(DetailStringGrid.Cells[1,i]),
                                                                                StringReplace(DetailStringGrid.Cells[4,i],  ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(DetailStringGrid.Cells[5,i],  ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                FormatDateTime('yyyy-mm-dd', DateIncomePicker.Date),
                                                                                s_IncomeCash,
                                                                                DetailStringGrid.Cells[6,i]
                                                                               ]);
      AppData.InsertIncomeDetail.Active := True;
    end;
end;

procedure TIncomeCashForm.SaveCorrIncomeCashDoc;
var
    i: integer;
begin
 Sum_Nal :=  0;
 Sum_NotNal := 0;

   for i:= 1 to DetailStringGrid.RowCount do
      Begin
    // Сумма (нал)
        if DetailStringGrid.Cells[4,i] <> EmptyStr then
          Sum_Nal := Sum_Nal + StrToFloat(StringReplace(DetailStringGrid.Cells[4,i], '.',   ',',[rfReplaceAll, rfIgnoreCase]));
    // Сумма (безнал)
        if DetailStringGrid.Cells[5,i] <> EmptyStr then
          Sum_NotNal := Sum_NotNal + StrToFloat(StringReplace(DetailStringGrid.Cells[5,i], '.',  ',', [rfReplaceAll, rfIgnoreCase]));
      end;

     // Удаление и перевод в резерв старой версии документа
  AppData.DeleteIncomeDocum.Active := False;
  AppData.DeleteIncomeDocum.CommandText := FOrmat (SSQLD_DeleteIncomeDocum, [MainForm.ReestrIncomeCash.FieldByName('UNICUM_NUM').AsInteger,
                                                                             MainForm.ReestrIncomeCash.FieldByName('NUMDOC').AsInteger]);
  AppData.DeleteIncomeDocum.Active := True;

    // Шапка документа
    AppData.CorrIncomeDoc.Active := False;
    AppData.CorrIncomeDoc.CommandText := Format(SSQLCorrIncomeDoc_h, [          StrToInt(NumDocEdit.Text),
                                                                                FormatDateTime('yyyy-mm-dd', DateIncomePicker.Date),
                                                                                MainForm.ReestrIncomeCash.FieldByName('FAMILY').AsString,
                                                                                FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz',MainForm.ReestrIncomeCash.FieldByName('CREATE_DATE').AsDateTime),
                                                                                g_User,
                                                                                StringReplace(FloatToStr(Sum_Nal),  ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(FloatToStr(Sum_NotNal),  ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                s_IncomeCash,
                                                                                PrimechEdit.Text
                                                                                ]);


    AppData.CorrIncomeDoc.Active := True;

  // Элементы документа (Выручка)

  Appdata.MaxUnicumNumInc.Active := False;
  Appdata.MaxUnicumNumInc.Active := True;

  For i := 1 to DetailStringGrid.RowCount-1 do
   Begin
      AppData.InsertIncomeDetail.Active := False;
      AppData.InsertIncomeDetail.CommandText := Format(SSQLD_InsertIncomeDetail, [Appdata.MaxUnicumNumInc.FindField('UNICUM_NUM').AsInteger,
                                                                                StrToInt(NumDocEdit.Text),
                                                                                StrToInt(DetailStringGrid.Cells[0,i]),
                                                                                StrToInt(DetailStringGrid.Cells[1,i]),
                                                                                StringReplace(DetailStringGrid.Cells[4,i],  ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(DetailStringGrid.Cells[5,i],  ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                FormatDateTime('yyyy-mm-dd', DateIncomePicker.Date),
                                                                                s_IncomeCash,
                                                                                DetailStringGrid.Cells[6,i]
                                                                               ]);
      AppData.InsertIncomeDetail.Active := True;
   end;
end;



procedure TIncomeCashForm.SavePopClick(Sender: TObject);
begin
  Case TypeSaveIncome of
    g_CreateDoc:    SaveNewIncomeCashDoc();
    g_CorrDoc:      SaveCorrIncomeCashDoc();
  end;

  MessageBox(Handle,PChar('Документ (Выручка) успешно сохранен!'),PChar('Выручка'), MB_ICONINFORMATION+MB_OK);
  MainForm.ReestrIncomeCash.Active := False;
  MainForm.ReestrIncomeCash.Active := True;
  MainForm.Tabs.TabIndex := TAB_IncomeCash;
  MainForm.BarCalc(TAB_IncomeCash);
  MainForm.IncomeDifference(DBeg, DEnd);
  Close();
end;

procedure TIncomeCashForm.AddBtnClick(Sender: TObject);
begin
  fl_ShopInDoc := 13;
  ShopForm.SettingShopForm(1);
  ShopForm.ShowModal();
end;

procedure TIncomeCashForm.DeleteRow(StringGrid: TStringGrid;
  ARow: Integer);
var i, j: Integer;
begin
  with DetailStringGrid do
  begin
    for i:=ARow+1 to RowCount-1 do
      for j:=0 to ColCount-1 do
        Cells[j, i-1]:=Cells[j, i];
    for i:=1 to ColCount-1 do
      Cells[i, RowCount-1]:='';
    RowCount:=RowCount-1;
  end;
end;

procedure TIncomeCashForm.DeleteBtnClick(Sender: TObject);
var
    i:integer;
begin
      If DetailStringGrid.Row <> 0 then
       Begin
        DeleteRow(DetailStringGrid, DetailStringGrid.Row);
        For i:= 1 to DetailStringGrid.RowCount do
          DetailStringGrid.Cells[0,i] := IntToStr(i);
        DetailStringGrid.Cells[0,0] := 'NN';
       end
      else
        Exit;
end;

procedure TIncomeCashForm.PrintBtnClick(Sender: TObject);
begin
  AppData.Report.Template := SIncomeCashTotalDoc;
  AppData.Report.Run;
end;

function TIncomeCashForm.CalcValueCellsVB(StringCalc: string): string;
var
    msc: Variant;
begin

  try
      msc := CreateOleObject('MSScriptControl.ScriptControl');
      msc.Language := 'VBScript';
      Result := msc.Eval(Copy(StringReplace(StringCalc, ',', '.', [rfReplaceAll, rfIgnoreCase]), 2, Length(StringCalc)));
  except
      FreeAndNil(msc);
  end;

end;

end.
