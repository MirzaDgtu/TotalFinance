unit Module;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TModuleForm = class(TForm)
    Bar: TStatusBar;
    Panel1: TPanel;
    ModuleGrid: TDBGrid;
    Module: TADODataSet;
    Bevel1: TBevel;
    AddBtn: TBitBtn;
    ChangeBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    RefreshBtn: TBitBtn;
    ModuleUID: TIntegerField;
    ModuleNAME: TStringField;
    DS_Module: TDataSource;
    DeleteModule: TADODataSet;
    DeleteModuleRes: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure ChangeBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure ModuleBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModuleForm: TModuleForm;
  TypeModule: integer;
  

implementation

uses Main, ModuleData, sConst, AddModule, Globals;

{$R *.dfm}

procedure TModuleForm.FormCreate(Sender: TObject);
begin
  Module.Active := False;
  Module.Active := True;
end;

procedure TModuleForm.DeleteBtnClick(Sender: TObject);
var
  QModule, QDelModule: Word;

begin
QDelModule := MessageBox(Handle,PChar('�� ������������� ������� ������� ���� ������?'),PChar('�������� ���������'), MB_ICONINFORMATION+MB_YESNO);
if QDelModule = IDYES then
begin
  DeleteModule.Active := False;
  DeleteModule.CommandText := Format (SSQLDeleteModule, [Module.FieldByName('UID').AsInteger]);
  DeleteModule.Active := True;

  if DeleteModule.FieldByName('Res').AsInteger = 0 then
    QModule := MessageBox(Handle, PChar('������ ������!'), PChar('�������� ������'), MB_ICONINFORMATION+MB_OK)
  else
  if DeleteModule.FieldByName('Res').AsInteger = 1 then
    QModule := MessageBox(Handle, PChar('�������� ������ ���������, �.�. �� �������� � ������������!'), PChar('�������� ������'), MB_ICONINFORMATION+MB_OK);
end
else
  Exit;

  Module.Active := False;
  Module.Active := True;
end;

procedure TModuleForm.AddBtnClick(Sender: TObject);
begin
 TypeModule :=  g_CreateDoc;

 with TAddModuleForm.Create(Application) do
    Begin
        try
            Caption := '��������';
            ShowModal();
        except
            FreeAndNil(AddModuleForm);
        end;
    end;
end;

procedure TModuleForm.ChangeBtnClick(Sender: TObject);
begin
  TypeModule := g_CorrDoc;

  with TAddModuleForm.Create(Application) do
    Begin
       try
          ModuleEdit.Text := Module.FieldByName('Name').AsString;
          AddModuleBtn.Caption := '��������';
          ShowModal();
       except
          FreeAndNil(AddModuleForm);
       end;
    end;
end;

procedure TModuleForm.RefreshBtnClick(Sender: TObject);
begin
  Module.Active := False;
  Module.Active := True;
end;

procedure TModuleForm.ModuleBeforeOpen(DataSet: TDataSet);
begin
    Module.CommandText := SSQlGetModule;
end;

end.
