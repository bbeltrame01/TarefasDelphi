object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Principal'
  ClientHeight = 551
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = menu
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object menu: TMainMenu
    Left = 264
    Top = 136
    object tarefas: TMenuItem
      Caption = 'Tarefas'
      object tarefa1: TMenuItem
        Action = act_tarefa1
      end
      object tarefa2: TMenuItem
        Action = act_tarefa2
      end
      object tarefa3: TMenuItem
        Action = act_tarefa3
      end
    end
  end
  object al_menu: TActionList
    Left = 304
    Top = 136
    object act_tarefa1: TAction
      Caption = 'Tarefa 01'
      OnExecute = act_tarefa1Execute
    end
    object act_tarefa2: TAction
      Caption = 'Tarefa 02'
      OnExecute = act_tarefa2Execute
    end
    object act_tarefa3: TAction
      Caption = 'Tarefa 03'
      OnExecute = act_tarefa3Execute
    end
  end
end
