object frmOptions: TfrmOptions
  Left = 527
  Top = 292
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 266
  ClientWidth = 362
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 362
    Height = 235
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 10
    TabOrder = 0
    object Pages: TPageControl
      Left = 10
      Top = 10
      Width = 342
      Height = 215
      ActivePage = Gain
      Align = alClient
      MultiLine = True
      TabIndex = 0
      TabOrder = 0
      object Gain: TTabSheet
        Caption = #1044#1086#1093#1086#1076#1099
        ImageIndex = 1
        object cbCanGainDelete: TCheckBox
          Left = 10
          Top = 15
          Width = 310
          Height = 17
          Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077' '#1076#1086#1093#1086#1076#1086#1074
          TabOrder = 0
        end
      end
      object tsCost: TTabSheet
        Caption = #1056#1072#1089#1093#1086#1076#1099
        ImageIndex = 1
        object cbCanCostDelete: TCheckBox
          Left = 10
          Top = 15
          Width = 310
          Height = 17
          Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077' '#1088#1072#1089#1093#1086#1076#1086#1074
          TabOrder = 0
        end
      end
      object tsDebt: TTabSheet
        Caption = #1044#1086#1083#1075#1080
        ImageIndex = 4
        object cbCanDebtDelete: TCheckBox
          Left = 10
          Top = 15
          Width = 310
          Height = 17
          Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077' '#1076#1086#1083#1075#1086#1074
          TabOrder = 0
        end
      end
      object tsBackUp: TTabSheet
        Caption = #1056#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1080#1077
        ImageIndex = 2
        object cbBackUp: TCheckBox
          Left = 10
          Top = 15
          Width = 310
          Height = 17
          Caption = #1057#1086#1079#1076#1072#1074#1072#1090#1100' '#1088#1077#1079#1077#1088#1074#1085#1091#1102' '#1082#1086#1087#1080#1102' '#1041#1044' '#1087#1088#1080' '#1079#1072#1087#1091#1089#1082#1077
          TabOrder = 0
        end
      end
      object tsBalance: TTabSheet
        Caption = #1041#1072#1083#1072#1085#1089
        ImageIndex = 5
        object lblBalance: TLabel
          Left = 10
          Top = 15
          Width = 52
          Height = 13
          Caption = #1041#1072#1083#1072#1085#1089' '#1085#1072
        end
        object lblBalance1: TLabel
          Left = 115
          Top = 15
          Width = 70
          Height = 13
          Caption = #1095#1080#1089#1083#1086' '#1084#1077#1089#1103#1094#1072
        end
        object cbBalanceDay: TDBComboBoxEh
          Left = 70
          Top = 12
          Width = 41
          Height = 19
          DropDownBox.Rows = 20
          EditButtons = <>
          Flat = True
          Items.Strings = (
            '1'
            '5'
            '10'
            '15'
            '20'
            '25')
          KeyItems.Strings = (
            '1'
            '5'
            '10'
            '15'
            '20'
            '25')
          TabOrder = 0
          Visible = True
        end
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 235
    Width = 362
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnOK: TButton
      Left = 190
      Top = 0
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 275
      Top = 0
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
end
