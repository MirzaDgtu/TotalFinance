unit AddStateBuh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls;

type
  TAddStateBuhForm = class(TForm)
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    StateEdit: TEdit;
    AddBtn: TBitBtn;
    AddState: TADODataSet;
    CorrState: TADODataSet;
    procedure AddBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure SaveStateBuh(TypeSave: Byte);
  public
    { Public declarations }
  end;

var
  AddStateBuhForm: TAddStateBuhForm;

implementation

uses Globals, sConst, StateBuh, ModuleData;

{$R *.dfm}

{ TAddStateBuhForm }

// Сохранение новой (откорректированной) статьи
procedure TAddStateBuhForm.SaveStateBuh(TypeSave: Byte);
begin
  case TypeSave of
    g_CreateDoc:  Begin
                     Screen.Cursor := crSQLWait;
                     AddState.Active := False;
                     AddState.CommandText := Format(SSQLCreateStateBuh, [Trim(StateEdit.Text)]);
                     AddState.Active := True;
                     Screen.Cursor := crDefault;
                     MessageBox(Handle, PChar('Новая статья успешно создана!'), PChar('Добавление статьи'), MB_ICONINFORMATION+MB_OK);
                  end;

    g_CorrDoc:    Begin
                     Screen.Cursor := crSQLWait;
                     CorrState.Active := False;
                     CorrState.CommandText := Format(SSQLCorrStateBuh, [AppData.StateBuh.FieldByName('UID').AsInteger,
                                                                        Trim(StateEdit.Text)]);
                     CorrState.Active := True;
                     Screen.Cursor := crDefault;
                     MessageBox(Handle, PChar('Статья успешно откорректирована!'), PChar('Коррекция статьи'), MB_ICONINFORMATION+MB_OK);
                  end;
  end;
end;

procedure TAddStateBuhForm.AddBtnClick(Sender: TObject);
begin
   SaveStateBuh(TypeSaveState);
   StateBuhForm.ResreshStateBuh();
   Close();
end;

end.
