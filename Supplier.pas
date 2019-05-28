unit Supplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB;

type
  TSupplierForm = class(TForm)
    Bar: TStatusBar;
    Panel: TPanel;
    SupplierGrid: TDBGrid;
    Bevel1: TBevel;
    AddBtn: TBitBtn;
    CorrBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    RefreshBtn: TBitBtn;
    ToReserveBtn: TBitBtn;
    TransferBackReserveBtn: TBitBtn;
    ReserveCheck: TCheckBox;
    GroupBox1: TGroupBox;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    SuppliersSet: TADODataSet;
    DS_SuppliersSet: TDataSource;
    SuppliersSetUID: TIntegerField;
    SuppliersSetsName: TStringField;
    SuppliersSetReserve: TBooleanField;
    TransferSupplierSet: TADODataSet;
    DeleteSupplierSet: TADODataSet;
    OperSupplierSet: TADODataSet;
    procedure ReserveCheckClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure CorrBtnClick(Sender: TObject);
    procedure ToReserveBtnClick(Sender: TObject);
    procedure SupplierGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure TransferBackReserveBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BarInfo();
  end;

var
  SupplierForm: TSupplierForm;

implementation

uses Main, ModuleData, sConst, AddSupplier, Globals;

{$R *.dfm}

{ TSupplierForm }

procedure TSupplierForm.BarInfo;
var
    s_SelectUID: string;
begin
  Screen.Cursor := crSQLWait;
  SuppliersSet.DisableControls;

  s_SelectUID := SuppliersSet.FieldByName('UID').AsString;
  SuppliersSet.Active := False;
  SuppliersSet.CommandText := Format(SSQLGetSupplier, [Byte(ReserveCheck.Checked)]);
  SuppliersSet.Active := True;

  SuppliersSet.Locate('UID', s_SelectUID, [loCaseInsensitive, loPartialKey]);

  Screen.Cursor := crDefault;
  SuppliersSet.EnableControls;
  

  Bar.Panels[0].Text := 'Количество поставщиков: ' + IntToStr(SuppliersSet.RecordCount);
end;

procedure TSupplierForm.ReserveCheckClick(Sender: TObject);
begin
   BarInfo();
end;

procedure TSupplierForm.RefreshBtnClick(Sender: TObject);
begin
  BarInfo();
end;

procedure TSupplierForm.AddBtnClick(Sender: TObject);
var
    AddSupplierF: TAddSupplierForm;
begin

   Try
     AddSupplierF := TAddSupplierForm.Create(MainForm);
     with AddSupplierF do
        Begin
           Caption := 'Добавить';
           if ShowModal = mrOK then
             Begin
                  OperSupplierSet.Active := False;
                  OperSupplierSet.CommandText := Format(SSQLAddSupplier, [SupplierEdit.Text,
                                                                          0]);
                  OperSupplierSet.Active := True;

                  MessageBox(Handle, PChar('Новый поставщик успешно добавлен'), PChar('Добавить поставщика'), MB_ICONINFORMATION+MB_OK);
                  BarInfo();
             end;
        end;
   Finally
         FreeAndNil(AddSupplierF);
   end;
end;

procedure TSupplierForm.CorrBtnClick(Sender: TObject);
var
    AddSupplierF: TAddSupplierForm;
begin
    Try
       AddSupplierF := TAddSupplierForm.Create(MainForm);
       with AddSupplierF do
          Begin
             SupplierEdit.Text := SuppliersSet.FieldByName('sName').AsString;
             AddSupplierBtn.Caption := 'Изменить';
             if ShowModal = mrOK then
               Begin
                  OperSupplierSet.Active := False;
                  OperSupplierSet.CommandText := Format(SSQLCorrSupplier, [SuppliersSet.FieldByName('UID').AsInteger,
                                                                           SupplierEdit.Text]);
                  OperSupplierSet.Active := True;
                  MessageBox(Handle, PChar('Поставщик успешно откорректирован'), PChar('Корректровка поставщика'), MB_ICONINFORMATION+MB_OK);
                  BarInfo();
               end;
          end;
    finally
        FreeAndNil(AddSupplierF);
    end;
end;

procedure TSupplierForm.ToReserveBtnClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  TransferSupplierSet.Active := False;
  TransferSupplierSet.CommandText := Format(SSQLTransferSupplierToReserve, [SuppliersSet.FieldByName('UID').AsInteger,
                                                                            i_ReserveWith]);
  TransferSupplierSet.Active := True;
  Screen.Cursor := crDefault;
  BarInfo();
end;

procedure TSupplierForm.SupplierGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If (SuppliersSet.FieldByName('RESERVE').AsBoolean) then
    Begin
       with SupplierGrid.Canvas do
        Begin
          Brush.Color := clRed;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TSupplierForm.TransferBackReserveBtnClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  TransferSupplierSet.Active := False;
  TransferSupplierSet.CommandText := Format(SSQLTransferSupplierToReserve, [SuppliersSet.FieldByName('UID').AsInteger,
                                                                            i_ReserveWithNo]);
  TransferSupplierSet.Active := True;
  Screen.Cursor := crDefault;
  BarInfo();
end;

procedure TSupplierForm.DeleteBtnClick(Sender: TObject);
var
    QUser, QDelUser: Word;
begin
QDelUser := MessageBox(Handle,PChar('Вы действительно желаете удалить этого пользователя?'),PChar('Удаление пользователя'), MB_ICONINFORMATION+MB_YESNO);
if QDelUser = IDYES then
  Begin
    Screen.Cursor := crSQLWait;
    DeleteSupplierSet.Active := False;
    DeleteSupplierSet.CommandText := Format(SSQLDeleteSupplier, [SuppliersSet.FieldByName('UID').AsInteger]);
    DeleteSupplierSet.Active := True;
    Screen.Cursor := crDefault;

    BarInfo();
  end
else
    Exit;

end;

procedure TSupplierForm.FindBtnClick(Sender: TObject);
var
    StrFilter: string;
begin
  StrFilter := EmptyStr;
  StrFilter := 'sName LIKE ' + QuotedStr('%' + Trim(FindEdit.Text) + '%');

  if StrFilter <> EmptyStr then
    Begin
      SuppliersSet.Filter := StrFilter;
      SuppliersSet.Filtered := True;
    end;
end;

end.
