object frmBalance: TfrmBalance
  Left = 374
  Top = 199
  BorderStyle = bsDialog
  Caption = #1041#1072#1083#1072#1085#1089
  ClientHeight = 243
  ClientWidth = 292
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 202
    Width = 292
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnOK: TButton
      Left = 110
      Top = 10
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
  end
  object Pages: TPageControl
    Left = 0
    Top = 0
    Width = 292
    Height = 202
    ActivePage = tsCurrentBalance
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object tsCurrentBalance: TTabSheet
      Caption = #1058#1077#1082#1091#1097#1080#1081
      Enabled = False
      object lblGain: TLabel
        Left = 10
        Top = 10
        Width = 35
        Height = 13
        Caption = #1044#1086#1093#1086#1076':'
      end
      object lblCost: TLabel
        Left = 10
        Top = 50
        Width = 39
        Height = 13
        Caption = #1056#1072#1089#1093#1086#1076':'
      end
      object lblBalance: TLabel
        Left = 10
        Top = 130
        Width = 40
        Height = 13
        Caption = #1041#1072#1083#1072#1085#1089':'
      end
      object lblDebt: TLabel
        Left = 10
        Top = 90
        Width = 35
        Height = 13
        Caption = #1044#1086#1083#1075#1080':'
      end
      object edGain: TDBNumberEditEh
        Left = 10
        Top = 25
        Width = 120
        Height = 19
        DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Flat = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Visible = True
      end
      object edCost: TDBNumberEditEh
        Left = 10
        Top = 65
        Width = 120
        Height = 19
        DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Flat = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Visible = True
      end
      object edBalance: TDBNumberEditEh
        Left = 10
        Top = 145
        Width = 120
        Height = 19
        DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Flat = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Visible = True
      end
      object edDebt: TDBNumberEditEh
        Left = 10
        Top = 105
        Width = 120
        Height = 19
        DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Flat = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Visible = True
      end
    end
    object tsDayBalance: TTabSheet
      Caption = #1053#1072' '#1076#1072#1090#1091' '#1084#1077#1089#1103#1094#1072
      ImageIndex = 1
      object GridBalance: TDBGridEh
        Left = 0
        Top = 0
        Width = 284
        Height = 174
        Align = alClient
        DataSource = dsBalance
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
        OnSortMarkingChanged = GridBalanceSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'REG_DATE'
            Footer.Alignment = taRightJustify
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 70
          end
          item
            DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
            EditButtons = <>
            FieldName = 'BALANCE'
            Footer.Alignment = taLeftJustify
            Footer.Value = #1079#1072#1087#1080#1089#1077#1081
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = #1041#1072#1083#1072#1085#1089
            Title.TitleButton = True
            Width = 100
          end>
      end
    end
  end
  object mdBalance: TRxMemoryData
    FieldDefs = <>
    Left = 246
    Top = 32
    object mdBalanceREG_DATE: TDateField
      FieldName = 'REG_DATE'
    end
    object mdBalanceBALANCE: TFloatField
      FieldName = 'BALANCE'
    end
  end
  object dsBalance: TDataSource
    DataSet = mdBalance
    Left = 246
    Top = 62
  end
end
