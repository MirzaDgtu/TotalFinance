 unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TLoginDlg = class(TForm)
    Bevel1: TBevel;
    NameEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    PasswordEdit: TEdit;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label3: TLabel;
    ServerEdit: TEdit;
    procedure NameEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginDlg: TLoginDlg;
  hLogin: THandle;

function RegisterUser(var User, Password, Server: string): Boolean;

implementation

uses  Globals,  SConst, ModuleData, Main;

{$R *.dfm}

function RegisterUser(var User, Password, Server: string): Boolean;
begin
  with TLoginDlg.Create(Application) do
  try
    hLogin := Handle;
    ServerEdit.Text := Server;
    NameEdit.Text := User;
    Result := ShowModal() = mrOk;
    if Result then
    begin
      User := NameEdit.Text;
      Password := PasswordEdit.Text;
      Server := ServerEdit.Text;
    end;
  finally
    Free();
  end;
end;

procedure TLoginDlg.NameEditChange(Sender: TObject);
begin
  OkBtn.Enabled := (Length(NameEdit.Text) >= 2) and (Pos(#32, NameEdit.Text) = 0);
end;

end.
