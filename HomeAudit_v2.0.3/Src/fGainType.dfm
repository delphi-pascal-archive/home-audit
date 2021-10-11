object frmGainType: TfrmGainType
  Left = 263
  Top = 114
  Width = 870
  Height = 500
  ActiveControl = GridGainType
  Caption = #1042#1080#1076#1099' '#1076#1086#1093#1086#1076#1086#1074
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
  object GridGainType: TDBGridEh
    Left = 0
    Top = 0
    Width = 862
    Height = 473
    Align = alClient
    DataSource = dsGainType
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
    PopupMenu = pmGainType
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
    OnSortMarkingChanged = GridGainTypeSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'GAIN_TYPE_ID'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = 'ID'
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footer.Value = #1079#1072#1087#1080#1089#1077#1081
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 250
      end>
  end
  object mdGainType: TRxMemoryData
    FieldDefs = <>
    AfterScroll = mdGainTypeAfterScroll
    Left = 182
    Top = 116
    object mdGainTypeGAIN_TYPE_ID: TIntegerField
      FieldName = 'GAIN_TYPE_ID'
    end
    object mdGainTypeNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
  end
  object dsGainType: TDataSource
    DataSet = mdGainType
    Left = 182
    Top = 154
  end
  object pmGainType: TPopupMenu
    Images = frmMain.ImageList
    Left = 220
    Top = 116
    object pmGainTypeAdd: TMenuItem
      Action = frmMain.AcAdd
    end
    object pmGainTypeEdit: TMenuItem
      Action = frmMain.AcEdit
    end
    object pmGainTypeDelete: TMenuItem
      Action = frmMain.AcDelete
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pmGainTypeRefresh: TMenuItem
      Action = frmMain.AcRefresh
    end
  end
end
