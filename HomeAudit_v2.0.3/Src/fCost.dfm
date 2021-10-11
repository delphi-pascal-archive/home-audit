object frmCost: TfrmCost
  Left = 296
  Top = 166
  Width = 886
  Height = 517
  Caption = #1056#1072#1089#1093#1086#1076#1099
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
    Height = 490
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvNone
    Constraints.MinWidth = 190
    TabOrder = 0
    OnResize = pnlFilterResize
    object lblCostType: TLabel
      Left = 10
      Top = 30
      Width = 66
      Height = 13
      Caption = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1072':'
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
    object sbEndPeriodBegin: TSpeedButton
      Left = 155
      Top = 165
      Width = 19
      Height = 19
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1081' '#1076#1077#1085#1100' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1088#1072#1089#1093#1086#1076#1086#1074
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
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1081' '#1076#1077#1085#1100' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1088#1072#1089#1093#1086#1076#1086#1074
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
    object sbStartPeriodBegin: TSpeedButton
      Left = 133
      Top = 165
      Width = 19
      Height = 19
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1077#1088#1074#1099#1081' '#1076#1077#1085#1100' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1088#1072#1089#1093#1086#1076#1086#1074
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
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1077#1088#1074#1099#1081' '#1076#1077#1085#1100' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1088#1072#1089#1093#1086#1076#1086#1074
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
    object pnlFilterTop: TPanel
      Left = 1
      Top = 1
      Width = 188
      Height = 19
      Align = alTop
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080
      TabOrder = 0
    end
    object cbCostType: TDBComboBoxEh
      Left = 10
      Top = 45
      Width = 170
      Height = 19
      DropDownBox.Rows = 30
      EditButtons = <>
      Flat = True
      TabOrder = 1
      Visible = True
      OnChange = cbCostTypeChange
    end
    object edPeriodBegin: TDBDateTimeEditEh
      Left = 30
      Top = 165
      Width = 100
      Height = 19
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 4
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
      TabOrder = 5
      Visible = True
      OnChange = edPeriodBeginChange
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
      OnChange = cbCostTypeChange
    end
    object pnlExclude: TPanel
      Left = 1
      Top = 289
      Width = 188
      Height = 200
      Align = alBottom
      TabOrder = 7
      object pnlCostTypeTitle: TPanel
        Left = 1
        Top = 1
        Width = 186
        Height = 19
        Align = alTop
        BevelOuter = bvLowered
        Caption = #1042#1080#1076#1099' '#1088#1072#1089#1093#1086#1076#1086#1074
        TabOrder = 0
      end
      object GridCostType: TDBGridEh
        Left = 1
        Top = 20
        Width = 186
        Height = 179
        Align = alClient
        DataSource = dsCostType
        Flat = True
        FooterColor = clInfoBk
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
        PopupMenu = pmCostType
        ReadOnly = True
        RowHeight = 2
        RowLines = 1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnCellClick = GridCostTypeCellClick
        Columns = <
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'EXCLUDE'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.Caption = '.'
            Width = 15
          end
          item
            EditButtons = <>
            FieldName = 'COST_TYPE'
            Footers = <>
            Title.Caption = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1072
            Width = 165
          end
          item
            EditButtons = <>
            FieldName = 'COST_TYPE_ID'
            Footers = <>
            Title.Caption = 'ID'
            Visible = False
            Width = 30
          end>
      end
    end
    object cbDopParam: TCheckBox
      Left = 10
      Top = 270
      Width = 171
      Height = 17
      Hint = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100'/'#1089#1082#1088#1099#1090#1100' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
      TabOrder = 6
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
      OnChange = cbCostTypeChange
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
  object RxSplitter1: TRxSplitter
    Left = 190
    Top = 0
    Width = 4
    Height = 490
    ControlFirst = pnlFilter
    Align = alLeft
    BevelOuter = bvNone
  end
  object Pages: TPageControl
    Left = 194
    Top = 0
    Width = 684
    Height = 490
    ActivePage = tsCostPeriod
    Align = alClient
    TabIndex = 1
    TabOrder = 2
    OnChange = PagesChange
    object tsCost: TTabSheet
      Caption = #1056#1072#1089#1093#1086#1076#1099
      object GridCost: TDBGridEh
        Left = 0
        Top = 23
        Width = 676
        Height = 439
        Align = alClient
        DataSource = dsCost
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
        PopupMenu = pmCost
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
        OnGetCellParams = GridCostGetCellParams
        OnSortMarkingChanged = GridCostSortMarkingChanged
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
            Checkboxes = True
            EditButtons = <>
            FieldName = 'ERRAND'
            Footer.Alignment = taLeftJustify
            Footer.Value = #1079#1072#1087#1080#1089#1077#1081
            Footer.ValueType = fvtStaticText
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            ReadOnly = True
            Title.Caption = #1050#1086#1084#1072#1085#1076'.'
            Title.TitleButton = True
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'COST_ID'
            Footer.Alignment = taLeftJustify
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
            FieldName = 'COST_TYPE'
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
      object DockCost: TDock97
        Left = 0
        Top = 0
        Width = 676
        Height = 23
        object ToolbarCost: TToolbar97
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
          object btnCostOptimizeWidth: TSpeedButton
            Left = 80
            Top = 0
            Width = 190
            Height = 18
            Caption = #1054#1087#1090#1080#1084#1080#1079#1072#1088#1086#1074#1072#1090#1100' '#1096#1080#1088#1080#1085#1091' '#1082#1086#1083#1086#1085#1086#1082
            Flat = True
            OnClick = btnCostOptimizeWidthClick
          end
          object navCost: TLMDDBNavigator
            Left = 0
            Top = 0
            Width = 80
            Height = 19
            DataSource = dsCost
            Buttons = [nbFirst, nbPrior, nbNext, nbLast]
            ButtonHints.Strings = (
              #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100)
            ButtonStyle = ubsWin40Ext
            CustomButtons = <>
            Align = alTop
            Bevel.Mode = bmCustom
            Flat = True
            TabOrder = 0
          end
        end
      end
    end
    object tsCostPeriod: TTabSheet
      Caption = #1056#1072#1089#1093#1086#1076#1099' '#1079#1072' '#1087#1077#1088#1080#1086#1076
      ImageIndex = 1
      object pnlCostPeriod: TPanel
        Left = 0
        Top = 0
        Width = 676
        Height = 250
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object DockCostPeriod: TDock97
          Left = 0
          Top = 0
          Width = 676
          Height = 23
          object ToolbarCostPeriod: TToolbar97
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
            object btnCostPeriodOptimizeWidth: TSpeedButton
              Left = 80
              Top = 0
              Width = 190
              Height = 18
              Caption = #1054#1087#1090#1080#1084#1080#1079#1072#1088#1086#1074#1072#1090#1100' '#1096#1080#1088#1080#1085#1091' '#1082#1086#1083#1086#1085#1086#1082
              Flat = True
              OnClick = btnCostPeriodOptimizeWidthClick
            end
            object navCostPeriod: TLMDDBNavigator
              Left = 0
              Top = 0
              Width = 80
              Height = 19
              DataSource = dsCostPeriod
              Buttons = [nbFirst, nbPrior, nbNext, nbLast]
              ButtonHints.Strings = (
                #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100)
              ButtonStyle = ubsWin40Ext
              CustomButtons = <>
              Align = alTop
              Bevel.Mode = bmCustom
              Flat = True
              TabOrder = 0
            end
          end
        end
        object GridCostPeriod: TDBGridEh
          Left = 0
          Top = 23
          Width = 676
          Height = 227
          Align = alClient
          DataSource = dsCostPeriod
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
          PopupMenu = pmCostPeriod
          RowHeight = 2
          RowLines = 1
          SumList.Active = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnGetCellParams = GridCostPeriodGetCellParams
          OnSortMarkingChanged = GridCostPeriodSortMarkingChanged
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
              Checkboxes = True
              EditButtons = <>
              FieldName = 'ERRAND'
              Footer.Alignment = taLeftJustify
              Footer.Value = #1079#1072#1087#1080#1089#1077#1081
              Footer.ValueType = fvtStaticText
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              ReadOnly = True
              Title.Caption = #1050#1086#1084#1072#1085#1076'.'
              Title.TitleButton = True
              Width = 50
            end
            item
              Checkboxes = False
              EditButtons = <>
              FieldName = 'PERIOD_NO'
              Footer.Alignment = taLeftJustify
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088' '#1087#1077#1088#1080#1086#1076#1072
              Title.TitleButton = True
              Width = 55
            end
            item
              EditButtons = <>
              FieldName = 'PERIOD'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clBlack
              Footer.Font.Height = -11
              Footer.Font.Name = 'MS Sans Serif'
              Footer.Font.Style = []
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
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'COST_COUNT'
              Footer.DisplayFormat = '0 '#1088#1072#1089#1093#1086#1076#1086#1074
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1088#1072#1089#1093#1086#1076#1086#1074
              Title.TitleButton = True
              Width = 80
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
              Title.Caption = #1057#1088#1077#1076#1085#1080#1081' '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1089#1091#1090#1082#1080
              Title.TitleButton = True
              Width = 90
            end
            item
              DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
              EditButtons = <>
              FieldName = 'MIN_COST'
              Footer.DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
              Footers = <>
              Title.Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1088#1072#1089#1093#1086#1076
              Title.TitleButton = True
              Width = 90
            end
            item
              DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
              EditButtons = <>
              FieldName = 'MAX_COST'
              Footer.DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
              Footers = <>
              Title.Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1081' '#1088#1072#1089#1093#1086#1076
              Title.TitleButton = True
              Width = 90
            end>
        end
      end
      object pnlCostTypePeriod: TPanel
        Left = 0
        Top = 256
        Width = 676
        Height = 206
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DockCostTypePeriod: TDock97
          Left = 0
          Top = 0
          Width = 676
          Height = 23
          object ToolbarCostTypesPeriod: TToolbar97
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
            object btnCostTypePeriodOptimizeWidth: TSpeedButton
              Left = 80
              Top = 0
              Width = 190
              Height = 18
              Caption = #1054#1087#1090#1080#1084#1080#1079#1072#1088#1086#1074#1072#1090#1100' '#1096#1080#1088#1080#1085#1091' '#1082#1086#1083#1086#1085#1086#1082
              Flat = True
              OnClick = btnCostTypePeriodOptimizeWidthClick
            end
            object navCostTypePeriod: TLMDDBNavigator
              Left = 0
              Top = 0
              Width = 80
              Height = 19
              DataSource = dsCostTypePeriod
              Buttons = [nbFirst, nbPrior, nbNext, nbLast]
              ButtonHints.Strings = (
                #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100)
              ButtonStyle = ubsWin40Ext
              CustomButtons = <>
              Align = alTop
              Bevel.Mode = bmCustom
              Flat = True
              TabOrder = 0
            end
          end
        end
        object GridCostTypePeriod: TDBGridEh
          Left = 0
          Top = 23
          Width = 676
          Height = 183
          Align = alClient
          DataSource = dsCostTypePeriod
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
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnGetCellParams = GridCostTypePeriodGetCellParams
          OnSortMarkingChanged = GridCostTypePeriodSortMarkingChanged
          Columns = <
            item
              EditButtons = <>
              FieldName = 'COST_TYPE'
              Footer.ValueType = fvtStaticText
              Footers = <>
              Title.Caption = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1072
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
              Footer.Value = #1079#1072#1087#1080#1089#1077#1081
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1057#1091#1084#1084#1072
              Title.TitleButton = True
              Width = 100
            end>
        end
      end
      object RxSplitter2: TRxSplitter
        Left = 0
        Top = 250
        Width = 676
        Height = 6
        ControlFirst = pnlCostPeriod
        Align = alTop
        BevelOuter = bvNone
      end
    end
    object tsDiagram: TTabSheet
      Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1072
      ImageIndex = 2
      object Chart: TChart
        Left = 0
        Top = 0
        Width = 676
        Height = 462
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
  object mdCost: TRxMemoryData
    FieldDefs = <>
    AfterScroll = mdCostAfterScroll
    OnCalcFields = mdCostCalcFields
    Left = 354
    Top = 116
    object mdCostUNACCOUNTED: TSmallintField
      FieldName = 'UNACCOUNTED'
    end
    object mdCostERRAND: TIntegerField
      FieldName = 'ERRAND'
    end
    object mdCostCOST_ID: TIntegerField
      FieldName = 'COST_ID'
    end
    object mdCostREG_DATE: TDateField
      FieldName = 'REG_DATE'
    end
    object mdCostDATE_OF_WEEK: TStringField
      FieldKind = fkCalculated
      FieldName = 'DATE_OF_WEEK'
      Size = 2
      Calculated = True
    end
    object mdCostCOST_TYPE: TStringField
      FieldName = 'COST_TYPE'
      Size = 30
    end
    object mdCostSUMM: TFloatField
      FieldName = 'SUMM'
    end
    object mdCostCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 100
    end
  end
  object dsCost: TDataSource
    DataSet = mdCost
    Left = 354
    Top = 154
  end
  object pmCost: TPopupMenu
    Images = frmMain.ImageList
    Left = 466
    Top = 116
    object pmCostAdd: TMenuItem
      Action = frmMain.AcAdd
    end
    object pmAddPattern: TMenuItem
      Action = frmMain.AcAddPattern
    end
    object pmCostEdit: TMenuItem
      Action = frmMain.AcEdit
    end
    object pmCostDelete: TMenuItem
      Action = frmMain.AcDelete
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pmCostRefresh: TMenuItem
      Action = frmMain.AcRefresh
    end
  end
  object mdCostPeriod: TRxMemoryData
    FieldDefs = <>
    AfterScroll = mdCostPeriodAfterScroll
    Left = 392
    Top = 116
    object mdCostPeriodUNACCOUNTED: TSmallintField
      FieldName = 'UNACCOUNTED'
    end
    object mdCostPeriodERRAND: TIntegerField
      FieldName = 'ERRAND'
    end
    object mdCostPeriodPERIOD_NO: TWordField
      FieldName = 'PERIOD_NO'
    end
    object mdCostPeriodPERIOD: TStringField
      FieldName = 'PERIOD'
      Size = 50
    end
    object mdCostPeriodDAYS_PERIOD: TIntegerField
      FieldName = 'DAYS_PERIOD'
    end
    object mdCostPeriodCOST_COUNT: TIntegerField
      FieldName = 'COST_COUNT'
    end
    object mdCostPeriodSUMM: TFloatField
      FieldName = 'SUMM'
    end
    object mdCostPeriodAVG_SUMM: TFloatField
      FieldName = 'AVG_SUMM'
    end
    object mdCostPeriodMIN_COST: TFloatField
      FieldName = 'MIN_COST'
    end
    object mdCostPeriodMAX_COST: TFloatField
      FieldName = 'MAX_COST'
    end
    object mdCostPeriodBDATE: TDateField
      FieldName = 'BDATE'
    end
    object mdCostPeriodEDATE: TDateField
      FieldName = 'EDATE'
    end
  end
  object dsCostPeriod: TDataSource
    DataSet = mdCostPeriod
    Left = 392
    Top = 154
  end
  object mdCostType: TRxMemoryData
    FieldDefs = <>
    Left = 20
    Top = 324
    object mdCostTypeCOST_TYPE_ID: TIntegerField
      FieldName = 'COST_TYPE_ID'
    end
    object mdCostTypeCOST_TYPE: TStringField
      FieldName = 'COST_TYPE'
      Size = 30
    end
    object mdCostTypeEXCLUDE: TSmallintField
      FieldName = 'EXCLUDE'
    end
  end
  object dsCostType: TDataSource
    DataSet = mdCostType
    Left = 20
    Top = 362
  end
  object pmCostType: TPopupMenu
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
    object pmCostTypeRefresh: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = pmCostTypeRefreshClick
    end
  end
  object mdCostTypePeriod: TRxMemoryData
    FieldDefs = <>
    Left = 358
    Top = 346
    object mdCostTypePeriodCOST_TYPE: TStringField
      FieldName = 'COST_TYPE'
      Size = 30
    end
    object mdCostTypePeriodSUMM: TFloatField
      FieldName = 'SUMM'
    end
  end
  object dsCostTypePeriod: TDataSource
    DataSet = mdCostTypePeriod
    Left = 358
    Top = 384
  end
  object pmCostPeriod: TPopupMenu
    OnPopup = pmCostPeriodPopup
    Left = 520
    Top = 116
    object pmCostCurrentPeriod: TMenuItem
      Caption = #1056#1072#1089#1093#1086#1076#1099' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1087#1077#1088#1080#1086#1076
      Hint = #1056#1072#1089#1093#1086#1076#1099' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1087#1077#1088#1080#1086#1076
      OnClick = pmCostCurrentPeriodClick
    end
  end
end
