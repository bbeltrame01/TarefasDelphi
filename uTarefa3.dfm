object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tarefa 03'
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object lbl_titulo: TLabel
    Left = 8
    Top = 13
    Width = 111
    Height = 16
    Caption = 'Valores por Projeto'
  end
  object lbl_tot: TLabel
    Left = 632
    Top = 325
    Width = 48
    Height = 16
    Caption = 'Total R$'
  end
  object lbl_tot_div: TLabel
    Left = 632
    Top = 372
    Width = 98
    Height = 16
    Caption = 'Total Divis'#245'es R$'
  end
  object btn_total: TButton
    Left = 448
    Top = 325
    Width = 162
    Height = 41
    Caption = 'Obter Total'
    TabOrder = 0
    OnClick = btn_totalClick
  end
  object edt_tot: TMaskEdit
    Left = 632
    Top = 342
    Width = 121
    Height = 24
    ReadOnly = True
    TabOrder = 1
    Text = ''
  end
  object edt_tot_div: TMaskEdit
    Left = 632
    Top = 389
    Width = 121
    Height = 24
    ReadOnly = True
    TabOrder = 2
    Text = ''
  end
  object btn_total_div: TButton
    Left = 448
    Top = 372
    Width = 162
    Height = 41
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 3
    OnClick = btn_total_divClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 32
    Width = 778
    Height = 287
    DataSource = src
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idProjeto'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeProjeto'
        Width = 520
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 120
        Visible = True
      end>
  end
  object cds: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'idProjeto'
        DataType = ftInteger
      end
      item
        Name = 'NomeProjeto'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Valor'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 216
    Top = 344
    object cdsidProjeto: TIntegerField
      FieldName = 'idProjeto'
    end
    object cdsNomeProjeto: TStringField
      FieldName = 'NomeProjeto'
      Size = 100
    end
    object cdsValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#,###,##0.00'
    end
    object cdsTotValor: TAggregateField
      DefaultExpression = 'SUM(Valor)'
      FieldName = 'TotValor'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,###,##0.00'
      Expression = 'SUM(Valor)'
    end
  end
  object src: TDataSource
    DataSet = cds
    Left = 256
    Top = 344
  end
end
