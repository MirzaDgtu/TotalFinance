unit Shop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus;

type
  TShopForm = class(TForm)
    Panel1: TPanel;
    ShopGrid: TDBGrid;
    PopupShopMenu: TPopupMenu;
    CreateShopPop: TMenuItem;
    DeleteShopPop: TMenuItem;
    ToReserveShopPop: TMenuItem;
    CorrShopPop: TMenuItem;
    ReserveCheck: TCheckBox;
    FromReserveShopPop: TMenuItem;
    AddInDocBtn: TBitBtn;
    Bevel1: TBevel;
    AddBtn: TBitBtn;
    CorrBtn: TBitBtn;
    ReserveBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    GroupBox1: TGroupBox;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    RefreshShopPop: TMenuItem;
    FromReserveBtn: TBitBtn;
    RefreshBtn: TBitBtn;
    procedure AddBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure ShopGridKeyPress(Sender: TObject; var Key: Char);
    procedure CorrBtnClick(Sender: TObject);
    procedure ReserveCheckClick(Sender: TObject);
    procedure FromReserveShopPopClick(Sender: TObject);
    procedure AddInDocBtnClick(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure ReserveBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShopGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RefreshShopPopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SettingShopForm(TypePreview: integer);
    procedure RefreshShopGrid;
  end;

var
  ShopForm: TShopForm;
  fl_TypeOperShop, fl_TypeReserve: integer;

implementation

uses ModuleData, AddShop, sConst, DB, CreateDoc, Expenses, Globals, ZpAup,
  IncomeCash, TaxToZp, PercentOfTerminal, Shipment, Offs, TypeEnergy,
  PublicUtilities, Main;

{$R *.dfm}

procedure TShopForm.AddBtnClick(Sender: TObject);
var
    AddShopF: TAddShopForm;
begin
  fl_TypeOperShop := 0;

  AddShopF :=  TAddShopForm.Create(MainForm);
      Try
        with AddShopF do
          Begin
               Caption := 'Новый магазин';
               if AddShopF.ShowModal = mrOk then
                Begin
                    if fl_TypeOperShop = 0 then
                     Begin
                        AppData.InsertNewShop.Active := False;
                        AppData.InsertNewShop.CommandText := Format (SSQLInsertNewShop, [NameShopEdit.Text,
                                                                                         AdressShopEdit.Text,
                                                                                         InnEdit.Text,
                                                                                         KppEdit.Text,
                                                                                         0]);
                        AppData.InsertNewShop.Active := True;

                        AppData.Organiz.Active := False;
                        AppData.Organiz.Active := True;
                     end;
                end;
          end;
      finally
          FreeAndNil(AddShopF);
      end;
end;

procedure TShopForm.DeleteBtnClick(Sender: TObject);
var
    QDel: word;
begin
   if not AppData.Organiz.IsEmpty then
    Begin
      QDel := MessageBox(Handle, PChar('Вы действительно желаете удалить магазин: ' + AppData.Organiz.FieldByName('Name').AsString + '?'), PChar('Удаление магазина'), MB_ICONWARNING+MB_YESNO);

      if QDel = IDYES then
        Begin
            Screen.Cursor := crSQLWait;
            AppData.Organiz.DisableControls;

            AppData.DeleteShop.Active := False;
            AppData.DeleteShop.CommandText := Format (SSQLDeleteShop, [AppData.Organiz.FieldByName('UID').AsInteger]);
            AppData.DeleteShop.Active := True;

            AppData.Organiz.Active := False;
            AppData.Organiz.Active := True;

            if AppData.DeleteShop.FieldByName('Res').AsInteger = 0 then
                MessageBox(Handle, PChar('Магазин успешно удален!'), PChar('Удаление магазина'), MB_ICONINFORMATION+MB_OK)
            else
            if AppData.DeleteShop.FieldByName('Res').AsInteger = 1 then
                MessageBox(Handle, PChar('Магазин переведен в резерв,' + Chr(13) +  'в связи с наличием связанных с ним документов!'), PChar('Удаление магазина'), MB_ICONINFORMATION+MB_OK);

            AppData.Organiz.EnableControls;    
            Screen.Cursor := crDefault;
        end
      else
        Exit;
    end;
end;

procedure TShopForm.ShopGridKeyPress(Sender: TObject; var Key: Char);
begin
  case KEY of
    #27 : Close();
  end;
end;

procedure TShopForm.CorrBtnClick(Sender: TObject);
var
    AddShopF: TAddShopForm;
begin
    fl_TypeOperShop := 1;
    AddShopF :=  TAddShopForm.Create(MainForm);


      try
         with AddShopF do
          Begin
            NameShopEdit.Text   := AppData.Organiz.FieldByName('NAME').AsString;
            AdressShopEdit.Text := AppData.Organiz.FieldByName('ADRESS').AsString;
            InnEdit.Text := AppData.Organiz.FieldByName('INN').AsString;
            KppEdit.Text := AppData.Organiz.FieldByName('KPP').AsString;

            if ShowModal = mrOK then
              Begin
                 if fl_TypeOperShop = 1 then
                   Begin
                      AppData.CorrShop.Active := False;
                      AppData.CorrShop.CommandText := Format(SSQLCorrShop, [AppData.Organiz.FieldByName('UID').AsInteger,
                                                                            NameShopEdit.Text,
                                                                            AdressShopEdit.Text,
                                                                            InnEdit.Text,
                                                                            KppEdit.Text,
                                                                            0]);
                      AppData.CorrShop.Active := True;

                      AppData.Organiz.Active := False;
                      AppData.Organiz.Active := True;
                   end;
              end;
          end;
      finally
        FreeAndNil(AddShopF);
      end;
end;

procedure TShopForm.RefreshShopGrid;
begin
  if ReserveCheck.Checked then
  begin
    AppData.Organiz.Active := False;
    AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [1]);
    AppData.Organiz.Active := True;
  end
  else
  if ReserveCheck.Checked = False then
  begin
    AppData.Organiz.Active := False;
    AppData.Organiz.CommandText := Format(SSQLGetOrganiz, [0]);
    AppData.Organiz.Active := True;
  end;
end;

procedure TShopForm.ReserveCheckClick(Sender: TObject);
begin
  RefreshShopGrid();
end;

procedure TShopForm.FromReserveShopPopClick(Sender: TObject);
begin
  fl_TypeReserve := 0;

  if not AppData.Organiz.IsEmpty then
    Begin
      Screen.Cursor := crSQLWait;
      AppData.Organiz.DisableControls;

      AppData.TransferToReserve.Active := False;
      AppData.TransferToReserve.CommandText := Format(SSQLTransferClientToReserve, [AppData.Organiz.FieldByName('UID').AsInteger, 0]);
      AppData.TransferToReserve.Active := True;

      AppData.Organiz.Active := False;
      AppData.Organiz.Active := True;

      MessageBox(Handle, PCHar('Магазин успешно переведен из резерва!'), PChar('Перевод из резерва'), MB_ICONINFORMATION+MB_OK);

      AppData.Organiz.EnableControls;
      Screen.Cursor := crDefault;
    end;
end;

procedure TShopForm.AddInDocBtnClick(Sender: TObject);
var
    i: integer;
begin
  case fl_ShopInDoc of
    // Добавление в Выручка
      1:   Begin
              with CreateDocumentForm.DetailStringGrid do
              begin
                RowCount := RowCount + 1;
                Cells[0,RowCount-1] := IntToStr(RowCount-1);
                Cells[1,RowCount-1] := AppData.Organiz.FieldByName('UID').AsString;
                Cells[2,RowCount-1] := AppData.Organiz.FieldByName('Name').AsString;
                Cells[3,RowCount-1] := AppData.Organiz.FieldByName('Adress').AsString;
              end;
           end;

    // Добавление в Все виды расходов
      2:  Begin
              with ExpenseForm.ExpenseStringGrid do
                begin
                  RowCount := RowCount + 1;
                  Cells[0,RowCount-1] := IntToStr(RowCount-1);
                  Cells[1,RowCount-1] := AppData.Organiz.FieldByName('UID').AsString;
                  Cells[2,RowCount-1] := AppData.Organiz.FieldByName('Name').AsString;
                  Cells[3,RowCount-1] := AppData.Organiz.FieldByName('Adress').AsString;
                end;
          end;

    // Добавление в ЗП АУП
      3:  Begin
             with ZpAupForm.ZpAupStringGrid do
                Begin
                    RowCount := RowCount + 1;
                    Cells[0,RowCount-1] := IntToStr(RowCount-1);
                    Cells[1,RowCount-1] := AppData.Organiz.FieldByName('UID').AsString;
                    Cells[2,RowCount-1] := AppData.Organiz.FieldByName('Name').AsString;
                    Cells[3,RowCount-1] := AppData.Organiz.FieldByName('Adress').AsString;
                  end;
             end;

     // Налоги по ЗП
      4:  Begin
             with TaxToZpForm.TaxZpStringGrid do
              Begin
                  RowCount := RowCount + 1;
                  Cells[0,RowCount-1] := IntToStr(RowCount-1);
                  Cells[1,RowCount-1] := AppData.Organiz.FieldByName('UID').AsString;
                  Cells[2,RowCount-1] := AppData.Organiz.FieldByName('Name').AsString;
                  Cells[3,RowCount-1] := AppData.Organiz.FieldByName('Adress').AsString;
              end;
          end;

      // Процент по ЗП
      6:  Begin
             with PercentOfTerminalForm.PercentOfTerminalStringGrid do
              Begin
                  RowCount := RowCount + 1;
                  Cells[0,RowCount-1] := IntToStr(RowCount-1);
                  Cells[1,RowCount-1] := AppData.Organiz.FieldByName('UID').AsString;
                  Cells[2,RowCount-1] := AppData.Organiz.FieldByName('Name').AsString;
                  Cells[3,RowCount-1] := AppData.Organiz.FieldByName('Adress').AsString;
              end;
          end;

      // Отгрузка (Восток и Прочие)
      7:  Begin
             with ShipmentForm.ShipmentStringGrid do
              Begin
                  RowCount := RowCount + 1;
                  Cells[0,RowCount-1] := IntToStr(RowCount-1);
                  Cells[1,RowCount-1] := AppData.Organiz.FieldByName('UID').AsString;
                  Cells[2,RowCount-1] := AppData.Organiz.FieldByName('Name').AsString;
                  Cells[3,RowCount-1] := AppData.Organiz.FieldByName('Adress').AsString;
              end;
          end;

      // Списание, Возврат, Envd
      8:  Begin
            with OffsForm.OffsStringGrid do
              Begin
                  RowCount := RowCount + 1;
                  Cells[0,RowCount-1] := IntToStr(RowCount-1);
                  Cells[1,RowCount-1] := AppData.Organiz.FieldByName('UID').AsString;
                  Cells[2,RowCount-1] := AppData.Organiz.FieldByName('Name').AsString;
                  Cells[3,RowCount-1] := AppData.Organiz.FieldByName('Adress').AsString;
              end
          end;

      // Коммунальные услуги
      9: Begin
            with PublicUtilitiesForm.PublicUtilitesStringGrid do
              Begin
                  RowCount := RowCount + 1;
                  Cells[0,RowCount-1] := IntToStr(RowCount-1);
                  Cells[1,RowCount-1] := AppData.Organiz.FieldByName('UID').AsString;
                  Cells[2,RowCount-1] := AppData.Organiz.FieldByName('Name').AsString;
                  Cells[3,RowCount-1] := AppData.Organiz.FieldByName('Adress').AsString;
              end
         end;

    // Добавление в Выручка (касса)
      13: Begin
              with IncomeCashForm.DetailStringGrid do
              begin
                RowCount := RowCount + 1;
                Cells[0,RowCount-1] := IntToStr(RowCount-1);
                Cells[1,RowCount-1] := AppData.Organiz.FieldByName('UID').AsString;
                Cells[2,RowCount-1] := AppData.Organiz.FieldByName('Name').AsString;
                Cells[3,RowCount-1] := AppData.Organiz.FieldByName('Adress').AsString;
              end;
          end;
  end;

end;

procedure TShopForm.FindBtnClick(Sender: TObject);
var
  StrFilter: string;
begin
   StrFilter := EmptyStr;
   StrFilter := 'NAME LIKE ' + QuotedStr('%' + Trim(FindEdit.Text) + '%');
    AppData.Organiz.Filter := StrFilter;
      If StrFilter <> EmptyStr then
        AppData.Organiz.Filtered := True;
end;

procedure TShopForm.FindEditChange(Sender: TObject);
begin
    If FindEdit.Text = EmptyStr then
       AppData.Organiz.Filtered := False;
end;

procedure TShopForm.ReserveBtnClick(Sender: TObject);
begin
  fl_TypeReserve := 1;
    if not AppData.Organiz.IsEmpty then
    Begin
      Screen.Cursor := crSQLWait;
      AppData.Organiz.DisableControls;

      AppData.TransferToReserve.Active := False;
      AppData.TransferToReserve.CommandText := Format(SSQLTransferClientToReserve, [AppData.Organiz.FieldByName('UID').AsInteger, 1]);
      AppData.TransferToReserve.Active := True;

      AppData.Organiz.Active := False;
      AppData.Organiz.Active := True;
      MessageBox(Handle, PCHar('Магазин успешно переведен в резерв!'), PChar('Перевод в резерв'), MB_ICONINFORMATION+MB_OK);

      AppData.Organiz.EnableControls;
      Screen.Cursor := crDefault;
    end;
end;

procedure TShopForm.FormCreate(Sender: TObject);
begin
  //RefreshShopGrid();
end;

procedure TShopForm.SettingShopForm(TypePreview: integer);
begin
  case TypePreview of
    0:  Begin
          AddInDocBtn.Visible := False;
          AddBtn.Visible      := True;
          ReserveBtn.Visible  := True;
          DeleteBtn.Visible   := True;
          CorrBtn.Visible     := True;
        end;

    1:  Begin
          AddBtn.Visible      := False;
          AddInDocBtn.Visible := True;
          AddInDocBtn.Left    := AddBtn.Left;
          AddInDocBtn.Top     := AddBtn.Top;
          ReserveBtn.Visible  := False;
          DeleteBtn.Visible   := False;
          CorrBtn.Visible     := False;
        end;
  end;
end;

procedure TShopForm.ShopGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if AppData.Organiz.FieldByName('RESERVE').AsString = '*' then
    begin
      with ShopGrid.Canvas do
        Begin
          Brush.Color := clRed;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TShopForm.RefreshShopPopClick(Sender: TObject);
begin
    RefreshShopGrid();
end;

end.
