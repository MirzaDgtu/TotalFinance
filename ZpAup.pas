unit ZpAup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, ComCtrls, ExtCtrls, Grids, Buttons, DateUtils,
  DB, ADODB, Menus, ComObj;

type
  TZpAupForm = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    NumDocEdit: TEdit;
    Label1: TLabel;
    ZpAupPicker: TDateTimePicker;
    PrimechEdit: TEdit;
    Label3: TLabel;
    Panel2: TPanel;
    Bar: TStatusBar;
    ZpAupStringGrid: TStringGrid;
    NaznachenieCombo: TComboBox;
    SaveBtn: TBitBtn;
    AddBtn: TBitBtn;
    DeleteRowBtn: TBitBtn;
    NaznachenieZpAup: TADODataSet;
    PopupZpAupMenu: TPopupMenu;
    L1: TMenuItem;
    N1: TMenuItem;
    SaveZpAupPopup: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    PrintBtn: TBitBtn;
    procedure DeleteRowBtnClick(Sender: TObject);
    procedure NaznachenieComboChange(Sender: TObject);
    procedure NaznachenieComboExit(Sender: TObject);
    procedure ZpAupStringGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure NaznachenieZpAupBeforeOpen(DataSet: TDataSet);
    procedure SaveBtnClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ZpAupStringGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
  private
    { Private declarations }

    procedure DeleteRow(StringGrid: TStringGrid; ARow: Integer);
    procedure GetNaznachenieZpAup;
    procedure SaveNewZpAUPDoc;
    procedure SaveCorrZpAupDoc;
    function   CalcValueCellsVB(StringCalc: string): string;
        
  public
    { Public declarations }
    procedure ZpAupStringGridSetting(TypePreviewZpAupDoc: integer);

  end;

var
  ZpAupForm: TZpAupForm;

implementation

uses ModuleData, sConst, Main, Globals, Shop;

{$R *.dfm}

procedure TZpAupForm.DeleteRowBtnClick(Sender: TObject);
var
    i:integer;
begin
      If ZpAupStringGrid.Row <> 0 then
       Begin
        DeleteRow(ZpAupStringGrid, ZpAupStringGrid.Row);
        For i:= 1 to ZpAupStringGrid.RowCount do
          ZpAupStringGrid.Cells[0,i] := IntToStr(i);
        ZpAupStringGrid.Cells[0,0] := 'NN';
       end
      else
        Exit;
end;



procedure TZpAupForm.DeleteRow(StringGrid: TStringGrid; ARow: Integer);
var i, j: Integer;
begin
  with ZpAupStringGrid do
  begin
    for i:=ARow+1 to RowCount-1 do
      for j:=0 to ColCount-1 do
        Cells[j, i-1]:=Cells[j, i];
    for i:=1 to ColCount-1 do
      Cells[i, RowCount-1]:='';
    RowCount:=RowCount-1;
  end;
end;

procedure TZpAupForm.NaznachenieComboChange(Sender: TObject);
begin
  ZpAupStringGrid.Cells[ZpAupStringGrid.Col, ZpAupStringGrid.Row] := NaznachenieCombo.Items[NaznachenieCombo.ItemIndex];
  NaznachenieCombo.Visible := False;
end;

procedure TZpAupForm.NaznachenieComboExit(Sender: TObject);
begin
  ZpAupStringGrid.Cells[ZpAupStringGrid.Col, ZpAupStringGrid.Row] := NaznachenieCombo.Items[NaznachenieCombo.ItemIndex];
  NaznachenieCombo.Visible := False;
end;

procedure TZpAupForm.ZpAupStringGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
   var
    R: TRECT;
begin
 if TypeSaveZpAup <> g_Preview then
 Begin
      If ACol in [4,5,6] then
        ZpAupStringGrid.Options := ZpAupStringGrid.Options  + [goEditing]
      else
        ZpAupStringGrid.Options := ZpAupStringGrid.Options  - [goEditing];

      if ((ACol = 5) and (ARow <> 0)) then
        Begin
          NaznachenieCombo.ItemIndex :=  NaznachenieCombo.Items.IndexOf(ZpAupStringGrid.Cells[ACol, ARow]);
          R:= ZpAupStringGrid.CellRect(ACol, ARow);
          R.Left  := R.Left + ZpAupStringGrid.Left;
          R.Right := R.Right + ZpAupStringGrid.Left;
          R.Top   := R.Top + ZpAupStringGrid.Top;
          R.Bottom := R.Bottom + ZpAupStringGrid.Top;
          NaznachenieCombo.Left := R.Left +1;
          NaznachenieCombo.Top  := R.Top + 1;
          NaznachenieCombo.Width := (R.Right + 1) - R.Left;
          NaznachenieCombo.Height := (R.Bottom + 1) - R.Top;

          NaznachenieCombo.Visible := True;
          NaznachenieCombo.SetFocus;
        end;
      CanSelect := True;
 end
 else
        ZpAupStringGrid.Options := ZpAupStringGrid.Options  - [goEditing];
end;

procedure TZpAupForm.GetNaznachenieZpAup;
begin
  NaznachenieCombo.Items.Clear;
  NaznachenieZpAup.Active := False;
  NaznachenieZpAup.Active := True;

  NaznachenieZpAup.First;
  while not NaznachenieZpAup.Eof do
    Begin
      NaznachenieCombo.Items.Add(NaznachenieZpAup.FieldByName('sName').AsString);
      NaznachenieZpAup.Next;
    end;

end;

procedure TZpAupForm.NaznachenieZpAupBeforeOpen(DataSet: TDataSet);
begin
  NaznachenieZpAup.CommandText := SSQLGetNaznachenieZpAup;
end;



procedure TZpAupForm.SaveBtnClick(Sender: TObject);
begin
  SaveZpAupPopup.Popup(SaveBtn.ClientOrigin.X, SaveBtn.ClientOrigin.Y);
end;

procedure TZpAupForm.N2Click(Sender: TObject);
begin
  case TypeSaveZpAup of
      g_CreateDoc: SaveNewZpAUPDoc();
      g_CorrDoc:   SaveCorrZpAupDoc();
  end;


  MessageBox(Handle,PChar('Расходный документ успешно сохранен!'),PChar('Расходный документ'), MB_ICONINFORMATION+MB_OK);

  MainForm.ReestrZpAup.Active := False;
  MainForm.ReestrZpAup.Active := True;
  MainForm.Tabs.TabIndex := TAB_ZpAup;
  MainForm.BarCalc(TAB_ZpAup);

  Close();
end;

procedure TZpAupForm.ZpAupStringGridKeyPress(Sender: TObject;
  var Key: Char);
var
  vrPos, vrLength: byte;
begin
    with Sender as TStringGrid do
        Begin
         vrLength := Length(Cells[Col, Row]);
         vrPos := Pos(',',Cells[Col,Row]);

          if Col = 4then
          Begin
        //  Ограничение по допустимым символам
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
                              if ZpAupStringGrid.Col = 4 then
                                Begin
                                  try
                                    if Pos('=', Cells[Col, Row]) <> 0 then
                                       ZpAupStringGrid.Cells[Col, Row] :=  CalcValueCellsVB(ZpAupStringGrid.Cells[Col, Row]);
                                  except
                                    MessageBox(Handle, PChar('Введены некорректные данные!'), PChar(ZpAupForm.Caption), MB_ICONERROR+MB_OK);
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


// Сохранение нового документа (ЗП АУП)
procedure TZpAupForm.SaveNewZpAUPDoc;
var
    I: integer;
    Sum_Nal: real;
begin

 Sum_Nal := 0;

 // Общая сумма документа (ЗП АУП)
 for i := 1 to ZpAupStringGrid.RowCount-1 do
  Begin
    if ZpAupStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Nal := Sum_Nal +  StrToFloat(StringReplace(ZpAupStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
  end;

  // Сохранение шапки документа (ЗП АУП)
  AppData.ZpAupDocHead.Active := False;
  AppData.ZpAupDocHead.CommandText := Format(SSQLCreateZpAupDocHead, [FormatDateTime('yyyy-mm-dd', ZpAupPicker.Date),
                                                                      PrimechEdit.Text,
                                                                      g_User,
                                                                      StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                      Null,
                                                                      s_ZpAup]);
  AppData.ZpAupDocHead.Active := True;

  AppData.MaxUnicumNumZpAup.Active := False;
  AppData.MaxUnicumNumZpAup.Active := True;

  //Сохранение элементов документа (ЗП АУП)
  For i:= 1 to ZpAupStringGrid.RowCount - 1 do
  Begin
    AppData.ZpAupDocDetail.Active := False;
    AppData.ZpAupDocDetail.CommandText := Format(SSQLCreateZpAupDocDetail, [AppData.MaxUnicumNumZpAup.FieldByName('UNICUM_NUM').AsInteger,
                                                                            AppData.MaxUnicumNumZpAup.FieldByName('NUMDOC').AsInteger,
                                                                            FormatDateTime('yyyy-mm-dd', ZpAupPicker.Date),
                                                                            StrToInt(ZpAupStringGrid.Cells[0,i]),
                                                                            StrToInt(ZpAupStringGrid.Cells[1,i]),
                                                                            StringReplace(ZpAupStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            g_User,
                                                                            ZpAupStringGrid.Cells[5,i],
                                                                            ZpAupStringGrid.Cells[6,i],
                                                                            Null,
                                                                            s_ZpAup]);
    AppData.ZpAupDocDetail.Active := True;
  end;
end;




// Сохранение откорректированного документа (ЗП АУП)
procedure TZpAupForm.SaveCorrZpAupDoc;
var
    I: integer;
    Sum_Nal: real;
begin

 Sum_Nal := 0;

 // Общая сумма документа (Налоги по ЗП)
 for i := 1 to ZpAupStringGrid.RowCount-1 do
  Begin
    if ZpAupStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Nal := Sum_Nal +  StrToFloat(StringReplace(ZpAupStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
  end;

  // Удаление документа (Налоги по ЗП)
  AppData.ZpAupDetail.Active := False;
  AppData.ZpAupDetail.CommandText := Format(SSQLGetZpAupDocDetail, [MainForm.ReestrZpAup.FieldByName('UNICUM_NUM').AsInteger]);
  AppData.ZpAupDetail.Active := True;


  // Сохранение шапки документа (Налоги по ЗП)
  AppData.CorrZpAupH.Active := False;
  AppData.CorrZpAupH.CommandText := Format(SSQLCorrZpAupDoc_h,       [StrToInt(NumDocEdit.Text),
                                                                      FormatDateTime('yyyy-mm-dd', ZpAupPicker.DateTime),
                                                                      MainForm.ReestrZpAup.FieldByName('FAMILY').AsString,
                                                                      FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz', MainForm.ReestrZpAup.FieldByName('CREATE_DATE').AsDateTime),
                                                                      StringReplace(FloatToStr(Sum_Nal),  ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                      g_User,
                                                                      PrimechEdit.Text,
                                                                      Null,
                                                                      s_ZpAup]);
  AppData.CorrZpAupH.Active := True;

  //Сохранение элементов документа (Налоги по ЗП)
  For i:= 1 to ZpAupStringGrid.RowCount - 1 do
  Begin
    AppData.ZpAupDocDetail.Active := False;
    AppData.ZpAupDocDetail.CommandText := Format(SSQLCreateZpAupDocDetail, [MainForm.ReestrZpAup.FieldByName('UNICUM_NUM').AsInteger,
                                                                            StrToInt(NumDocEdit.Text),
                                                                            FormatDateTime('yyyy-mm-dd', ZpAupPicker.Date),
                                                                            StrToInt(ZpAupStringGrid.Cells[0,i]),
                                                                            StrToInt(ZpAupStringGrid.Cells[1,i]),
                                                                            StringReplace(ZpAupStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            g_User,
                                                                            ZpAupStringGrid.Cells[5,i],
                                                                            ZpAupStringGrid.Cells[6,i],
                                                                            Null,
                                                                            s_ZpAup]);

    AppData.ZpAupDocDetail.Active := True;
  end;

    AppData.AdoCmd.CommandText := Format(SSQLUpdateZpAupStatusCorrDoc, [Appdata.ZpAupDetail.FieldByName('UNICUM_NUM').AsInteger, 0]);
    AppData.AdoCmd.Execute;
end;

procedure TZpAupForm.ZpAupStringGridSetting(TypePreviewZpAupDoc: integer);
begin

    case TypePreviewZpAupDoc of
      // Создание
       g_CreateDoc:   Begin
                        with ZpAupStringGrid do
                          begin
                            ColCount := 7;
                            Cells[0,0] := 'NN';
                            Cells[1,0] := 'Код';
                            Cells[2,0] := 'Название';
                            Cells[3,0] := 'Адрес';
                            Cells[4,0] := 'Сумма (нал)';
                            Cells[5,0] := 'Назначение';
                            Cells[6,0] := 'Примечание';


                            ColWidths[0] := 25;
                            ColWidths[1] := 50;
                            ColWidths[2] := 110;
                            ColWidths[3] := 150;
                            ColWidths[4] := 100;
                            ColWidths[5] := 100;
                            ColWidths[6] := 135;
                          end;

                          ZpAupPicker.Date := Now();
                          ZpAupStringGrid.DefaultRowHeight := NaznachenieCombo.Height;
                          NaznachenieCombo.Visible := False;
                          Caption := 'Создание документа (ЗП АУП)';
                          ZpAupForm.NumDocEdit.Text := EmptyStr;
                          ZpAupForm.PrimechEdit.Text := EmptyStr;

                          // Использование кнопок
                          SaveBtn.Enabled := True;
                          AddBtn.Enabled := True;
                          DeleteRowBtn.Enabled := True;

                          ZpAupPicker.Enabled := True;
                          PrimechEdit.Enabled := True;
                          NumDocEdit.Enabled := True;
                          PrintBtn.Enabled := False;

                          // Использование PopupZpAupMenu
                          L1.Enabled := True;
                          N1.Enabled := True;

                          // Использование SaveZpAupPopup
                          N2.Enabled := True;
                          N3.Enabled := True;
                      end;

       // Корректировка
       g_CorrDoc:   Begin
                        with ZpAupStringGrid do
                        begin
                            ColCount := 7;
                            Cells[0,0] := 'NN';
                            Cells[1,0] := 'Код';
                            Cells[2,0] := 'Название';
                            Cells[3,0] := 'Адрес';
                            Cells[4,0] := 'Сумма (нал)';
                            Cells[5,0] := 'Назначение';
                            Cells[6,0] := 'Примечание';

                            ColWidths[0] := 25;
                            ColWidths[1] := 50;
                            ColWidths[2] := 110;
                            ColWidths[3] := 150;
                            ColWidths[4] := 100;
                            ColWidths[5] := 100;
                            ColWidths[6] := 135;
                        end;

                        ZpAupStringGrid.DefaultRowHeight := NaznachenieCombo.Height;
                        NaznachenieCombo.Visible := False;
                        Caption := 'Корректировка документа (ЗП АУП)';

                        // Использование кнопок
                        SaveBtn.Enabled := True;
                        AddBtn.Enabled := True;
                        DeleteRowBtn.Enabled := True;

                        ZpAupPicker.Enabled := True;
                        PrimechEdit.Enabled := True;
                        NumDocEdit.Enabled := True;
                        PrintBtn.Enabled := True;

                        // Использование PopupZpAupMenu
                        L1.Enabled := True;
                        N1.Enabled := True;

                        // Использование SaveZpAupPopup
                        N2.Enabled := True;
                        N3.Enabled := True;
                    end;

       // Просмотр
       g_Preview:   Begin
                        with ZpAupStringGrid do
                        begin
                            ColCount := 7;
                            Cells[0,0] := 'NN';
                            Cells[1,0] := 'Код';
                            Cells[2,0] := 'Название';
                            Cells[3,0] := 'Адрес';
                            Cells[4,0] := 'Сумма (нал)';
                            Cells[5,0] := 'Назначение';
                            Cells[6,0] := 'Примечание';

                            ColWidths[0] := 25;
                            ColWidths[1] := 50;
                            ColWidths[2] := 110;
                            ColWidths[3] := 150;
                            ColWidths[4] := 100;
                            ColWidths[5] := 100;
                            ColWidths[6] := 135;
                        end;
                        
                        ZpAupStringGrid.DefaultRowHeight := NaznachenieCombo.Height;
                        NaznachenieCombo.Visible := False;
                        Caption := 'Просмотр документа (ЗП АУП)';

                        // Использование кнопок
                        SaveBtn.Enabled := False;
                        AddBtn.Enabled := False;
                        DeleteRowBtn.Enabled := False;

                        ZpAupPicker.Enabled := False;
                        PrimechEdit.Enabled := False;
                        NumDocEdit.Enabled := False;
                        PrintBtn.Enabled := True;

                        // Использование PopupZpAupMenu
                        L1.Enabled := False;
                        N1.Enabled := False;

                        // Использование SaveZpAupPopup
                        N2.Enabled := False;
                        N3.Enabled := False;
                    end;


    end;

end;

procedure TZpAupForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
    i: integer;
begin
  for i := 0 to ZpAupStringGrid.ColCount - 1 do
    Begin
      ZpAupStringGrid.Cols[i].Clear;
    end;

  for i := 0 to ZpAupStringGrid.RowCount - 1 do
    Begin
      ZpAupStringGrid.Rows[i].Clear;
    end;

    AppData.AdoCmd.CommandText := Format(SSQLUpdateZpAupStatusCorrDoc, [MainForm.ReestrZpAup.FieldByName('UNICUM_NUM').AsInteger, 0]);
    AppData.AdoCmd.Execute;
end;

procedure TZpAupForm.AddBtnClick(Sender: TObject);
begin
  fl_ShopInDoc:= 3;
  ShopForm.SettingShopForm(1);
  ShopForm.ShowModal();
end;

procedure TZpAupForm.PrintBtnClick(Sender: TObject);
begin
    AppData.Report.Template := SZpAupTotalDoc;
    AppData.Report.Run;
end;

function TZpAupForm.CalcValueCellsVB(StringCalc: string): string;
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
