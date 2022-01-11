object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tarefa 01'
  ClientHeight = 421
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
  object lbl_colunas: TLabel
    Left = 16
    Top = 16
    Width = 45
    Height = 16
    Caption = 'Colunas'
  end
  object lbl_tabelas: TLabel
    Left = 239
    Top = 16
    Width = 45
    Height = 16
    Caption = 'Tabelas'
  end
  object lbl_condicoes: TLabel
    Left = 462
    Top = 16
    Width = 58
    Height = 16
    Caption = 'Condi'#231#245'es'
  end
  object lbl_sql: TLabel
    Left = 16
    Top = 215
    Width = 68
    Height = 16
    Caption = 'SQL Gerado'
  end
  object shp: TShape
    Left = 16
    Top = 207
    Width = 770
    Height = 2
  end
  object mem_colunas: TMemo
    Left = 16
    Top = 33
    Width = 209
    Height = 155
    TabOrder = 0
  end
  object mem_tabelas: TMemo
    Left = 239
    Top = 33
    Width = 209
    Height = 155
    TabOrder = 1
  end
  object mem_condicoes: TMemo
    Left = 462
    Top = 33
    Width = 209
    Height = 155
    TabOrder = 2
  end
  object btn_gerar: TButton
    Left = 677
    Top = 99
    Width = 109
    Height = 41
    Caption = 'Gerar SQL'
    TabOrder = 3
    OnClick = btn_gerarClick
  end
  object mem_sql: TMemo
    Left = 16
    Top = 233
    Width = 770
    Height = 180
    TabOrder = 5
  end
  object btn_limpar: TButton
    Left = 677
    Top = 147
    Width = 109
    Height = 41
    Caption = 'Limpar SQL'
    TabOrder = 4
    OnClick = btn_limparClick
  end
end
