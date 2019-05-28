unit CreateDocument;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ComCtrls, ExtCtrls, Menus;

type
  TCreateDocmentForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    N_Plat_PorEdit: TEdit;
    DateTimePicker1: TDateTimePicker;
    StatusBar1: TStatusBar;
    DetailStringGrid: TStringGrid;
    SaveBtn: TBitBtn;
    PopMenuSave: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DetailStringGridSetting;
  end;

var
  CreateDocmentForm: TCreateDocmentForm;

implementation

uses Main;

{$R *.dfm}

procedure TCreateDocmentForm.DetailStringGridSetting;
var
    i:integer;
begin
  with DetailStringGrid do
    Begin
      ColWidths[0] := 20;
      ColWidths[1] := 100;
      ColWidths[2] := 300;
      ColWidths[3] := 100;
      ColWidths[4] := 100;

      Cells[0,0] := 'NN';
      Cells[1,0] := 'Магазин';
      Cells[2,0] := 'Адрес';
      Cells[3,0] := 'Наличные с-ва';
      Cells[4,0] := 'Безналичные с-ва';
    End;
  for i := 0 to DetailStringGrid.RowCount-1 do
    begin
      DetailStringGrid.RowHeights[i] := 20;
    end;
end;

procedure TCreateDocmentForm.FormActivate(Sender: TObject);
begin
  DetailStringGridSetting();
end;

procedure TCreateDocmentForm.SaveBtnClick(Sender: TObject);
begin
  PopMenuSave.Popup(DetailStringGrid.ClientOrigin.X, DetailStringGrid.ClientOrigin.Y);
end;

end.
