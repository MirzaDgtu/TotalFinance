unit AddShop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TAddShopForm = class(TForm)
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Bevel1: TBevel;
    NameShopEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    KppEdit: TEdit;
    InnEdit: TEdit;
    AdressShopEdit: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure OkBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddShopForm: TAddShopForm;

implementation

uses ModuleData, sConst;

{$R *.dfm}

procedure TAddShopForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case KEY of
    #27 : Close();
  end;
end;
procedure TAddShopForm.OkBtnClick(Sender: TObject);
begin
    if Length(Trim(NameShopEdit.Text)) <> 0 then
      ModalResult := mrOk
  else
      MessageBox(Handle, PChar('Введите наименование магазина!'), PChar('Добавить магазин'), MB_ICONERROR+MB_OK);
end;

end.
