unit Access;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TAccessForm = class(TForm)
    Panel1: TPanel;
    Bar: TStatusBar;
    Bevel2: TBevel;
    ExitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    UserAccessGrid: TDBGrid;
    GroupBox2: TGroupBox;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    AccessBtn: TBitBtn;
    RefreshBtn: TBitBtn;
    NaznachenieBtn: TBitBtn;
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure AccessBtnClick(Sender: TObject);
    procedure NaznachenieBtnClick(Sender: TObject);
    procedure UserAccessGridTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccessForm: TAccessForm;


implementation

uses ModuleData, Main, User, Module, sConst, Rigth, AccessNaznachenie;

{$R *.dfm}


procedure TAccessForm.ExitBtnClick(Sender: TObject);
begin
  Close();
end;

procedure TAccessForm.RefreshBtnClick(Sender: TObject);
begin
  AppData.User.Active := False;
  AppData.User.CommandText := Format(SSQLGetUser, [0]);
  AppData.User.Active := True;
end;

procedure TAccessForm.FindBtnClick(Sender: TObject);
var
    StrFilter: string;
begin
  StrFilter := EmptyStr;
  StrFilter := 'EmployeeName LIKE ' + QuotedStr('%' + Trim(FindEdit.Text) + '%');

  if StrFilter <> EmptyStr then
  begin
    AppData.User.Filter := StrFilter;
    AppData.User.Filtered := True;
  end;
end;

procedure TAccessForm.FindEditChange(Sender: TObject);
begin
  If FindEdit.Text = EmptyStr then
      Appdata.User.Filtered := False;
end;

procedure TAccessForm.AccessBtnClick(Sender: TObject);
begin
 with RigthForm do
 Begin
      RigthUserSet.Active := False;
      RigthUserSet.CommandText := Format (SSQLGetUserModuls, [AppData.User.FieldByName('UID').AsInteger]);
      RigthUserSet.Active := True;
      ShowModal();
 end;
end;

procedure TAccessForm.NaznachenieBtnClick(Sender: TObject);
begin
  with AccessNaznachenieForm do
  begin
    AccessNaznachenieUser.Active := False;
    AccessNaznachenieUser.CommandText := Format (SSQLGetUserNaznachenie, [AppData.User.FieldByName('UID').AsInteger]);
    AccessNaznachenieUser.Active := True;
    ShowModal();
  end;
end;

procedure TAccessForm.UserAccessGridTitleClick(Column: TColumn);
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
