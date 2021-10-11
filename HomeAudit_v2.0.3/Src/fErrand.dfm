object frmErrand: TfrmErrand
  Left = 263
  Top = 114
  Width = 870
  Height = 500
  ActiveControl = GridErrand
  Caption = #1050#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1080
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
  object GridErrand: TDBGridEh
    Left = 0
    Top = 0
    Width = 862
    Height = 473
    Align = alClient
    DataSource = dsErrand
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
    PopupMenu = pmErrand
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
    OnSortMarkingChanged = GridErrandSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ERRAND_ID'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = 'ID'
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'BDATE'
        Footers = <>
        Title.Caption = #1053#1072#1095#1072#1083#1086
        Title.TitleButton = True
        Visible = False
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'EDATE'
        Footers = <>
        Title.Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Visible = False
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = #1045'RRAND_PERIOD'
        Footer.Value = #1079#1072#1087#1080#1089#1077#1081
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Caption = #1055#1077#1088#1080#1086#1076' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1080
        Title.TitleButton = True
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'DAYS_PERIOD'
        Footers = <>
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081
        Title.TitleButton = True
        Width = 65
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
  object mdErrand: TRxMemoryData
    FieldDefs = <>
    AfterScroll = mdErrandAfterScroll
    OnCalcFields = mdErrandCalcFields
    Left = 182
    Top = 116
    object mdErrandERRAND_ID: TIntegerField
      FieldName = 'ERRAND_ID'
    end
    object mdErrandBDATE: TDateField
      FieldName = 'BDATE'
    end
    object mdErrandEDATE: TDateField
      FieldName = 'EDATE'
    end
    object mdErrandCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 100
    end
    object mdErrandRRAND_PERIOD: TStringField
      FieldKind = fkCalculated
      FieldName = #1045'RRAND_PERIOD'
      Size = 25
      Calculated = True
    end
    object mdErrandDAYS_PERIOD: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'DAYS_PERIOD'
      Calculated = True
    end
  end
  object dsErrand: TDataSource
    DataSet = mdErrand
    Left = 182
    Top = 154
  end
  object pmErrand: TPopupMenu
    Images = frmMain.ImageList
    Left = 220
    Top = 116
    object pmCostTypeAdd: TMenuItem
      Action = frmMain.AcAdd
    end
    object pmCostTypeEdit: TMenuItem
      Action = frmMain.AcEdit
    end
    object pmCostTypeDelete: TMenuItem
      Action = frmMain.AcDelete
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pmCostTypeRefresh: TMenuItem
      Action = frmMain.AcRefresh
    end
  end
end
