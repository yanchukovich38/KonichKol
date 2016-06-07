object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1056#1072#1089#1095#1077#1090' '#1082#1086#1085#1080#1095#1077#1089#1082#1086#1081' '#1087#1088#1103#1084#1086#1079#1091#1073#1086#1081' '#1087#1077#1088#1077#1076#1072#1095#1080
  ClientHeight = 177
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 11
    Width = 98
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1091#1073#1100#1077#1074
  end
  object Label2: TLabel
    Left = 9
    Top = 38
    Width = 39
    Height = 13
    Caption = #1052#1086#1076#1091#1083#1100
  end
  object Label3: TLabel
    Left = 9
    Top = 65
    Width = 73
    Height = 13
    Caption = #1064#1080#1088#1080#1085#1072' '#1074#1077#1085#1094#1072
  end
  object Label4: TLabel
    Left = 9
    Top = 92
    Width = 123
    Height = 13
    Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1089#1084#1077#1097#1077#1085#1080#1103
  end
  object Label5: TLabel
    Left = 200
    Top = 11
    Width = 71
    Height = 13
    Caption = #1044#1080#1072#1084#1077#1090#1088' '#1074#1072#1083#1072
  end
  object Label6: TLabel
    Left = 201
    Top = 38
    Width = 134
    Height = 13
    Caption = #1044#1080#1072#1084#1077#1090#1088' '#1073#1086#1083#1100#1096#1086#1075#1086' '#1082#1086#1083#1077#1089#1072
  end
  object Label7: TLabel
    Left = 201
    Top = 65
    Width = 120
    Height = 13
    Caption = #1044#1080#1072#1084#1077#1090#1088' '#1084#1072#1083#1086#1075#1086' '#1082#1086#1083#1077#1089#1072
  end
  object Label8: TLabel
    Left = 201
    Top = 92
    Width = 6
    Height = 13
    Caption = 'b'
  end
  object Button1: TButton
    Left = 8
    Top = 116
    Width = 363
    Height = 25
    Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 146
    Top = 8
    Width = 33
    Height = 21
    TabOrder = 1
    Text = '25'
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 146
    Top = 35
    Width = 33
    Height = 21
    TabOrder = 2
    Text = '4'
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 146
    Top = 62
    Width = 33
    Height = 21
    TabOrder = 3
    Text = '20'
    OnKeyPress = Edit3KeyPress
  end
  object Edit4: TEdit
    Left = 146
    Top = 89
    Width = 33
    Height = 21
    TabOrder = 4
    Text = '0,5'
    OnKeyPress = Edit4KeyPress
  end
  object Edit5: TEdit
    Left = 338
    Top = 8
    Width = 33
    Height = 21
    TabOrder = 5
    Text = '20'
  end
  object Edit6: TEdit
    Left = 338
    Top = 35
    Width = 33
    Height = 21
    TabOrder = 6
    Text = '40'
  end
  object Edit7: TEdit
    Left = 338
    Top = 62
    Width = 33
    Height = 21
    TabOrder = 7
    Text = '80'
  end
  object Edit8: TEdit
    Left = 338
    Top = 89
    Width = 33
    Height = 21
    TabOrder = 8
    Text = '10'
  end
  object Button2: TButton
    Left = 8
    Top = 144
    Width = 362
    Height = 25
    Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    TabOrder = 9
    OnClick = Button2Click
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 272
    Top = 104
  end
end
