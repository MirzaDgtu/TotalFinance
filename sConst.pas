unit sConst;

interface
resourcestring

{$I SEAST.INC}

  SRegTotalFinanceKey  = '\Software\EastTrade\TotalFinance';
  SPrintServerKey  = 'PrintServer';


// ���� �  ���������
  SSQLGetAllUser             = 'EXEC FINANCE..D_GetAllUser';                                      // ��������� ���� �������������
  SSQLGetUserAccessModule    = 'EXEC FINANCE..D_GetUserAccessModule %d';                          // ��������� ��������� ������� ��� ������������
  SSQLGetAllUserNaznachenie  = 'EXEC FINANCE..D_GetAllUserNaznachenie';                           // ��������� ���� ������ ���������� ��� ������������




// ������������
  SSQLGetUser                = 'EXEC FINANCE..D_GetUser %d';                                      // ����� �������������
  SSQLTransferUserToReserve  = 'EXEC FINANCE..D_TransferUserToReserve %d, %d';                    // ����� ������������ � ������
  SSQLAddUser                = 'EXEC FINANCE..D_AddUser %d, ''%s''';                              // ���������� ������������
  SSQLDeleteUser             = 'EXEC FINANCE..D_DeleteUser %d';                                   // �������� ������������
  SSQLGetEmployees           = 'EXEC FINANCE..D_GetEmployees';                                    // ����������
  SSQLSetAdmin               = 'EXEC FINANCE..D_SetAdmin %d, %d';                                 // ���������� ���� ��������������


  SUserNotRegistered     = '������������ ''%s'' �� ���������������.'#13#10 +
                           '���������� � �������������� ������';
  SModuleError = '��������� ������� ��� ''%s'' ���.' + #13#10 +
                 '���������� � ��������������';
// ����������
  SSQLGetNaznachenie               = 'EXEC FINANCE..D_GetNaznachenie %d';                         // ����� ���� ������ ����������
  SSQLAddStatNaznachenie           = 'EXEC FINANCE..D_AddStatNaznachenie ''%s'', %d';             // ���������� ����� ������ ����������
  SSQLCorrStatNaznachenie          = 'EXEC FINANCE..D_CorrStatNaznachenie %d, ''%s''';            // ������������� ������ ����������
  SSQTransferNaznachenieToReserve  = 'EXEC FINANCE..D_TransferNaznachenieToReserve %d, %d';       // ������ (�������, �������)
  SSQLDeleteStatNaznachenie        = 'EXEC FINANCE..D_DeleteStatNaznachenie %d';                  // �������� ����������
  SSQLGetUserNaznachenieAccess     = 'EXEC FINANCE..D_GetUserNaznachenieAccess %d';               // ��������� ������ ���������� ��������� ������������
  

// ����������
  SSQLGetSupplier = 'EXEC FINANCE..D_GetSupplier %d';                                              // ��������� ������ ����������� (0 - ��� �������, � ��������)
  SSQLAddSupplier = 'EXEC FINANCE..D_AddSupplier ''%s'', %d';                                      // ���������� ������ ����������
  SSQLCorrSupplier = 'EXEC FINANCE..D_CorrSupplier %d, ''%s''';                                    // ��������� ����� ����������
  SSQLTransferSupplierToReserve = 'EXEC FINANCE..D_TransferSupplierToReserve %d, %d';              // ������� � ������ � �� ������� ����������
  SSQLDeleteSupplier = 'EXEC FINANCE..D_DeleteSupplier %d';                                        // �������� ����������

  
// ��������
  SSQLGetOrganiz              = 'EXEC FINANCE..D_GetOrganiz %d';                                      // ����� ���������
  SSQLInsertNewShop           = 'EXEC FINANCE..D_InsertNewShop ''%s'', ''%s'', ''%s'', ''%s'', %d';   // ���������� ������ ��������
  SSQLDeleteShop              = 'EXEC FINANCE..D_DeleteShop %d';                                      // �������� ��������
  SSQLTransferClientToReserve = 'EXEC FINANCE..D_TransferClientToReserve %d, %d';                     // ������� �������� � ������
  SSQLCorrShop                = 'EXEC FINANCE..D_CorrShop %d, ''%s'', ''%s'', ''%s'', ''%s'', %d';    // ������������� ��������


// ������
  SSQlGetModule               = 'EXEC FINANCE..D_GetModule';                                          // ����� ���� �������
  SSQLAddModule               = 'EXEC FINANCE..D_AddModule ''%s''';                                   // ���������� ������ ������
  SSQLCorrModule              = 'EXEC FINANCE..D_CorrModule %d, ''%s''';                              // ������������� ������
  SSQLDeleteModule            = 'EXEC FINANCE..D_DeleteModule %d';                                    // �������� ������


// ������
  SSQLGetUserModuls            = 'EXEC FINANCE..D_GetUserModuls %d';                                   // ��������� ������ ������� ������������
  SSQLUpdModuleUserAccess      = 'EXEC FINANCE..D_UpdModuleUserAccess %d, %d, %d';                     // ���������� ���� �� ������
  SSQLGetUserNaznachenie       = 'EXEC FINANCE..D_GetUserNaznachenie %d';                              // ��������� ������ ������ ���������� ������������
  SSQLUpdNaznachenieUserAccess = 'EXEC FINANCE..D_UpdNaznachenieUserAccess %d, %d, %d';                // ���������� ���� �� ������ ����������
  SSQLGetInfoAccess            = 'EXEC FINANCE..D_GetInfoAccess %d';                                   // ��������� ���������� � ���������� ��������� ������� � ������ ����������


// �������
  SSQLSetOtmetkaDoc            = 'EXEC FINANCE..D_SetOtmetkaDoc %d, %d, %d';                            // ��������� (������) �������


// �����
  SSQLCorrCashBoxSum           = 'EXEC FINANCE..D_CorrCashBoxSum ''%s'', ''%s''';                      // ������������� ����� � �����
  SSQLGetHeaderDocCashBox      = 'EXEC FINANCE..D_GetHeaderDocCashBox ''%s'', ''%s''';                 // ��������� ��������� �� ����������� ������� ����������� �������(������� - ������) �� ����
  SSQLCashActualeSumCashBox    = 'EXEC FINANCE..D_CashActualeSumCashBox';                              // ��������� ���������� ����� � �����
  SSQLGetOperCashBox           = 'EXEC FINANCE..D_GetOperCashBox ''%s'', ''%s''';                      // ��������� ������������� �������� ��� ������ � �����


// �������
  SSQLD_InsertHeaderIncome    = 'EXEC FINANCE..D_InsertHeaderIncome ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';     // ���������� ����� ��������� (�������)
  SSQLD_InsertIncomeDetail    = 'EXEC FINANCE..D_InsertIncomeDetail %d, %d, %d, %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';           // ���������� ��������� ��������� (�������)
  SSQLGetMaxUnicumNumInc      = 'EXEC FINANCE..D_GetMaxUnicumNumInc';                                                                  // ��������� ������������� ������ ���������
  SSQLD_DeleteIncomeDocum     = 'EXEC FINANCE..D_DeleteIncomeDocum %d, %d';                                                            // �������� ��������� (�������)
  SSQLGetIncomeDetail         = 'EXEC FINANCE..D_GetIncomeDetail %d';                                                                  // �������� � ������������� ��������� (�������)
  SSQLCorrIncomeDoc_h         = 'EXEC FINANCE..D_CorrIncomeDoc_h %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';  // ������������� ����� ��������� (�������)
  SSQLUpdateIncStatusCorrDoc  = 'EXEC FINANCE..D_UpdateIncStatusCorrDoc %d, %d';                                                    // ���������� ������� ��������� ��� �������� ��� �������������
  SSQLIncomeDifference        = 'EXEC FINANCE..D_IncomeDifference ''%s'', ''%s''';                                                     // ������� ���� ����� ������� <-> ������� (�����)


// �������
  SSQLCreateExpenseDocHead   = 'EXEC FINANCE..D_CreateExpenseDocHead ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                                     // ���������� ����� ��������� (�������)
  SSQLCreateExpenseDocDetail = 'EXEC FINANCE..D_CreateExpenseDocDetail %d, %d, ''%s'', %d, %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';   // ���������� ��������� ��������� (�������)
  SSQLGetMaxUnicumNumExpense = 'EXEC FINANCE..D_GetMaxUnicumNumExpense';                                                                                  // ��������� ������������� ������ ���������
  SSQLGetExpenceDetail       = 'EXEC FINANCE..D_GetExpenceDetail %d';                                                                                     // �������� � ������������� ���������� ���������
  SSQLCorrExpenceDoc_h       = 'EXEC FINANCE..D_CorrExpenceDoc_h %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                     // ������������� ����� ���������� ���������
  SSQLGetExpenceZPDetail     = 'EXEC FINANCE..D_GetExpenceZPDetail %d';                                                                                   // �������� � ������������� ���������� (��) ���������
  SSQLDeleteExpenceDocum     = 'EXEC FINANCE..D_DeleteExpenceDocum %d';                                                                                   // �������� ���������� ���������
  SSQLGetExpenceOtherDetail  = 'EXEC FINANCE..D_GetExpenceOtherDetail %d';                                                                                // �������� ��������� ���������� (������) ��������� (��� ������)
  SSQLUpdateExpStatusCorrDoc = 'EXEC FINANCE..D_UpdateExpStatusCorrDoc %d, %d';                                                                           // ���������� ������� ��������� ��� �������� ��� �������������


// �� ���
  SSQLGetNaznachenieZpAup   = 'EXEC FINANCE..D_GetNaznachenieZpAup';                                                                              // ��������� ������ ������ ���������� ��� ���������� (�� ���)
  SSQLGetMaxUnicumNumZpAup  = 'EXEC FINANCE..D_GetMaxUnicumNumZpAup';                                                                             // ��������� ������������� ������ ��������� (�� ���)
  SSQLCreateZpAupDocHead    = 'EXEC FINANCE..D_CreateZpAupDocHead ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                                // ���������� ����� ��������� (�� ���)
  SSQLCorrZpAupDoc_h        = 'EXEC FINANCE..D_CorrZpAupDoc_h %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                // ���������� ������������������ ����� ��������� (�� ���)
  SSQLCreateZpAupDocDetail  = 'EXEC FINANCE..D_CreateZpAupDocDetail %d, %d, ''%s'', %d, %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';      // ���������� ��������� ��������� (�� ���)
  SSQLDeleteZpAupDocum      = 'EXEC FINANCE..D_DeleteZpAupDocum %d';                                                                              // �������� ��������� (�� ���)
  SSQLGetZpAupDocDetail     = 'EXEC FINANCE..D_GetZpAupDocDetail %d';                                                                             // �������� ����������� ��������� (�� ���)
  SSQLUpdateZpAupStatusCorrDoc = 'EXEC FINANCE..D_UpdateZpAupStatusCorrDoc %d, %d';                                                               // ���������� ������� ��������� ��� �������� ��� �������������


  // ������ �� ��
  SSQLCreateTaxToZpDocHead   = 'EXEC FINANCE..D_CreateTaxToZpDocHead ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                              //  ���������� ����� ��������� (����� �� ��)
  SSQLCreateTaxToZpDocDetail = 'EXEC FINANCE..D_CreateTaxToZpDocDetail %d, %d, ''%s'', %d, %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';    //  ���������� ��������� ��������� (����� �� ��)
  SSQLGetTaxToZpDocDetail    = 'EXEC FINANCE..D_GetTaxToZpDocDetail %d';                                                                           //  ��������� ��������� ��������� (����� �� ��)
  SSQLCorrTaxToZpDoc_h       = 'EXEC FINANCE..D_CorrTaxToZpDoc_h %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';              //  ����� ������������������ ��������� (����� �� ��)



  // �������� �� ���������
  SSQLCreatePercentOfTerminalHead = 'EXEC FINANCE..D_CreatePercentOfTerminalHead ''%s'', ''%s'', ''%s'', ''%s''';                                  // ���������� ������ ��������� (������� �� ���������)
  SSQLCreatePercentOfTerminalDocDetail  = 'EXEC FINANCE..D_CreatePercentOfTerminalDocDetail %d, %d, ''%s'', %d, %d, ''%s'', ''%s'', ''%s''';       // ���������� ��������� ��������� (������� �� ���������)
  SSQLDeletePercentOfTerminalDocum      = 'EXEC FINANCE..D_DeletePercentOfTerminalDocum %d';                                                       // �������� ��������� (������� �� ���������)
  SSQLGetPercentOfTerminalDocDetail     = 'EXEC FINANCE..D_GetPercentOfTerminalDocDetail %d';                                                      // �������� ��������� ���������  (������� �� ���������)
  SSQLGetMaxUnicumNumPercentOfTerminal  = 'EXEC FINANCE..D_GetMaxUnicumNumPercentOfTerminal';                                                      // ��������� ������������� ������ ��������� (������� �� ���������)
  SSQLCorrPercentOfTerminalDoc_h        =  'EXEC FINANCE..D_CorrPercentOfTerminalDoc_h %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';        // ���������� ����� ������������������� ��������� (������� �� ���������)
  SSQLUpdatePercentOfTerminalStatusCorrDoc = 'EXEC FINANCE..D_UpdatePercentOfTerminalStatusCorrDoc %d, %d';                                        // ��������� ������� ��������� (���������������)


  // �������� (������), (������)
  SSQLCreateShipmentHeader = 'EXEC FINANCE..D_CreateShipmentHeader  ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                               //  ���������� ������ ��������� (�������� (������)(������))
  SSQLCreateShipmentDetail = 'EXEC FINANCE..D_CreateShipmentDetail %d, %d, ''%s'', %d, %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';        //  ���������� ��������� ��������� (�������� (������)(������))
  SSQLCorrShipmentDoc_h = 'EXEC FINANCE..D_CorrShipmentDoc_h  %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                                 //  ���������� ����� ������������������� ��������� (�������� (������)(������))
  SSQLGetMaxUnicumNumShipment = 'EXEC FINANCE..D_GetMaxUnicumNumShipment';                                                                         //  ��������� ������������� ������ ��������� (�������� (������)(������))
  SSQLGetShipmentDetail = 'EXEC FINANCE..D_GetShipmentDetail %d';                                                                                  //  ��������� ��������� ��������� (�������� (������)(������))
  SSQLUpdateShipmentStatusCorrDoc = 'EXEC FINANCE..D_UpdateShipmentStatusCorrDoc %d, %d';                                                          //  ��������� ������� ��������� (��� ���������)  (�������� (������)(������))
  SSQLDeleteShipmentDocum = 'EXEC FINANCE..D_DeleteShipmentDocum %d';                                                                              //  �������� ��������� (��������(������),(������) � ���������� ��������� � �����)


  // ��������, // �������
  SSQLCreateOffsHeader = 'EXEC FINANCE..D_CreateOffsHeader ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                                //  ���������� ������ ��������� (��������)
  SSQLCreateOffsDetail  = 'EXEC FINANCE..D_CreateOffsDetail %d, %d, %d, %d, ''%s'', ''%s'', ''%s'', ''%s''';                                       //  ���������� ��������� ��������� (��������)
  SSQLGetMaxUnicumNumOffs = 'EXEC FINANCE..D_GetMaxUnicumNumOffs';                                                                                 //  ��������� ���������� ������ ������������ ��������� '��������'
  SSQLDeleteOffsDocum  = 'EXEC FINANCE..D_DeleteOffsDocum %d';                                                                                 //  �������� ��������� (��������)
  SSQLGetOffsDetail = 'EXEC FINANCE..D_GetOffsDetail %d';                                                                                          //  ��������� ��������� ��������� (��������)
  SSQLCorrOffsDoc_h = 'EXEC FINANCE..D_CorrOffsDoc_h %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                                  //  ���������� ������������������� (�����) ��������� (��������)
  SSQLUpdateOffsStatusCorrDoc = 'EXEC FINANCE..D_UpdateOffsStatusCorrDoc %d, %d';                                                                  //  ��������� ������� ��������������� ��������� (��������)


  // ����
  SSQLCreateEnvdHeader = 'EXEC FINANCE..D_CreateEnvdHeader ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                                // ���������� ������ ��������� (����)
  SSQLCreateEnvdDetail = 'EXEC FINANCE..D_CreateEnvdDetail %d, %d, %d, %d, ''%s'', ''%s'', ''%s'', ''%s''';                                        // ���������� ��������� ��������� (����)
  SSQLCorrEnvdDoc_h = 'EXEC FINANCE..D_CorrEnvdDoc_h %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                                  // ���������� ������������������� ��������� (����)


  // ������������ ������
    SSQLCreatePublicUtilitiesHeadDoc  = 'EXEC FINANCE..D_CreatePublicUtilitiesHeadDoc ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                                        // ���������� ����� ��������� (������������ ������)
    SSQLCreatePublicUtilitiesDetailDoc  = 'EXEC FINANCE..D_CreatePublicUtilitiesDetailDoc %d, %d, ''%s'', %d, %d, %d, %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';    // ���������� ��������� ��������� (������������ ������)
    SSQLUpdatePublicUtilitiesStatusCorrDoc  = 'EXEC FINANCE..D_UpdatePublicUtilitiesStatusCorrDoc %d, %d';                                                            // ��������� ������� ��������� (������������ ������)
    SSQLGetPublicUtilitiesDetail  = 'EXEC FINANCE..D_GetPublicUtilitiesDetail %d';                                                                                    // ��������� ��������� ��������� (������������ ������)
    SSQLDeletePublicUtilitiesDoc  = 'EXEC FINANCE..D_DeletePublicUtilitiesDoc %d';                                                                                    // �������� ��������� (������������ ������)
    SSQLCorrPublicUtilitiesDoc_h  = 'EXEC FINANCE..D_CorrPublicUtilitiesDoc_h %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s''';                            // ���������� ������������������� ����� ��������� (������������ ������)


  // ���� �������

  SSQLGetTypeEnergy = 'EXEC FINANCE..D_GetTypeEnergy %d';                                                                                          // ��������� ������ ����� ������� (1 - ���, 0 - ��� �������)
  SSQLCreateTypeEnergy = 'EXEC FINANCE..D_CreateTypeEnergy ''%s'', %d';                                                                            // �������� ����� ������ "���� �������"
  SSQLCorrTypeEnergy = 'EXEC FINANCE..D_CorrTypeEnergy %d, ''%s''';                                                                                // ������������� ������ "���� �������"
  SSQLTransferTypeEnergyToReserve = 'EXEC FINANCE..D_TransferTypeEnergyToReserve %d, %d';                                                          // ������� � ������ (�� �������)
  SSQLDeleteTypeEnergy  = 'EXEC FINANCE..D_DeleteTypeEnergy %d';                                                                                   // �������� ������ "���� �������"



  // �������
  SSQLGetReestrincome       = 'EXEC FINANCE..D_GetReestrincome ''%s'', ''%s''';             // ������ ���������� (�������)
  SSQLGetReestrExpense      = 'EXEC FINANCE..D_GetReestrExpense ''%s'', ''%s''';            // ������ ���������� (�������)
  SSQLGetReestrExpenseZP    = 'EXEC FINANCE..D_GetReestrExpenseZP ''%s'', ''%s''';          // ������ ���������� (������� ��)
  SSQLGetReestrExpenseOther = 'EXEC FINANCE..D_GetReestrExpenseOther ''%s'', ''%s''';       // ������ ���������� (������� (������))
  SSQLGetReestrZpAUP        = 'EXEC FINANCE..D_GetReestrZpAUP ''%s'', ''%s''';              // ������ ���������� (�� ���)
  SSQLGetReestrIncomeCach   = 'EXEC FINANCE..D_GetReestrIncomeCach ''%s'', ''%s''';         // ������ ���������� (������� (�����))
  SSQLGetReestrTaxToZp      = 'EXEC FINANCE..D_GetReestrTaxToZp ''%s'', ''%s''';            // ������ ���������� (������ �� ��)
  SSQLGetReestrPercentOfTerminal  = 'EXEC FINANCE..D_GetReestrPercentOfTerminal ''%s'', ''%s''';    //  ������ ���������� (������� �� ���������)
  SSQLGetReestrShipmentVostok = 'EXEC FINANCE..D_GetReestrShipmentVostok ''%s'', ''%s''';           //  ������ ���������� (��������(������))
  SSQLGetReestrShipmentOther  = 'EXEC FINANCE..D_GetReestrShipmentOther ''%s'', ''%s''';            //  ������ ���������� (��������(������))
  SSQLGetReestrOffs = 'EXEC FINANCE..D_GetReestrOffs  ''%s'', ''%s''';                              //  ������ ���������� (��������)
  SSQLGetReestrReturn = 'EXEC FINANCE..D_GetReestrReturn ''%s'', ''%s''';                           //  ������ ���������� (��������)
  SSQLGetReestrEnvd ='EXEC FINANCE..D_GetReestrEnvd ''%s'', ''%s''';                                //  ������ ���������� (����)
  SSQLGetReestrPublicUtilities  = 'EXEC FINANCE..D_GetReestrPublicUtilities ''%s'', ''%s''';        //  ������ ���������� (������������ ������)


 // ����� (������ ����������) -> �� �����
  SSQlIncomeShopReport      = 'EXEC FINANCE..D_Get_IncomeShopReport %d, %d, %d';             // ������� -> �� �����
  SSQlIncomeCashShopReport  = 'EXEC FINANCE..D_Get_IncomeCashShopReport %d, %d, %d';         // ������� (�����) -> �� �����
  SSQLExpenseTotalShop      = 'EXEC FINANCE..D_Get_ExpenseTotalShop %d, %d, %d';             // ������� -> �� �����
  SSQLExpenseZPTotalShop    = 'EXEC FINANCE..D_Get_ExpenseZPTotalShop %d, %d, %d';           // ������� �� -> �� �����
  SSQLExpenseOtherTotalShop = 'EXEC FINANCE..D_Get_ExpenseOtherTotalShop %d, %d, %d';        // ������� ������ -> �� �����
  SSQLZpAupTotalShop        = 'EXEC FINANCE..D_Get_ZpAupTotalShop %d, %d, %d';               // �� ��� -> �� �����
  SSQLTaxToZpTotalShop      = 'EXEC FINANCE..D_Get_TaxToZpTotalShop %d, %d, %d';             // ������ �� �� -> �� ����� 
  SSQLPercentOfTerminalTotalShop  = 'EXEC FINANCE..D_Get_PercentOfTerminalTotalShop %d, %d, %d'; // ������� �� ��������� -> �� �����
  SSQLShipmentVostokTotalShop = 'EXEC FINANCE..D_Get_ShipmentVostokTotalShop %d, %d, %d';    // ��������(������) -> �� �����
  SSQLShipmentOtherTotalShop  = 'EXEC FINANCE..D_Get_ShipmentOtherTotalShop %d, %d, %d';     // ��������(������) -> �� �����
  SSQLOffsShopReport          = 'EXEC FINANCE..D_Get_OffsShopReport %d, %d, %d';             // �������� -> �� �����
  SSQLReturnShopReport        = 'EXEC FINANCE..D_Get_ReturnShopReport %d, %d, %d';           // ������� -> �� �����
  SSQLEnvdShopReport          = 'EXEC FINANCE..D_Get_EnvdShopReport %d, %d, %d';             // ���� -> �� �����
  SSQLPublicUtilitiesTotalShop  = 'EXEC FINANCE..D_Get_PublicUtilitiesTotalShop %d, %d, %d'; // ������������ ������ -> �� �����

  
 // ����� (������ ����������) -> �� ����
  SSQLIncomeDayShopReport  = 'EXEC FINANCE..D_Get_IncomeDayShopReport %d, ''%s'', ''%s''';           // ������� -> �� ����
  SSQLIncomeCashDayShopReport = 'EXEC FINANCE..D_Get_IncomeCashDayShopReport %d, ''%s'', ''%s''';    // ������� (�����) -> �� ����
  SSQLDExpenseDayTotalShop  = 'EXEC FINANCE..D_Get_ExpenseDayTotalShop %d, ''%s'', ''%s''';          // ������� -> �� ����
  SSQLExpenseZPDayTotalShop = 'EXEC FINANCE..D_Get_ExpenseZPDayTotalShop %d, ''%s'', ''%s''';        // ������� �� -> �� ����
  SSQLExpenseOtherDayTotalShop  = 'EXEC FINANCE..D_Get_ExpenseOtherDayTotalShop %d, ''%s'', ''%s'''; // ������� ������ -> �� ����
  SSQLZpAupDayTotalShop = 'EXEC FINANCE..D_Get_ZpAupDayTotalShop %d, ''%s'', ''%s''';                // �� ��� -> �� ����
  SSQLTaxToZpDayTotalShop = 'EXEC FINANCE..D_Get_TaxToZpDayTotalShop %d, ''%s'', ''%s''';            // ������ �� �� -> �� ����
  SSQLPercentOfTerminalDayTotalShop = 'EXEC FINANCE..D_Get_PercentOfTerminalDayTotalShop %d, ''%s'', ''%s''';  // ������� �� ��������� -> �� ����
  SSQLShipmentVostokDayTotalShop  = 'EXEC FINANCE..D_Get_ShipmentVostokDayTotalShop %d, ''%s'', ''%s'''; // ��������(������) -> �� ����
  SSQLShipmentOtherDayTotalShop = 'EXEC FINANCE..D_Get_ShipmentOtherDayTotalShop %d, ''%s'', ''%s''';    // ��������(������) -> �� ����
  SSQLOffsDayShopReport = 'EXEC FINANCE..D_Get_OffsDayShopReport %d, ''%s'', ''%s''';                    // ��������  ->  �� ����
  SSQLReturnDayShopReport = 'EXEC FINANCE..D_Get_ReturnDayShopReport %d, ''%s'', ''%s''';                // ������� -> �� ����
  SSQLEnvdDayShopReport = 'EXEC FINANCE..D_Get_EnvdDayShopReport %d, ''%s'', ''%s''';                    // ���� -> �� ����
  SSQLPublicUtilitiesDayTotalShop = 'EXEC FINANCE..D_Get_PublicUtilitiesDayTotalShop  %d, ''%s'', ''%s'''; // ������������ ������ -> �� ����


                              // - ������ ������ - //

  SSQLGetColumnName = 'EXEC FINANCE..D_GetColumnName ''%s''';                                             // ��������� ������������ ����� �� ����� �������
  SSQLExecSql = 'EXEC FINANCE..D_ExecSql ''%s''';


                              // - ������ ����������� - //

  SSQLCreateStateBuh  = 'EXEC FINANCE..D_CreateStateBuh ''%s''';                                         // ���������� ����� ������ �����������
  SSQLCorrStateBuh  = 'EXEC FINANCE..D_CorrStateBuh %d, ''%s''';                                         // ������������� ������ �����������
  SSQLDeleteStatBuh = 'EXEC FINANCE..D_DeleteStatBuh %d';                                                // �������� ������ �����������
  SSQLTransferStateBuhToReserve = 'EXEC FINANCE..D_TransferStateBuhToReserve %d, %d';                    // ������� �(��) ������(�)
  SSQLGetStateBuh = 'EXEC FINANCE..D_GetStateBuh %d';                                                    // ��������� ������ �����������



                                  // - ������ - //

 // �������
  SIncomeReestr        = 'Report\IncomeReestr';                                   // �����  (�������)
  SIncomeCashReestr    = 'Report\IncomeCashReestr';                               // ������ (������� (�����))
  SExpenseReestr       = 'Report\ExpenseReestr';                                  // ������ (�������)
  SExpenseReestrZp     = 'Report\ExpenseReestrZp';                                // ������ (������� (��))
  SExpenseReestrOther  = 'Report\ExpenseReestrOther';                             // ������ (������� (������))
  SZpAupReestr         = 'Report\ZpAupReestr';                                    // ������ (�� ���)
  STaxToZpReestr       = 'Report\TaxToZpReestr';                                  // ������ (������ �� ��)
  SPercentOfTerminalReestr = 'Report\PercentOfTerminalReestr';                    // ������ (�������� �� ���������)
  SShipmentVostokReestr = 'Report\ShipmentVostokReestr';                          // ������ (�������� (������))
  SShipmentOtherReestr  = 'Report\ShipmentOtherReestr';                           // ������ (�������� (������))
  SOffsReestr           = 'Report\OffsReestr';                                    // ������ (��������)
  SReturReestr          = 'Report\ReturReestr';                                   // ������ (�������)
  SEnvdReestr           = 'Report\EnvdReestr';                                    // ������ (����)
  SPublicUtilitiesReestr  = 'Report\PublicUtilitiesReestr';                       // ������ (������������ ������)

 // ���������
  SIncomeTotalDoc       = 'Report\IncomeTotalDoc';                                 // �������� (�������)
  SIncomeCashTotalDoc   = 'Report\IncomeCashTotalDoc';                             // �������� (������� (�����))
  SExpenseTotalDoc      = 'Report\ExpenseTotalDoc';                                // �������� (�������)
  SExpenseTotalDocZp    = 'Report\ExpenseTotalDocZp';                              // �������� (������� (��))
  SExpenseOtherTotalDoc = 'Report\ExpenseOtherTotalDoc';                           // �������� (������� (������))
  SZpAupTotalDoc        = 'Report\ZpAupTotalDoc';                                  // �������� (�� ���)
  STaxToZpTotalDoc      = 'Report\TaxToZpTotalDoc';                                // �������� (������ �� ��)
  SPercentOfTerminalTotalDoc = 'Report\PercentOfTerminalTotalDoc';                 // �������� (�������� �� ���������)
  SShipmentVostokTotalDoc = 'Report\ShipmentVostokTotalDoc';                       // �������� (�������� (������))
  SShipmentOtherTotalDoc  = 'Report\ShipmentOtherTotalDoc';                        // �������� (�������� (������))
  SOffsTotalDoc           = 'Report\OffsTotalDoc';                                 // �������� (��������)
  SReturnTotalDoc         = 'Report\ReturnTotalDoc';                               // �������� (�������)
  SEnvdTotalDoc           = 'Report\EnvdTotalDoc';                                 // �������� (����)
  SPublicUtilitiesTotalDoc  = 'Report\PublicUtilitiesTotalDoc';                    // �������� (������������ ������)

// ����� �� ��������
  SIncomeTotalShop       = 'Report\IncomeTotalShop';                                // ����� (�������)
  SIncomeCashTotalShop   = 'Report\IncomeCashTotalShop';                            // ����� (������� (�����))
  SExpenseTotalShop      = 'Report\ExpenseTotalShop';                               // ����� (�������)
  SExpenseTotalShopZp    = 'Report\ExpenseTotalShopZp';                             // ����� (������� (��))
  SExpenseOtherTotalShop = 'Report\ExpenseOtherTotalShop';                          // ����� (������� (������))
  SZpAUPTotalShop        = 'Report\ZpAUPTotalShop';                                 // ����� (�� ���)
  STaxToZpTotalShop      = 'Report\TaxToZpTotalShop';                               // ����� (������ �� ��)
  SPercentOfTerminalTotalShop = 'Report\PercentOfTerminalTotalShop';                // ����� (�������� �� ���������)
  SShipmentVostokTotalShop = 'Report\ShipmentVostokTotalShop';                      // ����� (�������� (������))
  SShipmentOtherTotalShop  = 'Report\ShipmentOtherTotalShop';                       // ����� (�������� (������))
  SOffsTotalShop  = 'Report\OffsTotalShop';                                         // ����� (��������)
  SReturnTotalShop = 'Report\ReturnTotalShop';                                      // ����� (�������)
  SEnvdTotalShop = 'Report\EnvdTotalShop';                                          // ����� (����)
  SPublicUtilitiesTotalShop = 'Report\PublicUtilitiesTotalShop';                    // ����� (������������ ������)


              // -- ���������� ������ --//
  SSearchHeader                      = 'Report\ReportSearch\SearchHeader';                         // ����� �� ����������� ������ (�� ���������)
  SSearchIncomeDetail                = 'Report\ReportSearch\SearchIncomeDetail';                   // ����� �� ��������� ��������� (�������)
  SSearchOffsDetail                  = 'Report\ReportSearch\SearchOffsDetail';                     // ����� �� ��������� ��������� (��������)
  SSearchReturnDetail                = 'Report\ReportSearch\SearchReturnDetail';                   // ����� �� ��������� ��������� (�������)
  SSearchEnvdDetail                  = 'Report\ReportSearch\SearchEnvdDetail';                     // ����� �� ��������� ��������� (����)
  SSearchExpenseDetail               = 'Report\ReportSearch\SearchExpenseDetail';                  // ����� �� ��������� ��������� (�������, ������� (������))
  SSearchExpenseZpDetail             = 'Report\ReportSearch\SearchExpenseZpDetail';                // ����� �� ��������� ��������� (������� ��)
  SSearchZpAupDetail                 = 'Report\ReportSearch\SearchZpAupDetail';                    // ����� �� ��������� ��������� (�� ���)
  SSearchTaxToZpDetail               = 'Report\ReportSearch\SearchTaxToZpDetail';                  // ����� �� ��������� ��������� (������ �� ��)
  SSearchPercentOfTerminalDetail     = 'Report\ReportSearch\SearchPercentOfTerminalDetail';        // ����� �� ��������� ��������� (������� �� ���������)
  SSearchShipmentDetail              = 'Report\ReportSearch\SearchShipmentDetail';                 // ����� �� ��������� ��������� (��������)
  SSearchPublicUtilitiesDetail       = 'Report\ReportSearch\SearchPublicUtilitiesDetail';          // ����� �� ��������� ��������� (������������ ������)

           // -- ����� -- //

  SOperationsCashBox                 = 'Report\OperationsCashBox';                                 // �������� �� �����
  SDetailCashBox                     = 'Report\DetailCashBox';                                     // ����������� �� �����


implementation

uses AddModule, Globals, Main;

end.
