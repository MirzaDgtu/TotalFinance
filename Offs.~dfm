object OffsForm: TOffsForm
  Left = 651
  Top = 256
  Width = 680
  Height = 441
  BorderStyle = bsSizeToolWin
  Caption = 'OffsForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 377
    Width = 664
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
      Left = 197
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
    Width = 664
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
      Left = 429
      Top = 5
      Width = 74
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object MonthCombo: TComboBox
      Left = 267
      Top = 2
      Width = 86
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = '['#1042#1099#1073#1088#1072#1090#1100']'
      OnChange = MonthComboChange
      Items.Strings = (
        '['#1042#1099#1073#1088#1072#1090#1100']'
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object DatePicker: TDateTimePicker
      Left = 169
      Top = 2
      Width = 83
      Height = 21
      Date = 43399.000000000000000000
      Time = 43399.000000000000000000
      Enabled = False
      TabOrder = 1
    end
    object NumDocEdit: TEdit
      Left = 54
      Top = 3
      Width = 83
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object PrimechEdit: TEdit
      Left = 514
      Top = 3
      Width = 142
      Height = 21
      TabOrder = 3
    end
    object YearSpinEdit: TSpinEdit
      Left = 361
      Top = 2
      Width = 55
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 4
      Value = 0
      OnChange = MonthComboChange
    end
  end
  object Bar: TStatusBar
    Left = 0
    Top = 358
    Width = 664
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
  object OffsStringGrid: TStringGrid
    Left = 0
    Top = 27
    Width = 664
    Height = 331
    Align = alClient
    ColCount = 6
    RowCount = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing, goTabs]
    PopupMenu = PopupRowMenu
    TabOrder = 3
    OnKeyPress = OffsStringGridKeyPress
    OnSelectCell = OffsStringGridSelectCell
    ColWidths = (
      64
      64
      64
      64
      64
      64)
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
