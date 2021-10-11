object frmErrandEd: TfrmErrandEd
  Left = 457
  Top = 271
  ActiveControl = cbBDate
  BorderStyle = bsDialog
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1080
  ClientHeight = 173
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
    Width = 67
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblCommen: TLabel
    Left = 10
    Top = 90
    Width = 53
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
  end
  object Label1: TLabel
    Left = 10
    Top = 50
    Width = 85
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btnOK: TButton
    Left = 150
    Top = 140
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 235
    Top = 140
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
  object edErrandID: TDBEditEh
    Left = 258
    Top = 25
    Width = 50
    Height = 19
    EditButtons = <>
    Flat = True
    ImeName = '260'
    TabOrder = 1
    Visible = False
  end
  object cbBDate: TDBDateTimeEditEh
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
  object cbEDate: TDBDateTimeEditEh
    Left = 10
    Top = 65
    Width = 100
    Height = 19
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 4
    Visible = True
  end
  object edComment: TDBEditEh
    Left = 12
    Top = 105
    Width = 300
    Height = 19
    EditButtons = <>
    Flat = True
    TabOrder = 5
    Visible = True
  end
end
