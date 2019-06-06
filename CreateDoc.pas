unit CreateDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, ExtCtrls, StdCtrls, Buttons, Menus, StrUtils;

type
  TCreateDocumentForm = class(TForm)
    Panel1: TPanel;
    Bar: TStatusBar;
    DetailStringGrid: TStringGrid;
    SaveBtn: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    DateIncomePicker: TDateTimePicker;
    Label2: TLabel;
    NumDocEdit: TEdit;
    PopupGridMenu: TPopupMenu;
    DeletePop: TMenuItem;
    PopupSaveMenu: TPopupMenu;
    SavePop: TMenuItem;
    SaveNoPop: TMenuItem;
    AddPop: TMenuItem;
    AddBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    PrintBtn: TBitBtn;
    Label3: TLabel;
    PrimechEdit: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailStringGridKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure SavePopClick(Sender: TObject);
    procedure SaveNoPopClick(Sender: TObject);
    procedure DetailStringGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure AddBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure DetailStringGridDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }

    FOldSumNalDoc: real;
    FSumNalCashBox: real;
    FNewSumNalDoc: real;
    procedure  DeleteRow(StringGrid: TStringGrid; ARow: Integer);
    procedure  SaveNewIncomeDoc;
    procedure  SaveCorrIncomeDoc;
    function   CalcValueCellsVB(StringCalc: string): string;
    procedure  SetNewSumNalDoc(const Value: real);
    procedure  SetOldSumNalDoc(const Value: real);
    procedure  SetSumNalCashBox(const Value: real);

  public
    { Public declarations }
    
     procedure DetailStringGridSetting(TypeIncomeSetting:integer);
     property  SumNalCashBox: real read FSumNalCashBox write SetSumNalCashBox;
     property  OldSumNalDoc:  real read FOldSumNalDoc  write SetOldSumNalDoc;
     property  NewSumNalDoc:  real read FNewSumNalDoc  write SetNewSumNalDoc;
  end;

var
  CreateDocumentForm: TCreateDocumentForm;
  Sum_Nal, Sum_NotNal: real;

implementation

uses ModuleData, Main, Shop, sConst, Globals, DB, ComObj;

{$R *.dfm}

{ TForm1 }



procedure TCreateDocumentForm.FormActivate(Sender: TObject);
begin
  fl_ShopInDoc := 1;
  DetailStringGrid.SetFocus;
end;

procedure TCreateDocumentForm.SaveBtnClick(Sender: TObject);
begin
  PopupSaveMenu.Popup(SaveBtn.ClientOrigin.X, SaveBtn.ClientOrigin.Y);
end;

procedure TCreateDocumentForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    AppData.AdoCmd.CommandText := Format(SSQLUpdateIncStatusCorrDoc, [MainForm.ReestrIncome.FieldByName('UNICUM_NUM').AsInteger, 0]);
    AppData.AdoCmd.Execute;
end;

procedure TCreateDocumentForm.DetailStringGridKeyPress(Sender: TObject;
  var Key: Char);
var
  vrPos, vrLength: byte;
  TypeCalc: Char;
begin
    with Sender as TStringGrid do
        Begin
         vrLength := Length(Cells[Col, Row]);
         vrPos := Pos(',',Cells[Col,Row]);

          if (Col = 4) or (Col = 5) then
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
                              if DetailStringGrid.Col in [4,5] then
                                Begin
                                  try
                                    if Pos('=', Cells[Col, Row]) <> 0 then
                                       DetailStringGrid.Cells[Col, Row] :=  CalcValueCellsVB(DetailStringGrid.Cells[Col, Row]);
                                  except
                                    MessageBox(Handle, PChar('������� ������������ ������!'), PChar(CreateDocumentForm.Caption), MB_ICONERROR+MB_OK);
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



procedure TCreateDocumentForm.N1Click(Sender: TObject);
begin
end;

// ��������� �������� ������ �� ���������
procedure TCreateDocumentForm.DeleteRow(StringGrid: TStringGrid;
  ARow: Integer);
var i, j: Integer;
begin
  with DetailStringGrid do
  begin
    for i:=ARow+1 to RowCount-1 do
      for j:=0 to ColCount-1 do
        Cells[j, i-1]:=Cells[j, i];
    for i:=1 to ColCount-1 do
      Cells[i, RowCount-1]:='';
    RowCount:=RowCount-1;
  end;
end;

procedure TCreateDocumentForm.SavePopClick(Sender: TObject);
var
    Str: String;
begin

    Case TypeSaveIncome of
       g_CreateDoc: Begin
                        SaveNewIncomeDoc();
                        AppData.GetSumCashBox.Active := False;
                        AppData.GetSumCashBox.Active := True;
                        SumNalCashBox := AppData.GetSumCashBox.FieldByName('SUM_NAL').AsFloat;
                        NewSumNalDoc := Sum_Nal;

                        SumNalCashBox := SumNalCashBox + NewSumNalDoc;


                        AppData.CorrSumCashBox.Active := False;
                        AppData.CorrSumCashBox.CommandText := Format(SSQLCorrCashBoxSum, [StringReplace(FloatToStr(SumNalCashBox),   ',', '.', [rfReplaceAll, rfIgnoreCase]), s_Income]);
                        AppData.CorrSumCashBox.Active := True;
                    end;



       g_CorrDoc:  Begin
                        SaveCorrIncomeDoc();

                        AppData.GetSumCashBox.Active := False;
                        AppData.GetSumCashBox.Active := True;
                        SumNalCashBox := AppData.GetSumCashBox.FieldByName('SUM_NAL').AsFloat;
                        NewSumNalDoc := Sum_Nal;
                        OldSumNalDoc := MainForm.ReestrIncome.FieldByName('SUM_NAL').AsFloat;
                        SumNalCashBox := (SumNalCashBox - OldSumNalDoc) + NewSumNalDoc;

                        AppData.CorrSumCashBox.Active := False;
                        AppData.CorrSumCashBox.CommandText := Format(SSQLCorrCashBoxSum, [StringReplace(FloatToStr(SumNalCashBox),   ',', '.', [rfReplaceAll, rfIgnoreCase]), s_Income]);
                        AppData.CorrSumCashBox.Active := True;
                   end;


                    
    end;


  MessageBox(Handle,PChar('�������� (�������) ������� ��������!'),PChar('�������'), MB_ICONINFORMATION+MB_OK);
  MainForm.ReestrIncome.Active := False;
  MainForm.ReestrIncome.Active := True;
  MainForm.Tabs.TabIndex := TAB_Income;
  MainForm.BarCalc(TAB_Income);
  MainForm.IncomeDifference(DBeg, DEnd);
  Close();
end;

procedure TCreateDocumentForm.SaveNoPopClick(Sender: TObject);
begin
    Close();
end;

procedure TCreateDocumentForm.DetailStringGridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
 If  TypeSaveIncome <> g_Preview then
 Begin
  If ACol in [4,5,6] then
   DetailStringGrid.Options := DetailStringGrid.Options  + [goEditing]
  else
   DetailStringGrid.Options := DetailStringGrid.Options  - [goEditing];
 end;
end;

procedure TCreateDocumentForm.AddBtnClick(Sender: TObject);
begin
    fl_ShopInDoc := 1;
    ShopForm.SettingShopForm(1);
    ShopForm.ShowModal();
end;

// ���������� ������ ��������� (�������)
procedure TCreateDocumentForm.SaveNewIncomeDoc;
var
    i: integer;
begin
  Sum_Nal := 0;
  Sum_NotNal := 0;

    for i:= 1 to DetailStringGrid.RowCount - 1 do
      Begin
    // ����� (���)
        if DetailStringGrid.Cells[4,i] <> EmptyStr then
          Sum_Nal := Sum_Nal + StrToFloat(StringReplace(DetailStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
        if DetailStringGrid.Cells[5,i] <> EmptyStr then
          Sum_NotNal := Sum_NotNal + StrToFloat(StringReplace(DetailStringGrid.Cells[5,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
      end;

  // ����� ���������
    AppData.InsertHeaderIncome.Active := False;
    AppData.InsertHeaderIncome.CommandText := Format(SSQLD_InsertHeaderIncome, [FormatDateTime('yyyy-mm-dd', DateIncomePicker.Date),
                                                                                g_User,
                                                                                Null,
                                                                                Null,
                                                                                StringReplace(FloatToStr(Sum_Nal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(FloatToStr(Sum_NotNal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                s_Income,
                                                                                PrimechEdit.Text
                                                                                ]);
    AppData.InsertHeaderIncome.Active := True;


  // �������� ��������� (�������)
  AppData.MaxUnicumNumInc.Active := False;
  AppData.MaxUnicumNumInc.Active := True;

  For i := 1 to DetailStringGrid.RowCount-1 do
    Begin
      AppData.InsertIncomeDetail.Active := False;
      AppData.InsertIncomeDetail.CommandText := Format(SSQLD_InsertIncomeDetail, [AppData.MaxUnicumNumInc.FieldByName('UNICUM_NUM').AsInteger,
                                                                                AppData.MaxUnicumNumInc.FieldByName('NUMDOC').AsInteger,
                                                                                StrToInt(DetailStringGrid.Cells[0,i]),
                                                                                StrToInt(DetailStringGrid.Cells[1,i]),
                                                                                StringReplace(DetailStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(DetailStringGrid.Cells[5,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                FormatDateTime('yyyy-mm-dd', DateIncomePicker.Date),
                                                                                s_Income,
                                                                                DetailStringGrid.Cells[6,i]
                                                                               ]);
      AppData.InsertIncomeDetail.Active := True;
    end;
end;

// ������������� ��������� (�������)
procedure TCreateDocumentForm.SaveCorrIncomeDoc;
var
    i: integer;
begin
 Sum_Nal :=  0;
 Sum_NotNal := 0;
 
   for i:= 1 to DetailStringGrid.RowCount do
      Begin
    // ����� (���)
        if DetailStringGrid.Cells[4,i] <> EmptyStr then
          Sum_Nal := Sum_Nal + StrToFloat(StringReplace(DetailStringGrid.Cells[4,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
    // ����� (������)
        if DetailStringGrid.Cells[5,i] <> EmptyStr then
          Sum_NotNal := Sum_NotNal + StrToFloat(StringReplace(DetailStringGrid.Cells[5,i], '.', ',', [rfReplaceAll, rfIgnoreCase]));
      end;

     // �������� � ������� � ������ ������ ������ ���������
  AppData.DeleteIncomeDocum.Active := False;
  AppData.DeleteIncomeDocum.CommandText := FOrmat (SSQLD_DeleteIncomeDocum, [MainForm.ReestrIncome.FieldByName('UNICUM_NUM').AsInteger,
                                                                             MainForm.ReestrIncome.FieldByName('NUMDOC').AsInteger]);
  AppData.DeleteIncomeDocum.Active := True;

    // ����� ���������
    AppData.CorrIncomeDoc.Active := False;
    AppData.CorrIncomeDoc.CommandText := Format(SSQLCorrIncomeDoc_h, [          StrToInt(NumDocEdit.Text),
                                                                                FormatDateTime('yyyy-mm-dd', DateIncomePicker.Date),
                                                                                MainForm.ReestrIncome.FieldByName('FAMILY').AsString,
                                                                                FormatDateTime('yyyy-mm-dd hh:mm:ss.zzz',MainForm.ReestrIncome.FieldByName('CREATE_DATE').AsDateTime),
                                                                                g_User,
                                                                                StringReplace(FloatToStr(Sum_Nal),   ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(FloatToStr(Sum_NotNal), ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                s_Income,
                                                                                PrimechEdit.Text
                                                                                ]);


    AppData.CorrIncomeDoc.Active := True;

  // �������� ��������� (�������)

  Appdata.MaxUnicumNumInc.Active := False;
  Appdata.MaxUnicumNumInc.Active := True;

  For i := 1 to DetailStringGrid.RowCount-1 do
    Begin
      AppData.InsertIncomeDetail.Active := False;
      AppData.InsertIncomeDetail.CommandText := Format(SSQLD_InsertIncomeDetail, [Appdata.MaxUnicumNumInc.FindField('UNICUM_NUM').AsInteger,
                                                                                StrToInt(NumDocEdit.Text),
                                                                                StrToInt(DetailStringGrid.Cells[0,i]),
                                                                                StrToInt(DetailStringGrid.Cells[1,i]),
                                                                                StringReplace(DetailStringGrid.Cells[4,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                StringReplace(DetailStringGrid.Cells[5,i], ',', '.', [rfReplaceAll, rfIgnoreCase]),
                                                                                FormatDateTime('yyyy-mm-dd', DateIncomePicker.Date),
                                                                                s_Income,
                                                                                DetailStringGrid.Cells[6,i]
                                                                               ]);
    AppData.InsertIncomeDetail.Active := True;
 end;
end;


procedure TCreateDocumentForm.DetailStringGridSetting(
  TypeIncomeSetting: integer);
var
    i: integer;
begin
   case TypeIncomeSetting of
      g_CreateDoc:   // ��������
            begin
               with DetailStringGrid do
               Begin
                  Cells[0,0] := 'NN';
                  Cells[1,0] := 'UID';
                  Cells[2,0] := '�������';
                  Cells[3,0] := '�����';
                  Cells[4,0] := '����� ���';
                  Cells[5,0] := '����� ������';
                  Cells[6,0] := '����������';

                  ColWidths[0] := 25;
                  ColWidths[1] := 35;
                  ColWidths[2] := 110;
                  ColWidths[3] := 200;
                  ColWidths[4] := 70;
                  ColWidths[5] := 80;
                  ColWidths[6] := 137;
               end;

               DateIncomePicker.Enabled := True;

               // ������������� ������
               SaveBtn.Enabled := True;
               AddBtn.Enabled := True;
               DeleteBtn.Enabled := True;
               PrintBtn.Enabled := False;
               PrimechEdit.Enabled := True;

               // ������������� PopupSaveMenu
               SavePop.Enabled := True;
               SaveNoPop.Enabled := True;

               // ������������� PopupGridMenu
               AddPop.Enabled := True;
               DeletePop.Enabled := True;


              DetailStringGrid.Options := DetailStringGrid.Options + [goEditing];
            end;

      g_CorrDoc:    // �������������
            Begin
               with DetailStringGrid do
               Begin
                  Cells[0,0] := 'NN';
                  Cells[1,0] := 'UID';
                  Cells[2,0] := '�������';
                  Cells[3,0] := '�����';
                  Cells[4,0] := '����� ���';
                  Cells[5,0] := '����� ������';
                  Cells[6,0] := '����������';

                  ColWidths[0] := 25;
                  ColWidths[1] := 35;
                  ColWidths[2] := 110;
                  ColWidths[3] := 200;
                  ColWidths[4] := 70;
                  ColWidths[5] := 80;
                  ColWidths[6] := 137;
               end;

               DateIncomePicker.Enabled := True;

               // ������������� ������
               SaveBtn.Enabled := True;
               AddBtn.Enabled := True;
               DeleteBtn.Enabled := True;
               PrintBtn.Enabled := True;
               PrimechEdit.Enabled := True;

               // ������������� PopupSaveMenu
               SavePop.Enabled := True;
               SaveNoPop.Enabled := True;

               // ������������� PopupGridMenu
               AddPop.Enabled := True;
               DeletePop.Enabled := True;

              DetailStringGrid.Options := DetailStringGrid.Options + [goEditing];
            end;

      g_Preview:    // ��������
              begin
                with DetailStringGrid do
                Begin
                    Cells[0,0] := 'NN';
                    Cells[1,0] := 'UID';
                    Cells[2,0] := '�������';
                    Cells[3,0] := '�����';
                    Cells[4,0] := '����� ���';
                    Cells[5,0] := '����� ������';
                    Cells[6,0] := '����������';

                    ColWidths[0] := 25;
                    ColWidths[1] := 35;
                    ColWidths[2] := 110;
                    ColWidths[3] := 200;
                    ColWidths[4] := 70;
                    ColWidths[5] := 80;
                    ColWidths[6] := 137;
                end;

                DateIncomePicker.Enabled := False;

                // ������������� ������
                SaveBtn.Enabled := False;
                AddBtn.Enabled := False;
                DeleteBtn.Enabled := False;
                PrimechEdit.Enabled := False;

                // ������������� PopupSaveMenu
                SavePop.Enabled := False;
                SaveNoPop.Enabled := False;
                PrintBtn.Enabled := True;

                // ������������� PopupGridMenu
                AddPop.Enabled := False;
                DeletePop.Enabled := False;

                DetailStringGrid.Options := DetailStringGrid.Options - [goEditing];
              end;
   end;
 
 for i := 0 to DetailStringGrid.RowCount - 1 do
    DetailStringGrid.RowHeights[i] := 20;

end;

procedure TCreateDocumentForm.DeleteBtnClick(Sender: TObject);
var
    i:integer;
begin
      If DetailStringGrid.Row <> 0 then
       Begin
          DeleteRow(DetailStringGrid, DetailStringGrid.Row);
          For i:= 1 to DetailStringGrid.RowCount do
            DetailStringGrid.Cells[0,i] := IntToStr(i);
          DetailStringGrid.Cells[0,0] := 'NN';
       end
      else
        Exit;
end;

procedure TCreateDocumentForm.PrintBtnClick(Sender: TObject);
begin
    AppData.Report.Template := SIncomeTotalDoc;
    AppData.Report.Run;
end;

procedure TCreateDocumentForm.DetailStringGridDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
    if ARow = 0 then   //���� ������ 0 �� �������������� � ��� �����
      Begin
          with DetailStringGrid.Canvas do
          begin
           //������ ����� ������
            Font.Style := [fsBold];
            TextRect(Rect, Rect.Left+3, Rect.Top+3, DetailStringGrid.Cells[ACol, ARow]);
          end;
      end;
end;

function TCreateDocumentForm.CalcValueCellsVB(StringCalc: string): string;
var
    msc: Variant;
begin

  try
      msc := CreateOleObject('MSScriptControl.ScriptControl');
      msc.Language := 'VBScript';
      Result := msc.Eval(Copy(StringReplace(StringCalc, ',', '.', [rfReplaceAll, rfIgnoreCase]), 2, Length(StringCalc)));
  finally
      FreeAndNil(msc);
  end;   
end;

procedure TCreateDocumentForm.SetNewSumNalDoc(const Value: real);
begin
    FNewSumNalDoc := Value;
end;

procedure TCreateDocumentForm.SetOldSumNalDoc(const Value: real);
begin
    FOldSumNalDoc := Value;
end;

procedure TCreateDocumentForm.SetSumNalCashBox(const Value: real);
begin
   FSumNalCashBox := Value;
end;

end.
