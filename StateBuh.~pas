unit StateBuh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TStateBuhForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    AddBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    ReserveBtn: TBitBtn;
    RefreshBtn: TBitBtn;
    ReserveBox: TCheckBox;
    GroupBox1: TGroupBox;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    CorrBtn: TBitBtn;
    StateBuhGrid: TDBGrid;
    DS_StateBuh: TDataSource;
    PopupStateBuhMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    StateBuhToReserve: TADODataSet;
    DeleteStatBuh: TADODataSet;
    FromReserveBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure StateBuhGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ReserveBoxClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure CorrBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure ReserveBtnClick(Sender: TObject);
    procedure FromReserveBtnClick(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FindEditChange(Sender: TObject);
  private
    { Private declarations }
    procedure TranferState(Reserve: integer);

  public
    { Public declarations }
    procedure ResreshStateBuh;
  end;

var
  StateBuhForm: TStateBuhForm;
  TypeSaveState: Byte;
  FR: Byte;

implementation

uses sConst, Main, ModuleData, Globals, AddStateBuh;

{$R *.dfm}

{ TStateBuhForm }

procedure TStateBuhForm.ResreshStateBuh;
var
   SelectedStr: string;
begin
  if FR = 0 then
    Begin
      Screen.Cursor := crSQLWait;
      if ReserveBox.Checked = True then
        Begin
           AppData.StateBuh.Active := False;
           AppData.StateBuh.CommandText := Format(SSQLGetStateBuh, [1]);
           AppData.StateBuh.Active := True;
        end
      else
      if ReserveBox.Checked = False then
        Begin
           AppData.StateBuh.Active := False;
           AppData.StateBuh.CommandText := Format(SSQLGetStateBuh, [0]);
           AppData.StateBuh.Active := True;
        end;
        Screen.Cursor := crDefault;
    end
  else
    Begin
        Screen.Cursor := crSQLWait;
        SelectedStr := AppData.StateBuh.FieldByName('UID').AsString;

        if ReserveBox.Checked = True then
          Begin
             AppData.StateBuh.Active := False;
             AppData.StateBuh.CommandText := Format(SSQLGetStateBuh, [1]);
             AppData.StateBuh.Active := True;
          end
        else
        if ReserveBox.Checked = False then
          Begin
             AppData.StateBuh.Active := False;
             AppData.StateBuh.CommandText := Format(SSQLGetStateBuh, [0]);
             AppData.StateBuh.Active := True;
          end;

          AppData.StateBuh.Locate('UID', SelectedStr, [loCaseInsensitive, loPartialKey]);
          Screen.Cursor := crDefault;
    end;
    FR := 1;
end;

procedure TStateBuhForm.FormCreate(Sender: TObject);
begin
  FR := 0;
  ResreshStateBuh();
end;

procedure TStateBuhForm.StateBuhGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with StateBuhGrid do
    Begin
        if AppData.StateBuh.FieldByName('Reserve').AsString = '*' then
          Canvas.Brush.Color := clRed;
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TStateBuhForm.ReserveBoxClick(Sender: TObject);
begin
    ResreshStateBuh();
end;

procedure TStateBuhForm.DeleteBtnClick(Sender: TObject);
var
    QStateBuh, QDelStateBuh: Word;
begin
  if not (AppData.StateBuh.IsEmpty) then
    Begin
      QDelStateBuh := MessageBox(Handle,PChar('Вы действительно желаете удалить эту статью?'),PChar('Удаление статьи'), MB_ICONINFORMATION+MB_YESNO);
      if QDelStateBuh = IDYES then
      begin
        Screen.Cursor := crSQLWait;
        DeleteStatBuh.Active := False;
        DeleteStatBuh.CommandText := Format(SSQLDeleteStatBuh, [AppData.StateBuh.FieldByName('UID').AsInteger]);
        DeleteStatBuh.Active := True;

        ResreshStateBuh();
        Screen.Cursor := crDefault;

        QStateBuh := MessageBox(Handle, PChar('Статья удалена!'), PChar('Удаление статьи назначения'), MB_ICONINFORMATION+MB_OK);
      end
      else
        Exit;
    end
  else
        Exit;

end;

procedure TStateBuhForm.AddBtnClick(Sender: TObject);
begin
  TypeSaveState := g_CreateDoc;

  with TAddStateBuhForm.Create(Application) do
    Begin
        try
          Caption := 'Новая статья';
          AddBtn.Caption := 'Добавить';
          ShowModal();
        except
          FreeAndNil(AddStateBuhForm);
        end;
    end;

end;

procedure TStateBuhForm.CorrBtnClick(Sender: TObject);
begin
  TypeSaveState := g_CorrDoc;

  with TAddStateBuhForm.Create(Application) do
      Begin
          try
              Caption := 'Изменение статьи';
              AddBtn.Caption := 'Изменить';
              StateEdit.Text := AppData.StateBuh.FieldByName('Name').AsString;
              ShowModal();
          except
              FreeAndNil(AddStateBuhForm);
          end;
      end;
end;

procedure TStateBuhForm.RefreshBtnClick(Sender: TObject);
begin
      ResreshStateBuh();
end;

procedure TStateBuhForm.TranferState(Reserve: integer);
begin
    case Reserve of
      i_ReserveWithNo: Begin
                          Screen.Cursor := crSQLWait;
                          StateBuhToReserve.Active := False;
                          StateBuhToReserve.CommandText := Format(SSQLTransferStateBuhToReserve, [AppData.StateBuh.FieldByName('UID').AsInteger,
                                                                                                  i_ReserveWithNo]);
                          StateBuhToReserve.Active := True;
                          Screen.Cursor := crDefault;
                          ResreshStateBuh();
                       end;

      i_ReserveWith:   Begin
                          Screen.Cursor := crSQLWait;
                          StateBuhToReserve.Active := False;
                          StateBuhToReserve.CommandText := Format(SSQLTransferStateBuhToReserve, [AppData.StateBuh.FieldByName('UID').AsInteger,
                                                                                                  i_ReserveWith]);
                          StateBuhToReserve.Active := True;
                          Screen.Cursor := crDefault;
                          ResreshStateBuh();
                       end;
    end;
end;

procedure TStateBuhForm.ReserveBtnClick(Sender: TObject);
begin
    TranferState(i_ReserveWith);
end;

procedure TStateBuhForm.FromReserveBtnClick(Sender: TObject);
begin
    TranferState(i_ReserveWithNo);
end;

procedure TStateBuhForm.FindBtnClick(Sender: TObject);
var
    StrFilter: string;
begin
  if not (AppData.StateBuh.IsEmpty) then
    Begin
        StrFilter := EmptyStr;
        StrFilter := 'sName LIKE ' + QuotedStr('%' + Trim(FindEdit.Text) + '%');

        if StrFilter <> EmptyStr then
        Begin
          AppData.StateBuh.Filter := StrFilter;
          AppData.StateBuh.Filtered := True;
        end;
    end;
end;

procedure TStateBuhForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    AppData.StateBuh.Filter := EmptyStr;
    AppData.StateBuh.Filtered := False;
end;

procedure TStateBuhForm.FindEditChange(Sender: TObject);
begin
  if Trim(FindEdit.Text) = EmptyStr then
    Begin
      AppData.StateBuh.Filter := EmptyStr;
      AppData.StateBuh.Filtered := False;
    end;
end;

end.
