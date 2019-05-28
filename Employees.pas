unit Employees;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, ADODB, StdCtrls, Buttons;

type
  TEmployeesForm = class(TForm)
    EmployeesGrid: TDBGrid;
    Panel1: TPanel;
    Employees: TADODataSet;
    DS_Employees: TDataSource;
    EmployeesUID: TIntegerField;
    EmployeesCategoryUID: TIntegerField;
    EmployeesShortName: TStringField;
    EmployeessName: TStringField;
    EmployeesEmployeeName: TStringField;
    EmployeesAddress: TStringField;
    AddUser: TADODataSet;
    Label1: TLabel;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    procedure EmployeesBeforeOpen(DataSet: TDataSet);
    procedure EmployeesGridTitleClick(Column: TColumn);
    procedure EmployeesGridDblClick(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmployeesForm: TEmployeesForm;

implementation

uses ModuleData, User, sConst, Shop, Globals;

{$R *.dfm}

procedure TEmployeesForm.EmployeesBeforeOpen(DataSet: TDataSet);
begin
   Employees.CommandText := SSQLGetEmployees;
end;

procedure TEmployeesForm.EmployeesGridTitleClick(Column: TColumn);
var
  Str: string;
begin
  if Assigned(Column) and Assigned(Column.Field) and
    (Column.Field.FieldKind = fkData) then
    with TADODataset(Column.Grid.DataSource.Dataset) do
    begin
      Str := Column.FieldName;
      if Pos(Str, IndexFieldNames) = 0 then
        IndexFieldNames := Str
      else
        if Pos('DESC', IndexFieldNames) > 0 then
          IndexFieldNames := Str
        else
          IndexFieldNames := Str + ' DESC';
    end;
end;

procedure TEmployeesForm.EmployeesGridDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TEmployeesForm.FindBtnClick(Sender: TObject);
var
    StrFilter: string;
begin
  StrFilter := EmptyStr;
  StrFilter := 'EmployeeName LIKE ' + QuotedStr('%' + Trim(FindEdit.Text) + '%');

  if StrFilter <> EmptyStr then
  begin
    Employees.Filter := StrFilter;
    Employees.Filtered := True;
  end
  else
    Employees.Filtered := False;
end;

procedure TEmployeesForm.FindEditChange(Sender: TObject);
begin
  If FindEdit.Text = EmptyStr then
      Employees.Filtered := False;
end;

end.
