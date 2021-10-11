object frmGain: TfrmGain
  Left = 263
  Top = 114
  Width = 870
  Height = 515
  Caption = #1044#1086#1093#1086#1076#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFilter: TPanel
    Left = 0
    Top = 0
    Width = 190
    Height = 488
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvNone
    Constraints.MinWidth = 190
    TabOrder = 0
    OnResize = pnlFilterResize
    object lblGainType: TLabel
      Left = 10
      Top = 30
      Width = 60
      Height = 13
      Caption = #1042#1080#1076' '#1076#1086#1093#1086#1076#1072':'
    end
    object lblPeriod: TLabel
      Left = 10
      Top = 150
      Width = 38
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076
    end
    object lblPeriodStart: TLabel
      Left = 10
      Top = 170
      Width = 9
      Height = 13
      Caption = 'c:'
    end
    object lblPeriodEnd: TLabel
      Left = 10
      Top = 195
      Width = 15
      Height = 13
      Caption = #1087#1086':'
    end
    object lblError: TLabel
      Left = 10
      Top = 240
      Width = 131
      Height = 26
      Caption = #1055#1088#1086#1074#1077#1088#1100#1090#1077' '#1082#1086#1088#1088#1077#1082#1090#1085#1086#1089#1090#1100' '#13#10#1079#1085#1072#1095#1077#1085#1080#1081' '#1076#1072#1090#1099'!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblGroupCriterion: TLabel
      Left = 10
      Top = 70
      Width = 129
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1087#1086':'
    end
    object lblComment: TLabel
      Left = 10
      Top = 110
      Width = 73
      Height = 13
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    end
    object sbStartPeriodBegin: TSpeedButton
      Left = 133
      Top = 165
      Width = 19
      Height = 19
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1077#1088#1074#1099#1081' '#1076#1077#1085#1100' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1076#1086#1093#1086#1076#1086#1074
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A004A4A4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A004A4A
        4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A00A5A54A004A4A
        4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF00FF00FF004A4A4A00A5A54A00A5A54A004A4A
        4A004A4A4A004A4A4A004A4A4A004A4A4A00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF004A4A4A00A5A54A00A5A54A00A5A54A00A5A5
        4A00A5A54A00A5A54A00A5A54A004A4A4A00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF004A4A4A00A5A54A00A5A54A00A5A54A00A5A54A00A5A5
        4A00A5A54A00A5A54A00A5A54A004A4A4A00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF004A4A4A00A5A54A00A5A54A00A5A54A00A5A5
        4A00A5A54A00A5A54A00A5A54A004A4A4A00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF00FF00FF004A4A4A00A5A54A00A5A54A004A4A
        4A004A4A4A004A4A4A004A4A4A004A4A4A00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A00A5A54A004A4A
        4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A004A4A
        4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A004A4A4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbStartPeriodBeginClick
    end
    object sbStartPeriodEnd: TSpeedButton
      Left = 133
      Top = 190
      Width = 19
      Height = 19
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1077#1088#1074#1099#1081' '#1076#1077#1085#1100' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1076#1086#1093#1086#1076#1086#1074
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A004A4A4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A004A4A
        4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A00A5A54A004A4A
        4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF00FF00FF004A4A4A00A5A54A00A5A54A004A4A
        4A004A4A4A004A4A4A004A4A4A004A4A4A00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF004A4A4A00A5A54A00A5A54A00A5A54A00A5A5
        4A00A5A54A00A5A54A00A5A54A004A4A4A00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF004A4A4A00A5A54A00A5A54A00A5A54A00A5A54A00A5A5
        4A00A5A54A00A5A54A00A5A54A004A4A4A00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF004A4A4A00A5A54A00A5A54A00A5A54A00A5A5
        4A00A5A54A00A5A54A00A5A54A004A4A4A00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF00FF00FF004A4A4A00A5A54A00A5A54A004A4A
        4A004A4A4A004A4A4A004A4A4A004A4A4A00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A00A5A54A004A4A
        4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A00A5A54A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A004A4A
        4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A004A4A4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A
        4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbStartPeriodEndClick
    end
    object sbEndPeriodBegin: TSpeedButton
      Left = 155
      Top = 165
      Width = 19
      Height = 19
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1081' '#1076#1077#1085#1100' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1076#1086#1093#1086#1076#1086#1074
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF004A4A4A004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A004A4A4A00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A00A5A54A004A4A4A00FF00
        FF00FF00FF00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A00A5A54A00A5A54A004A4A
        4A00FF00FF00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF004A4A4A00A5A54A00A5A54A00A5A54A00A5A54A00A5A54A00A5A54A00A5A5
        4A004A4A4A00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF004A4A4A00A5A54A00A5A54A00A5A54A00A5A54A00A5A54A00A5A54A00A5A5
        4A00A5A54A004A4A4A00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF004A4A4A00A5A54A00A5A54A00A5A54A00A5A54A00A5A54A00A5A54A00A5A5
        4A004A4A4A00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A00A5A54A00A5A54A004A4A
        4A00FF00FF00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A00A5A54A004A4A4A00FF00
        FF00FF00FF00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A004A4A4A00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF004A4A4A004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbEndPeriodBeginClick
    end
    object sbEndPeriodEnd: TSpeedButton
      Left = 155
      Top = 190
      Width = 19
      Height = 19
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1081' '#1076#1077#1085#1100' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1076#1086#1093#1086#1076#1086#1074
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF004A4A4A004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A004A4A4A00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A00A5A54A004A4A4A00FF00
        FF00FF00FF00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A00A5A54A00A5A54A004A4A
        4A00FF00FF00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF004A4A4A00A5A54A00A5A54A00A5A54A00A5A54A00A5A54A00A5A54A00A5A5
        4A004A4A4A00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF004A4A4A00A5A54A00A5A54A00A5A54A00A5A54A00A5A54A00A5A54A00A5A5
        4A00A5A54A004A4A4A00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF004A4A4A00A5A54A00A5A54A00A5A54A00A5A54A00A5A54A00A5A54A00A5A5
        4A004A4A4A00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A00A5A54A00A5A54A004A4A
        4A00FF00FF00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A00A5A54A004A4A4A00FF00
        FF00FF00FF00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A004A4A4A00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00A5A54A004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF004A4A4A004A4A4A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbEndPeriodEndClick
    end
    object pnlFilterTop: TPanel
      Left = 1
      Top = 1
      Width = 188
      Height = 19
      Align = alTop
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080
      TabOrder = 0
    end
    object cbGainType: TDBComboBoxEh
      Left = 12
      Top = 45
      Width = 170
      Height = 19
      DropDownBox.Rows = 20
      EditButtons = <>
      Flat = True
      TabOrder = 1
      Visible = True
      OnChange = cbGainTypeChange
    end
    object cbGroupCriterion: TDBComboBoxEh
      Left = 10
      Top = 85
      Width = 170
      Height = 19
      EditButtons = <>
      Flat = True
      Items.Strings = (
        #1076#1085#1103#1084
        #1085#1077#1076#1077#1083#1103#1084
        #1084#1077#1089#1103#1094#1072#1084
        #1075#1086#1076#1072#1084)
      KeyItems.Strings = (
        #1085#1077#1076#1077#1083#1103#1084
        #1076#1077#1082#1072#1076#1072#1084
        #1084#1077#1089#1103#1094#1072#1084
        #1075#1086#1076#1072#1084)
      TabOrder = 2
      Visible = True
      OnChange = cbGainTypeChange
    end
    object pnlExclude: TPanel
      Left = 1
      Top = 287
      Width = 188
      Height = 200
      Align = alBottom
      TabOrder = 5
      object GridGainType: TDBGridEh
        Left = 1
        Top = 20
        Width = 186
        Height = 179
        Align = alClient
        DataSource = dsGainType
        Flat = True
        FooterColor = clInfoBk
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
        PopupMenu = pmGainType
        ReadOnly = True
        RowHeight = 2
        RowLines = 1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnCellClick = GridGainTypeCellClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'EXCLUDE'
            Footers = <>
            KeyList.Strings = (
              'true'
              'false')
            Title.Caption = '.'
            Width = 15
          end
          item
            EditButtons = <>
            FieldName = 'GAIN_TYPE'
            Footers = <>
            Title.Caption = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1072
            Width = 165
          end
          item
            EditButtons = <>
            FieldName = 'GAIN_TYPE_ID'
            Footers = <>
            Title.Caption = 'ID'
            Visible = False
            Width = 30
          end>
      end
      object pnlGainTypeTitle: TPanel
        Left = 1
        Top = 1
        Width = 186
        Height = 19
        Align = alTop
        BevelOuter = bvLowered
        Caption = #1042#1080#1076#1099' '#1076#1086#1093#1086#1076#1086#1074
        TabOrder = 1
      end
    end
    object cbDopParam: TCheckBox
      Left = 10
      Top = 270
      Width = 171
      Height = 17
      Hint = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100'/'#1089#1082#1088#1099#1090#1100' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
      TabOrder = 4
      OnClick = cbDopParamClick
    end
    object edComment: TDBEditEh
      Left = 10
      Top = 125
      Width = 170
      Height = 19
      EditButtons = <>
      Flat = True
      TabOrder = 3
      Visible = True
      OnChange = cbGainTypeChange
    end
    object edPeriodBegin: TDBDateTimeEditEh
      Left = 30
      Top = 165
      Width = 100
      Height = 19
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 6
      Visible = True
      OnChange = edPeriodBeginChange
    end
    object edPeriodEnd: TDBDateTimeEditEh
      Left = 30
      Top = 190
      Width = 100
      Height = 19
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 7
      Visible = True
      OnChange = edPeriodBeginChange
    end
    object cdPeriod: TDBComboBoxEh
      Left = 10
      Top = 215
      Width = 170
      Height = 19
      DropDownBox.Rows = 10
      EditButtons = <>
      Flat = True
      Items.Strings = (
        '['#1087#1088#1086#1080#1079#1074#1086#1083#1100#1085#1099#1081' '#1087#1077#1088#1080#1086#1076']'
        #1090#1077#1082#1091#1097#1072#1103' '#1085#1077#1076#1077#1083#1103
        #1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
        #1090#1077#1082#1091#1097#1080#1081' '#1075#1086#1076
        #1087#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1085#1077#1076#1077#1083#1103
        #1087#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
        #1087#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1075#1086#1076
        #1074#1077#1089#1100' '#1087#1077#1088#1080#1086#1076)
      KeyItems.Strings = (
        '['#1087#1088#1086#1080#1079#1074#1086#1083#1100#1085#1099#1081' '#1087#1077#1088#1080#1086#1076']'
        #1090#1077#1082#1091#1097#1072#1103' '#1085#1077#1076#1077#1083#1103
        #1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
        #1090#1077#1082#1091#1097#1080#1081' '#1075#1086#1076
        #1087#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1085#1077#1076#1077#1083#1103
        #1087#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
        #1087#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1075#1086#1076
        #1074#1077#1089#1100' '#1087#1077#1088#1080#1086#1076)
      TabOrder = 8
      Visible = True
      OnChange = cdPeriodChange
    end
  end
  object RxSplitter: TRxSplitter
    Left = 190
    Top = 0
    Width = 4
    Height = 488
    ControlFirst = pnlFilter
    Align = alLeft
    BevelOuter = bvNone
  end
  object Pages: TPageControl
    Left = 194
    Top = 0
    Width = 668
    Height = 488
    ActivePage = tsGain
    Align = alClient
    TabIndex = 0
    TabOrder = 2
    OnChange = PagesChange
    object tsGain: TTabSheet
      Caption = #1044#1086#1093#1086#1076#1099
      object GridGain: TDBGridEh
        Left = 0
        Top = 23
        Width = 660
        Height = 437
        Align = alClient
        DataSource = dsGain
        Flat = True
        FooterColor = clInfoBk
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
        PopupMenu = pmGain
        RowHeight = 2
        RowLines = 1
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnDblClick = AcEditExecute
        OnGetCellParams = GridGainGetCellParams
        OnSortMarkingChanged = GridGainSortMarkingChanged
        Columns = <
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'UNACCOUNTED'
            Footer.ValueType = fvtCount
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            ReadOnly = True
            Title.Caption = #1053#1077#1091#1095#1090'. '#1088#1072#1089#1093#1086#1076
            Title.TitleButton = True
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'GAIN_ID'
            Footer.Alignment = taLeftJustify
            Footer.Value = #1079#1072#1087#1080#1089#1077#1081
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = 'ID'
            Title.TitleButton = True
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'REG_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'DATE_OF_WEEK'
            Footers = <>
            Title.Caption = #1044#1053
            Width = 25
          end
          item
            EditButtons = <>
            FieldName = 'GAIN_TYPE'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clRed
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = []
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1086#1074
            Title.TitleButton = True
            Width = 250
          end
          item
            DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
            EditButtons = <>
            FieldName = 'SUMM'
            Footer.DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clRed
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = []
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072
            Title.TitleButton = True
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'COMMENT'
            Footers = <>
            Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 350
          end>
      end
      object DockGain: TDock97
        Left = 0
        Top = 0
        Width = 660
        Height = 23
        object ToolbarGain: TToolbar97
          Left = 0
          Top = 0
          BorderStyle = bsNone
          CloseButton = False
          DockMode = dmCannotFloatOrChangeDocks
          DockPos = 0
          DragHandleStyle = dhNone
          FullSize = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object btnGainOptimizeWidth: TSpeedButton
            Left = 80
            Top = 0
            Width = 190
            Height = 18
            Caption = #1054#1087#1090#1080#1084#1080#1079#1072#1088#1086#1074#1072#1090#1100' '#1096#1080#1088#1080#1085#1091' '#1082#1086#1083#1086#1085#1086#1082
            Flat = True
            OnClick = btnGainOptimizeWidthClick
          end
          object navGain: TLMDDBNavigator
            Left = 0
            Top = 0
            Width = 80
            Height = 19
            DataSource = dsGain
            Buttons = [nbFirst, nbPrior, nbNext, nbLast]
            ButtonHints.Strings = (
              #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100)
            ButtonStyle = ubsWin40Ext
            CustomButtons = <>
            Bevel.Mode = bmCustom
            Flat = True
            TabOrder = 0
          end
        end
      end
    end
    object tsGainPeriod: TTabSheet
      Caption = #1044#1086#1093#1086#1076#1099' '#1079#1072' '#1087#1077#1088#1080#1086#1076
      ImageIndex = 1
      object GridGainPeriod: TDBGridEh
        Left = 0
        Top = 23
        Width = 660
        Height = 437
        Align = alClient
        DataSource = dsGainPeriod
        Flat = True
        FooterColor = clInfoBk
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
        RowHeight = 2
        RowLines = 1
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnGetCellParams = GridGainPeriodGetCellParams
        OnSortMarkingChanged = GridGainPeriodSortMarkingChanged
        Columns = <
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'UNACCOUNTED'
            Footer.ValueType = fvtCount
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            ReadOnly = True
            Title.Caption = #1053#1077#1091#1095#1090'. '#1088#1072#1089#1093#1086#1076#1099
            Title.TitleButton = True
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'PERIOD_NO'
            Footer.Alignment = taLeftJustify
            Footer.Value = #1079#1072#1087#1080#1089#1077#1081
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088' '#1087#1077#1088#1080#1086#1076#1072
            Title.TitleButton = True
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'PERIOD'
            Footers = <>
            Title.Caption = #1055#1077#1088#1080#1086#1076
            Title.TitleButton = True
            Width = 210
          end
          item
            EditButtons = <>
            FieldName = 'DAYS_PERIOD'
            Footer.DisplayFormat = '0 '#1076#1085#1077#1081
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081' '#1079#1072' '#1087#1077#1088#1080#1086#1076
            Title.TitleButton = True
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'GAIN_COUNT'
            Footer.DisplayFormat = '0 '#1076#1086#1093#1086#1076#1086#1074
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1086#1093#1086#1076#1086#1074
            Title.TitleButton = True
            Width = 70
          end
          item
            DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
            EditButtons = <>
            FieldName = 'SUMM'
            Footer.DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clRed
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = []
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072
            Title.TitleButton = True
            Width = 90
          end
          item
            DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
            EditButtons = <>
            FieldName = 'AVG_SUMM'
            Footer.DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
            Footer.ValueType = fvtAvg
            Footers = <>
            Title.Caption = #1057#1088#1077#1076#1085#1080#1081' '#1076#1086#1093#1086#1076' '#1079#1072' '#1089#1091#1090#1082#1080
            Title.TitleButton = True
            Width = 90
          end
          item
            DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
            EditButtons = <>
            FieldName = 'MIN_GAIN'
            Footer.DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
            Footers = <>
            Title.Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1076#1086#1093#1086#1076
            Title.TitleButton = True
            Width = 90
          end
          item
            DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
            EditButtons = <>
            FieldName = 'MAX_GAIN'
            Footer.DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
            Footers = <>
            Title.Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1081' '#1076#1086#1093#1086#1076
            Title.TitleButton = True
            Width = 90
          end>
      end
      object DockGainPeriod: TDock97
        Left = 0
        Top = 0
        Width = 660
        Height = 23
        object ToolbarGainPeriod: TToolbar97
          Left = 0
          Top = 0
          BorderStyle = bsNone
          CloseButton = False
          DockMode = dmCannotFloatOrChangeDocks
          DockPos = 0
          DragHandleStyle = dhNone
          FullSize = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object btnGainPeriodOptimizeWidth: TSpeedButton
            Left = 80
            Top = 0
            Width = 190
            Height = 18
            Caption = #1054#1087#1090#1080#1084#1080#1079#1072#1088#1086#1074#1072#1090#1100' '#1096#1080#1088#1080#1085#1091' '#1082#1086#1083#1086#1085#1086#1082
            Flat = True
            OnClick = btnGainPeriodOptimizeWidthClick
          end
          object navGainPeriod: TLMDDBNavigator
            Left = 0
            Top = 0
            Width = 80
            Height = 19
            DataSource = dsGainPeriod
            Buttons = [nbFirst, nbPrior, nbNext, nbLast]
            ButtonHints.Strings = (
              #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100)
            ButtonStyle = ubsWin40Ext
            CustomButtons = <>
            Bevel.Mode = bmCustom
            Flat = True
            TabOrder = 0
          end
        end
      end
    end
    object tsDiagram: TTabSheet
      Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1072
      ImageIndex = 2
      object Chart: TChart
        Left = 0
        Top = 0
        Width = 660
        Height = 460
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Title.Text.Strings = (
          '')
        BottomAxis.Title.Caption = #1055#1077#1088#1080#1086#1076
        LeftAxis.Title.Caption = #1057#1091#1084#1084#1072', '#1088#1091#1073'.'
        Legend.TextStyle = ltsXValue
        Legend.Visible = False
        RightAxis.DateTimeFormat = '##.##.##'
        View3D = False
        Align = alClient
        TabOrder = 0
        object Series1: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clRed
          Title = #1056#1072#1089#1093#1086#1076#1099
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
      end
    end
  end
  object mdGain: TRxMemoryData
    FieldDefs = <>
    AfterScroll = mdGainAfterScroll
    OnCalcFields = mdGainCalcFields
    Left = 350
    Top = 116
    object mdGainUNACCOUNTED: TSmallintField
      FieldName = 'UNACCOUNTED'
    end
    object mdGainGAIN_ID: TIntegerField
      FieldName = 'GAIN_ID'
    end
    object mdGainREG_DATE: TDateField
      FieldName = 'REG_DATE'
    end
    object mdGainDATE_OF_WEEK: TStringField
      FieldKind = fkCalculated
      FieldName = 'DATE_OF_WEEK'
      Size = 2
      Calculated = True
    end
    object mdGainGAIN_TYPE: TStringField
      FieldName = 'GAIN_TYPE'
      Size = 30
    end
    object mdGainSUMM: TFloatField
      FieldName = 'SUMM'
    end
    object mdGainCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 100
    end
  end
  object dsGain: TDataSource
    DataSet = mdGain
    Left = 350
    Top = 154
  end
  object pmGain: TPopupMenu
    Images = frmMain.ImageList
    Left = 446
    Top = 116
    object pmGainAdd: TMenuItem
      Action = frmMain.AcAdd
    end
    object pmAddPattern: TMenuItem
      Action = frmMain.AcAddPattern
    end
    object pmGainEdit: TMenuItem
      Action = frmMain.AcEdit
    end
    object pmGainDelete: TMenuItem
      Action = frmMain.AcDelete
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pmGainRefresh: TMenuItem
      Action = frmMain.AcRefresh
    end
  end
  object mdGainPeriod: TRxMemoryData
    FieldDefs = <>
    Left = 390
    Top = 116
    object mdGainPeriodUNACCOUNTED: TSmallintField
      FieldName = 'UNACCOUNTED'
    end
    object mdGainPeriodPERIOD_NO: TWordField
      FieldName = 'PERIOD_NO'
    end
    object mdGainPeriodPERIOD: TStringField
      DisplayWidth = 50
      FieldName = 'PERIOD'
      Size = 50
    end
    object mdGainPeriodDAYS_PERIOD: TIntegerField
      FieldName = 'DAYS_PERIOD'
    end
    object mdGainPeriodGAIN_COUNT: TIntegerField
      FieldName = 'GAIN_COUNT'
    end
    object mdGainPeriodSUMM: TFloatField
      FieldName = 'SUMM'
    end
    object mdGainPeriodAVG_SUMM: TFloatField
      FieldName = 'AVG_SUMM'
    end
    object mdGainPeriodMIN_GAIN: TFloatField
      FieldName = 'MIN_GAIN'
    end
    object mdGainPeriodMAX_GAIN: TFloatField
      FieldName = 'MAX_GAIN'
    end
  end
  object dsGainPeriod: TDataSource
    DataSet = mdGainPeriod
    Left = 390
    Top = 154
  end
  object mdGainType: TRxMemoryData
    FieldDefs = <>
    Left = 20
    Top = 324
    object mdGainTypeGAIN_TYPE_ID: TIntegerField
      FieldName = 'GAIN_TYPE_ID'
    end
    object mdGainTypeGAIN_TYPE: TStringField
      FieldName = 'GAIN_TYPE'
      Size = 30
    end
    object mdGainTypeEXCLUDE: TBooleanField
      FieldName = 'EXCLUDE'
    end
  end
  object dsGainType: TDataSource
    DataSet = mdGainType
    Left = 20
    Top = 364
  end
  object pmGainType: TPopupMenu
    Images = frmMain.ImageList
    Left = 64
    Top = 324
    object pmAll: TMenuItem
      Caption = #1042#1089#1077
      OnClick = pmAllClick
    end
    object pmNon: TMenuItem
      Caption = #1053#1080#1095#1077#1075#1086
      OnClick = pmNonClick
    end
    object pmAllWithout: TMenuItem
      Caption = #1042#1089#1077', '#1082#1088#1086#1084#1077' '#1090#1077#1082#1091#1097#1077#1075#1086
      OnClick = pmAllWithoutClick
    end
    object pmNonWithout: TMenuItem
      Caption = #1053#1080#1095#1077#1075#1086', '#1082#1088#1086#1084#1077' '#1090#1077#1082#1091#1097#1077#1075#1086
      OnClick = pmNonWithoutClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object pmGainTypeRefresh: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = pmGainTypeRefreshClick
    end
  end
end
