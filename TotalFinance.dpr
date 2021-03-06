program TotalFinance;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  ModuleData in 'ModuleData.pas' {AppData: TDataModule},
  sConst in 'sConst.pas',
  Shop in 'Shop.pas' {ShopForm},
  AddShop in 'AddShop.pas' {AddShopForm},
  User in 'User.pas' {UserForm},
  CreateDoc in 'CreateDoc.pas' {CreateDocumentForm},
  Globals in 'Globals.pas',
  Range in 'Range.pas' {RangeForm},
  Expenses in 'Expenses.pas' {ExpenseForm},
  IncomeReport in 'IncomeReport.pas' {ReportForm},
  Employees in 'Employees.pas' {EmployeesForm},
  Naznachenie in 'Naznachenie.pas' {NaznachenieForm},
  StatNaznachenie in 'StatNaznachenie.pas' {NaznachenieDialog},
  Access in 'Access.pas' {AccessForm},
  Module in 'Module.pas' {ModuleForm},
  AddModule in 'AddModule.pas' {AddModuleForm},
  Rigth in 'Rigth.pas' {RigthForm},
  ZpAup in 'ZpAup.pas' {ZpAupForm},
  AccessNaznachenie in 'AccessNaznachenie.pas' {AccessNaznachenieForm},
  IncomeCash in 'IncomeCash.pas' {IncomeCashForm},
  TaxToZp in 'TaxToZp.pas' {TaxToZpForm},
  PercentOfTerminal in 'PercentOfTerminal.pas' {PercentOfTerminalForm},
  KassaSum in 'KassaSum.pas' {KassaSumForm},
  Search in 'Search.pas' {SearchForm},
  Supplier in 'Supplier.pas' {SupplierForm},
  AddSupplier in 'AddSupplier.pas' {AddSupplierForm},
  Shipment in 'Shipment.pas' {ShipmentForm},
  Offs in 'Offs.pas' {OffsForm},
  TypeEnergy in 'TypeEnergy.pas' {TypeEnergyForm},
  AddTypeEnergy in 'AddTypeEnergy.pas' {AddTypeEnergyForm},
  PublicUtilities in 'PublicUtilities.pas' {PublicUtilitiesForm},
  StateBuh in 'StateBuh.pas' {StateBuhForm},
  AddStateBuh in 'AddStateBuh.pas' {AddStateBuhForm},
  DownloadFile in 'DownloadFile.pas' {DownloadFileForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAppData, AppData);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TReportForm, ReportForm);
  Application.CreateForm(TNaznachenieDialog, NaznachenieDialog);
  Application.CreateForm(TModuleForm, ModuleForm);
  Application.CreateForm(TRigthForm, RigthForm);
  Application.CreateForm(TAccessNaznachenieForm, AccessNaznachenieForm);
  Application.CreateForm(TPublicUtilitiesForm, PublicUtilitiesForm);
  Application.CreateForm(TRangeForm, RangeForm);
  Application.CreateForm(TStateBuhForm, StateBuhForm);
  Application.CreateForm(TShopForm, ShopForm);
  Application.CreateForm(TTypeEnergyForm, TypeEnergyForm);
  Application.CreateForm(TExpenseForm, ExpenseForm);
  Application.Run;
end.
