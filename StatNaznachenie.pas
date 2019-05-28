unit StatNaznachenie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ExtCtrls;

type
  TNaznachenieDialog = class(TForm)
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    NaznachenieEdit: TEdit;
    AddBtn: TBitBtn;
    procedure AddBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NaznachenieDialog: TNaznachenieDialog;

implementation

uses ModuleData, sConst, Globals;

{$R *.dfm}

procedure TNaznachenieDialog.AddBtnClick(Sender: TObject);
begin
    if  Length(Trim(NaznachenieEdit.Text)) <> 0 Then
       ModalResult := mrOK
    else
       MessageBox(Handle, PChar('Не введена статья назначения'), PChar('Новая статья назначения'), MB_ICONSTOP+MB_OK);
end;

end.
