unit AccessNaznachenie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  TAccessNaznachenieForm = class(TForm)
    AccessNaznachenieGrid: TDBGrid;
    Panel1: TPanel;
    AccessNaznachenieUser: TADODataSet;
    DS_AccessNaznachenieSet: TDataSource;
    AccessNaznachenieUserUID: TIntegerField;
    AccessNaznachenieUsersName: TStringField;
    AccessNaznachenieUserAccessMode: TStringField;
    RefreshBtn: TBitBtn;
    ApplyBtn: TBitBtn;
    CloseBtn: TBitBtn;
    ApplyAccessNaznachenieUser: TADODataSet;
    AccessNaznachenieUserMode: TIntegerField;
    procedure RefreshBtnClick(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccessNaznachenieForm: TAccessNaznachenieForm;

implementation

uses Access, ModuleData, sConst;

{$R *.dfm}

procedure TAccessNaznachenieForm.RefreshBtnClick(Sender: TObject);
begin
  AccessNaznachenieUser.Active := False;
  AccessNaznachenieUser.Active := True;
end;

procedure TAccessNaznachenieForm.ApplyBtnClick(Sender: TObject);
var
  Str: string;
begin
Screen.Cursor := crSQLWait;

  Str := AccessNaznachenieUserAccessMode.AsString;
  AccessNaznachenieUserMode.AsInteger := AccessNaznachenieGrid.Columns[2].PickList.IndexOf(Str);
  ApplyAccessNaznachenieUser.Active := False;
  ApplyAccessNaznachenieUser.CommandText := Format(SSQLUpdNaznachenieUserAccess, [AppData.User.FieldByName('UID').AsInteger,
                                                                                  AccessNaznachenieUser.FieldByName('UID').AsInteger,
                                                                                  AccessNaznachenieUserMode.AsInteger]);
  ApplyAccessNaznachenieUser.Active := True;
Screen.Cursor := crDefault;
end;

procedure TAccessNaznachenieForm.CloseBtnClick(Sender: TObject);
begin
  Close();
end;

end.
