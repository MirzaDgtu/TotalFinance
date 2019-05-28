unit Offs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, ComCtrls, Spin, StdCtrls, Buttons, ExtCtrls, DateUtils, ComObj;

type
  TOffsForm = class(TForm)
    Panel1: TPanel;
    SaveBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    AddBtn: TBitBtn;
    PrintBtn: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MonthCombo: TComboBox;
    DatePicker: TDateTimePicker;
    NumDocEdit: TEdit;
    PrimechEdit: TEdit;
    YearSpinEdit: TSpinEdit;
    Bar: TStatusBar;
    OffsStringGrid: TStringGrid;
    PopupSaveMenu: TPopupMenu;
    SavePop: TMenuItem;
    SaveNoPop: TMenuItem;
    PopupRowMenu: TPopupMenu;
    AddPopup: TMenuItem;
    DeletePopup: TMenuItem;
    procedure MonthComboChange(Sender: TObject);
    procedure OffsStringGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure SavePopClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OffsStringGridKeyPress(Sender: TObject; var Key: Char);
    procedure AddBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure SaveNewOffsDoc();
    procedure SaveNewReturnDoc();
    procedure SaveNewEnvd();
    procedure SaveCorrOffsDoc();
    procedure SaveCorrReturnDoc();
    procedure SaveCorrEnvd();

    procedure  DeleteRow(StringGrid: TStringGrid; ARow: Integer);
    function   CalcValueCellsVB(StringCalc: string): string;
    procedure SaveOffsDoc(TabIndex, TypeOffs: integer);
  public
    { Public declarations }
    procedure SettingOffsForm(TabIndex: integer; TypeOffs: integer);
  end;

var
  OffsForm: TOffsForm;
  Sum_Nal, Sum_Not_Nal: real;

implementation

uses Main, ModuleData, sConst, Globals, Shop;

{$R *.dfm}

{ TOffsForm }

procedure TOffsForm.SettingOffsForm(TabIndex, TypeOffs: integer);
var
    i: integer;
begin
    case TabIndex of
        TAB_Offs:   Begin
                        case TypeOffs of
                            g_CreateDoc:  Begin
                                            with OffsStringGrid do
                                              Begin
                                                Cells[0,0] := '№';
                                                Cells[1,0] := 'Код';
                                                Cells[2,0] := 'Магазин';
                                                Cells[3,0] := 'Адрес';
                                                Cells[4,0] := 'Сумма (нал)';
                                                Cells[5,0] := 'Примечание';

                                                ColWidths[0] := 25;
                                                ColWidths[1] := 35;          
                                                ColWidths[2] := 150;
                                                ColWidths[3] := 200;
                                                ColWidths[4] := 70;
                                                ColWidths[5] := 180;
                                              end;

                                            Caption := 'Создать (Списание)';

                                            SaveBtn.Enabled := True;
                                            AddBtn.Enabled := True;
                                            DeleteBtn.Enabled := True;
                                            PrintBtn.Enabled := False;
                                            PrimechEdit.Enabled := True;

                                            NumDocEdit.Clear;
                                            MonthCombo.Enabled := True;
                                            MonthCombo.ItemIndex := 0;
                                            PrimechEdit.Clear;
                                            YearSpinEdit.Value := CurrentYear;
                                            YearSpinEdit.Enabled := True;
                                            DatePicker.Date := Now();

                                            SavePop.Enabled := True;
                                            SaveNoPop.Enabled := True;
                                            AddPopup.Enabled  := True;
                                            DeletePopup.Enabled := True;

                                            for i:= 1 to OffsStringGrid.RowCount - 1 do
                                                OffsStringGrid.RowHeights[i]  := 17;
                                          end;

                            g_CorrDoc:    Begin
                                            with OffsStringGrid do
                                              Begin
                                                Cells[0,0] := '№';
                                                Cells[1,0] := 'Код';
                                                Cells[2,0] := 'Магазин';
                                                Cells[3,0] := 'Адрес';
                                                Cells[4,0] := 'Сумма (нал)';
                                                Cells[5,0] := 'Примечание';

                                                ColWidths[0] := 25;
                                                ColWidths[1] := 35;
                                                ColWidths[2] := 150;
                                                ColWidths[3] := 200;
                                                ColWidths[4] := 70;
                                                ColWidths[5] := 180;
                                              end;

                                            Caption := 'Корректировать (Списание)';

                                            SaveBtn.Enabled := True;
                                            AddBtn.Enabled := True;
                                            DeleteBtn.Enabled := True;
                                            PrintBtn.Enabled := False;
                                            PrimechEdit.Enabled := True;
                                            MonthCombo.Enabled := True;
                                            YearSpinEdit.Enabled := True;

                                            SavePop.Enabled := True;
                                            SaveNoPop.Enabled := True;
                                            AddPopup.Enabled  := True;
                                            DeletePopup.Enabled := True;

                                            for i:= 1 to OffsStringGrid.RowCount - 1 do
                                                OffsStringGrid.RowHeights[i]  := 17;
                                          end;

                            g_Preview:    Begin
                                            with OffsStringGrid do
                                              Begin
                                                Cells[0,0] := '№';
                                                Cells[1,0] := 'Код';
                                                Cells[2,0] := 'Магазин';
                                                Cells[3,0] := 'Адрес';
                                                Cells[4,0] := 'Сумма (нал)';
                                                Cells[5,0] := 'Примечание';

                                                ColWidths[0] := 25;
                                                ColWidths[1] := 35;
                                                ColWidths[2] := 150;
                                                ColWidths[3] := 200;
                                                ColWidths[4] := 70;
                                                ColWidths[5] := 180;
                                              end;

                                            Caption := 'Просмотр (Списание)';

                                            SaveBtn.Enabled := False;
                                            AddBtn.Enabled := False;
                                            DeleteBtn.Enabled := False;
                                            PrintBtn.Enabled := True;
                                            PrimechEdit.Enabled := False;
                                            MonthCombo.Enabled := False;
                                            YearSpinEdit.Enabled := False;

                                            SavePop.Enabled := False;
                                            SaveNoPop.Enabled := False;
                                            AddPopup.Enabled  := False;
                                            DeletePopup.Enabled := False;

                                            for i:= 1 to OffsStringGrid.RowCount - 1 do
                                                OffsStringGrid.RowHeights[i]  := 17;                                            
                                          end;
                        end;
                    end;

              TAB_Return: Begin
                            case TypeOffs of
                                g_CreateDoc:  Begin
                                                with OffsStringGrid do
                                                  Begin
                                                    Cells[0,0] := '№';
                                                    Cells[1,0] := 'Код';
                                                    Cells[2,0] := 'Магазин';
                                                    Cells[3,0] := 'Адрес';
                                                    Cells[4,0] := 'Сумма (нал)';
                                                    Cells[5,0] := 'Примечание';

                                                    ColWidths[0] := 25;
                                                    ColWidths[1] := 35;
                                                    ColWidths[2] := 143;
                                                    ColWidths[3] := 200;
                                                    ColWidths[4] := 70;
                                                    ColWidths[5] := 180;
                                                  end;

                                                Caption := 'Создать (Возврат)';

                                                SaveBtn.Enabled := True;
                                                AddBtn.Enabled := True;
                                                DeleteBtn.Enabled := True;
                                                PrintBtn.Enabled := False;
                                                PrimechEdit.Enabled := True;

                                                NumDocEdit.Clear;
                                                MonthCombo.Enabled := True;
                                                MonthCombo.ItemIndex := 0;
                                                PrimechEdit.Clear;
                                                YearSpinEdit.Value := CurrentYear;
                                                YearSpinEdit.Enabled := True;

                                                SavePop.Enabled := True;
                                                SaveNoPop.Enabled := True;
                                                AddPopup.Enabled  := True;
                                                DeletePopup.Enabled := True;

                                                for i:= 1 to OffsStringGrid.RowCount - 1 do
                                                    OffsStringGrid.RowHeights[i]  := 17;
                                              end;

                                g_CorrDoc:    Begin
                                                with OffsStringGrid do
                                                  Begin
                                                    Cells[0,0] := '№';
                                                    Cells[1,0] := 'Код';
                                                    Cells[2,0] := 'Магазин';
                                                    Cells[3,0] := 'Адрес';
                                                    Cells[4,0] := 'Сумма (нал)';
                                                    Cells[5,0] := 'Примечание';

                                                    ColWidths[0] := 25;
                                                    ColWidths[1] := 35;
                                                    ColWidths[2] := 150;
                                                    ColWidths[3] := 200;
                                                    ColWidths[4] := 70;
                                                    ColWidths[5] := 180;
                                                  end;

                                                Caption := 'Корректировать (Возврат)';

                                                SaveBtn.Enabled := True;
                                                AddBtn.Enabled := True;
                                                DeleteBtn.Enabled := True;
                                                PrintBtn.Enabled := False;
                                                PrimechEdit.Enabled := True;
                                                MonthCombo.Enabled := True;
                                                YearSpinEdit.Enabled := True;

                                                SavePop.Enabled := True;
                                                SaveNoPop.Enabled := True;
                                                AddPopup.Enabled  := True;
                                                DeletePopup.Enabled := True;

                                                for i:= 1 to OffsStringGrid.RowCount - 1 do
                                                    OffsStringGrid.RowHeights[i]  := 17;
                                              end;

                                g_Preview:    Begin
                                                with OffsStringGrid do
                                                  Begin
                                                    Cells[0,0] := '№';
                                                    Cells[1,0] := 'Код';
                                                    Cells[2,0] := 'Магазин';
                                                    Cells[3,0] := 'Адрес';
                                                    Cells[4,0] := 'Сумма (нал)';
                                                    Cells[5,0] := 'Примечание';

                                                    ColWidths[0] := 25;
                                                    ColWidths[1] := 35;
                                                    ColWidths[2] := 150;
                                                    ColWidths[3] := 200;
                                                    ColWidths[4] := 70;
                                                    ColWidths[5] := 180;
                                                  end;

                                                Caption := 'Просмотр (Возврат)';

                                                SaveBtn.Enabled := False;
                                                AddBtn.Enabled := False;
                                                DeleteBtn.Enabled := False;
                                                PrintBtn.Enabled := True;
                                                PrimechEdit.Enabled := False;
                                                MonthCombo.Enabled := False;
                                                YearSpinEdit.Enabled := False;

                                                SavePop.Enabled := False;
                                                SaveNoPop.Enabled := False;
                                                AddPopup.Enabled  := False;
                                                DeletePopup.Enabled := False;

                                                for i:= 1 to OffsStringGrid.RowCount - 1 do
                                                    OffsStringGrid.RowHeights[i]  := 17;
                                              end;
                            end;
                    end;

        TAB_ENVD: Begin
                            case TypeOffs of
                                g_CreateDoc:  Begin
                                                with OffsStringGrid do
                                                  Begin
                                                    Cells[0,0] := '№';
                                                    Cells[1,0] := 'Код';
                                                    Cells[2,0] := 'Магазин';
                                                    Cells[3,0] := 'Адрес';
                                                    Cells[4,0] := 'Сумма (безнал)';
                                                    Cells[5,0] := 'Примечание';

                                                    ColWidths[0] := 25;
                                                    ColWidths[1] := 35;
                                                    ColWidths[2] := 143;
                                                    ColWidths[3] := 200;
                                                    ColWidths[4] := 83;
                                                    ColWidths[5] := 180;
                                                  end;

                                                Caption := 'Создать (ЕНВД)';

                                                SaveBtn.Enabled := True;
                                                AddBtn.Enabled := True;
                                                DeleteBtn.Enabled := True;
                                                PrintBtn.Enabled := False;
                                                PrimechEdit.Enabled := True;

                                                NumDocEdit.Clear;
                                                MonthCombo.Enabled := True;
                                                MonthCombo.ItemIndex := 0;
                                                PrimechEdit.Clear;
                                                YearSpinEdit.Value := CurrentYear;
                                                YearSpinEdit.Enabled := True;

                                                SavePop.Enabled := True;
                                                SaveNoPop.Enabled := True;
                                                AddPopup.Enabled  := True;
                                                DeletePopup.Enabled := True;

                                                for i:= 1 to OffsStringGrid.RowCount - 1 do
                                                    OffsStringGrid.RowHeights[i]  := 17;
                                              end;

                                g_CorrDoc:    Begin
                                                with OffsStringGrid do
                                                  Begin
                                                    Cells[0,0] := '№';
                                                    Cells[1,0] := 'Код';
                                                    Cells[2,0] := 'Магазин';
                                                    Cells[3,0] := 'Адрес';
                                                    Cells[4,0] := 'Сумма (безнал)';
                                                    Cells[5,0] := 'Примечание';

                                                    ColWidths[0] := 25;
                                                    ColWidths[1] := 35;
                                                    ColWidths[2] := 150;
                                                    ColWidths[3] := 200;
                                                    ColWidths[4] := 83;
                                                    ColWidths[5] := 180;
                                                  end;

                                                Caption := 'Корректировать (ЕНВД)';

                                                SaveBtn.Enabled := True;
                                                AddBtn.Enabled := True;
                                                DeleteBtn.Enabled := True;
                                                PrintBtn.Enabled := False;
                                                PrimechEdit.Enabled := True;
                                                MonthCombo.Enabled := True;
                                                YearSpinEdit.Enabled := True;

                                                SavePop.Enabled := True;
                                                SaveNoPop.Enabled := True;
                                                AddPopup.Enabled  := True;
                                                DeletePopup.Enabled := True;

                                                for i:= 1 to OffsStringGrid.RowCount - 1 do
                                                    OffsStringGrid.RowHeights[i]  := 17;
                                              end;

                                g_Preview:    Begin
                                                with OffsStringGrid do
                                                  Begin
                                                    Cells[0,0] := '№';
                                                    Cells[1,0] := 'Код';
                                                    Cells[2,0] := 'Магазин';
                                                    Cells[3,0] := 'Адрес';
                                                    Cells[4,0] := 'Сумма (безнал)';
                                                    Cells[5,0] := 'Примечание';

                                                    ColWidths[0] := 25;
                                                    ColWidths[1] := 35;
                                                    ColWidths[2] := 150;
                                                    ColWidths[3] := 200;
                                                    ColWidths[4] := 83;
                                                    ColWidths[5] := 180;
                                                  end;

                                                Caption := 'Просмотр (ЕНВД)';

                                                SaveBtn.Enabled := False;
                                                AddBtn.Enabled := False;
                                                DeleteBtn.Enabled := False;
                                                PrintBtn.Enabled := True;
                                                PrimechEdit.Enabled := False;
                                                MonthCombo.Enabled := False;
                                                YearSpinEdit.Enabled := False;

                                                SavePop.Enabled := False;
                                                SaveNoPop.Enabled := False;
                                                AddPopup.Enabled  := False;
                                                DeletePopup.Enabled := False;

                                                for i:= 1 to OffsStringGrid.RowCount - 1 do
                                                    OffsStringGrid.RowHeights[i]  := 17;
                                              end;
                            end;
                    end;
    end;
end;

procedure TOffsForm.MonthComboChange(Sender: TObject);
var
    d_Date: TDateTime;
begin
  if TypeOffs in [TAB_Offs, TAB_Return, TAB_ENVD] then
  begin
    if (TypeSaveOffs = g_CreateDoc) or (TypeSaveOffs = g_CorrDoc) then
    begin
      if MonthCombo.ItemIndex <> 0 then
        begin
          SavePop.Enabled := True;
          SaveBtn.Enabled := True;
          d_Date := EndOfTheMonth(StrToDateTime('01.' + IntToStr(MonthCombo.ItemIndex) + '.' + IntToStr(YearSpinEdit.Value)));
          DatePicker.Date := EndOfTheMonth (d_Date);
        end
      else
        Begin
          if MonthCombo.ItemIndex = 0 then
            Begin
              SaveBtn.Enabled := False;
              SavePop.Enabled := False;
            end;
        end;
    end;
  end
  else
     SavePop.Enabled := True;
     SaveBtn.Enabled := True;
end;

procedure TOffsForm.OffsStringGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 If  TypeSaveOffs <> g_Preview then
   Begin
    If ACol in [4,5,6] then
     OffsStringGrid.Options := OffsStringGrid.Options  + [goEditing]
    else
     OffsStringGrid.Options := OffsStringGrid.Options  - [goEditing];
   end
 else
     OffsStringGrid.Options := OffsStringGrid.Options  - [goEditing];
end;


procedure TOffsForm.SaveNewOffsDoc;
var
    i: integer;
begin
  Sum_Nal := 0;

    for i:= 1 to OffsStringGrid.RowCount - 1 do
      Begin
    // Сумма (нал)
        if OffsStringGrid.Cells[4,i] <> EmptyStr then
          Sum_Nal := Sum_Nal + StrToFloat(StringReplace(OffsStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
      end;

  // Шапка документа
    AppData.OffsHeadDoc.Active := False;
    AppData.OffsHeadDoc.CommandText := Format(SSQLCreateOffsHeader,           [FormatDateTime('yyyy-mm-dd', DatePicker.Date),
                                                                                g_User,
                                                                                Null,
                                                                                Null,
                                                                                StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                s_Offs,
                                                                                PrimechEdit.Text
                                                                                ]);
    AppData.OffsHeadDoc.Active := True;


  // Элементы документа (Списание)
  AppData.MaxUnicumNumOffs.Active := False;
  AppData.MaxUnicumNumOffs.Active := True;

  For i := 1 to OffsStringGrid.RowCount-1 do
    Begin
      AppData.OffsDetailDoc.Active := False;
      AppData.OffsDetailDoc.CommandText := Format(SSQLCreateOffsDetail,       [AppData.MaxUnicumNumOffs.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumOffs.FieldByName('NUMDOC').AsInteger,
                                                                                StrToInt(OffsStringGrid.Cells[0,i]),
                                                                                StrToInt(OffsStringGrid.Cells[1,i]),
                                                                                StringReplace(OffsStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                FormatDateTime('yyyy-mm-dd', DatePicker.Date),
                                                                                s_Offs,
                                                                                OffsStringGrid.Cells[5,i]
                                                                               ]);
      AppData.OffsDetailDoc.Active := True;
    end;
end;

procedure TOffsForm.SaveOffsDoc(TabIndex, TypeOffs: integer);
begin
  case TabIndex of
      TAB_Offs :    Begin
                       case TypeOffs of
                          g_CreateDoc:  SaveNewOffsDoc();
                          g_CorrDoc:    SaveCorrOffsDoc();
                       end;

                      MessageBox(Handle, PChar('Документ успешно сохранен!'), PChar('Списание'), MB_ICONINFORMATION+MB_OK);
                      with MainForm do
                        Begin
                          ReestrOffs.Active := False;
                          ReestrOffs.Active := True;
                          Tabs.TabIndex := TAB_Offs;
                          BarCalc(TAB_Offs);
                        end;
                    end;

      TAB_Return:   Begin
                       case TypeOffs of
                          g_CreateDoc:  SaveNewReturnDoc();
                          g_CorrDoc:    SaveCorrReturnDoc();
                       end;

                      MessageBox(Handle, PChar('Документ успешно сохранен!'), PChar('Возврат'), MB_ICONINFORMATION+MB_OK);
                      with MainForm do
                        Begin
                          ReestrReturn.Active := False;
                          ReestrReturn.Active := True;
                          Tabs.TabIndex := TAB_Return;
                          BarCalc(TAB_Return);
                        end;
                    end;

      TAB_ENVD:   Begin
                     case TypeOffs of
                          g_CreateDoc:  SaveNewEnvd();
                          g_CorrDoc:    SaveCorrEnvd();
                     end;

                     MessageBox(Handle, PChar('Документ успешно сохранен!'), PChar('ЕНВД'), MB_ICONINFORMATION+MB_OK);
                      with MainForm do
                        Begin
                          ReestrENVD.Active := False;
                          ReestrENVD.Active := True;
                          Tabs.TabIndex := TAB_ENVD;
                          BarCalc(TAB_ENVD);
                        end;

                  end;

  end;
  
  Close();

end;

procedure TOffsForm.SavePopClick(Sender: TObject);
begin
    SaveOffsDoc(TypeOffs, TypeSaveOffs);
end;

procedure TOffsForm.SaveBtnClick(Sender: TObject);
begin
  PopupSaveMenu.Popup(SaveBtn.ClientOrigin.X, SaveBtn.ClientOrigin.Y+SaveBtn.Height);
end;

procedure TOffsForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
    i: integer;
begin
    for i := 0 to OffsStringGrid.RowCount-1 do
      OffsStringGrid.Rows[i].Clear;

    For i := 0 to OffsStringGrid.ColCount - 1 do
      OffsStringGrid.Cols[i].Clear;

     case TypeOffs of
        TAB_Offs:     Begin
                        AppData.AdoCmd.CommandText := Format(SSQLUpdateOffsStatusCorrDoc, [MainForm.ReestrOffs.FieldByName('UNICUM_NUM').AsInteger, 0]);
                        AppData.AdoCmd.Execute;
                      end;

        TAB_Return:   Begin
                        AppData.AdoCmd.CommandText := Format(SSQLUpdateOffsStatusCorrDoc, [MainForm.ReestrReturn.FieldByName('UNICUM_NUM').AsInteger, 0]);
                        AppData.AdoCmd.Execute;
                      end;

        TAB_ENVD:     Begin
                        AppData.AdoCmd.CommandText := Format(SSQLUpdateOffsStatusCorrDoc, [MainForm.ReestrENVD.FieldByName('UNICUM_NUM').AsInteger, 0]);
                        AppData.AdoCmd.Execute;
                      end;

     end;

   
end;



procedure TOffsForm.SaveCorrOffsDoc;
var
    i: integer;
begin
 Sum_Nal :=  0;
 
   for i:= 1 to OffsStringGrid.RowCount do
      Begin
    // Сумма (нал)
        if OffsStringGrid.Cells[4,i] <> EmptyStr then
          Sum_Nal := Sum_Nal + StrToFloat(StringReplace(OffsStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
      end;

     // Удаление и перевод в резерв старой версии документа
  AppData.DeleteOffsDoc.Active := False;
  AppData.DeleteOffsDoc.CommandText := FOrmat (SSQLDeleteOffsDocum, [MainForm.ReestrOffs.FieldByName('UNICUM_NUM').AsInteger]);
  AppData.DeleteOffsDoc.Active := True;


    // Шапка документа
    AppData.CorrOffHeadDoc.Active := False;
    AppData.CorrOffHeadDoc.CommandText := Format(SSQLCorrOffsDoc_h,             [StrToInt(NumDocEdit.Text),
                                                                                FormatDateTime('yyyy-mm-dd', DatePicker.Date),
                                                                                MainForm.ReestrOffs.FieldByName('FAMILY').AsString,
                                                                                FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz',MainForm.ReestrOffs.FieldByName('CREATE_DATE').AsDateTime),
                                                                                g_User,
                                                                                StringReplace(FloatToStr(Sum_Nal),   ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                s_Offs,
                                                                                PrimechEdit.Text
                                                                                ]);
    AppData.CorrOffHeadDoc.Active := True;


  // Элементы документа (Списание)
  AppData.MaxUnicumNumOffs.Active := False;
  AppData.MaxUnicumNumOffs.Active := True;


  For i := 1 to OffsStringGrid.RowCount-1 do
    Begin
      AppData.OffsDetailDoc.Active := False;
      AppData.OffsDetailDoc.CommandText := Format(SSQLCreateOffsDetail,        [AppData.MaxUnicumNumOffs.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumOffs.FieldByName('NUMDOC').AsInteger,
                                                                                StrToInt(OffsStringGrid.Cells[0,i]),
                                                                                StrToInt(OffsStringGrid.Cells[1,i]),
                                                                                StringReplace(OffsStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                FormatDateTime('yyyy-mm-dd', DatePicker.Date),
                                                                                s_Offs,
                                                                                OffsStringGrid.Cells[5,i]
                                                                               ]);
      AppData.OffsDetailDoc.Active := True;
    end;
end;

procedure TOffsForm.OffsStringGridKeyPress(Sender: TObject; var Key: Char);
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
                              if OffsStringGrid.Col = 4 then
                                Begin
                                  try
                                    if Pos('=', Cells[Col, Row]) <> 0 then
                                       OffsStringGrid.Cells[Col, Row] :=  CalcValueCellsVB(OffsStringGrid.Cells[Col, Row]);
                                  except
                                    MessageBox(Handle, PChar('Введены некорректные данные!'), PChar(OffsForm.Caption), MB_ICONERROR+MB_OK);
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


procedure TOffsForm.AddBtnClick(Sender: TObject);
begin
  fl_ShopInDoc := 8;
  ShopForm.SettingShopForm(1);
  ShopForm.ShowModal();
end;

procedure TOffsForm.DeleteBtnClick(Sender: TObject);
var
    i:integer;
begin
      If OffsStringGrid.Row <> 0 then
       Begin
        DeleteRow(OffsStringGrid, OffsStringGrid.Row);
        For i:= 1 to OffsStringGrid.RowCount do
          OffsStringGrid.Cells[0,i] := IntToStr(i);
        OffsStringGrid.Cells[0,0] := '№';
       end
      else
        Exit;
end;

procedure TOffsForm.DeleteRow(StringGrid: TStringGrid; ARow: Integer);
var i, j: Integer;
begin
  with OffsStringGrid do
  begin
    for i:=ARow+1 to RowCount-1 do
      for j:=0 to ColCount-1 do
        Cells[j, i-1]:=Cells[j, i];
    for i:=1 to ColCount-1 do
      Cells[i, RowCount-1]:='';
    RowCount:=RowCount-1;
  end;
end;

procedure TOffsForm.PrintBtnClick(Sender: TObject);
begin
  case TypeOffs of
     TAB_Offs: begin
                  fl_TypeReport := TAB_Offs;
                  AppData.GetDetailOffs.Active := False;
                  AppData.GetDetailOffs.CommandText := Format(SSQLGetOffsDetail, [MainForm.ReestrOffs.FieldByName('UNICUM_NUM').AsInteger]);
                  AppData.Report.Template := SOffsTotalDoc;
                  AppData.Report.Run;
               end;

     TAB_Return:  Begin
                    fl_TypeReport := TAB_Return;
                    AppData.GetDetailOffs.Active := False;
                    AppData.GetDetailOffs.CommandText := Format(SSQLGetOffsDetail, [MainForm.ReestrReturn.FieldByName('UNICUM_NUM').AsInteger]);
                    AppData.Report.Template := SReturnTotalDoc;
                    AppData.Report.Run;
                  end;

     TAB_ENVD:  Begin
                  fl_TypeReport := TAB_ENVD;
                  AppData.GetDetailOffs.Active := False;
                  AppData.GetDetailOffs.CommandText := Format(SSQLGetOffsDetail, [MainForm.ReestrENVD.FieldByName('UNICUM_NUM').AsInteger]);
                  AppData.Report.Template := SEnvdTotalDoc;
                  AppData.Report.Run;
                end;
  end;
end;

procedure TOffsForm.SaveNewReturnDoc;
var
    i: integer;
begin
  Sum_Nal := 0;

    for i:= 1 to OffsStringGrid.RowCount - 1 do
      Begin
    // Сумма (нал)
        if OffsStringGrid.Cells[4,i] <> EmptyStr then
          Sum_Nal := Sum_Nal + StrToFloat(StringReplace(OffsStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
      end;

  // Шапка документа
    AppData.OffsHeadDoc.Active := False;
    AppData.OffsHeadDoc.CommandText := Format(SSQLCreateOffsHeader,           [FormatDateTime('yyyy-mm-dd', DatePicker.Date),
                                                                                g_User,
                                                                                Null,
                                                                                Null,
                                                                                StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                s_Return,
                                                                                PrimechEdit.Text
                                                                                ]);
    AppData.OffsHeadDoc.Active := True;


  // Элементы документа (Возврат)
  AppData.MaxUnicumNumOffs.Active := False;
  AppData.MaxUnicumNumOffs.Active := True;

  For i := 1 to OffsStringGrid.RowCount-1 do
    Begin
      AppData.OffsDetailDoc.Active := False;
      AppData.OffsDetailDoc.CommandText := Format(SSQLCreateOffsDetail,       [AppData.MaxUnicumNumOffs.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumOffs.FieldByName('NUMDOC').AsInteger,
                                                                                StrToInt(OffsStringGrid.Cells[0,i]),
                                                                                StrToInt(OffsStringGrid.Cells[1,i]),
                                                                                StringReplace(OffsStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                FormatDateTime('yyyy-mm-dd', DatePicker.Date),
                                                                                s_Return,
                                                                                OffsStringGrid.Cells[5,i]
                                                                               ]);
      AppData.OffsDetailDoc.Active := True;
    end;
end;

procedure TOffsForm.SaveCorrReturnDoc;
var
    i: integer;
begin
 Sum_Nal :=  0;
 
   for i:= 1 to OffsStringGrid.RowCount do
      Begin
    // Сумма (нал)
        if OffsStringGrid.Cells[4,i] <> EmptyStr then
          Sum_Nal := Sum_Nal + StrToFloat(StringReplace(OffsStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
      end;

     // Удаление и перевод в резерв старой версии документа
  AppData.DeleteOffsDoc.Active := False;
  AppData.DeleteOffsDoc.CommandText := FOrmat (SSQLDeleteOffsDocum, [MainForm.ReestrReturn.FieldByName('UNICUM_NUM').AsInteger]);
  AppData.DeleteOffsDoc.Active := True;


    // Шапка документа
    AppData.CorrOffHeadDoc.Active := False;
    AppData.CorrOffHeadDoc.CommandText := Format(SSQLCorrOffsDoc_h,             [StrToInt(NumDocEdit.Text),
                                                                                FormatDateTime('yyyy-mm-dd', DatePicker.Date),
                                                                                MainForm.ReestrReturn.FieldByName('FAMILY').AsString,
                                                                                FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz',MainForm.ReestrReturn.FieldByName('CREATE_DATE').AsDateTime),
                                                                                g_User,
                                                                                StringReplace(FloatToStr(Sum_Nal),   ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                s_Return,
                                                                                PrimechEdit.Text
                                                                                ]);
    AppData.CorrOffHeadDoc.Active := True;


  // Элементы документа (Выручка)
  AppData.MaxUnicumNumOffs.Active := False;
  AppData.MaxUnicumNumOffs.Active := True;


  For i := 1 to OffsStringGrid.RowCount-1 do
    Begin
      AppData.OffsDetailDoc.Active := False;
      AppData.OffsDetailDoc.CommandText := Format(SSQLCreateOffsDetail,        [AppData.MaxUnicumNumOffs.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumOffs.FieldByName('NUMDOC').AsInteger,
                                                                                StrToInt(OffsStringGrid.Cells[0,i]),
                                                                                StrToInt(OffsStringGrid.Cells[1,i]),
                                                                                StringReplace(OffsStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                FormatDateTime('yyyy-mm-dd', DatePicker.Date),
                                                                                s_Return,
                                                                                OffsStringGrid.Cells[5,i]
                                                                               ]);
      AppData.OffsDetailDoc.Active := True;
    end;
end;

procedure TOffsForm.SaveCorrEnvd;
var
    i: integer;
begin
 Sum_Not_Nal :=  0;
 
   for i:= 1 to OffsStringGrid.RowCount do
      Begin
    // Сумма (безнал)
        if OffsStringGrid.Cells[4,i] <> EmptyStr then
          Sum_Not_Nal := Sum_Not_Nal + StrToFloat(StringReplace(OffsStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
      end;

     // Удаление и перевод в резерв старой версии документа
  AppData.DeleteOffsDoc.Active := False;
  AppData.DeleteOffsDoc.CommandText := FOrmat (SSQLDeleteOffsDocum, [MainForm.ReestrENVD.FieldByName('UNICUM_NUM').AsInteger]);
  AppData.DeleteOffsDoc.Active := True;



    // Шапка документа
    AppData.CorrOffHeadDoc.Active := False;
    AppData.CorrOffHeadDoc.CommandText := Format(SSQLCorrEnvdDoc_h,             [StrToInt(NumDocEdit.Text),
                                                                                FormatDateTime('yyyy-mm-dd', DatePicker.Date),
                                                                                MainForm.ReestrENVD.FieldByName('FAMILY').AsString,
                                                                                FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz',MainForm.ReestrENVD.FieldByName('CREATE_DATE').AsDateTime),
                                                                                g_User,
                                                                                StringReplace(FloatToStr(Sum_Not_Nal),   ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                s_Envd,
                                                                                PrimechEdit.Text
                                                                                ]);
    AppData.CorrOffHeadDoc.Active := True;



  // Элементы документа (Списание)
  AppData.MaxUnicumNumOffs.Active := False;
  AppData.MaxUnicumNumOffs.Active := True;



  For i := 1 to OffsStringGrid.RowCount-1 do
    Begin
      AppData.OffsDetailDoc.Active := False;
      AppData.OffsDetailDoc.CommandText := Format(SSQLCreateEnvdDetail,       [AppData.MaxUnicumNumOffs.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumOffs.FieldByName('NUMDOC').AsInteger,
                                                                                StrToInt(OffsStringGrid.Cells[0,i]),
                                                                                StrToInt(OffsStringGrid.Cells[1,i]),
                                                                                StringReplace(OffsStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                FormatDateTime('yyyy-mm-dd', DatePicker.Date),
                                                                                s_Envd,
                                                                                OffsStringGrid.Cells[5,i]
                                                                               ]);
      AppData.OffsDetailDoc.Active := True;
    end;


end;

procedure TOffsForm.SaveNewEnvd;
var
    i: integer;
begin
  Sum_Not_Nal := 0;

    for i:= 1 to OffsStringGrid.RowCount - 1 do
      Begin
    // Сумма (безнал)
        if OffsStringGrid.Cells[4,i] <> EmptyStr then
          Sum_Not_Nal := Sum_Not_Nal + StrToFloat(StringReplace(OffsStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
      end;

  // Шапка документа
    AppData.OffsHeadDoc.Active := False;
    AppData.OffsHeadDoc.CommandText := Format(SSQLCreateEnvdHeader,           [FormatDateTime('yyyy-mm-dd', DatePicker.Date),
                                                                                g_User,
                                                                                Null,
                                                                                Null,
                                                                                StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                s_Envd,
                                                                                PrimechEdit.Text
                                                                                ]);
    AppData.OffsHeadDoc.Active := True;


  // Элементы документа (Возврат)
  AppData.MaxUnicumNumOffs.Active := False;
  AppData.MaxUnicumNumOffs.Active := True;

  For i := 1 to OffsStringGrid.RowCount-1 do
    Begin
      AppData.OffsDetailDoc.Active := False;
      AppData.OffsDetailDoc.CommandText := Format(SSQLCreateEnvdDetail,       [AppData.MaxUnicumNumOffs.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumOffs.FieldByName('NUMDOC').AsInteger,
                                                                                StrToInt(OffsStringGrid.Cells[0,i]),
                                                                                StrToInt(OffsStringGrid.Cells[1,i]),
                                                                                StringReplace(OffsStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                FormatDateTime('yyyy-mm-dd', DatePicker.Date),
                                                                                s_Envd,
                                                                                OffsStringGrid.Cells[5,i]
                                                                               ]);
      AppData.OffsDetailDoc.Active := True;
    end;
end;

function TOffsForm.CalcValueCellsVB(StringCalc: string): string;
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
