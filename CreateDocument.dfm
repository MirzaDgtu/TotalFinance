object CreateDocmentForm: TCreateDocmentForm
  Left = 686
  Top = 102
  BorderStyle = bsToolWindow
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 531
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 497
    Width = 456
    Height = 34
    Align = alBottom
    TabOrder = 0
    object SaveBtn: TBitBtn
      Left = 4
      Top = 6
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = SaveBtnClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 456
    Height = 26
    Align = alTop
    TabOrder = 1
    object N_Plat_PorEdit: TEdit
      Left = 4
      Top = 3
      Width = 78
      Height = 21
      TabOrder = 0
    end
    object DateTimePicker1: TDateTimePicker
      Left = 87
      Top = 2
      Width = 83
      Height = 21
      Date = 43379.642626585650000000
      Time = 43379.642626585650000000
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 478
    Width = 456
    Height = 19
    Panels = <>
  end
  object DetailStringGrid: TStringGrid
    Left = 0
    Top = 26
    Width = 456
    Height = 452
    Align = alClient
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goEditing, goTabs, goRowSelect]
    ParentFont = False
    PopupMenu = PopMenuSave
    TabOrder = 3
    ColWidths = (
      64
      64
      177
      64
      64)
  end
  object PopMenuSave: TPopupMenu
    Left = 176
    Top = 184
    object N1: TMenuItem
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100
    end
    object N2: TMenuItem
      Caption = '&'#1053#1077' '#1089#1086#1093#1088#1072#1085#1103#1090#1100
    end
  end
end
