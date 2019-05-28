unit TypeEnergy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls, Buttons;

type
  TTypeEnergyForm = class(TForm)
    Panel1: TPanel;
    Bar: TStatusBar;
    TypeEnergyGrid: TDBGrid;
    DS_TypeEnergy: TDataSource;
    GroupBox1: TGroupBox;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    ReserveCheck: TCheckBox;
    DeleteBtn: TBitBtn;
    ReserveBtn: TBitBtn;
    CorrBtn: TBitBtn;
    AddBtn: TBitBtn;
    Bevel1: TBevel;
    RefreshBtn: TBitBtn;
    TypeEnergyReserveSet: TADODataSet;
    FromReserveBtn: TBitBtn;
    TypeEnergyDelete: TADODataSet;
    procedure FormCreate(Sender: TObject);
    procedure ReserveCheckClick(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure CorrBtnClick(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure FromReserveBtnClick(Sender: TObject);
    procedure ReserveBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure TypeEnergyGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BarInfo;
  end;

var
  TypeEnergyForm: TTypeEnergyForm;
  g_SaveTypeEnergy: integer;

implementation

uses Main, Globals, sConst, ModuleData, AddTypeEnergy, Shop;

{$R *.dfm}

{ TTypeEnergyForm }

procedure TTypeEnergyForm.BarInfo;
var
    ReserveCount: integer;
begin
  ReserveCount := 0;
  if ReserveCheck.Checked = True then
    Begin
      Screen.Cursor := crSQLWait;
      AppData.TypeEnergySet.Active := False;
      AppData.TypeEnergySet.CommandText := Format(SSQLGetTypeEnergy, [i_ReserveWith]);
      AppData.TypeEnergySet.Active := True;
      Screen.Cursor := crDefault;
    end
  else
    Begin
      Screen.Cursor := crSQLWait;
      AppData.TypeEnergySet.Active := False;
      AppData.TypeEnergySet.CommandText := Format(SSQLGetTypeEnergy, [i_ReserveWithNo]);
      AppData.TypeEnergySet.Active := True;
      Screen.Cursor := crDefault;
    end;
  
  Bar.Panels[0].Text := 'Количество: ' + IntToStr(AppData.TypeEnergySet.RecordCount);
  AppData.TypeEnergySet.First;
  while not AppData.TypeEnergySet.Eof do
    Begin
      if AppData.TypeEnergySet.FieldByName('Reserve').AsString = '*' then
        Inc(ReserveCount);
    AppData.TypeEnergySet.Next;
    end;
    
  AppData.TypeEnergySet.First;
  Bar.Panels[1].Text := 'В резерве: ' + IntToStr(ReserveCount);
end;

procedure TTypeEnergyForm.FormCreate(Sender: TObject);
begin
  BarInfo();
end;

procedure TTypeEnergyForm.ReserveCheckClick(Sender: TObject);
begin
    BarInfo();
end;

procedure TTypeEnergyForm.FindBtnClick(Sender: TObject);
var
  StrFilter: string;
begin
   StrFilter := EmptyStr;
   StrFilter := 'NAME LIKE ' + QuotedStr('%' + Trim(FindEdit.Text) + '%');
    AppData.TypeEnergySet.Filter := StrFilter;
      If StrFilter <> EmptyStr then
       AppData.TypeEnergySet.Filtered := True;
end;

procedure TTypeEnergyForm.AddBtnClick(Sender: TObject);
begin
  g_SaveTypeEnergy := g_CreateDoc;

  with TAddTypeEnergyForm.Create(Application) do
    Begin
      Try
        TypeEnergyBtn.Caption := 'Добавить';
        GroupBox1.Caption := 'Введите новую статью -> Вид энергии';
        ShowModal();
      except
        FreeAndNil(AddTypeEnergyForm);
      end;
    end;

end;

procedure TTypeEnergyForm.CorrBtnClick(Sender: TObject);
begin
  g_SaveTypeEnergy := g_CorrDoc;

  with TAddTypeEnergyForm.Create(Application) do
    Begin
      try
          TypeEnergyBtn.Caption := 'Изменить';
          TypeEnergyEdit.Text := AppData.TypeEnergySet.FieldByName('Name').AsString;
          TypeEnergyEdit.SelectAll;
          GroupBox1.Caption := 'Корректировка статьи ' + QuotedStr(AppData.TypeEnergySet.FieldByName('Name').AsString);
          ShowModal();
      except
          FreeAndNil(AddTypeEnergyForm);
      end;
    end;
end;

procedure TTypeEnergyForm.FindEditChange(Sender: TObject);
begin
    If FindEdit.Text = EmptyStr then
       AppData.TypeEnergySet.Filtered := False;
end;

procedure TTypeEnergyForm.FromReserveBtnClick(Sender: TObject);
begin
  TypeEnergyReserveSet.Active := False;
  TypeEnergyReserveSet.CommandText := Format(SSQLTransferTypeEnergyToReserve, [AppData.TypeEnergySet.FieldByName('UID').AsInteger,
                                                                                       i_ReserveWithNo]);
  TypeEnergyReserveSet.Active := True;
  BarInfo();

end;

procedure TTypeEnergyForm.ReserveBtnClick(Sender: TObject);
begin
  TypeEnergyReserveSet.Active := False;
  TypeEnergyReserveSet.CommandText := Format(SSQLTransferTypeEnergyToReserve, [AppData.TypeEnergySet.FieldByName('UID').AsInteger,
                                                                               i_ReserveWith]);
  TypeEnergyReserveSet.Active := True;
  BarInfo();
end;

procedure TTypeEnergyForm.DeleteBtnClick(Sender: TObject);
var
    QDel, QRes: Word;
begin
      QDel:=MessageBox(Handle,PChar('Вы действительно желаете удалить этот документ?'),PChar('Удаление документа'), MB_ICONINFORMATION+MB_YESNO);
      if QDel=IDYES then
        begin
          TypeEnergyDelete.Active := False;
          TypeEnergyDelete.CommandText := Format(SSQLDeleteTypeEnergy, [AppData.TypeEnergySet.FieldByName('UID').AsInteger]);
          TypeEnergyDelete.Active := True;
          BarInfo();
          QRes := MessageBox(Handle, PChar('Статья успешно удалена'),PChar('Удаление статьи'), MB_ICONINFORMATION+MB_OK);
        end
      else
          Exit;
end;

procedure TTypeEnergyForm.TypeEnergyGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
If AppData.TypeEnergySet.FieldByName('RESERVE').AsString = '*' then
    Begin
       with TypeEnergyGrid.Canvas do
        Begin
          Brush.Color := clRed;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

end.
