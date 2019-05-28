object ShipmentForm: TShipmentForm
  Left = 610
  Top = 299
  BorderStyle = bsToolWindow
  Caption = 'ShipmentForm'
  ClientHeight = 363
  ClientWidth = 878
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 337
    Width = 878
    Height = 26
    Align = alBottom
    TabOrder = 0
    object SaveBtn: TBitBtn
      Left = 5
      Top = 1
      Width = 61
      Height = 22
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = SaveBtnClick
    end
    object DeleteBtn: TBitBtn
      Left = 133
      Top = 1
      Width = 61
      Height = 22
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = DeleteBtnClick
    end
    object AddBtn: TBitBtn
      Left = 70
      Top = 1
      Width = 61
      Height = 22
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = AddBtnClick
    end
    object PrintBtn: TBitBtn
      Left = 196
      Top = 1
      Width = 61
      Height = 22
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 3
      OnClick = PrintBtnClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 878
    Height = 27
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 147
      Top = 6
      Width = 17
      Height = 13
      Caption = #1053#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 7
      Width = 40
      Height = 13
      Caption = #1053#1086#1084#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 511
      Top = 5
      Width = 155
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ShipmentPicker: TDateTimePicker
      Left = 169
      Top = 2
      Width = 83
      Height = 21
      Date = 43399.000000000000000000
      Time = 43399.000000000000000000
      TabOrder = 0
    end
    object NumDocEdit: TEdit
      Left = 54
      Top = 3
      Width = 83
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object PrimechEdit: TEdit
      Left = 676
      Top = 3
      Width = 200
      Height = 21
      TabOrder = 2
    end
  end
  object Bar: TStatusBar
    Left = 0
    Top = 318
    Width = 878
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object ShipmentStringGrid: TStringGrid
    Left = 0
    Top = 27
    Width = 878
    Height = 291
    Align = alClient
    ColCount = 8
    RowCount = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing, goTabs]
    PopupMenu = PopupRowMenu
    TabOrder = 3
    OnKeyPress = ShipmentStringGridKeyPress
    OnSelectCell = ShipmentStringGridSelectCell
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      64)
  end
  object SuppliersCombo: TComboBox
    Left = 532
    Top = 32
    Width = 105
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 4
    Visible = False
    OnChange = SuppliersComboChange
    OnExit = SuppliersComboExit
    Items.Strings = (
      #1040#1074#1072#1085#1089
      #1040#1088#1077#1085#1076#1072
      #1042#1099#1074#1086#1079' '#1084#1091#1089#1086#1088#1072
      #1043#1057#1052
      #1044#1085#1080' '#1056#1086#1078#1076#1077#1085#1080#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      #1044#1086#1087#1083#1072#1090#1099
      #1044#1086#1088#1086#1075#1072
      #1047#1072#1088#1087#1083#1072#1090#1072
      #1050#1072#1088#1090#1099' '#1087#1077#1088#1077#1074#1086#1076' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084
      #1050#1086#1084#1080#1089#1089#1080#1103
      #1050#1086#1084#1084#1091#1085#1072#1083#1100#1085#1099#1077' '#1091#1089#1083#1091#1075#1080
      #1054#1074#1086#1097#1080
      #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084
      #1054#1090#1087#1091#1089#1082#1085#1099#1077
      #1055#1086#1076#1086#1090#1095#1077#1090
      #1055#1088#1077#1084#1080#1080
      #1057#1090#1088#1086#1081#1084#1072#1090#1077#1088#1080#1072#1083#1099
      #1059#1074#1086#1083#1100#1085#1077#1085#1080#1077
      #1061#1086#1079'. '#1085#1091#1078#1076#1099' '#1084#1072#1075#1072#1079#1080#1085#1099)
  end
  object PopupSaveMenu: TPopupMenu
    Images = MainForm.ImageList
    Left = 248
    Top = 208
    object SavePop: TMenuItem
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100
      SubMenuImages = MainForm.ImageList
      ImageIndex = 16
      ShortCut = 16467
      OnClick = SavePopClick
    end
    object SaveNoPop: TMenuItem
      Caption = '&'#1053#1077' '#1089#1086#1093#1088#1072#1085#1103#1090#1100
      SubMenuImages = MainForm.ImageList
      ImageIndex = 17
      OnClick = SaveNoPopClick
    end
  end
  object SuppliersSet: TADODataSet
    Connection = AppData.Connection
    Parameters = <>
    Left = 648
    Top = 40
    object SuppliersSetUID: TIntegerField
      FieldName = 'UID'
    end
    object SuppliersSetsName: TStringField
      FieldName = 'sName'
      Size = 50
    end
  end
  object PopupRowMenu: TPopupMenu
    Images = MainForm.ImageList
    Left = 360
    Top = 200
    object AddPopup: TMenuItem
      Caption = '&'#1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 15
    end
    object DeletePopup: TMenuItem
      Caption = '&'#1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 14
    end
  end
end
