unit AddSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TAddSupplierForm = class(TForm)
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    SupplierEdit: TEdit;
    AddSupplierBtn: TBitBtn;
    procedure AddSupplierBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddSupplierForm: TAddSupplierForm;

implementation

uses ModuleData, Supplier, Globals, sConst;

{$R *.dfm}


procedure TAddSupplierForm.AddSupplierBtnClick(Sender: TObject);
begin
  if Length(Trim(SupplierEdit.Text)) <> 0 then
     Begin
       ModalResult := mrOk;
       AddSupplierBtn.Default := True;
     end
  else
     MessageBox(Handle, PChar('Введите имя поставщика'), PChar('Новый поставщик'), MB_ICONINFORMATION+MB_OK);
end;

end.
