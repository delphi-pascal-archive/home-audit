object frmDebtEd: TfrmDebtEd
  Left = 457
  Top = 260
  ActiveControl = cbDebtType
  BorderStyle = bsDialog
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1076#1086#1083#1075#1086#1074
  ClientHeight = 248
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblDebtType: TLabel
    Left = 10
    Top = 10
    Width = 54
    Height = 13
    Caption = #1042#1080#1076' '#1076#1086#1083#1075#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btnOK: TButton
    Left = 150
    Top = 215
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 237
    Top = 215
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
  object gbDebt: TGroupBox
    Left = 10
    Top = 50
    Width = 140
    Height = 151
    Caption = #1044#1086#1083#1075
    TabOrder = 1
    object lblDebtDate: TLabel
      Left = 10
      Top = 20
      Width = 29
      Height = 13
      Caption = #1044#1072#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblDebtSumm: TLabel
      Left = 10
      Top = 60
      Width = 37
      Height = 13
      Caption = #1057#1091#1084#1084#1072':'
    end
    object lblDebtCommen: TLabel
      Left = 10
      Top = 100
      Width = 53
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
    end
    object cbDebtDate: TDBDateTimeEditEh
      Left = 10
      Top = 35
      Width = 120
      Height = 19
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object edDebtComment: TDBEditEh
      Left = 10
      Top = 115
      Width = 120
      Height = 19
      EditButtons = <>
      Flat = True
      TabOrder = 2
      Visible = True
    end
    object edDebtSumm: TDBNumberEditEh
      Left = 10
      Top = 75
      Width = 120
      Height = 19
      DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
      EditButtons = <>
      Flat = True
      MaxValue = 100000
      MinValue = 1
      TabOrder = 1
      Value = 1
      Visible = True
    end
  end
  object gbPays: TGroupBox
    Left = 170
    Top = 50
    Width = 140
    Height = 151
    Caption = #1042#1099#1087#1083#1072#1090#1072
    TabOrder = 2
    object lblPayDate: TLabel
      Left = 10
      Top = 20
      Width = 29
      Height = 13
      Caption = #1044#1072#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblPaySumm: TLabel
      Left = 10
      Top = 60
      Width = 37
      Height = 13
      Caption = #1057#1091#1084#1084#1072':'
    end
    object lblPayCommen: TLabel
      Left = 10
      Top = 100
      Width = 53
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
    end
    object cbPayDate: TDBDateTimeEditEh
      Left = 10
      Top = 35
      Width = 120
      Height = 19
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object edPayComment: TDBEditEh
      Left = 10
      Top = 115
      Width = 120
      Height = 19
      EditButtons = <>
      Flat = True
      TabOrder = 2
      Visible = True
    end
    object edPaySumm: TDBNumberEditEh
      Left = 10
      Top = 75
      Width = 120
      Height = 19
      DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
      EditButtons = <>
      Flat = True
      MaxValue = 100000
      MinValue = 1
      TabOrder = 1
      Visible = True
    end
  end
  object cbDebtType: TDBComboBoxEh
    Left = 10
    Top = 25
    Width = 300
    Height = 19
    DropDownBox.Rows = 20
    EditButtons = <>
    Flat = True
    Items.Strings = (
      #1103' '#1076#1086#1083#1078#1077#1085
      #1084#1085#1077' '#1076#1086#1083#1078#1085#1099)
    KeyItems.Strings = (
      '0'
      '1')
    TabOrder = 0
    Visible = True
    EditMask = ''
  end
  object Button1: TButton
    Left = 34
    Top = 230
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
  end
end
