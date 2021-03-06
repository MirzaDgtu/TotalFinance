unit Naznachenie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, ADODB, StdCtrls, Buttons, Menus;

type
  TNaznachenieForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    NaznachenieGrid: TDBGrid;
    Naznachenie: TADODataSet;
    DS_Naznachenie: TDataSource;
    Bevel1: TBevel;
    AddBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    ReserveBtn: TBitBtn;
    RefreshBtn: TBitBtn;
    ReserveBox: TCheckBox;
    GroupBox1: TGroupBox;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    NaznachenieUID: TIntegerField;
    NaznacheniesName: TStringField;
    PopupNaznachenieMenu: TPopupMenu;
    AddPop: TMenuItem;
    DeletePop: TMenuItem;
    CorrPop: TMenuItem;
    ToReservePop: TMenuItem;
    FromReservePop: TMenuItem;
    RefreshPop: TMenuItem;
    CorrBtn: TBitBtn;
    NaznachenieToReserve: TADODataSet;
    NaznachenieReserve: TStringField;
    DeleteStatNaznachenie: TADODataSet;
    DeleteStatNaznachenieRes: TIntegerField;
    OperNaznachenie: TADODataSet;
    FromReserveBtn: TBitBtn;
    procedure AddBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure CorrBtnClick(Sender: TObject);
    procedure ReserveBtnClick(Sender: TObject);
    procedure ReserveBoxClick(Sender: TObject);
    procedure FromReservePopClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure NaznachenieGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshNaznachenie;
  end;

var
  NaznachenieForm: TNaznachenieForm;
  

implementation

uses ModuleData, sConst, StatNaznachenie, Globals, Expenses, Main;

{$R *.dfm}

procedure TNaznachenieForm.AddBtnClick(Sender: TObject);
var
     NaznachenieD: TNaznachenieDialog;
begin
  Try
    NaznachenieD := TNaznachenieDialog.Create(MainForm);

    with NaznachenieD do
      Begin
        AddBtn.Caption := '��������';
        if ShowModal = mrOK then
            Begin
              OperNaznachenie.Active := False;
              OperNaznachenie.CommandText := Format(SSQLAddStatNaznachenie, [NaznachenieEdit.Text, 0]);
              OperNaznachenie.Active := True;

              MessageBox(Handle, PChar('����� ������ ������� ���������'), PChar('����� ������'), MB_ICONINFORMATION+MB_OK);
            end;
      end;
    RefreshNaznachenie();
  Finally
      FreeAndNil(NaznachenieD);
  end;
end;

procedure TNaznachenieForm.RefreshBtnClick(Sender: TObject);
begin
  RefreshNaznachenie();
end;

procedure TNaznachenieForm.CorrBtnClick(Sender: TObject);
var
     NaznachenieD: TNaznachenieDialog;
begin
  Try
    NaznachenieD := TNaznachenieDialog.Create(MainForm);

    with NaznachenieD do
      Begin
        AddBtn.Caption := '��������';
        NaznachenieEdit.Text := Naznachenie.FieldByName('sName').AsString;
        if ShowModal = mrOK then
            Begin
              OperNaznachenie.Active := False;
              OperNaznachenie.CommandText := Format(SSQLCorrStatNaznachenie ,[Naznachenie.FieldByName('UID').AsInteger,
                                                                              NaznachenieEdit.Text,
                                                                              0]);
              OperNaznachenie.Active := True;
              MessageBox(Handle, PChar('������ ������� ����������������'), PChar('������������� ������'), MB_ICONINFORMATION+MB_OK);
            end;
      end;
    RefreshNaznachenie();
  Finally
      FreeAndNil(NaznachenieD);
  end;
end;

procedure TNaznachenieForm.ReserveBtnClick(Sender: TObject);
begin
  NaznachenieToReserve.Active := False;
  NaznachenieToReserve.CommandText := Format (SSQTransferNaznachenieToReserve, [Naznachenie.FieldByName('UID').AsInteger,
                                                                                g_CorrDoc]);
  NaznachenieToReserve.Active := True;

  RefreshNaznachenie();

end;

procedure TNaznachenieForm.ReserveBoxClick(Sender: TObject);
begin
  RefreshNaznachenie();
end;

procedure TNaznachenieForm.FromReservePopClick(Sender: TObject);
begin
  NaznachenieToReserve.Active := False;
  NaznachenieToReserve.CommandText := Format (SSQTransferNaznachenieToReserve, [Naznachenie.FieldByName('UID').AsInteger,
                                                                                g_CreateDoc]);
  NaznachenieToReserve.Active := True;

  RefreshNaznachenie();
end;

procedure TNaznachenieForm.RefreshNaznachenie;
begin
  if ReserveBox.Checked = True then
    Begin
       Naznachenie.Active := False;
       Naznachenie.CommandText := Format(SSQLGetNaznachenie, [1]);
       Naznachenie.Active := True;
    end
  else
  if ReserveBox.Checked = False then
    Begin
       Naznachenie.Active := False;
       Naznachenie.CommandText := Format(SSQLGetNaznachenie, [0]);
       Naznachenie.Active := True;
    end;
end;

procedure TNaznachenieForm.DeleteBtnClick(Sender: TObject);
var
    QNaznachenie, QDelNaznachenie: Word;
begin

QDelNaznachenie := MessageBox(Handle,PChar('�� ������������� ������� ������� ��� ������?'),PChar('�������� ������ ����������'), MB_ICONINFORMATION+MB_YESNO);
if QDelNaznachenie = IDYES then
begin
  DeleteStatNaznachenie.Active := False;
  DeleteStatNaznachenie.CommandText := Format(SSQLDeleteStatNaznachenie, [Naznachenie.FieldByName('UID').AsInteger]);
  DeleteStatNaznachenie.Active := True;

  RefreshNaznachenie();

  if DeleteStatNaznachenie.FieldByName('Res').AsInteger = 0 then
    QNaznachenie := MessageBox(Handle, PChar('������ �������!'), PChar('�������� ������ ����������'), MB_ICONINFORMATION+MB_OK)
  else
  if DeleteStatNaznachenie.FieldByName('Res').AsInteger = 1 then
    QNaznachenie := MessageBox(Handle, PChar('������ ���������� � ������, � ����� � �������� �� � ����������!'), PChar('�������� ������ ����������'), MB_ICONINFORMATION+MB_OK);
end
else
  Exit;
end;

procedure TNaznachenieForm.FindBtnClick(Sender: TObject);
var
    StrFilter: string;
begin
  StrFilter := EmptyStr;
  StrFilter := 'sName LIKE ' + QuotedStr('%' + Trim(FindEdit.Text) + '%');

  if StrFilter <> EmptyStr then
  Begin
    Naznachenie.Filter := StrFilter;
    Naznachenie.Filtered := True;
  end;
end;

procedure TNaznachenieForm.FindEditChange(Sender: TObject);
begin
  if FindEdit.Text = EmptyStr then
    Naznachenie.Filtered := False;
end;

procedure TNaznachenieForm.NaznachenieGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Naznachenie.FieldByName('RESERVE').AsString = '*' then
    with NaznachenieGrid.Canvas do
    begin
      Brush.Color := clRed;
      FillRect(Rect);
      TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
    end;
end;

end.
