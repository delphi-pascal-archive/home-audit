object frmGainTypeEd: TfrmGainTypeEd
  Left = 457
  Top = 271
  ActiveControl = edName
  BorderStyle = bsDialog
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1074#1080#1076#1086#1074' '#1076#1086#1093#1086#1076#1086#1074
  ClientHeight = 101
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel
    Left = 10
    Top = 15
    Width = 53
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
  end
  object btnOK: TButton
    Left = 180
    Top = 65
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 265
    Top = 65
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object edName: TDBEditEh
    Left = 10
    Top = 30
    Width = 330
    Height = 19
    EditButtons = <>
    Flat = True
    TabOrder = 0
    Visible = True
  end
end
