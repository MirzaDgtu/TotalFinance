unit AddTypeEnergy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TAddTypeEnergyForm = class(TForm)
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    TypeEnergyEdit: TEdit;
    TypeEnergyBtn: TBitBtn;
    TypeEnergyResourseSet: TADODataSet;
    procedure TypeEnergyBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TypeEnergyEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddTypeEnergyForm: TAddTypeEnergyForm;

implementation

uses ModuleData, TypeEnergy, sConst, Globals;

{$R *.dfm}

procedure TAddTypeEnergyForm.TypeEnergyBtnClick(Sender: TObject);
begin
  case g_SaveTypeEnergy of
    0: Begin
          TypeEnergyResourseSet.Active := False;
          TypeEnergyResourseSet.CommandText := Format(SSQLCreateTypeEnergy, [TypeEnergyEdit.Text,
                                                                             i_ReserveWithNo]);
          TypeEnergyResourseSet.Active := True;
       end;
    1: Begin
          TypeEnergyResourseSet.Active := False;
          TypeEnergyResourseSet.CommandText := Format(SSQLCorrTypeEnergy, [ AppData.TypeEnergySet.FieldByName('UID').AsInteger,
                                                                            TypeEnergyEdit.Text]);
          TypeEnergyResourseSet.Active := True;
       end;
  end;

  MessageBox(Handle, PChar('Статья успешно сохранена!'), PChar('Виды энергии'), MB_ICONINFORMATION+MB_OK);
  TypeEnergyForm.BarInfo();
  Close();
end;

procedure TAddTypeEnergyForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TypeEnergyEdit.Text := EmptyStr;
  TypeEnergyResourseSet.Active := False;
end;

procedure TAddTypeEnergyForm.TypeEnergyEditChange(Sender: TObject);
begin
  if Trim(TypeEnergyEdit.Text) <> EmptyStr then
      TypeEnergyBtn.Default := True;
end;

end.
