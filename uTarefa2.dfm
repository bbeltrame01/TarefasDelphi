object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tarefa 02'
  ClientHeight = 121
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object lbl_mils_trd1: TLabel
    Left = 8
    Top = 15
    Width = 79
    Height = 16
    Caption = 'Milissegundos'
  end
  object lbl_mils_trd2: TLabel
    Left = 8
    Top = 71
    Width = 79
    Height = 16
    Caption = 'Milissegundos'
  end
  object pgb_trd1: TProgressBar
    Left = 112
    Top = 32
    Width = 547
    Height = 24
    Step = 1
    TabOrder = 5
  end
  object btn_iniciar: TButton
    Left = 665
    Top = 75
    Width = 121
    Height = 38
    Caption = 'Iniciar'
    TabOrder = 4
    OnClick = btn_iniciarClick
  end
  object pgb_trd2: TProgressBar
    Left = 112
    Top = 88
    Width = 547
    Height = 25
    Step = 1
    TabOrder = 6
  end
  object edt_mils_trd1: TEdit
    Left = 8
    Top = 32
    Width = 80
    Height = 24
    TabOrder = 0
    OnKeyPress = edt_mils_trd1KeyPress
  end
  object upd_mils_trd1: TUpDown
    Left = 89
    Top = 32
    Width = 17
    Height = 25
    TabOrder = 1
    OnClick = upd_mils_trd1Click
  end
  object edt_mils_trd2: TEdit
    Left = 8
    Top = 88
    Width = 80
    Height = 24
    TabOrder = 2
    OnKeyPress = edt_mils_trd2KeyPress
  end
  object upd_mils_trd2: TUpDown
    Left = 89
    Top = 88
    Width = 17
    Height = 25
    TabOrder = 3
    OnClick = upd_mils_trd2Click
  end
  object txt_pgb_t1: TStaticText
    Left = 373
    Top = 36
    Width = 4
    Height = 4
    Color = clNone
    ParentColor = False
    TabOrder = 7
  end
  object txt_pgb_t2: TStaticText
    Left = 373
    Top = 92
    Width = 4
    Height = 4
    Color = clNone
    ParentColor = False
    TabOrder = 8
  end
end
