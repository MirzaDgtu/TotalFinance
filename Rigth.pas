unit Rigth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls, Buttons;

type
  TRigthForm = class(TForm)
    GroupBox1: TGroupBox;
    RigthUserGrid: TDBGrid;
    RigthUserSet: TADODataSet;
    DS_RigthUser: TDataSource;
    RigthUserSetUID: TIntegerField;
    RigthUserSetAccessMode: TStringField;
    RigthUserSetName: TStringField;
    Panel1: TPanel;
    RefreshBtn: TBitBtn;
    CancelBtn: TBitBtn;
    RigthUserAccess: TADODataSet;
    ApplyBtn: TBitBtn;
    RigthUserSetMode: TIntegerField;
    procedure ApplyBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RigthForm: TRigthForm;

implementation

uses Module, ModuleData, sConst;

{$R *.dfm}

procedure TRigthForm.ApplyBtnClick(Sender: TObject);
var
    Str: string;
begin
    Screen.Cursor := crSQLWait;
    Str := RigthUserSetAccessMode.AsString;
    RigthUserSetMode.AsInteger := RigthUserGrid.Columns[2].PickList.IndexOf(Str);
    
    RigthUserAccess.Active := False;
    RigthUserAccess.CommandText := Format(SSQLUpdModuleUserAccess, [AppData.User.FieldByName('UID').AsInteger,
                                                                    RigthUserSet.FieldByName('UID').AsInteger,
                                                                    RigthUserSetMode.AsInteger]);
    RigthUserAccess.Active := True;
    Screen.Cursor :=  crDefault;
end;

procedure TRigthForm.CancelBtnClick(Sender: TObject);
begin
  Close();
end;

procedure TRigthForm.RefreshBtnClick(Sender: TObject);
begin
  RigthUserSet.Active := False;
  RigthUserSet.Active := True;
end;

end.
