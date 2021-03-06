unit User;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Menus, DB, ADODB,
  ComCtrls;

type
  TUserForm = class(TForm)
    Panel1: TPanel;
    UserGrid: TDBGrid;
    AddBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    PopupUserMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DeleteUser: TADODataSet;
    Bevel1: TBevel;
    RefreshBtn: TBitBtn;
    StatusBar1: TStatusBar;
    ReserveBtn: TBitBtn;
    ReserveBox: TCheckBox;
    GroupBox1: TGroupBox;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    N4: TMenuItem;
    N5: TMenuItem;
    UserToReserve: TADODataSet;
    DeleteUserRes: TIntegerField;
    BitBtn1: TBitBtn;
    AdminBox: TCheckBox;
    AdminSet: TADODataSet;
    procedure AddBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure ReserveBtnClick(Sender: TObject);
    procedure ReserveBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure UserGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AdminBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UserGridTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshUser;
  end;

var
  UserForm: TUserForm;

implementation

uses ModuleData, Main, Employees, sConst, Globals;

{$R *.dfm}

procedure TUserForm.AddBtnClick(Sender: TObject);
var
    EmployeeF: TEmployeesForm;
begin
  try
    EmployeeF := TEmployeesForm.Create(UserForm);
    with EmployeeF do
      Begin
          Employees.Active := False;
          Employees.Active := True;
          if ShowModal = mrOK then
            Begin   
              AppData.User.Active := False;
              AppData.User.CommandText := Format(SSQLGetUser, [0]);
              AppData.User.Active := True;

              if AppData.User.Locate('UID', Employees.FieldByName('UID').AsString, [loCaseInsensitive, loPartialKey]) then
                  MessageBox(Handle, PChar('������ ������������ ��� ��������'), PChar('������������'), mrOk + MB_ICONWARNING)
              else
                  Begin
                     AddUser.Active := False;
                     AddUser.CommandText := Format(SSQLAddUser, [Employees.FieldByName('UID').AsInteger,
                                                                 Employees.FieldByName('sName').AsString]);
                     AddUser.Active := True;

                     AppData.User.Active := False;
                     AppData.User.CommandText := Format(SSQLGetUser, [Byte(ReserveBox.Checked)]);
                     AppData.User.Active := True;
                  end;
             end;

      end;
  finally
    FreeAndNil(EmployeeF);
  end;

end;

procedure TUserForm.DeleteBtnClick(Sender: TObject);
var
    QUser, QDelUser: Word;
begin

  QDelUser := MessageBox(Handle,PChar('�� ������������� ������� ������� ����� ������������?'),PChar('�������� ������������'), MB_ICONINFORMATION+MB_YESNO);
  if QDelUser = IDYES then
    begin
      DeleteUser.Active := False;
      DeleteUser.CommandText := Format(SSQLDeleteUser, [AppData.User.FieldByName('UID').AsInteger]);
      DeleteUser.Active := True;

      AppData.User.Active := False;
      AppData.User.CommandText := Format(SSQLGetUser, [Byte(ReserveBox.Checked)]);
      AppData.User.Active := True;

      if DeleteUser.FieldByName('Res').AsInteger = 0 then
        QUser := MessageBox(Handle, PChar('������������ ������!'), PChar('�������� ������������'), MB_ICONINFORMATION+MB_OK)
      else
      if DeleteUser.FieldByName('Res').AsInteger = 1 then
        QUser := MessageBox(Handle, PChar('������������ ��������� � ������, � ����� � �������� ��������� �� ����������!'), PChar('�������� ������������'), MB_ICONINFORMATION+MB_OK);
    end
  else
    Exit;
end;

procedure TUserForm.RefreshBtnClick(Sender: TObject);
begin
  RefreshUser();
end;

procedure TUserForm.ReserveBtnClick(Sender: TObject);
begin
  UserToReserve.Active := False;
  UserToReserve.CommandText := Format(SSQLTransferUserToReserve, [AppData.User.FieldByName('UID').AsInteger,
                                                                  i_ReserveWith]);
  UserToReserve.Active := True;
  RefreshUser();
end;

procedure TUserForm.RefreshUser;
begin
  if ReserveBox.Checked = True then
  Begin
    AppData.User.Active := False;
    AppData.User.CommandText := Format(SSQLGetUser, [i_ReserveWith]);
    AppData.User.Active := True;
  end
  else  
  if ReserveBox.Checked = False then
  Begin
    AppData.User.Active := False;
    AppData.User.CommandText := Format(SSQLGetUser, [i_ReserveWithNo]);
    AppData.User.Active := True;
  end;
end;

procedure TUserForm.ReserveBoxClick(Sender: TObject);
begin
  RefreshUser();
end;

procedure TUserForm.FormCreate(Sender: TObject);
begin
  RefreshUser();
end;

procedure TUserForm.N5Click(Sender: TObject);
begin
  UserToReserve.Active := False;
  UserToReserve.CommandText := Format(SSQLTransferUserToReserve, [AppData.User.FieldByName('UID').AsInteger,
                                                                  i_ReserveWithNo]);
  UserToReserve.Active := True;
  RefreshUser();
end;

procedure TUserForm.FindBtnClick(Sender: TObject);
var
    StrFilter: string;
begin
  StrFilter := EmptyStr;
  StrFilter := 'EmployeeName LIKE ' + QuotedStr('%' + Trim(FindEdit.Text) + '%');

  if StrFilter <> EmptyStr then
  Begin
    AppData.User.Filter := StrFilter;
    AppData.User.Filtered := True;
  end;
end;

procedure TUserForm.FindEditChange(Sender: TObject);
begin
    if FindEdit.Text = EmptyStr then
      AppData.User.Filtered := False;
end;

procedure TUserForm.UserGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
// ������
  if AppData.User.FieldByName('RESERVE').AsString = '*' then
    begin
      with UserGrid.Canvas do
        Begin
          Brush.Color := clRed;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
// ������
   if AppData.User.FieldByName('Admin').AsString = '*' then
    begin
      with UserGrid.Canvas do
        Begin
          Brush.Color := clSkyBlue;
          Font.Color  := clRed;
          FillRect(Rect);
          TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
    end;
end;

procedure TUserForm.AdminBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    sName: string;
begin
  sName := AppData.User.FieldByName('Login').AsString;
  AdminSet.Active := False;
  AdminSet.CommandText := Format(SSQLSetAdmin, [AppData.User.FieldByName('UID').AsInteger,
                                                Byte(AdminBox.Checked)]);

  AdminSet.Active := True;

  AppData.User.Active := False;
  AppData.User.CommandText := Format(SSQLGetUser, [Byte(ReserveBox.Checked)]);
  AppData.User.Active := True;

  AppData.User.Locate('Login', SName, [loCaseInsensitive, loPartialKey]);

end;

procedure TUserForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   AppData.User.Filtered := False;
end;

procedure TUserForm.UserGridTitleClick(Column: TColumn);
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

end.
