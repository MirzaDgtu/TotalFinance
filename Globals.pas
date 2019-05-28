unit Globals;

interface

uses
  Windows, Messages, Classes, Variants, ComCtrls, Printers;


 const
  TAB_Income             = 0;
  TAB_Expense            = 1;
  TAB_ExpenseZP          = 2;
  TAB_ExpenseOther       = 3;
  TAB_ZpAup              = 4;
  TAB_TaxToZp            = 5;
  TAB_PercentOfTerminal  = 6;
  TAB_ShipmentVostok     = 7;
  TAB_ShipmentOther      = 8;
  TAB_Offs               = 9;
  TAB_PublicUtilities    = 10;
  TAB_Return             = 11;
  TAB_ENVD               = 12;
  TAB_IncomeCash         = 13;

 var
  { ��� ������� � ������������ }
  g_Server: string;
  g_User: string;
  g_UserUID: Integer;
  g_PrintServer: string = 'DC-07\F2012SQL';

    { ��������� ������� }
  g_IsAdmin: Boolean;

 const
    s_Income              = '�';  // �������
    s_IncomeCash          = '��'; // ������� (�����)
    s_Expense             = '�';  // ��������� ��������
    s_ExpenseZp           = '��'; // ������� ��
    s_ExpenseOther        = '��'; // ������� ������
    s_ZpAup               = '��'; // �� ���
    s_TaxToZp             = '��'; // ������ ��
    s_ShipmentVostok      = '��'; // ��������(������)
    s_ShipmentOther       = '��'; // ��������(������)
    s_Offs                = '��'; // ��������
    s_Return              = '��'; // �������
    s_Envd                = '��'; // ����

  // �������� ���������� � �������������
 const
     g_CreateDoc = 0;         //   ��������
     g_CorrDoc   = 1;         //   �������������
     g_Preview   = 2;         //   ��������


 // ������
 const
    i_ReserveWith         = 1;      // � �������
    i_ReserveWithNo       = 0;      // �� � �������

  var fl_ShopInDoc: integer;        // ���������� �������� � �������� (1 - � �������, 2 - � (��� �������), 3 - �� ���, 13 - ������� (�����))

implementation

uses
  SConst, SysUtils, Registry, WinSpool;


function DefaultServer: string;
var
  Buf: array[0..255] of AnsiChar;
  Res, Size: Cardinal;
begin
  Size := SizeOf(Buf);
  Res := GetEnvironmentVariable('LOGONSERVER', @Buf, Size);
  if Res >= 3 then
    Result := System.Copy(Buf, 3, Res - 2)
  else
    Result := EmptyStr;
end;
 
function CurrentUser: string;
var
  Buf: array[0..255] of AnsiChar;
  Size: Cardinal;
begin
  Size := SizeOf(Buf);
  if GetUserName(@Buf, Size) then
    Result := Buf
  else
    Size := GetLastError();
end;

function CheckActive: Boolean;
var
  hMutex: THandle;
begin
  hMutex := CreateMutex(nil, True, 'TotalFinance');
  Result := (hMutex = 0) or (GetLastError() = ERROR_ALREADY_EXISTS);
end;

procedure WriteParams;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create();
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(SRegEastTrade, True) then
    begin
      Reg.WriteString(SRegServerName, g_Server);
      Reg.CloseKey();
    end;
    if Reg.OpenKey(SRegTotalFinanceKey, True) then
    begin
      Reg.WriteString(SPrintServerKey, g_PrintServer);
      Reg.CloseKey();
    end;
  finally
    Reg.Free;
  end;
end;

procedure ReadParams;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create();
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(SRegEastTrade, True) then
    begin
      g_Server := Reg.ReadString(SRegServerName);
      Reg.CloseKey();
    end;
    if Reg.OpenKey(SRegTotalFinanceKey, False) then
    begin
      g_PrintServer := Reg.ReadString(SPrintServerKey);
    end;
  finally
    Reg.Free;
  end;
end;


initialization
  if not CheckActive() then
  begin
    ReadParams();
    g_User := CurrentUser();
    if g_Server = EmptyStr then g_Server := DefaultServer();
  end
  else
    Exit;
finalization
  WriteParams();
    Exit;
end.
