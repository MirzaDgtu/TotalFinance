unit TaxToZp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, ComCtrls, StdCtrls, Buttons, ExtCtrls, ComObj;

type
  TTaxToZpForm = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    NumDocEdit: TEdit;
    TaxZpPicker: TDateTimePicker;
    PrimechEdit: TEdit;
    Panel2: TPanel;
    SaveBtn: TBitBtn;
    AddBtn: TBitBtn;
    DeleteRowBtn: TBitBtn;
    Bar: TStatusBar;
    TaxZpStringGrid: TStringGrid;
    PopupZpAupMenu: TPopupMenu;
    AddPop: TMenuItem;
    DelPop: TMenuItem;
    SaveZpAupPopup: TPopupMenu;
    SavePop: TMenuItem;
    SaveNoPop: TMenuItem;
    PrintBtn: TBitBtn;
    procedure DeleteRowBtnClick(Sender: TObject);
    procedure TaxZpStringGridKeyPress(Sender: TObject; var Key: Char);
    procedure TaxZpStringGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure AddBtnClick(Sender: TObject);
    procedure SavePopClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PrintBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure  SaveNewTaxToZpDoc();
    procedure  SaveCorrTaxToZpDoc();
    procedure  DeleteRow(StringGrid: TStringGrid; ARow: Integer);
    function   CalcValueCellsVB(StringCalc: string): string;    
  public
    { Public declarations }
    procedure SettingTaxToZp(TypePreviewTaxZp: integer);
  end;

var
  TaxToZpForm: TTaxToZpForm;

implementation

uses Globals, Main, ModuleData, Shop, sConst;

{$R *.dfm}

{ TTaxToZpForm }

procedure TTaxToZpForm.DeleteRow(StringGrid: TStringGrid; ARow: Integer);
var i, j: Integer;
begin
  with TaxZpStringGrid do
  begin
    for i:=ARow+1 to RowCount-1 do
      for j:=0 to ColCount-1 do
        Cells[j, i-1]:=Cells[j, i];
    for i:=1 to ColCount-1 do
      Cells[i, RowCount-1]:='';
    RowCount:=RowCount-1;
  end;
end;

procedure TTaxToZpForm.SettingTaxToZp(TypePreviewTaxZp: integer);
var
    i: integer;
begin
     { DONE 1 -opmp -cTaxToZp : В налоги по ЗП добавить возможность выбирать статью из комбобокса }
   case TypePreviewTaxZp of
     g_CreateDoc : Begin
                      with TaxZpStringGrid do
                        Begin
                          ColCount := 6;
                          Cells[0,0] := 'NN';
                          Cells[1,0] := 'Код';
                          Cells[2,0] := 'Название';
                          Cells[3,0] := 'Адрес';
                          Cells[4,0] := 'Сумма (безнал)';
                          Cells[5,0] := 'Примечание';

                          ColWidths[0] := 25;
                          ColWidths[1] := 50;
                          ColWidths[2] := 110;
                          ColWidths[3] := 165;
                          ColWidths[4] := 100;
                          ColWidths[5] := 115;
                        End;

                      Caption := 'Налоги по ЗП -> Создать';
                      NumDocEdit.Text := EmptyStr;
                      PrimechEdit.Text := EmptyStr;
                      TaxZpPicker.Date := Now();

                        // Кнопки
                      SaveBtn.Enabled := True;
                      AddBtn.Enabled := True;
                      DeleteRowBtn.Enabled := True;
                      PrintBtn.Enabled := False;
                      // Верхняя панель
                      PrimechEdit.Enabled := True;
                      TaxZpPicker.Enabled := True;

                      // Попап меню
                      SavePop.Enabled := True;
                      SaveNoPop.Enabled := True;
                      AddPop.Enabled := True;
                      DeleteRowBtn.Enabled := True;

                   end;

     g_CorrDoc : Begin
                      with TaxZpStringGrid do
                        Begin
                          ColCount := 6;
                          Cells[0,0] := 'NN';
                          Cells[1,0] := 'Код';
                          Cells[2,0] := 'Название';
                          Cells[3,0] := 'Адрес';
                          Cells[4,0] := 'Сумма (безнал)';
                          Cells[5,0] := 'Примечание';

                          ColWidths[0] := 25;
                          ColWidths[1] := 50;
                          ColWidths[2] := 110;
                          ColWidths[3] := 165;
                          ColWidths[4] := 100;
                          ColWidths[5] := 115;
                        End;

                      Caption := 'Налоги по ЗП -> Корректировка';

                        // Кнопки
                      SaveBtn.Enabled := True;
                      AddBtn.Enabled := True;
                      DeleteRowBtn.Enabled := True;
                      PrintBtn.Enabled := True;

                      // Верхняя панель
                      PrimechEdit.Enabled := True;
                      TaxZpPicker.Enabled := True;

                      // Попап меню
                      SavePop.Enabled := True;
                      SaveNoPop.Enabled := True;
                      AddPop.Enabled := True;
                      DeleteRowBtn.Enabled := True;
                   end;

       g_Preview : Begin
                      with TaxZpStringGrid do
                        Begin
                          ColCount := 6;
                          Cells[0,0] := 'NN';
                          Cells[1,0] := 'Код';
                          Cells[2,0] := 'Название';
                          Cells[3,0] := 'Адрес';
                          Cells[4,0] := 'Сумма (безнал)';
                          Cells[5,0] := 'Примечание';

                          ColWidths[0] := 25;
                          ColWidths[1] := 50;
                          ColWidths[2] := 110;
                          ColWidths[3] := 165;
                          ColWidths[4] := 100;
                          ColWidths[5] := 115;
                        End;

                      Caption := 'Налоги по ЗП -> Просмотр';

                        // Кнопки
                      SaveBtn.Enabled := False;
                      AddBtn.Enabled := False;
                      DeleteRowBtn.Enabled := False;
                      PrintBtn.Enabled := True;

                      // Верхняя панель
                      PrimechEdit.Enabled := False;
                      TaxZpPicker.Enabled := False;

                      // Попап меню
                      SavePop.Enabled := False;
                      SaveNoPop.Enabled := False;
                      AddPop.Enabled := False;
                      DeleteRowBtn.Enabled := False;

                   end;
   end;
   
   For i := 0 to TaxZpStringGrid.RowCount - 1 do
         TaxZpStringGrid.RowHeights[i] := 20;

end;

procedure TTaxToZpForm.DeleteRowBtnClick(Sender: TObject);
var
    i:integer;
begin
      if TaxZpStringGrid.Row <> 0 then
       Begin
         DeleteRow(TaxZpStringGrid, TaxZpStringGrid.Row);
         For i:= 1 to TaxZpStringGrid.RowCount do
            TaxZpStringGrid.Cells[0,i] := IntToStr(i);
         TaxZpStringGrid.Cells[0,0] := 'NN';
       end
      else
         Exit;
end;

procedure TTaxToZpForm.TaxZpStringGridKeyPress(Sender: TObject;
  var Key: Char);
var
  vrPos, vrLength: byte;
begin
    with Sender as TStringGrid do
        Begin
         vrLength := Length(Cells[Col, Row]);
         vrPos := Pos(',',Cells[Col,Row]);

          if Col = 4 then
          Begin
        //  Ограничение по допустимым символам
            case Key of
              '0'..'9','+','-','*','/':  ;
              '=':  Begin
                      if Pos('=', Cells[Col, Row]) > 0 then
                          Key := #0;
                    end;
              '.',',' :  {Begin
                            if (vrPos >4) or (vrLength = 0) then
                               Key := #0
                            else
                               Key := DecimalSeparator;
                         end};
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
                              if TaxZpStringGrid.Col = 4  then
                                Begin
                                  try
                                    if Pos('=', Cells[Col, Row]) <> 0 then
                                       TaxZpStringGrid.Cells[Col, Row] :=  CalcValueCellsVB(TaxZpStringGrid.Cells[Col, Row]);
                                  except
                                    MessageBox(Handle, PChar('Введены некорректные данные!'), PChar(TaxToZpForm.Caption), MB_ICONERROR+MB_OK);
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

procedure TTaxToZpForm.TaxZpStringGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 if TypeSaveTaxToZp <> g_Preview then
   Begin
     If ACol in [4,5] then
      TaxZpStringGrid.Options := TaxZpStringGrid.Options  + [goEditing]
     else
      TaxZpStringGrid.Options := TaxZpStringGrid.Options  - [goEditing];
   end
 else
      TaxZpStringGrid.Options := TaxZpStringGrid.Options  - [goEditing];

end;

procedure TTaxToZpForm.AddBtnClick(Sender: TObject);
begin
    fl_ShopInDoc := 4;
    ShopForm.SettingShopForm(1);
    ShopForm.ShowModal();
end;

procedure TTaxToZpForm.SaveNewTaxToZpDoc;
var
    I: integer;
    Sum_Not_Nal: real;
begin

 Sum_Not_Nal := 0;

 // Общая сумма документа (Налоги по ЗП)
 for i := 1 to TaxZpStringGrid.RowCount-1 do
  Begin
    if TaxZpStringGrid.Cells[4,i] <> EmptyStr then
        Sum_Not_Nal := Sum_Not_Nal +  StrToFloat(StringReplace(TaxZpStringGrid.Cells[4,i], '.',  ',',[rfReplaceAll, rfIgnoreCase]));
  end;

  // Сохранение шапки документа (Налоги по ЗП)
  AppData.TaxToZpHeadDoc.Active := False;
  AppData.TaxToZpHeadDoc.CommandText := Format(SSQLCreateTaxToZpDocHead, [FormatDateTime('yyyy-mm-dd', TaxZpPicker.Date),
                                                                        PrimechEdit.Text,
                                                                        g_User,
                                                                        Null,
                                                                        StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                        s_TaxToZp]);
  AppData.TaxToZpHeadDoc.Active := True;

  AppData.MaxUnicumNumZpAup.Active := False;
  AppData.MaxUnicumNumZpAup.Active := True;

  //Сохранение элементов документа (Налоги по ЗП)
  For i:= 1 to TaxZpStringGrid.RowCount - 1 do
  Begin
    AppData.TaxToZpDetail.Active := False;
    AppData.TaxToZpDetail.CommandText := Format(SSQLCreateTaxToZpDocDetail, [AppData.MaxUnicumNumZpAup.FieldByName('UNICUM_NUM').AsInteger,
                                                                            AppData.MaxUnicumNumZpAup.FieldByName('NUMDOC').AsInteger,
                                                                            FormatDateTime('yyyy-mm-dd', TaxZpPicker.Date),
                                                                            StrToInt(TaxZpStringGrid.Cells[0,i]),
                                                                            StrToInt(TaxZpStringGrid.Cells[1,i]),
                                                                            Null,
                                                                            g_User,
                                                                            Null,
                                                                            TaxZpStringGrid.Cells[5,i],
                                                                            StringReplace(TaxZpStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            s_TaxToZp]);
    AppData.TaxToZpDetail.Active := True;
  end;

end;



  // Сохранение откорректированного документа
procedure TTaxToZpForm.SaveCorrTaxToZpDoc;
var
    I: integer;
    Sum_Not_Nal: real;
begin

 Sum_Not_Nal := 0;

 // Общая сумма документа (Налоги по ЗП)
 for i := 1 to TaxZpStringGrid.RowCount-1 do
  Begin
    if TaxZpStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Not_Nal := Sum_Not_Nal +  StrToFloat(StringReplace(TaxZpStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
  end;

  // Удаление документа
  AppData.DeleteZpAupDoc.Active := False;
  AppData.DeleteZpAupDoc.CommandText := Format(SSQLDeleteZpAupDocum, [MainForm.ReestrTaxToZp.FieldByName('UNICUM_NUM').AsInteger]);
  AppData.DeleteZpAupDoc.Active := True;



  // Сохранение шапки документа (Налоги по ЗП)
  AppData.CorrTaxToZpH.Active := False;
  AppData.CorrTaxToZpH.CommandText := Format(SSQLCorrTaxToZpDoc_h,   [StrToInt(NumDocEdit.Text),
                                                                      FormatDateTime('yyyy-mm-dd', TaxZpPicker.DateTime),
                                                                      MainForm.ReestrTaxToZp.FieldByName('FAMILY').AsString,
                                                                      FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz', MainForm.ReestrTaxToZp.FieldByName('CREATE_DATE').AsDateTime),
                                                                      Null,
                                                                      g_User,
                                                                      PrimechEdit.Text,
                                                                      StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                      s_TaxToZp]);
  AppData.CorrTaxToZpH.Active := True;

  AppData.MaxUnicumNumZpAup.Active := False;
  AppData.MaxUnicumNumZpAup.Active := True;


  //Сохранение элементов документа (Налоги по ЗП)
  For i:= 1 to TaxZpStringGrid.RowCount - 1 do
  Begin
    AppData.TaxToZpDetail.Active := False;
    AppData.TaxToZpDetail.CommandText := Format(SSQLCreateTaxToZpDocDetail, [AppData.MaxUnicumNumZpAup.FieldByName('UNICUM_NUM').AsInteger,
                                                                            AppData.MaxUnicumNumZpAup.FieldByName('NUMDOC').AsInteger,
                                                                            FormatDateTime('yyyy-mm-dd', TaxZpPicker.Date),
                                                                            StrToInt(TaxZpStringGrid.Cells[0,i]),
                                                                            StrToInt(TaxZpStringGrid.Cells[1,i]),
                                                                            Null,
                                                                            g_User,
                                                                            Null,
                                                                            TaxZpStringGrid.Cells[5,i],
                                                                            StringReplace(TaxZpStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            s_TaxToZp]);
    AppData.TaxToZpDetail.Active := True;
  end;

    AppData.AdoCmd.CommandText := Format(SSQLUpdateZpAupStatusCorrDoc, [Appdata.GetTaxToZpDetail.FieldByName('UNICUM_NUM').AsInteger, 0]);
    AppData.AdoCmd.Execute;
end;


procedure TTaxToZpForm.SavePopClick(Sender: TObject);
begin
  case TypeSaveTaxToZp of
     g_CreateDoc: SaveNewTaxToZpDoc();
     g_CorrDoc:   SaveCorrTaxToZpDoc();
  end;

  MessageBox(Handle,PChar('Расходный документ успешно сохранен!'),PChar('Расходный документ'), MB_ICONINFORMATION+MB_OK);
  MainForm.Tabs.TabIndex := TAB_TaxToZp;
  MainForm.ReestrTaxToZp.Active :=  False;
  MainForm.ReestrTaxToZp.Active :=  True;
  MainForm.BarCalc(TAB_TaxToZp);
  Close();
end;

procedure TTaxToZpForm.SaveBtnClick(Sender: TObject);
begin
    SaveZpAupPopup.Popup(SaveBtn.ClientOrigin.X, SaveBtn.ClientOrigin.Y);
end;

procedure TTaxToZpForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if TypeSaveTaxToZp = g_CorrDoc then
      Begin
        AppData.AdoCmd.CommandText := Format(SSQLUpdateZpAupStatusCorrDoc, [Appdata.GetTaxToZpDetail.FieldByName('UNICUM_NUM').AsInteger, 0]);
        AppData.AdoCmd.Execute;
      end;  
end;

procedure TTaxToZpForm.PrintBtnClick(Sender: TObject);
begin
    AppData.Report.Template := STaxToZpTotalDoc;
    AppData.Report.Run;
end;

function TTaxToZpForm.CalcValueCellsVB(StringCalc: string): string;
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

end.
