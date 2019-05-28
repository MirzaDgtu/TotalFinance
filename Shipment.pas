unit Shipment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Menus, StdCtrls, Grids, ComCtrls, Buttons, ExtCtrls, ComObj;

type
  TShipmentForm = class(TForm)
    Panel1: TPanel;
    SaveBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    AddBtn: TBitBtn;
    PrintBtn: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ShipmentPicker: TDateTimePicker;
    NumDocEdit: TEdit;
    PrimechEdit: TEdit;
    Bar: TStatusBar;
    ShipmentStringGrid: TStringGrid;
    SuppliersCombo: TComboBox;
    PopupSaveMenu: TPopupMenu;
    SavePop: TMenuItem;
    SaveNoPop: TMenuItem;
    SuppliersSet: TADODataSet;
    PopupRowMenu: TPopupMenu;
    AddPopup: TMenuItem;
    DeletePopup: TMenuItem;
    SuppliersSetUID: TIntegerField;
    SuppliersSetsName: TStringField;
    procedure SuppliersComboChange(Sender: TObject);
    procedure SuppliersComboExit(Sender: TObject);
    procedure ShipmentStringGridKeyPress(Sender: TObject; var Key: Char);
    procedure ShipmentStringGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure SavePopClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure SaveNoPopClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetSuppliers();
    procedure DeleteRow(StringGrid: TStringGrid; ARow: Integer);
    procedure SaveNewShipmentVostok();
    procedure SaveNewShipmentOther();
    procedure SaveCorrShipmentVostok();
    procedure SaveCorrShipmentOther();
    function   CalcValueCellsVB(StringCalc: string): string;

    procedure SaveShipmentDoc(TabIndex, TypeSaveShipment: Integer);
  public
    { Public declarations }
    procedure SettingShipmentForm(TabIndex: integer; TypeSetting: integer);
  end;

var
  ShipmentForm: TShipmentForm;

implementation

uses Globals, sConst, ModuleData, Main, DateUtils, Shop, Search;

{$R *.dfm}

{ TShipmentForm }

procedure TShipmentForm.SettingShipmentForm(TabIndex,
  TypeSetting: integer);
begin
    case TabIndex of
        TAB_ShipmentVostok:   Begin
                                  case TypeSetting of
                                      g_CreateDoc:  Begin
                                                       With ShipmentStringGrid do
                                                          Begin
                                                            ColCount := 8;
                                                            Cells[0,0] := 'NN';
                                                            Cells[1,0] := 'Код';
                                                            Cells[2,0] := 'Название';
                                                            Cells[3,0] := 'Адрес';
                                                            Cells[4,0] := 'Сумма (нал)';
                                                            Cells[5,0] := 'Сумма (безнал)';
                                                            Cells[6,0] := 'Поставщик';
                                                            Cells[7,0] := 'Примечание';

                                                            ColWidths[0] := 25;
                                                            ColWidths[1] := 50;
                                                            ColWidths[2] := 110;
                                                            ColWidths[3] := 200;
                                                            ColWidths[4] := 70;
                                                            ColWidths[5] := 80;
                                                            ColWidths[6] := 130;
                                                            ColWidths[7] := 200;

                                                            Options := Options + [goEditing];
                                                          end;

                                                       Caption := 'Создать (Отгрузка(Восток))';
                                                       NumDocEdit.Clear;
                                                       PrimechEdit.Clear;
                                                       ShipmentPicker.Date := Now();

                                                       ShipmentPicker.Enabled := True;
                                                       SuppliersCombo.Enabled := True;
                                                       PrimechEdit.Enabled := True;
                                                       NumDocEdit.Enabled  := True;

                                                       AddBtn.Enabled := True;
                                                       DeleteBtn.Enabled := True;
                                                       PrintBtn.Enabled := True;
                                                       SaveBtn.Enabled := True;

                                                       AddPopup.Enabled := True;
                                                       DeletePopup.Enabled := True;
                                                    end;

                                      g_CorrDoc:    Begin
                                                       With ShipmentStringGrid do
                                                          Begin
                                                            ColCount := 8;
                                                            Cells[0,0] := 'NN';
                                                            Cells[1,0] := 'Код';
                                                            Cells[2,0] := 'Название';
                                                            Cells[3,0] := 'Адрес';
                                                            Cells[4,0] := 'Сумма (нал)';
                                                            Cells[5,0] := 'Сумма (безнал)';
                                                            Cells[6,0] := 'Поставщик';
                                                            Cells[7,0] := 'Примечание';

                                                            ColWidths[0] := 25;
                                                            ColWidths[1] := 50;
                                                            ColWidths[2] := 110;
                                                            ColWidths[3] := 200;
                                                            ColWidths[4] := 70;
                                                            ColWidths[5] := 80;
                                                            ColWidths[6] := 130;
                                                            ColWidths[7] := 200;

                                                            Options := Options + [goEditing];
                                                          end;

                                                       Caption := 'Корректировать (Отгрузка(Восток))';

                                                       ShipmentPicker.Enabled := True;
                                                       SuppliersCombo.Enabled := True;
                                                       PrimechEdit.Enabled := True;
                                                       NumDocEdit.Enabled  := True;

                                                       AddBtn.Enabled := True;
                                                       DeleteBtn.Enabled := True;
                                                       PrintBtn.Enabled := True;
                                                       SaveBtn.Enabled := True;

                                                       AddPopup.Enabled := True;
                                                       DeletePopup.Enabled := True;
                                                    end;

                                      g_Preview:    Begin
                                                       With ShipmentStringGrid do
                                                          Begin
                                                            ColCount := 8;
                                                            Cells[0,0] := 'NN';
                                                            Cells[1,0] := 'Код';
                                                            Cells[2,0] := 'Название';
                                                            Cells[3,0] := 'Адрес';
                                                            Cells[4,0] := 'Сумма (нал)';
                                                            Cells[5,0] := 'Сумма (безнал)';
                                                            Cells[6,0] := 'Поставщик';
                                                            Cells[7,0] := 'Примечание';

                                                            ColWidths[0] := 25;
                                                            ColWidths[1] := 50;
                                                            ColWidths[2] := 110;
                                                            ColWidths[3] := 200;
                                                            ColWidths[4] := 70;
                                                            ColWidths[5] := 80;
                                                            ColWidths[6] := 130;
                                                            ColWidths[7] := 200;

                                                            Options := Options - [goEditing];
                                                          end;

                                                       Caption := 'Просмотр (Отгрузка(Восток))';

                                                       ShipmentPicker.Enabled := False;
                                                       SuppliersCombo.Enabled := False;
                                                       PrimechEdit.Enabled := False;
                                                       NumDocEdit.Enabled  := False;

                                                       AddBtn.Enabled := False;
                                                       DeleteBtn.Enabled := False;
                                                       PrintBtn.Enabled := True;
                                                       SaveBtn.Enabled := False;

                                                       AddPopup.Enabled := False;
                                                       DeletePopup.Enabled := False;

                                                    end;
                                  end;
                              end;
        TAB_ShipmentOther:    Begin
                                  case TypeSetting of
                                      g_CreateDoc:  Begin
                                                     With ShipmentStringGrid do
                                                          Begin
                                                            ColCount := 8;
                                                            Cells[0,0] := 'NN';
                                                            Cells[1,0] := 'Код';
                                                            Cells[2,0] := 'Название';
                                                            Cells[3,0] := 'Адрес';
                                                            Cells[4,0] := 'Сумма (нал)';
                                                            Cells[5,0] := 'Сумма (безнал)';
                                                            Cells[6,0] := 'Поставщик';
                                                            Cells[7,0] := 'Примечание';

                                                            ColWidths[0] := 25;
                                                            ColWidths[1] := 50;
                                                            ColWidths[2] := 110;
                                                            ColWidths[3] := 200;
                                                            ColWidths[4] := 70;
                                                            ColWidths[5] := 80;
                                                            ColWidths[6] := 130;
                                                            ColWidths[7] := 200;

                                                            Options := Options + [goEditing];
                                                          end;

                                                       Caption := 'Создать (Отгрузка(Прочие))';
                                                       NumDocEdit.Clear;
                                                       PrimechEdit.Clear;
                                                       ShipmentPicker.Date := Now();

                                                       ShipmentPicker.Enabled := True;
                                                       SuppliersCombo.Enabled := True;
                                                       PrimechEdit.Enabled := True;
                                                       NumDocEdit.Enabled  := True;

                                                       AddBtn.Enabled := True;
                                                       DeleteBtn.Enabled := True;
                                                       PrintBtn.Enabled := True;
                                                       SaveBtn.Enabled := True;

                                                       AddPopup.Enabled := True;
                                                       DeletePopup.Enabled := True;
                                                    end;

                                      g_CorrDoc:    Begin
                                                      With ShipmentStringGrid do
                                                          Begin
                                                            ColCount := 8;
                                                            Cells[0,0] := 'NN';
                                                            Cells[1,0] := 'Код';
                                                            Cells[2,0] := 'Название';
                                                            Cells[3,0] := 'Адрес';
                                                            Cells[4,0] := 'Сумма (нал)';
                                                            Cells[5,0] := 'Сумма (безнал)';
                                                            Cells[6,0] := 'Поставщик';
                                                            Cells[7,0] := 'Примечание';

                                                            ColWidths[0] := 25;
                                                            ColWidths[1] := 50;
                                                            ColWidths[2] := 110;
                                                            ColWidths[3] := 200;
                                                            ColWidths[4] := 70;
                                                            ColWidths[5] := 80;
                                                            ColWidths[6] := 130;
                                                            ColWidths[7] := 200;

                                                            Options := Options + [goEditing];
                                                          end;

                                                       Caption := 'Корректировать (Отгрузка(Прочие))';

                                                       ShipmentPicker.Enabled := True;
                                                       SuppliersCombo.Enabled := True;
                                                       PrimechEdit.Enabled := True;
                                                       NumDocEdit.Enabled  := True;

                                                       AddBtn.Enabled := True;
                                                       DeleteBtn.Enabled := True;
                                                       PrintBtn.Enabled := True;
                                                       SaveBtn.Enabled := True;

                                                       AddPopup.Enabled := True;
                                                       DeletePopup.Enabled := True;
                                                    end;
                                                    
                                      g_Preview:    Begin
                                                       With ShipmentStringGrid do
                                                          Begin
                                                            ColCount := 8;
                                                            Cells[0,0] := 'NN';
                                                            Cells[1,0] := 'Код';
                                                            Cells[2,0] := 'Название';
                                                            Cells[3,0] := 'Адрес';
                                                            Cells[4,0] := 'Сумма (нал)';
                                                            Cells[5,0] := 'Сумма (безнал)';
                                                            Cells[6,0] := 'Поставщик';
                                                            Cells[7,0] := 'Примечание';

                                                            ColWidths[0] := 25;
                                                            ColWidths[1] := 50;
                                                            ColWidths[2] := 110;
                                                            ColWidths[3] := 200;
                                                            ColWidths[4] := 70;
                                                            ColWidths[5] := 80;
                                                            ColWidths[6] := 130;
                                                            ColWidths[7] := 200;

                                                            Options := Options - [goEditing];
                                                          end;

                                                       Caption := 'Просмотр (Отгрузка(Прочие))';

                                                       ShipmentPicker.Enabled := False;
                                                       SuppliersCombo.Enabled := False;
                                                       PrimechEdit.Enabled := False;
                                                       NumDocEdit.Enabled  := False;

                                                       AddBtn.Enabled := False;
                                                       DeleteBtn.Enabled := False;
                                                       PrintBtn.Enabled := True;
                                                       SaveBtn.Enabled := False;

                                                       AddPopup.Enabled := False;
                                                       DeletePopup.Enabled := False;
                                                    end;
                                  end;
                              end;
    end;
end;

procedure TShipmentForm.SuppliersComboChange(Sender: TObject);
begin
  ShipmentStringGrid.Cells[ShipmentStringGrid.Col, ShipmentStringGrid.Row] := SuppliersCombo.Items[SuppliersCombo.ItemIndex];
  SuppliersCombo.Visible := False;
end;

procedure TShipmentForm.SuppliersComboExit(Sender: TObject);
begin
  ShipmentStringGrid.Cells[ShipmentStringGrid.Col, ShipmentStringGrid.Row] := SuppliersCombo.Items[SuppliersCombo.ItemIndex];
  SuppliersCombo.Visible := False;
end;

procedure TShipmentForm.ShipmentStringGridKeyPress(Sender: TObject;
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
                              if ShipmentStringGrid.Col in [4,5] then
                                Begin
                                  try
                                    if Pos('=', Cells[Col, Row]) <> 0 then
                                       ShipmentStringGrid.Cells[Col, Row] :=  CalcValueCellsVB(ShipmentStringGrid.Cells[Col, Row]);
                                  except
                                    MessageBox(Handle, PChar('Введены некорректные данные!'), PChar(ShipmentForm.Caption), MB_ICONERROR+MB_OK);
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

procedure TShipmentForm.ShipmentStringGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
    R: TRECT;
begin
 if TypeSaveShipment <> g_Preview then
   Begin
    If ACol in [4,5,6,7] then
        ShipmentStringGrid.Options := ShipmentStringGrid.Options  + [goEditing]
    else
        ShipmentStringGrid.Options := ShipmentStringGrid.Options  - [goEditing];

    if ((ACol = 6) and (ARow <> 0)) then
      Begin

        SuppliersCombo.ItemIndex :=  SuppliersCombo.Items.IndexOf(ShipmentStringGrid.Cells[ACol, ARow]);
        R:= ShipmentStringGrid.CellRect(ACol, ARow);
        R.Left  := R.Left + ShipmentStringGrid.Left;
        R.Right := R.Right + ShipmentStringGrid.Left;
        R.Top   := R.Top + ShipmentStringGrid.Top;
        R.Bottom := R.Bottom + ShipmentStringGrid.Top;
        SuppliersCombo.Left := R.Left +1;
        SuppliersCombo.Top  := R.Top + 1;
        SuppliersCombo.Width := (R.Right + 1) - R.Left;
        SuppliersCombo.Height := (R.Bottom + 1) - R.Top;

        SuppliersCombo.Visible := True;
        SuppliersCombo.SetFocus;
      end;
        CanSelect := True;
   end;
end;

procedure TShipmentForm.FormCreate(Sender: TObject);
begin
    ShipmentStringGrid.DefaultRowHeight := SuppliersCombo.Height;
    GetSuppliers();
end;

procedure TShipmentForm.GetSuppliers;
begin
    SuppliersSet.Active := False;
    SuppliersSet.CommandText := Format(SSQLGetSupplier, [0]);
    SuppliersSet.Active := True;

    SuppliersCombo.Items.Clear;
    SuppliersSet.First;
     while not SuppliersSet.Eof do
       Begin
          SuppliersCombo.Items.Add(SuppliersSet.FieldbyName('sName').AsString);
          SuppliersSet.Next;
       end;

end;

procedure TShipmentForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    i: integer;
begin
  for i := 0 to ShipmentStringGrid.ColCount - 1 do
    Begin
      ShipmentStringGrid.Cols[i].Clear;
    end;

  for i := 0 to ShipmentStringGrid.RowCount - 1 do
    Begin
      ShipmentStringGrid.Rows[i].Clear;
    end;

   case TypeShipment of
      TAB_ShipmentVostok: Begin
                             AppData.AdoCmd.CommandText := Format(SSQLUpdateShipmentStatusCorrDoc, [MainForm.ReestrShipmentVostok.FieldByName('UNICUM_NUM').AsInteger, 0]);
                             AppData.AdoCmd.Execute;
                             MainForm.ReestrShipmentVostok.Active := False;
                             MainForm.ReestrShipmentVostok.Active := True;
                          end;

      TAB_ShipmentOther:  Begin
                             AppData.AdoCmd.CommandText := Format(SSQLUpdateShipmentStatusCorrDoc, [MainForm.ReestrShipmentOther.FieldByName('UNICUM_NUM').AsInteger, 0]);
                             AppData.AdoCmd.Execute;
                             MainForm.ReestrShipmentOther.Active := False;
                             MainForm.ReestrShipmentOther.Active := True;
                          end;
   end;
end;

procedure TShipmentForm.SaveBtnClick(Sender: TObject);
begin
  PopupSaveMenu.Popup(SaveBtn.ClientOrigin.X, SaveBtn.ClientOrigin.Y);
end;

procedure TShipmentForm.AddBtnClick(Sender: TObject);
begin
  fl_ShopInDoc := 7;
  ShopForm.SettingShopForm(1);
  ShopForm.ShowModal();
end;

procedure TShipmentForm.DeleteBtnClick(Sender: TObject);
var
    i:integer;
begin
      If ShipmentStringGrid.Row <> 0 then
         Begin
            DeleteRow(ShipmentStringGrid, ShipmentStringGrid.Row);
            For i:= 1 to ShipmentStringGrid.RowCount do
              ShipmentStringGrid.Cells[0,i] := IntToStr(i);
            ShipmentStringGrid.Cells[0,0] := 'NN';
         end
      else
           Exit;
end;

procedure TShipmentForm.DeleteRow(StringGrid: TStringGrid; ARow: Integer);
var i, j: Integer;
begin
  with ShipmentStringGrid do
  begin
    for i:=ARow+1 to RowCount-1 do
      for j:=0 to ColCount-1 do
        Cells[j, i-1]:=Cells[j, i];
    for i:=1 to ColCount-1 do
      Cells[i, RowCount-1]:='';
    RowCount:=RowCount-1;
  end;
end;

procedure TShipmentForm.SaveNewShipmentVostok;
var
    i: integer;
    Sum_Nal, Sum_Not_nal: real;
begin

 Sum_Nal := 0;
 Sum_Not_Nal := 0;

 for i := 1 to ShipmentStringGrid.RowCount-1 do
  Begin
    if ShipmentStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Nal     := Sum_Nal +  StrToFloat(StringReplace(ShipmentStringGrid.Cells[4,i],  '.', ',', [rfReplaceAll, rfIgnoreCase]));
    if ShipmentStringGrid.Cells[5,i] <> EmptyStr then
      Sum_Not_Nal := Sum_Not_Nal +StrToFloat(StringReplace(ShipmentStringGrid.Cells[5,i], '.', ',',  [rfReplaceAll, rfIgnoreCase]));
  end;

  AppData.ShipmentHeadDoc.Active := False;
  AppData.ShipmentHeadDoc.CommandText := Format(SSQLCreateShipmentHeader, [FormatDateTime('yyyy-mm-dd', ShipmentPicker.Date),
                                                                          PrimechEdit.Text,
                                                                          g_User,
                                                                          StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                          StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                          s_ShipmentVostok]);
  AppData.ShipmentHeadDoc.Active := True;

  AppData.MaxUnicumNumShipment.Active := False;
  AppData.MaxUnicumNumShipment.Active := True;


  for i := 1 to ShipmentStringGrid.RowCount-1 do
  Begin
    AppData.ShipmentDetailDoc.Active := False;
    AppData.ShipmentDetailDoc.CommandText := Format(SSQLCreateShipmentDetail, [AppData.MaxUnicumNumShipment.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumShipment.FieldByName('NUMDOC').AsInteger,
                                                                                FormatDateTime('yyyy-mm-dd',ShipmentPicker.Date),
                                                                                StrToInt(ShipmentStringGrid.Cells[0,i]),
                                                                                StrToInt(ShipmentStringGrid.Cells[1,i]),
                                                                                StringReplace(ShipmentStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(ShipmentStringGrid.Cells[5,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                ShipmentStringGrid.Cells[6,i],
                                                                                ShipmentStringGrid.Cells[7,i],
                                                                                g_User,
                                                                                s_ShipmentVostok
                                                                                ]);
    AppData.ShipmentDetailDoc.Active := True;
  end; 
end;

procedure TShipmentForm.SaveShipmentDoc(TabIndex,
  TypeSaveShipment: Integer);
begin
    Case TabIndex of
        TAB_ShipmentVostok:  Begin
                                case TypeSaveShipment of
                                    g_CreateDoc: SaveNewShipmentVostok();
                                    g_CorrDoc:   SaveCorrShipmentVostok();
                                end;

                               MainForm.ReestrShipmentVostok.Active := False;
                               MainForm.ReestrShipmentVostok.Active := True;
                               MainForm.Tabs.TabIndex := TAB_ShipmentVostok;
                             end;

        TAB_ShipmentOther:   Begin
                                case TypeSaveShipment of
                                    g_CreateDoc:  SaveNewShipmentOther();
                                    g_CorrDoc:    SaveCorrShipmentOther();
                                end;
                                
                               MainForm.ReestrShipmentOther.Active := False;
                               MainForm.ReestrShipmentOther.Active := True;
                               MainForm.Tabs.TabIndex := TAB_ShipmentOther;
                             end;
    end;

  MessageBox(Handle,PChar('Документ Отгрузка(Восток) успешно сохранен!'),PChar('Документ Отгрузка(Восток)'), MB_ICONINFORMATION+MB_OK);
  Close();
end;

procedure TShipmentForm.SavePopClick(Sender: TObject);
begin
  SaveShipmentDoc(TypeShipment, TypeSaveShipment);
end;

procedure TShipmentForm.SaveNewShipmentOther;
var
    i: integer;
    Sum_Nal, Sum_Not_nal: real;
begin

 Sum_Nal := 0;
 Sum_Not_Nal := 0;

 for i := 1 to ShipmentStringGrid.RowCount-1 do
  Begin
    if ShipmentStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Nal     := Sum_Nal +  StrToFloat(StringReplace(ShipmentStringGrid.Cells[4,i],  '.', ',', [rfReplaceAll, rfIgnoreCase]));
    if ShipmentStringGrid.Cells[5,i] <> EmptyStr then
      Sum_Not_Nal := Sum_Not_Nal +StrToFloat(StringReplace(ShipmentStringGrid.Cells[5,i], '.', ',',  [rfReplaceAll, rfIgnoreCase]));
  end;

  AppData.ShipmentHeadDoc.Active := False;
  AppData.ShipmentHeadDoc.CommandText := Format(SSQLCreateShipmentHeader, [FormatDateTime('yyyy-mm-dd', ShipmentPicker.Date),
                                                                          PrimechEdit.Text,
                                                                          g_User,
                                                                          StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                          StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                          s_ShipmentOther]);
  AppData.ShipmentHeadDoc.Active := True;

  AppData.MaxUnicumNumShipment.Active := False;
  AppData.MaxUnicumNumShipment.Active := True;


  for i := 1 to ShipmentStringGrid.RowCount-1 do
  Begin
    AppData.ShipmentDetailDoc.Active := False;
    AppData.ShipmentDetailDoc.CommandText := Format(SSQLCreateShipmentDetail, [AppData.MaxUnicumNumShipment.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumShipment.FieldByName('NUMDOC').AsInteger,
                                                                                FormatDateTime('yyyy-mm-dd',ShipmentPicker.Date),
                                                                                StrToInt(ShipmentStringGrid.Cells[0,i]),
                                                                                StrToInt(ShipmentStringGrid.Cells[1,i]),
                                                                                StringReplace(ShipmentStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(ShipmentStringGrid.Cells[5,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                ShipmentStringGrid.Cells[6,i],
                                                                                ShipmentStringGrid.Cells[7,i],
                                                                                g_User,
                                                                                s_ShipmentOther
                                                                                ]);
    AppData.ShipmentDetailDoc.Active := True;
  end;
end;


procedure TShipmentForm.SaveCorrShipmentVostok;
var
    I: integer;
    Sum_Nal, Sum_Not_nal: real;
Begin
 Sum_Nal := 0;
 Sum_Not_Nal := 0;

 for i := 1 to ShipmentStringGrid.RowCount-1 do
  Begin
    if ShipmentStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Nal     := Sum_Nal +  StrToFloat(StringReplace(ShipmentStringGrid.Cells[4,i], '.', ',',  [rfReplaceAll, rfIgnoreCase]));
    if ShipmentStringGrid.Cells[5,i] <> EmptyStr then
      Sum_Not_Nal := Sum_Not_Nal +StrToFloat(StringReplace(ShipmentStringGrid.Cells[5,i], '.', ',',  [rfReplaceAll, rfIgnoreCase]));
  end;

  // Удаление старой версии расходной накладной и перевод документа в архив
  AppData.DeleteShipment.Active := False;
  AppData.DeleteShipment.CommandText := Format(SSQLDeleteShipmentDocum, [MainForm.ReestrShipmentVostok.FieldByName('UNICUM_NUM').AsInteger]);
  AppData.DeleteShipment.Active := True;


  // Шапка расходной накладной
   AppData.CorrShipmentH.Active := False;
   AppData.CorrShipmentH.CommandText := Format(SSQLCorrShipmentDoc_h, [     StrToInt(NumDocEdit.Text),
                                                                            FormatDateTime('yyyy-mm-dd', ShipmentPicker.Date),
                                                                            PrimechEdit.Text,
                                                                            MainForm.ReestrShipmentVostok.FieldByName('FAMILY').AsString,
                                                                            FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz', MainForm.ReestrShipmentVostok.FieldByName('CREATE_DATE').AsDateTime),
                                                                            StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            s_ShipmentVostok,
                                                                            g_User]);
  AppData.CorrShipmentH.Active := True;


  AppData.MaxUnicumNumShipment.Active := False;
  AppData.MaxUnicumNumShipment.Active := True;


  // Элементы расходной накладной
    for i := 1 to ShipmentStringGrid.RowCount-1 do
    Begin
      AppData.ShipmentDetailDoc.Active := False;
      AppData.ShipmentDetailDoc.CommandText := Format(SSQLCreateShipmentDetail, [AppData.MaxUnicumNumShipment.FieldByName('UNICUM_NUM').AsInteger,
                                                                                  AppData.MaxUnicumNumShipment.FieldByName('NUMDOC').AsInteger,
                                                                                  FormatDateTime('yyyy-mm-dd',ShipmentPicker.Date),
                                                                                  StrToInt(ShipmentStringGrid.Cells[0,i]),
                                                                                  StrToInt(ShipmentStringGrid.Cells[1,i]),
                                                                                  StringReplace(ShipmentStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                  StringReplace(ShipmentStringGrid.Cells[5,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                  ShipmentStringGrid.Cells[6,i],
                                                                                  ShipmentStringGrid.Cells[7,i],
                                                                                  g_User,
                                                                                  s_ShipmentVostok
                                                                                  ]);
      AppData.ShipmentDetailDoc.Active := True;
    end;
end;


procedure TShipmentForm.SaveCorrShipmentOther;
var
    I: integer;
    Sum_Nal, Sum_Not_nal: real;
Begin
 Sum_Nal := 0;
 Sum_Not_Nal := 0;

 for i := 1 to ShipmentStringGrid.RowCount-1 do
  Begin
    if ShipmentStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Nal     := Sum_Nal +  StrToFloat(StringReplace(ShipmentStringGrid.Cells[4,i], '.', ',',  [rfReplaceAll, rfIgnoreCase]));
    if ShipmentStringGrid.Cells[5,i] <> EmptyStr then
      Sum_Not_Nal := Sum_Not_Nal +StrToFloat(StringReplace(ShipmentStringGrid.Cells[5,i], '.', ',',  [rfReplaceAll, rfIgnoreCase]));
  end;

  // Удаление старой версии расходной накладной и перевод документа в архив
  AppData.DeleteShipment.Active := False;
  AppData.DeleteShipment.CommandText := Format(SSQLDeleteShipmentDocum, [MainForm.ReestrShipmentOther.FieldByName('UNICUM_NUM').AsInteger]);
  AppData.DeleteShipment.Active := True;


  // Шапка расходной накладной
   AppData.CorrShipmentH.Active := False;
   AppData.CorrShipmentH.CommandText := Format(SSQLCorrShipmentDoc_h, [     StrToInt(NumDocEdit.Text),
                                                                            FormatDateTime('yyyy-mm-dd', ShipmentPicker.Date),
                                                                            PrimechEdit.Text,
                                                                            MainForm.ReestrShipmentOther.FieldByName('FAMILY').AsString,
                                                                            FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz', MainForm.ReestrShipmentOther.FieldByName('CREATE_DATE').AsDateTime),
                                                                            StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            s_ShipmentOther,
                                                                            g_User]);
  AppData.CorrShipmentH.Active := True;


  AppData.MaxUnicumNumShipment.Active := False;
  AppData.MaxUnicumNumShipment.Active := True;


  // Элементы расходной накладной
    for i := 1 to ShipmentStringGrid.RowCount-1 do
  Begin
    AppData.ShipmentDetailDoc.Active := False;
    AppData.ShipmentDetailDoc.CommandText := Format(SSQLCreateShipmentDetail, [AppData.MaxUnicumNumShipment.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumShipment.FieldByName('NUMDOC').AsInteger,
                                                                                FormatDateTime('yyyy-mm-dd',ShipmentPicker.Date),
                                                                                StrToInt(ShipmentStringGrid.Cells[0,i]),
                                                                                StrToInt(ShipmentStringGrid.Cells[1,i]),
                                                                                StringReplace(ShipmentStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(ShipmentStringGrid.Cells[5,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                ShipmentStringGrid.Cells[6,i],
                                                                                ShipmentStringGrid.Cells[7,i],
                                                                                g_User,
                                                                                s_ShipmentOther
                                                                                ]);
    AppData.ShipmentDetailDoc.Active := True;
  end;
end;


procedure TShipmentForm.FormActivate(Sender: TObject);
begin
  GetSuppliers();
end;

procedure TShipmentForm.PrintBtnClick(Sender: TObject);
begin
  case TypeShipment of
      TAB_ShipmentVostok:   Begin
                              AppData.ShipmentDetail.Active := False;
                              AppData.ShipmentDetail.CommandText := Format(SSQLGetShipmentDetail, [MainForm.ReestrShipmentVostok.FieldByName('UNICUM_NUM').AsInteger]);
                              AppData.Report.Template := SShipmentVostokTotalDoc;
                              AppData.Report.Run;
                            end;

      TAB_ShipmentOther:   Begin
                              AppData.ShipmentDetail.Active := False;
                              AppData.ShipmentDetail.CommandText := Format(SSQLGetShipmentDetail, [MainForm.ReestrShipmentOther.FieldByName('UNICUM_NUM').AsInteger]);
                              AppData.Report.Template := SShipmentOtherTotalDoc;
                              AppData.Report.Run;
                           end;
  end;
end;

procedure TShipmentForm.SaveNoPopClick(Sender: TObject);
begin
  Close();
end;

function TShipmentForm.CalcValueCellsVB(StringCalc: string): string;
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
