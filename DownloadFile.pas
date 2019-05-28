unit DownloadFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ComCtrls, ExtCtrls, ComObj, Gauges,
  Outline, DirOutln;

type
  TDownloadFileForm = class(TForm)
    Panel1: TPanel;
    Bar: TStatusBar;
    Panel2: TPanel;
    OpenDialog: TOpenDialog;
    DownloadGrid: TStringGrid;
    Panel3: TPanel;
    OpenBtn: TBitBtn;
    AddFileBtn: TBitBtn;
    ClearBtn: TBitBtn;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Gauge: TGauge;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    procedure OpenBtnClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure DownloadGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  procedure Xls_Open(XLSFile:string; Grid:TStringGrid);
  procedure Xls_Open_filter(XLSFile:string; Grid:TStringGrid; ShopCriteries:string);
  procedure BarInfo;
  public
    { Public declarations }
  end;

var
  DownloadFileForm: TDownloadFileForm;

implementation

uses Main;

{$R *.dfm}

procedure TDownloadFileForm.OpenBtnClick(Sender: TObject);
begin
    OpenDialog.FileName := EmptyStr;
    if OpenDialog.Execute then Xls_Open(OpenDialog.FileName, DownloadGrid);
end;

procedure TDownloadFileForm.Xls_Open(XLSFile: string; Grid: TStringGrid);
 const
  xlCellTypeLastCell = $0000000B;
var
  ExlApp, Sheet: OLEVariant;
  i, j, r, c:integer;

begin
     //������� ������ Excel
  ExlApp := CreateOleObject('Excel.Application');

  //������ ���� Excel ���������
  ExlApp.Visible := false;

  //��������� ���� XLSFile
  ExlApp.Workbooks.Open(XLSFile);

  //������� ������ Sheet(��������) � ��������� ����� ����� (1)
  //� �����, � �������� ����� ������������ ������
  Sheet := ExlApp.Workbooks[ExtractFileName(XLSFile)].WorkSheets[1];

  //���������� ��������� ������ �� �����
  Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

    // ���������� ����� ��������� ������
    r := ExlApp.ActiveCell.Row;

    // ���������� ����� ���������� �������
    c := ExlApp.ActiveCell.Column;

    //������������� ���-�� �������� � ����� � StringGrid
    Grid.RowCount:=r;
    Grid.ColCount:=c;

    Gauge.MaxValue := ExlApp.ActiveCell.SpecialCells(xlCellTypeLastCell).Row;
    Grid.Cells[0,0] := 'NN';
    Grid.ColWidths[0] := 35;

    //��������� �������� �� ������ ������ � �������� � ���� �������
     for j:= 1 to r do
       for i:= 1 to c do
        Begin
          Grid.Cells[i,j-1]:= sheet.cells[j,i];
          Gauge.Progress := Gauge.Progress + 1;
        end;
     Gauge.Progress := Gauge.MinValue;
        //���� ���������� ��������� ������� ��
       //Grid.Cells[i-1,j-1]:= sheet.cells[j,i].formula;

     for i := 1 to Grid.RowCount -1 do
       Grid.Cells[0,i] := IntToStr(i);
    try
      BarInfo();
    except
            on E:Exception do MessageBox(Handle, PChar('�������� ������ ��� �������� ����.' + #13 + '�������� ������ �� ������ ����' + #13 + '���� ��������� ����� ���� ��������!'), PChar('������� ����'), MB_ICONSTOP+MNC_IGNORE);
    end;

 //��������� ���������� Excel
 ExlApp.Quit;

 //������� ���������� ������
 ExlApp := Unassigned;
 Sheet := Unassigned;

end;

procedure TDownloadFileForm.ClearBtnClick(Sender: TObject);
var
    i: integer;
begin
    for i := 0 to DownloadGrid.ColCount -1 do
        DownloadGrid.Cols[i].Clear;

    for i := 0 to DownloadGrid.ColCount -1 do
        DownloadGrid.Rows[i].Clear;

      DownloadGrid.ColCount := 2;
      DownloadGrid.RowCount := 3;  
end;

procedure TDownloadFileForm.DownloadGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
     if ARow = 0 then   //���� ������ 0 �� �������������� � ��� �����
    with DownloadGrid.Canvas do
    begin
     //������ ����� ������
      Font.Style := [fsBold];

      //����������� ������������� ������ �.�. 0-���
      // Rect.Left+3 � Rect.Top+3 ���������� ������ � ������
      TextRect(Rect, Rect.Left+3, Rect.Top+3, DownloadGrid.Cells[ACol, ARow]);
    end;
end;


procedure TDownloadFileForm.BarInfo;
  var
      i: integer;
      TotalSum, Sum_Nal, Sum_Not_Nal: real;
begin
  for i := 1 to DownloadGrid.RowCount -1 do
      Begin
          TotalSum := TotalSum + StrToFloat(DownloadGrid.Cells[14, i]);
          Sum_Nal := Sum_Nal + StrToFloat(DownloadGrid.Cells[15, i]);
          Sum_Not_Nal := Sum_Not_nal + StrToFloat(DownloadGrid.Cells[16, i]);
      end;

    Bar.Panels[0].Text := '���������� �������: ' + IntToStr(DownloadGrid.RowCount - 1);
    Bar.Panels[1].Text := '����� (�����): ' + FormatFloat('###,###,###.###', TotalSum);
    Bar.Panels[2].Text := '����� (���): ' + FormatFloat('###,###,###.###', Sum_Nal);
    Bar.Panels[3].Text := '����� (������): ' + FormatFloat('###,###,###.###', Sum_Not_Nal);
end;

procedure TDownloadFileForm.Xls_Open_filter(XLSFile: string;
  Grid: TStringGrid; ShopCriteries: string);
 const
  xlCellTypeLastCell = $0000000B;
var
  ExlApp, Sheet: OLEVariant;
  i, j, r, c:integer;

begin
     //������� ������ Excel
  ExlApp := CreateOleObject('Excel.Application');

  //������ ���� Excel ���������
  ExlApp.Visible := false;

  //��������� ���� XLSFile
  ExlApp.Workbooks.Open(XLSFile);

  //������� ������ Sheet(��������) � ��������� ����� ����� (1)
  //� �����, � �������� ����� ������������ ������
  Sheet := ExlApp.Workbooks[ExtractFileName(XLSFile)].WorkSheets[1];

  //���������� ��������� ������ �� �����
  Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

  if Trim(LowerCase(Sheet.Cells[j, 4])) = Trim(LowerCase(ShopCriteries)) then
    Begin
    // ���������� ����� ��������� ������
    r := ExlApp.ActiveCell.Row;

    // ���������� ����� ���������� �������
    c := ExlApp.ActiveCell.Column;

    //������������� ���-�� �������� � ����� � StringGrid
    Grid.RowCount:=r;
    Grid.ColCount:=c;

    Gauge.MaxValue := ExlApp.ActiveCell.SpecialCells(xlCellTypeLastCell).Row;
    Grid.Cells[0,0] := 'NN';
    Grid.ColWidths[0] := 35;

        //��������� �������� �� ������ ������ � �������� � ���� �������
         for j:= 1 to r do
           for i:= 1 to c do
            Begin
              Grid.Cells[i,j-1]:= sheet.cells[j,i];
              Gauge.Progress := Gauge.Progress + 1;
            end;
         Gauge.Progress := Gauge.MinValue;
            //���� ���������� ��������� ������� ��
           //Grid.Cells[i-1,j-1]:= sheet.cells[j,i].formula;

         for i := 1 to Grid.RowCount -1 do
           Grid.Cells[0,i] := IntToStr(i);
        try
          BarInfo();
        except
                on E:Exception do MessageBox(Handle, PChar('�������� ������ ��� �������� ����.' + #13 + '�������� ������ �� ������ ����' + #13 + '���� ��������� ����� ���� ��������!'), PChar('������� ����'), MB_ICONSTOP+MNC_IGNORE);
        end;
     end;

 //��������� ���������� Excel
 ExlApp.Quit;

 //������� ���������� ������
 ExlApp := Unassigned;
 Sheet := Unassigned;
end;

procedure TDownloadFileForm.BitBtn2Click(Sender: TObject);
begin
    if OpenDialog.Execute then Xls_Open_filter(OpenDialog.FileName, DownloadGrid, Edit1.Text);
end;

end.
