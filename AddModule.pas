unit AddModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ExtCtrls;

type
  TAddModuleForm = class(TForm)
    GroupBox1: TGroupBox;
    AddModule: TADODataSet;
    CorrModule: TADODataSet;
    Bevel1: TBevel;
    ModuleEdit: TEdit;
    AddModuleBtn: TBitBtn;
    procedure AddModuleBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddModuleForm: TAddModuleForm;

implementation

uses ModuleData, Module, Globals, sConst;

{$R *.dfm}

procedure TAddModuleForm.AddModuleBtnClick(Sender: TObject);
begin
  if TypeModule = g_CreateDoc then
  begin
   if Trim(ModuleEdit.Text) <> EmptyStr then
   Begin
      AddModule.Active := False;
      AddModule.CommandText := Format (SSQLAddModule, [Trim(ModuleEdit.Text)]);
      AddModule.Active := True;

     ModuleForm.Module.Active := False;
     ModuleForm.Module.Active := True;
     Close;
   end;
  end
  else
  if TypeModule = g_CorrDoc then
  begin
   if Trim(ModuleEdit.Text) <> EmptyStr then
   Begin
    CorrModule.Active := False;
    CorrModule.CommandText := Format(SSQLCorrModule, [ModuleForm.Module.FieldByName('UID').AsInteger ,
                                                      Trim(ModuleEdit.Text)]);
     CorrModule.Active := True;
     ModuleForm.Module.Active := False;
     ModuleForm.Module.Active := True;
     Close;
   end;
 end;
end;

end.
