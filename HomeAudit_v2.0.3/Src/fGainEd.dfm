object frmGainEd: TfrmGainEd
  Left = 457
  Top = 271
  ActiveControl = cbDate
  BorderStyle = bsDialog
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1076#1086#1093#1086#1076#1086#1074
  ClientHeight = 233
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
  object lblDate: TLabel
    Left = 10
    Top = 10
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
  object lblGainType: TLabel
    Left = 10
    Top = 50
    Width = 60
    Height = 13
    Caption = #1042#1080#1076' '#1076#1086#1093#1086#1076#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblSumm: TLabel
    Left = 10
    Top = 90
    Width = 37
    Height = 13
    Caption = #1057#1091#1084#1084#1072':'
  end
  object lblCommen: TLabel
    Left = 10
    Top = 130
    Width = 53
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
  end
  object cbGainType: TDBComboBoxEh
    Left = 10
    Top = 65
    Width = 300
    Height = 19
    DropDownBox.Rows = 20
    EditButtons = <>
    Flat = True
    TabOrder = 1
    Visible = True
  end
  object btnOK: TButton
    Left = 150
    Top = 200
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 4
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 235
    Top = 200
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
  object edComment: TDBEditEh
    Left = 10
    Top = 145
    Width = 300
    Height = 19
    EditButtons = <>
    Flat = True
    TabOrder = 3
    Visible = True
  end
  object cbDate: TDBDateTimeEditEh
    Left = 10
    Top = 25
    Width = 100
    Height = 19
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 0
    Visible = True
  end
  object edSumm: TDBNumberEditEh
    Left = 10
    Top = 105
    Width = 100
    Height = 19
    DisplayFormat = ',0.00 '#1088#1091#1073#39'.'#39';-,0.00 '#1088#1091#1073#39'.'#39
    EditButtons = <>
    Flat = True
    MaxValue = 100000
    MinValue = 1
    TabOrder = 2
    Value = 1
    Visible = True
  end
  object cbUnaccounted: TCheckBox
    Left = 10
    Top = 170
    Width = 300
    Height = 17
    Caption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100' '#1087#1088#1080' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1077' '#1079#1072' '#1087#1077#1088#1080#1086#1076
    TabOrder = 6
  end
end
