object SearchForm: TSearchForm
  Left = 513
  Top = 251
  Width = 961
  Height = 481
  BorderStyle = bsSizeToolWin
  Caption = #1052#1086#1076#1091#1083#1100' '#1087#1086#1080#1089#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 945
    Height = 138
    Align = alTop
    Caption = #1042#1099#1073#1086#1088' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1087#1086#1080#1089#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 25
      Width = 45
      Height = 13
      Caption = #1052#1086#1076#1091#1083#1100
    end
    object Label5: TLabel
      Left = 10
      Top = 76
      Width = 86
      Height = 13
      Caption = #1058#1077#1082#1089#1090' '#1087#1086#1080#1089#1082#1072':'
    end
    object Label2: TLabel
      Left = 10
      Top = 51
      Width = 50
      Height = 13
      Caption = #1057#1090#1086#1083#1073#1077#1094
    end
    object Bevel1: TBevel
      Left = 354
      Top = 22
      Width = 218
      Height = 108
    end
    object Label6: TLabel
      Left = 360
      Top = 37
      Width = 72
      Height = 13
      Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
    end
    object Label9: TLabel
      Left = 360
      Top = 69
      Width = 68
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    end
    object Label10: TLabel
      Left = 360
      Top = 102
      Width = 75
      Height = 13
      Caption = #1042#1080#1076' '#1101#1085#1077#1088#1075#1080#1080
    end
    object ModulsCombo: TComboBox
      Left = 62
      Top = 21
      Width = 161
      Height = 21
      Cursor = crHandPoint
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ModulsComboChange
    end
    object FindEdit: TEdit
      Left = 96
      Top = 74
      Width = 125
      Height = 21
      Cursor = crHandPoint
      Enabled = False
      TabOrder = 2
    end
    object FindBtn: TBitBtn
      Left = 867
      Top = 22
      Width = 75
      Height = 20
      Cursor = crHandPoint
      Caption = #1053#1072#1081#1090#1080
      TabOrder = 11
      OnClick = FindBtnClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF001564841F1564841FFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001564
        842F146889EF146889EF1564842FFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001564841F1B6D
        8CEF1FADDBFF149FCDFF146889EF1564842FFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001564841F1D6E
        8CEF51CBE6FF22BEF0FF149FCDFF146889EF1564842FFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001564
        842F1D6E8CEF51CBE6FF22BEF0FF149FCDFF146889EF1564842FFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF001564842F1D6E8CEF51CBE6FF22BEF0FF149FCDFF146889EF5A563F7F7252
        28F2725228F67252288F7252281FFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF001564842F1D6E8CEF51CBE6FF1FADDBFF1A6783FF978972FFCDBB
        A6FFD0C2B1FFA69074FF725228FF7252285FFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF001564842F1D6E8CEF216B85FFB4AA96FFFBF4EEFFFDF9
        F5FFFEFCF9FFFEFEFCFFE4DED6FF7A5C35FF7252283FFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF005D563C8F9F8969FFF3DBC4FFF4E1D0FFF7EA
        DDFFFAF2EBFFFDFAF7FFFFFEFCFFB8A790FF725228AFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00866339FFDAB188FFEDD0B4FFF2DCC7FFF5E6
        D6FFF8EEE3FFFAF3ECFFFDF8F3FFE4DACCFF725228EFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00866339FFDDB289FFECCAA9FFEFD6BDFFF3DF
        CCFFF5E6D7FFF7EBDFFFFAF0E5FFF4EADCFF725228FFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00856238D1C49B71FFEEC6A1FFF6E7D9FFF6E7
        D8FFF2DDC8FFF3E1CFFFF6E7D6FFC8B69AFF725228BFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF007252283F866339FFE2B993FFFDFAF8FFFFFF
        FFFFF5E6D7FFEFD5BDFFF0D5BAFF87643BFF7252285FFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007252288F896438FFCEA075FFEBC1
        9DFFECBC93FFCF9767FF90602FFF7252289FFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007252284F725228CF7D58
        2CFF7D572AFF725228CF7252285FFFFFFF00FFFFFF00FFFFFF00}
    end
    object DopSettFindBtn: TBitBtn
      Left = 867
      Top = 42
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = #1044#1072#1090#1072
      TabOrder = 12
      OnClick = DopSettFindBtnClick
      Glyph.Data = {
        66030000424D6603000000000000360000002800000010000000110000000100
        18000000000030030000000000000000000000000000000000009D9D9D979797
        9797979797979696969797979797979797979696969797979797979696969797
        97979797949494B9B9B9BDBDBDD1D1D1CFCFCFCECECEC8C8C8CFD0D0CFCFCFCD
        CDCDCACACACFD0D0D0D0D0C7C7C7D0D0D0CFCFCFCFD0D0C6C6C6BDBDBDCECECE
        CCCDCDCCCCCCC6C7C7CDCDCDCCCDCDCBCBCBC7C8C8CDCDCDCDCDCDC5C5C5CDCD
        CDCCCCCCCDCDCDC6C6C6B9B9B9C9C9C9C7C7C7C6C6C6C2C2C2C8C8C8C7C7C7C5
        C5C5C3C6C8C8CDD0C8CACBC0C0C0C8C8C8C7C7C7C7C8C8C4C4C4C2C1C1D5D5D5
        D3D3D3D2D2D2CDCECFD4D4D4D3D3D3D2D8DBC9AFA2CF977BD1CBC8CCD2D5D4D4
        D4D3D3D3D4D4D4C9C9C9C4C4C4D8D8D8D6D6D7D6D7D7CBC1BCD8DDDFD7DADCD1
        B5A7D09273D2BEB4CD7246C8A899D8DEE1D6D6D6D8D8D8CBCBCBC1C1C1D3D3D3
        D1D2D2D0D1D2CBC9C7C99C86D3E1E8CD8F71CFCDCCD2D8DAD2E0E7CB7E57CEC7
        C3D2D4D4D2D3D3C9C9C9CACACAE0E0E0DEDEDEDDDDDDD9DEE0D3AD9AD5B8A9DA
        D1CDD09070E1E9EEDFE1E1D8D4D2D29A7FDFE5E7E0E0E0CFCFCFCDCDCDE4E3E3
        E2E1E1E0E0E0DBDBDBE5ECF0D3A893D1B09FCC9C84D9C3B8E5EBEFDCD9D7D29C
        81E3E8EAE3E3E3D0D0D0C9CACADEDFDFDCDDDDDBDBDBD6D7D7DDDDDDDEE4E7DC
        D0CAC79D88CDAB9AD0B6A8C38A6DDEDCDCDCDEDEDEDEDECECECED6D9DAF0F2F4
        EEF0F2ECEFF0E6E9EAEEF1F2EEF0F2EBF0F2E9F0F4EDF1F3E9E6E5E6EEF3EEF2
        F4EDF0F1F0F2F4D6D7D8AD9D96B6A299B5A298B4A197B19E94B5A299B5A298B4
        A197B19E95B6A399B6A49BB09D93B5A299B5A298B4A096BDB4B0BE7552CD6F41
        CE7143CD7043CA6F43CD7043CE7043CB6F43CC7043CE7143CC7043CA6F43CE70
        43CE7043CA6B3CC89B86D68862E48657D17F57DB8358ED8958D58158D27F57E9
        8859E28659D27F57DC8458ED8958D38058D28058EB8452D6A790EB8E61A66749
        2237425F4D44FF96572A3940223742E581519D654A2237426B5245FF91552136
        40203641F1814AE2AB90F6CCB7B08A77181F2268574EFFD4B4333130181F22F0
        B99EA78473181F22746055FFD1B2222526171E21FCBFA1F0D9CDFDFFFFC5CACC
        4949498D8F90FFFFFF6263634A4A4AF8FDFFBFC3C549494996999AFFFFFF5555
        554B4B4BFEFFFFFAFDFF}
    end
    object ColumnCombo: TComboBox
      Left = 64
      Top = 48
      Width = 159
      Height = 21
      Cursor = crHandPoint
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 1
      OnChange = ColumnComboChange
    end
    object RadioGroup: TRadioGroup
      Left = 230
      Top = 17
      Width = 122
      Height = 43
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 3
    end
    object NaclRBtn: TRadioButton
      Left = 235
      Top = 29
      Width = 113
      Height = 16
      Caption = #1055#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = NaclRBtnClick
    end
    object DetailRBtn: TRadioButton
      Left = 235
      Top = 43
      Width = 113
      Height = 14
      Caption = #1055#1086' '#1101#1083#1077#1084#1077#1085#1090#1072#1084
      TabOrder = 5
      OnClick = DetailRBtnClick
    end
    object GroupBox5: TGroupBox
      Left = 230
      Top = 60
      Width = 122
      Height = 47
      Caption = #1058#1080#1087' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1103
      TabOrder = 6
      object AccuracyRadio: TRadioButton
        Left = 3
        Top = 15
        Width = 111
        Height = 10
        Caption = #1058#1086#1095#1085#1086#1077
        TabOrder = 1
      end
      object EntryRadio: TRadioButton
        Left = 3
        Top = 28
        Width = 112
        Height = 13
        Caption = #1055#1086' '#1074#1093#1086#1078#1076#1077#1085#1080#1102
        Checked = True
        TabOrder = 0
        TabStop = True
      end
    end
    object PrintBtn: TBitBtn
      Left = 867
      Top = 67
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 13
      OnClick = PrintBtnClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00D87000EFD76F00FFD56F00FFD36E00FFD16E00FFCF6D
        00FFCD6D00FFCC6C00EFFFFFFF00FFFFFF00FFFFFF00FFFFFF00725228FF7252
        28FF725228FF725228FFDA7000FFFEFCFBFFFCF7F2FFF9EFE6FFF5E6D8FFF2DC
        C7FFEDD0B4FFCD6D00FF725228FF725228FF725228FF725228FF725228FFC9D0
        D3FFC9D0D3FFC9D0D3FFDC7100FFFEFEFEFFFDFBF9FFFBF6F0FFF8EEE3FFF5E4
        D4FFF1DAC3FFCF6D00FFC9D0D3FFC9D0D3FFC9D0D3FF725228FF725228FFC9D0
        D3FFA98D6AFFA78963FF763C00FF9C9C9CFFAFAFAFFFC2C1BFFFD5CFC9FFE5DA
        D0FFF0DECDFFD06E00FFA78963FFA98D6AFFC9D0D3FF725228FF725228FFD0D6
        D9FFA2845EFFF0EBE5FF572D01FF6B3700FF7B3F00FF8B4800FF9B5000FFAB59
        00FFBA6100FFC16704FFF0EBE5FFA2845EFFD0D6D9FF725228FF725228FFF1C9
        A0FF9E8059FFF1F1F1FF343434FF383837FF3B3B3AFF3E3E3DFF414140FF4444
        43FF484847FF4B4B4AFFF1F1F1FF9E8059FFF1C9A0FF725228FF725228FFF6D9
        BBFF997B54FFD3D5D6FFD1D4D5FFCDD0D1FFC9CCCDFFC4C7C9FFBFC3C4FFBABE
        C0FFB7BBBDFFB7BBBDFFB7BBBDFF997B54FFF6D9BBFF725228FF836742FFF9E7
        D4FF95764FFFFBFBFBFFF6F7F7FFEEF0F1FFE6E8E9FFDDE1E3FFD5D9DCFFCDD2
        D5FFC6CDCFFF80FDCEFFBFF5D8FF95764FFFF9E7D4FF725228FF725228FFE3D6
        C7FF90724AFFF9FAFAFFF7F8F9FFF3F4F5FFCBC4B9FFA6957EFFA3937CFFA191
        7AFFDADEE0FF01FC9DFF80EBB2FF90724AFFEBE0D3FF725228FF7252288F7252
        28FF8C6D45FFF9FAFAFFF9FAFAFFF6F7F8FFF5F6F7FFF2F3F4FFF0F2F3FFEFF1
        F2FFEEF1F1FFEEF1F1FFEFF1F2FF8C6D45FF725228FF7252285FFFFFFF00FFFF
        FF00876840EF876840FF876840FF876840FF876840FF876840FF876840FF8768
        40FF876840FF876840FF876840FF876840EFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00725228EFDA7000FFFDFBF9FFFBF6F1FFF9EFE6FFF6E8DAFFF3E0
        CDFFEFD6BEFFCF6D00FF725228EFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00DB7100FFFEFEFDFFFDFAF7FFFBF5EFFFF8EEE4FFF5E6
        D8FFF2DECAFFD06E00FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00DD7100FFFFFFFEFFFEFDFCFFFCF9F6FFFAF3EDFFDF72
        00FFDF7200FFD66F00EFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00DE7200FFFFFFFFFFFFFEFEFFFEFCFBFFFCF8F4FFDF72
        00FFD97000EFD36F002FFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00DF7200EFDE7200FFDD7100FFDB7100FFDA7000FFDC71
        00EFD670002FFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    end
    object NaznachenieCombo: TComboBox
      Left = 438
      Top = 34
      Width = 131
      Height = 21
      Cursor = crHandPoint
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 7
    end
    object SupplierCombo: TComboBox
      Left = 437
      Top = 66
      Width = 131
      Height = 21
      Cursor = crHandPoint
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 8
    end
    object TypeEnergyCombo: TComboBox
      Left = 437
      Top = 97
      Width = 131
      Height = 21
      Cursor = crHandPoint
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 9
    end
    object GroupBox6: TGroupBox
      Left = 576
      Top = 17
      Width = 290
      Height = 117
      Caption = #1055#1086' '#1084#1072#1075#1072#1079#1080#1085#1091
      TabOrder = 10
      object UidLabel: TLabel
        Left = 101
        Top = 43
        Width = 5
        Height = 13
      end
      object AdressLabel: TLabel
        Left = 51
        Top = 62
        Width = 120
        Height = 13
        AutoSize = False
        WordWrap = True
      end
      object ShopView: TListView
        Left = 2
        Top = 15
        Width = 286
        Height = 100
        Align = alClient
        Checkboxes = True
        Columns = <
          item
            Caption = 'UID'
            Width = 40
          end
          item
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 95
          end
          item
            Caption = #1040#1076#1088#1077#1089
            Width = 147
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object ShopCheck: TCheckBox
      Left = 232
      Top = 112
      Width = 97
      Height = 17
      Caption = #1055#1086' '#1084#1072#1075#1072#1079#1080#1085#1091
      TabOrder = 14
      OnClick = ShopCheckClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 138
    Width = 945
    Height = 281
    Align = alClient
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1086#1080#1089#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Bar: TStatusBar
      Left = 2
      Top = 260
      Width = 941
      Height = 19
      Panels = <
        item
          Width = 150
        end
        item
          Width = 200
        end
        item
          Width = 150
        end>
    end
    object Tabs: TPageControl
      Left = 2
      Top = 15
      Width = 941
      Height = 245
      ActivePage = TabHeader
      Align = alClient
      TabOrder = 1
      object TabHeader: TTabSheet
        Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103
        object SearchGrid: TDBGrid
          Left = 0
          Top = 0
          Width = 933
          Height = 217
          Align = alClient
          DataSource = DS_Header
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnTitleClick = SearchGridTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'UNICUM_NUM'
              Title.Caption = #1059#1085'. '#1085#1086#1084#1077#1088
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMDOC'
              Title.Caption = #1053#1086#1084#1077#1088
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATE_P_POR'
              Title.Caption = #1044#1072#1090#1072
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUM_NAL'
              Title.Caption = #1057#1091#1084#1084#1072'('#1085#1072#1083')'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUM_NOT_NAL'
              Title.Caption = #1057#1091#1084#1084#1072'('#1073#1077#1079#1085#1072#1083')'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILY'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'FAMILY_1'
              Title.Caption = #1057#1086#1079#1076#1072#1083
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CREATE_DATE'
              Title.Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076'.'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WHO_CORR'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'WHO_CORR_1'
              Title.Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1083
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATE_CORR'
              Title.Caption = #1044#1072#1090#1072' '#1082'-'#1082#1080
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TYPE_DOC'
              Title.Caption = #1058#1080#1087' '#1076'-'#1090#1072
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRIMECH'
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Width = 150
              Visible = True
            end>
        end
      end
      object TabDetails: TTabSheet
        Caption = #1069#1083#1077#1084#1077#1085#1090#1099
        ImageIndex = 1
        object DetailGrid: TDBGrid
          Left = 0
          Top = 0
          Width = 835
          Height = 217
          Align = alClient
          DataSource = DS_Detail
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnTitleClick = SearchGridTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'UNICUM_NUM'
              Title.Caption = #1059#1085'. '#1085#1086#1084#1077#1088
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMDOC'
              Title.Caption = #1053#1086#1084#1077#1088
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATE_P_POR'
              Title.Caption = #1044#1072#1090#1072
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_PREDM'
              Title.Caption = 'NN'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'UID_SHOP'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = #1052#1072#1075#1072#1079#1080#1085
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Adress'
              Title.Caption = #1040#1076#1088#1077#1089
              Width = 133
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUM_NAL'
              Title.Caption = #1057#1091#1084#1084#1072' ('#1085#1072#1083')'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUM_NOT_NAL'
              Title.Caption = #1057#1091#1084#1084#1072' ('#1073#1077#1079#1085#1072#1083')'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILY_1'
              Title.Caption = #1057#1086#1079#1076#1072#1090#1077#1083#1100
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CREATE_DATE'
              Title.Caption = #1044#1072#1090#1072' '#1089#1086#1079'-'#1080#1103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAZNACHENIE'
              Title.Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RECIPIENT'
              Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUPPLIER'
              Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TYPE_ENERGY'
              Title.Caption = #1058#1080#1087' '#1101#1085#1077#1088#1075#1080#1080
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRIMECH'
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILY'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TYPE_DOC'
              Title.Caption = #1058#1080#1087' '#1076'-'#1090#1072
              Visible = True
            end>
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 419
    Width = 945
    Height = 24
    Align = alBottom
    TabOrder = 2
  end
  object DopSettingPanel: TPanel
    Left = -167
    Top = 1
    Width = 170
    Height = 135
    Color = clActiveBorder
    TabOrder = 3
    object GroupBox2: TGroupBox
      Left = 3
      Top = 1
      Width = 162
      Height = 132
      Caption = #1044#1072#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Bevel2: TBevel
        Left = 8
        Top = 16
        Width = 149
        Height = 88
      end
      object Label3: TLabel
        Left = 16
        Top = 50
        Width = 9
        Height = 13
        Caption = #1057
      end
      object Label4: TLabel
        Left = 17
        Top = 76
        Width = 17
        Height = 13
        Caption = #1055#1086
      end
      object HintPanelBtn: TBitBtn
        Left = 136
        Top = 108
        Width = 23
        Height = 21
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = HintPanelBtnClick
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7F8FCFC
          FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBFCFA
          FAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFD
          D3B2A5DBD3D0FAFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFDBC1B6D4BFB6F4F6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFCEA89AAA5A39D3C2BBFBFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE2D0C9AF6749C29786F4F9FBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFDFFFFCCA798B77B64B26E53D4C4BDFBFDFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFDAC0B6B67962B87F68C49C8CF5F9FBFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFDFEFFD0AD9FB97F69BD8B78AC6348D4C5BFFBFD
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAC1B7B98069BE8B78B17057C59E8EF5
          F9FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDA89AB87F68BD8976B27862
          A95E41D5C7C0FBFDFEFFFFFFFFFFFFFFFFFFFFFFFFE2D1CBB57862BC8976B67D
          69AC674BC59F91F5F9FBFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFCCA99CB47760BB
          8773B2755FAF715AAA6043D5C7C1FBFDFEFFFFFFFFFFFFFFFFFFDBC2B9B47962
          BC8875B47963AF7159AC674EC6A192F5F9FBFFFFFFFFFFFFFFFFFFFDFEFFD0AF
          A2B87F68BA8572B2765FAF7159B0725BAA6145D5C7C2FBFDFEFFFFFFFFFFFFDB
          C3BAB9816BBB8672B37762AF715AAF725BAD674EC6A193F5F9FBFFFFFFFFFFFF
          FFFFFFCDAB9FBA826CBE8975B37760B0735CAF725BAF725BA96145D5C8C2FCFE
          FFFFFFFFE2D3CDB87D66BE8A75B77D67B0725BB0715AAF715AAC684FC5A294F5
          F9FBFFFFFFFDFFFFCDACA0BB7F68C28F79B97D67B67A63B57861B3765FB2755E
          AB6248D5C9C3FBFFFFDBC6BDBA816BC4907BBB816AB67A63B57962B47760B275
          5FAD6A50C6A396F4F9FAFDFDFED4B5AAC08973C7927DBF856FBB8069BA7F68B9
          7D66B77B64B67A63AD664BD8CECBDCCAC2BF8B75C7937EC08670BC8169BA7F68
          B97E67B87C65B67A63AF6D54C6A396F4F9FAEFE5E0B87C66CC9A85C38972C187
          6FBE856DBE836DBD816ABB7F68B97E68AE694EDCD6D3B2715ACF9D8AC48D76C0
          876FC0866EBE846CBD826BBB8069B97E67B37158C6A397F4F9FAFCFAF9D1AE9F
          C99884C89079C58C75C38A74C28A72C08670BE856EBE846DB16C53D8CFCCD9BD
          B3C79681C9947EC58C73C48C75C28A72C08870BF866EBE846DB7765DC6A498F4
          F9FAFFFFFFFAF8F6D1AB9FCB9A84CB967FC78F77C58E76C48C74C28A72C28971
          B37055D4C8C4FCFFFFDBBFB4C99986CE9982C78E76C68E77C48C75C38A73C189
          71B97A61C5A498F4F8FAFFFFFFFFFFFFFEFFFFCA9F8ED09F8ACC967FC89179C8
          9078C68E76C68D76B47259D5C8C3FCFFFFFFFFFFD8BBB0CB9884D09C86C89078
          C89079C78E77C58D75BC7E66C5A499F4F8FAFFFFFFFFFFFFFFFFFFFEFEFED2B0
          A3D4A998CF9A82CC947CCA937CCA947BB7775CD5C8C4FBFDFEFFFFFFFFFFFFD8
          BCB1CFA392D3A18BCB937CCA947CC9927BBF836AC5A599F4F8FAFFFFFFFFFFFF
          FFFFFFFFFFFFFAF6F5D3B0A4D6AA97D29F88CC967ECE9881B97960D4C7C4FBFD
          FEFFFFFFFFFFFFFFFFFFDBC0B7D3A897D5A48ECD967ECD987FC3866EC4A59AF4
          F8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFECDA597D9AF9DD29F87D19A83
          BA7B63D4C8C4FBFDFEFFFFFFFFFFFFFFFFFFFFFFFFD8BCB2D4A997D8A792CF99
          81C68B72C4A59BF4F8F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFED5
          B4A9DEB9A9D9A58DBB7E65D4C8C5FBFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          D8BDB4D9B2A3DBAD98C88D74C3A69BF4F8F9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF9F6F5D5B6ABE1BCABC38A74D2C6C2FBFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFDCC3BADCB8A9D29F8AC3A49AF4F7F9FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFCD2B0A3BF8A78D8CAC7FCFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAC1B6CEA28FC5A69BF7
          FBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFE
          C7A093EFE5E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFD1B2A9DCC3BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      end
      object OnRbtn: TRadioButton
        Left = 13
        Top = 30
        Width = 40
        Height = 17
        Caption = 'On'
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        OnClick = OnRbtnClick
      end
      object OffRbtn: TRadioButton
        Left = 55
        Top = 30
        Width = 40
        Height = 17
        Caption = 'Off'
        Checked = True
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 2
        TabStop = True
        OnClick = OffRbtnClick
      end
      object BegPicker: TDateTimePicker
        Left = 39
        Top = 46
        Width = 90
        Height = 19
        Cursor = crHandPoint
        Date = 43475.700432881950000000
        Time = 43475.700432881950000000
        TabOrder = 3
      end
      object EndPicker: TDateTimePicker
        Left = 39
        Top = 73
        Width = 90
        Height = 18
        Cursor = crHandPoint
        Date = 43475.700432881950000000
        Time = 43475.700432881950000000
        TabOrder = 4
      end
    end
  end
  object HeaderSet: TADODataSet
    Connection = AppData.Connection
    Parameters = <>
    Left = 72
    Top = 242
    object HeaderSetUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object HeaderSetNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object HeaderSetDATE_P_POR: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object HeaderSetSUM_NAL: TFloatField
      FieldName = 'SUM_NAL'
      DisplayFormat = '#,###,###.###'
    end
    object HeaderSetSUM_NOT_NAL: TFloatField
      FieldName = 'SUM_NOT_NAL'
      DisplayFormat = '#,###,###.###'
    end
    object HeaderSetFAMILY: TStringField
      FieldName = 'FAMILY'
      Visible = False
    end
    object HeaderSetFAMILY_1: TStringField
      FieldName = 'FAMILY_1'
      Size = 100
    end
    object HeaderSetCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object HeaderSetWHO_CORR: TStringField
      FieldName = 'WHO_CORR'
      Visible = False
      Size = 100
    end
    object HeaderSetWHO_CORR_1: TStringField
      FieldName = 'WHO_CORR_1'
      Size = 100
    end
    object HeaderSetDATE_CORR: TDateTimeField
      FieldName = 'DATE_CORR'
    end
    object HeaderSetTYPE_DOC: TStringField
      FieldName = 'TYPE_DOC'
      Size = 10
    end
    object HeaderSetPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 250
    end
  end
  object DS_Header: TDataSource
    AutoEdit = False
    DataSet = HeaderSet
    Left = 72
    Top = 293
  end
  object ModulsSet: TADODataSet
    Connection = AppData.Connection
    BeforeOpen = ModulsSetBeforeOpen
    Parameters = <>
    Left = 204
    Top = 242
    object ModulsSetUID: TIntegerField
      FieldName = 'UID'
    end
    object ModulsSetNAME: TStringField
      FieldName = 'NAME'
    end
  end
  object Naznachenie: TADODataSet
    Connection = AppData.Connection
    Parameters = <>
    Left = 274
    Top = 242
    object NaznachenieUID: TIntegerField
      FieldName = 'UID'
    end
    object NaznacheniesName: TStringField
      FieldName = 'sName'
      Size = 50
    end
  end
  object PanelTimer: TTimer
    Interval = 10
    OnTimer = PanelTimerTimer
    Left = 384
    Top = 121
  end
  object ColumnSet: TADODataSet
    Connection = AppData.Connection
    Parameters = <>
    Left = 348
    Top = 243
    object ColumnSetCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Size = 100
    end
  end
  object DetailSet: TADODataSet
    Connection = AppData.Connection
    Parameters = <>
    Left = 139
    Top = 242
    object DetailSetUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object DetailSetNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object DetailSetDATE_P_POR: TDateTimeField
      FieldName = 'DATE_P_POR'
    end
    object DetailSetNUM_PREDM: TIntegerField
      FieldName = 'NUM_PREDM'
    end
    object DetailSetUID_SHOP: TIntegerField
      FieldName = 'UID_SHOP'
    end
    object DetailSetNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object DetailSetAdress: TStringField
      FieldName = 'Adress'
      Size = 100
    end
    object DetailSetSUM_NAL: TFloatField
      FieldName = 'SUM_NAL'
      DisplayFormat = '#,###,###.###'
    end
    object DetailSetSUM_NOT_NAL: TFloatField
      FieldName = 'SUM_NOT_NAL'
      DisplayFormat = '#,###,###.###'
    end
    object DetailSetCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object DetailSetFAMILY: TStringField
      FieldName = 'FAMILY'
    end
    object DetailSetFAMILY_1: TStringField
      FieldName = 'FAMILY_1'
      Size = 100
    end
    object DetailSetPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 250
    end
    object DetailSetRECIPIENT: TStringField
      FieldName = 'RECIPIENT'
      Size = 50
    end
    object DetailSetNAZNACHENIE: TStringField
      FieldName = 'NAZNACHENIE'
      Size = 50
    end
    object DetailSetSUPPLIER: TStringField
      FieldName = 'SUPPLIER'
      Size = 100
    end
    object DetailSetTYPE_ENERGY: TStringField
      FieldName = 'TYPE_ENERGY'
      Size = 100
    end
    object DetailSetTYPE_DOC: TStringField
      FieldName = 'TYPE_DOC'
      Size = 5
    end
  end
  object DS_Detail: TDataSource
    DataSet = DetailSet
    Left = 136
    Top = 292
  end
  object Report: TFlexCelReport
    AutoClose = False
    Adapter = Adapter
    DataModule = Owner
    Left = 454
    Top = 241
  end
  object Adapter: TOLEAdapter
    SaveFormatExtended = []
    Left = 454
    Top = 289
  end
  object SuppliersSet: TADODataSet
    Connection = AppData.Connection
    Parameters = <>
    Left = 273
    Top = 291
    object SuppliersSetUID: TIntegerField
      FieldName = 'UID'
    end
    object SuppliersSetsName: TStringField
      FieldName = 'sName'
      Size = 100
    end
  end
  object TypeEnergySet: TADODataSet
    Connection = AppData.Connection
    Parameters = <>
    Left = 270
    Top = 341
    object TypeEnergySetUID: TIntegerField
      FieldName = 'UID'
    end
    object TypeEnergySetName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
end
