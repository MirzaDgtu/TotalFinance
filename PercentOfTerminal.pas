unit PercentOfTerminal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, ComCtrls, StdCtrls, Buttons, ExtCtrls, ComObj;

type
  TPercentOfTerminalForm = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    NumDocEdit: TEdit;
    PercentOfTerminalPicker: TDateTimePicker;
    PrimechEdit: TEdit;
    Panel2: TPanel;
    SaveBtn: TBitBtn;
    AddBtn: TBitBtn;
    DeleteRowBtn: TBitBtn;
    PrintBtn: TBitBtn;
    Bar: TStatusBar;
    PercentOfTerminalStringGrid: TStringGrid;
    PopupPercentOfTerminalMenu: TPopupMenu;
    AddPop: TMenuItem;
    DelPop: TMenuItem;
    SavePercentOfTerminalPopup: TPopupMenu;
    SavePop: TMenuItem;
    SaveNoPop: TMenuItem;
    procedure PercentOfTerminalStringGridKeyPress(Sender: TObject;
      var Key: Char);
    procedure PercentOfTerminalStringGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure SaveBtnClick(Sender: TObject);
    procedure DeleteRowBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure SaveNoPopClick(Sender: TObject);
    procedure SavePopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PrintBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure  DeleteRow(StringGrid: TStringGrid; ARow: Integer);
    procedure  SaveNewPercentOfTerminalDoc;
    procedure  SaveCorrPercentOfTerminalDoc;
    function   CalcValueCellsVB(StringCalc: string): string;    
  public
    { Public declarations }
    procedure SettingPercentOfTerminal(TypePreview:integer);
  end;

var
  PercentOfTerminalForm: TPercentOfTerminalForm;

implementation

uses ModuleData, Main, Globals, sConst, Shop;

{$R *.dfm}

procedure TPercentOfTerminalForm.DeleteRow(StringGrid: TStringGrid;
  ARow: Integer);
var i, j: Integer;
begin
  with PercentOfTerminalStringGrid do
  begin
    for i:=ARow+1 to RowCount-1 do
      for j:=0 to ColCount-1 do
        Cells[j, i-1]:=Cells[j, i];
    for i:=1 to ColCount-1 do
      Cells[i, RowCount-1]:='';
    RowCount:=RowCount-1;
  end;
end;

procedure TPercentOfTerminalForm.PercentOfTerminalStringGridKeyPress(
  Sender: TObject; var Key: Char);
var
  vrPos, vrLength: byte;
begin
    with Sender as TStringGrid do
        Begin
         vrLength := Length(Cells[Col, Row]);
         vrPos := Pos(',',Cells[Col,Row]);

          if Col = 4 then
          Begin
        //  ����������� �� ���������� ��������
            case Key of
              '0'..'9','+','-','*','/':  ;
              '=':  Begin
                      if Pos('=', Cells[Col, Row]) > 0 then
                          Key := #0;
                    end;
              '.',',' :  {Begin
                            if (vrPos >0) or (vrLength = 0) then
                               Key := #0
                            else
                               Key := DecimalSeparator;
                         end};
              #8      :  ;
              // ��� ESC ����� ������������ Ctrl+z
              #27     : begin
                          keybd_event(VK_LCONTROL, 0, 0, 0);               // ������� ������� Ctrl
                          keybd_event(Ord('Z'), 0, 0, 0);                  // ������� ������� Z
                          keybd_event(Ord('Z'), 0, KEYEVENTF_KEYUP, 0);    // ���������� ������� Ctrl
                          keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0); // ���������� ������� Z
                        end;
              #26     :  ;
              #13     :  Begin
                           with Sender as TStringGrid do
                           Begin
                              if PercentOfTerminalStringGrid.Col = 4 then
                                Begin
                                  try
                                    if Pos('=', Cells[Col, Row]) <> 0 then
                                       PercentOfTerminalStringGrid.Cells[Col, Row] :=  CalcValueCellsVB(PercentOfTerminalStringGrid.Cells[Col, Row]);
                                  except
                                    MessageBox(Handle, PChar('������� ������������ ������!'), PChar(PercentOfTerminalForm.Caption), MB_ICONERROR+MB_OK);
                                  end;
                                end;
                           end;
                         end;
              else
              Key := chr(0);
             end;
          end;
    end;
end;

procedure TPercentOfTerminalForm.PercentOfTerminalStringGridSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  If TypeSavePercent <> g_Preview then
    Begin
      If ACol in [4,5] then
        PercentOfTerminalStringGrid.Options := PercentOfTerminalStringGrid.Options  + [goEditing]
      else
        PercentOfTerminalStringGrid.Options := PercentOfTerminalStringGrid.Options  - [goEditing];
    end;
end;

procedure TPercentOfTerminalForm.SaveBtnClick(Sender: TObject);
begin
    SavePercentOfTerminalPopup.Popup(SaveBtn.ClientOrigin.X, SaveBtn.ClientOrigin.Y);
end;

procedure TPercentOfTerminalForm.DeleteRowBtnClick(Sender: TObject);
var
    i:integer;
begin
      if PercentOfTerminalStringGrid.Row <> 0 then
       Begin
         DeleteRow(PercentOfTerminalStringGrid, PercentOfTerminalStringGrid.Row);
         For i:= 1 to PercentOfTerminalStringGrid.RowCount do
            PercentOfTerminalStringGrid.Cells[0,i] := IntToStr(i);
         PercentOfTerminalStringGrid.Cells[0,0] := 'NN';
       end
      else
         Exit;
end;

procedure TPercentOfTerminalForm.SettingPercentOfTerminal(
  TypePreview: integer);
var
    i: integer;
begin

   case TypePreview of
     g_CreateDoc : Begin
                      with PercentOfTerminalStringGrid do
                        Begin
                          ColCount := 6;
                          Cells[0,0] := 'NN';
                          Cells[1,0] := '���';
                          Cells[2,0] := '��������';
                          Cells[3,0] := '�����';
                          Cells[4,0] := '����� (������)';
                          Cells[5,0] := '����������';

                          ColWidths[0] := 25;
                          ColWidths[1] := 50;
                          ColWidths[2] := 110;
                          ColWidths[3] := 165;
                          ColWidths[4] := 100;
                          ColWidths[5] := 115;
                        End;

                      Caption := '������� �� ��������� -> �������';
                      NumDocEdit.Text := EmptyStr;
                      PrimechEdit.Text := EmptyStr;
                      PercentOfTerminalPicker.Date := Now();

                        // ������
                      SaveBtn.Enabled := True;
                      AddBtn.Enabled := True;
                      DeleteRowBtn.Enabled := True;
                      PrintBtn.Enabled := False;
                      // ������� ������
                      PrimechEdit.Enabled := True;
                      PercentOfTerminalPicker.Enabled := True;

                      // ����� ����
                      SavePop.Enabled := True;
                      SaveNoPop.Enabled := True;
                      AddPop.Enabled := True;
                      DeleteRowBtn.Enabled := True;

                   end;

     g_CorrDoc : Begin
                      with PercentOfTerminalStringGrid do
                        Begin
                          ColCount := 6;
                          Cells[0,0] := 'NN';
                          Cells[1,0] := '���';
                          Cells[2,0] := '��������';
                          Cells[3,0] := '�����';
                          Cells[4,0] := '����� (������)';
                          Cells[5,0] := '����������';

                          ColWidths[0] := 25;
                          ColWidths[1] := 50;
                          ColWidths[2] := 110;
                          ColWidths[3] := 165;
                          ColWidths[4] := 100;
                          ColWidths[5] := 115;
                        End;

                      Caption := '������� �� ��������� -> �������������';

                        // ������
                      SaveBtn.Enabled := True;
                      AddBtn.Enabled := True;
                      DeleteRowBtn.Enabled := True;
                      PrintBtn.Enabled := True;

                      // ������� ������
                      PrimechEdit.Enabled := True;
                      PercentOfTerminalPicker.Enabled := True;

                      // ����� ����
                      SavePop.Enabled := True;
                      SaveNoPop.Enabled := True;
                      AddPop.Enabled := True;
                      DeleteRowBtn.Enabled := True;
                   end;

       g_Preview : Begin
                      with PercentOfTerminalStringGrid do
                        Begin
                          ColCount := 6;
                          Cells[0,0] := 'NN';
                          Cells[1,0] := '���';
                          Cells[2,0] := '��������';
                          Cells[3,0] := '�����';
                          Cells[4,0] := '����� (������)';
                          Cells[5,0] := '����������';

                          ColWidths[0] := 25;
                          ColWidths[1] := 50;
                          ColWidths[2] := 110;
                          ColWidths[3] := 165;
                          ColWidths[4] := 100;
                          ColWidths[5] := 115;
                        End;

                      Caption := '������� �� ��������� -> ��������';

                        // ������
                      SaveBtn.Enabled := False;
                      AddBtn.Enabled := False;
                      DeleteRowBtn.Enabled := False;
                      PrintBtn.Enabled := True;

                      // ������� ������
                      PrimechEdit.Enabled := False;
                      PercentOfTerminalPicker.Enabled := False;

                      // ����� ����
                      SavePop.Enabled := False;
                      SaveNoPop.Enabled := False;
                      AddPop.Enabled := False;
                      DeleteRowBtn.Enabled := False;

                   end;
   end;


   For i := 0 to PercentOfTerminalStringGrid.RowCount - 1 do
         PercentOfTerminalStringGrid.RowHeights[i] := 20;

end;

//
procedure TPercentOfTerminalForm.SaveNewPercentOfTerminalDoc;
var
    I: integer;
    Sum_Not_Nal: real;
begin

 Sum_Not_Nal := 0;

 // ����� ����� ��������� (������� �� ���������)
 for i := 1 to PercentOfTerminalStringGrid.RowCount-1 do
  Begin
    if PercentOfTerminalStringGrid.Cells[4,i] <> EmptyStr then
        Sum_Not_Nal := Sum_Not_Nal +  StrToFloat(StringReplace(PercentOfTerminalStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
  end;

  // ���������� ����� ��������� (������� �� ���������)
  AppData.PercentOfTerminalHeadDoc.Active := False;
  AppData.PercentOfTerminalHeadDoc.CommandText := Format(SSQLCreatePercentOfTerminalHead, [FormatDateTime('yyyy-mm-dd', PercentOfTerminalPicker.Date),
                                                                                            PrimechEdit.Text,
                                                                                            g_User,
                                                                                            StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase])]);
  AppData.PercentOfTerminalHeadDoc.Active := True;

  AppData.MaxUnicumNumPercentOfTerminal.Active := False;
  AppData.MaxUnicumNumPercentOfTerminal.Active := True;

  //���������� ��������� ��������� (������� �� ���������)
  For i:= 1 to PercentOfTerminalStringGrid.RowCount - 1 do
  Begin
    AppData.PercentOfTerminalDetail.Active := False;
    AppData.PercentOfTerminalDetail.CommandText := Format(SSQLCreatePercentOfTerminalDocDetail, [AppData.MaxUnicumNumPercentOfTerminal.FieldByName('UNICUM_NUM').AsInteger,
                                                                            AppData.MaxUnicumNumPercentOfTerminal.FieldByName('NUMDOC').AsInteger,
                                                                            FormatDateTime('yyyy-mm-dd', PercentOfTerminalPicker.Date),
                                                                            StrToInt(PercentOfTerminalStringGrid.Cells[0,i]),
                                                                            StrToInt(PercentOfTerminalStringGrid.Cells[1,i]),
                                                                            StringReplace(PercentOfTerminalStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                            g_User,
                                                                            PercentOfTerminalStringGrid.Cells[5,i]]);
    AppData.PercentOfTerminalDetail.Active := True;
  end;
end;


// ���������� ������������������� ��������� (�������� �� ���������)
procedure TPercentOfTerminalForm.SaveCorrPercentOfTerminalDoc;
var
    I: integer;
    Sum_Not_Nal: real;
begin

 Sum_Not_Nal := 0;

 // ����� ����� ��������� (�������� �� ���������)
 for i := 1 to PercentOfTerminalStringGrid.RowCount-1 do
  Begin
    if PercentOfTerminalStringGrid.Cells[4,i] <> EmptyStr then
      Sum_Not_Nal := Sum_Not_Nal +  StrToFloat(StringReplace(PercentOfTerminalStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
  end;

  // �������� ��������� (�������� �� ���������)
  AppData.DeletePercentOfTerminalDoc.Active := False;
  AppData.DeletePercentOfTerminalDoc.CommandText := Format(SSQLDeletePercentOfTerminalDocum, [MainForm.ReestrPercentOfTerminal.FieldByName('UNICUM_NUM').AsInteger]);
  AppData.DeletePercentOfTerminalDoc.Active := True;


  // ���������� ����� ��������� (�������� �� ���������)
  AppData.CorrPercentOfTerminalH.Active := False;
  AppData.CorrPercentOfTerminalH.CommandText := Format(SSQLCorrPercentOfTerminalDoc_h,   [StrToInt(NumDocEdit.Text),
                                                                                          FormatDateTime('yyyy-mm-dd', PercentOfTerminalPicker.Date),
                                                                                          MainForm.ReestrPercentOfTerminal.FieldByName('FAMILY').AsString,
                                                                                          FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz', MainForm.ReestrPercentOfTerminal.FieldByName('CREATE_DATE').AsDateTime),
                                                                                          StringReplace(FloatToStr(Sum_Not_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                          g_User,
                                                                                          PrimechEdit.Text]);
  AppData.CorrPercentOfTerminalH.Active := True;


  AppData.MaxUnicumNumPercentOfTerminal.Active := False;
  AppData.MaxUnicumNumPercentOfTerminal.Active := True;


  //���������� ��������� ��������� (������� �� ���������)
  For i:= 1 to PercentOfTerminalStringGrid.RowCount - 1 do
  Begin
    AppData.PercentOfTerminalDetail.Active := False;
    AppData.PercentOfTerminalDetail.CommandText := Format(SSQLCreatePercentOfTerminalDocDetail, [AppData.MaxUnicumNumPercentOfTerminal.FieldByName('UNICUM_NUM').AsInteger,
                                                                                                 AppData.MaxUnicumNumPercentOfTerminal.FieldByName('NUMDOC').AsInteger,
                                                                                                 FormatDateTime('yyyy-mm-dd', PercentOfTerminalPicker.Date),
                                                                                                 StrToInt(PercentOfTerminalStringGrid.Cells[0,i]),
                                                                                                 StrToInt(PercentOfTerminalStringGrid.Cells[1,i]),
                                                                                                 StringReplace(PercentOfTerminalStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                                 g_User,
                                                                                                 PercentOfTerminalStringGrid.Cells[5,i]]);
    AppData.PercentOfTerminalDetail.Active := True;
  end;

end;



procedure TPercentOfTerminalForm.AddBtnClick(Sender: TObject);
begin
  fl_ShopInDoc := 6;
  ShopForm.SettingShopForm(1);
  ShopForm.ShowModal();
end;

procedure TPercentOfTerminalForm.SaveNoPopClick(Sender: TObject);
begin
  Close();
end;

procedure TPercentOfTerminalForm.SavePopClick(Sender: TObject);
begin
  case TypeSavePercent of
    g_CreateDoc:    SaveNewPercentOfTerminalDoc();
    g_CorrDoc:      SaveCorrPercentOfTerminalDoc();
  end;

  MessageBox(Handle,PChar('�������� % �� ��������� ������� ��������!'),PChar('�������� % �� ���������'), MB_ICONINFORMATION+MB_OK);
  MainForm.Tabs.TabIndex := TAB_PercentOfTerminal;
  MainForm.ReestrPercentOfTerminal.Active :=  False;
  MainForm.ReestrPercentOfTerminal.Active :=  True;
  MainForm.BarCalc(TAB_PercentOfTerminal);
  Close();
end;

procedure TPercentOfTerminalForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if TypeSavePercent = g_CorrDoc then
      Begin
        AppData.AdoCmd.CommandText := Format(SSQLUpdatePercentOfTerminalStatusCorrDoc, [Appdata.GetPercentOfTerminalDetail.FieldByName('UNICUM_NUM').AsInteger, 0]);
        AppData.AdoCmd.Execute;
      end;
end;

procedure TPercentOfTerminalForm.PrintBtnClick(Sender: TObject);
begin
    AppData.Report.Template := SPercentOfTerminalTotalDoc;
    AppData.Report.Run;
end;

function TPercentOfTerminalForm.CalcValueCellsVB(
  StringCalc: string): string;
var
    msc: Variant;
begin
  msc := CreateOleObject('MSScriptControl.ScriptControl');

  try
      msc.Language := 'VBScript';
Result := msc.Eval(Copy(StringReplace(StringCalc, ',', '.', [rfReplaceAll, rfIgnoreCase]), 2, Length(StringCalc)));
  finally
      FreeAndNil(msc);
  end;
end;

end.
