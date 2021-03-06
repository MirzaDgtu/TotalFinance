unit Range;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TRangeForm = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    BeginPicker: TDateTimePicker;
    EndPicker: TDateTimePicker;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    procedure CancelBtnClick(Sender: TObject);
    procedure BeginPickerKeyPress(Sender: TObject; var Key: Char);
    procedure OkBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure RangeRefreshGrid(TabIndex: integer);
  public
    { Public declarations }
  end;

var
  RangeForm: TRangeForm;

implementation

uses Main, sConst, Globals;

{$R *.dfm}

procedure TRangeForm.CancelBtnClick(Sender: TObject);
begin
  Close();
end;

procedure TRangeForm.BeginPickerKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close();
end;

procedure TRangeForm.RangeRefreshGrid(TabIndex: integer);
begin

  Case TabIndex of
    TAB_Income:               Begin
                                Screen.Cursor := crSQLWait;
                                MainForm.ReestrIncome.Active := False;
                                MainForm.ReestrIncome.CommandText := Format(SSQLGetReestrincome, [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                                  FormatDateTime('yyyy-mm-dd', EndPicker.Date)]);
                                MainForm.ReestrIncome.Active := True;
                                MainForm.IncomeDifference(BeginPicker.Date, EndPicker.Date);
                                MainForm.BarCalc(TAB_Income);
                                Screen.Cursor := crDefault;
                              end;

    TAB_Expense:              Begin
                                Screen.Cursor := crSQLWait;
                                MainForm.ReestrExpense.Active := False;
                                MainForm.ReestrExpense.CommandText := Format(SSQLGetReestrExpense, [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                           FormatDateTime('yyyy-mm-dd', EndPicker.Date)]);
                                MainForm.ReestrExpense.Active := True;
                                MainForm.BarCalc(TAB_Expense);
                                Screen.Cursor := crDefault;
                              end;

    TAB_ExpenseZP:            Begin
                                Screen.Cursor := crSQLWait;
                                MainForm.ReestrExpenseZP.Active := False;
                                MainForm.ReestrExpenseZP.CommandText := Format(SSQLGetReestrExpenseZP, [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                           FormatDateTime('yyyy-mm-dd', EndPicker.Date)]);
                                MainForm.ReestrExpenseZP.Active := True;
                                MainForm.BarCalc(TAB_ExpenseZP);
                                Screen.Cursor := crDefault;
                              end;

    TAB_ExpenseOther:         Begin
                                Screen.Cursor := crSQLWait;
                                MainForm.ReestrExpenseOther.Active := False;
                                MainForm.ReestrExpenseOther.CommandText := Format(SSQLGetReestrExpenseOther, [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                                              FormatDateTime('yyyy-mm-dd', EndPicker.Date)]);;
                                MainForm.ReestrExpenseOther.Active := True;
                                MainForm.BarCalc(TAB_ExpenseOther);
                                Screen.Cursor := crDefault;
                              end;

    TAB_ZpAup:                Begin
                                Screen.Cursor := crSQLWait;
                                MainForm.ReestrZpAup.Active := False;
                                MainForm.ReestrZpAup.CommandText       :=  Format(SSQLGetReestrZpAUP, [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                                       FormatDateTime('yyyy-mm-dd', EndPicker.Date)]);
                                MainForm.ReestrZpAup.Active := True;
                                MainForm.BarCalc(TAB_ZpAup);
                                Screen.Cursor := crDefault;
                              end;

    TAB_TaxToZp:              Begin
                                Screen.Cursor := crSQLWait;
                                MainForm.ReestrTaxToZp.Active := False;
                                MainForm.ReestrTaxToZp.CommandText      := Format(SSQLGetReestrTaxToZp, [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                                          FormatDateTime('yyyy-mm-dd',EndPicker.Date)]);
                                MainForm.ReestrTaxToZp.Active := True;
                                MainForm.BarCalc(TAB_TaxToZp);
                                Screen.Cursor := crDefault;
                              end;

    TAB_PercentOfTerminal:    Begin
                                Screen.Cursor := crSQLWait;
                                MainForm.ReestrPercentOfTerminal.Active := False;
                                MainForm.ReestrPercentOfTerminal.CommandText   := Format(SSQLGetReestrPercentOfTerminal, [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                                                          FormatDateTime('yyyy-mm-dd',EndPicker.Date)]);
                                MainForm.ReestrPercentOfTerminal.Active := True;
                                MainForm.BarCalc(TAB_PercentOfTerminal);
                                Screen.Cursor := crDefault;
                              end;

    TAB_ShipmentVostok:       Begin
                                Screen.Cursor := crSQLWait;
                                MainForm.ReestrShipmentVostok.Active := False;
                                MainForm.ReestrShipmentVostok.CommandText      := Format(SSQLGetReestrShipmentVostok,    [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                                                          FormatDateTime('yyyy-mm-dd',EndPicker.Date)]);
                                MainForm.ReestrShipmentVostok.Active := True;
                                MainForm.BarCalc(TAB_ShipmentVostok);
                                Screen.Cursor := crDefault;
                              end;

    TAB_ShipmentOther:        Begin
                                Screen.Cursor := crSQLWait;
                                MainForm.ReestrShipmentOther.Active := False;
                                MainForm.ReestrShipmentOther.CommandText := Format(SSQLGetReestrShipmentOther,           [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                                                          FormatDateTime('yyyy-mm-dd',EndPicker.Date)]);
                                MainForm.ReestrShipmentOther.Active := True;
                                MainForm.BarCalc(TAB_ShipmentOther);
                                Screen.Cursor := crDefault;
                              end;

    TAB_Offs:                 Begin
                                Screen.Cursor := crSQLWait;
                                MainForm.ReestrOffs.Active := False;
                                MainForm.ReestrOffs.CommandText :=  Format(SSQLGetReestrOffs,                            [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                                                          FormatDateTime('yyyy-mm-dd', EndPicker.Date)]);
                                MainForm.ReestrOffs.Active := True;
                                MainForm.BarCalc(TAB_Offs);
                                Screen.Cursor := crDefault;
                              end;

    TAB_PublicUtilities:      Begin
                                Screen.Cursor := crSQLWait;
                                MainForm.ReestrPublicUtilities.Active := False;
                                MainForm.ReestrPublicUtilities.CommandText  :=  Format(SSQLGetReestrPublicUtilities, [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                                                      FormatDateTime('yyyy-mm-dd', EndPicker.Date)]);
                                MainForm.ReestrPublicUtilities.Active := True;
                                MainForm.BarCalc(TAB_PublicUtilities);
                                Screen.Cursor := crDefault;
                              end;

    TAB_Return:               Begin
                                Screen.Cursor := crSQLWait;
                                 MainForm.ReestrReturn.Active := False;
                                 MainForm.ReestrReturn.CommandText :=  Format(SSQLGetReestrReturn,                            [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                                                             FormatDateTime('yyyy-mm-dd',EndPicker.Date)]);
                                 MainForm.ReestrReturn.Active := True;
                                 MainForm.BarCalc(TAB_Return);
                                Screen.Cursor := crDefault;
                              end;

    TAB_ENVD:                 Begin
                                Screen.Cursor := crSQLWait;
                                 MainForm.ReestrENVD.Active := False;
                                 MainForm.ReestrENVD.CommandText  := Format(SSQLGetReestrEnvd,    [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                                    FormatDateTime('yyyy-mm-dd', EndPicker.Date)]);
                                 MainForm.ReestrENVD.Active := True;
                                 MainForm.BarCalc(TAB_ENVD);
                                Screen.Cursor := crDefault;
                              end;

    TAB_IncomeCash:           Begin
                                Screen.Cursor := crSQLWait;
                                MainForm.ReestrIncomeCash.Active := False;
                                MainForm.ReestrIncomeCash.CommandText := Format(SSQLGetReestrIncomeCach, [FormatDateTime('yyyy-mm-dd', BeginPicker.Date),
                                                                                                          FormatDateTime('yyyy-mm-dd', EndPicker.Date)]);
                                MainForm.ReestrIncomeCash.Active := True;
                                MainForm.BarCalc(TAB_IncomeCash);
                                Screen.Cursor := crDefault;
                              end;
  end;

    f_GetDate := 1;
    MainForm.BarRange();
    Close();
end;

procedure TRangeForm.OkBtnClick(Sender: TObject);
begin
  if BeginPicker.Date > EndPicker.Date then
      Begin
          MessageBox(Handle, PChar('��������� ���� ������ ��������'), PChar('������'), MB_ICONWARNING+MB_OK);
          BeginPicker.Date := Now();
      end
  else
           RangeRefreshGrid(RangeTabIndex);
end;

procedure TRangeForm.FormCreate(Sender: TObject);
begin
    BeginPicker.Date := Now();
    EndPicker.Date := BeginPicker.Date + 1;
end;

end.
