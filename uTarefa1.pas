{==============================================================================}
{  Desenvolvedor..: Bruno Beltrame                                             }
{  Criação........: 01/2022                                                    }
{  Atualização....: 01/2022                                                    }
{  Comentários....: Prova Datum TI - Tarefa 01                                 }
{==============================================================================}

unit uTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uspQuery, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait;

type
  TfTarefa1 = class(TForm)
    lbl_colunas: TLabel;
    mem_colunas: TMemo;
    lbl_tabelas: TLabel;
    mem_tabelas: TMemo;
    lbl_condicoes: TLabel;
    mem_condicoes: TMemo;
    btn_gerar: TButton;
    mem_sql: TMemo;
    lbl_sql: TLabel;
    shp: TShape;
    btn_limpar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_gerarClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btn_gerarClick(Sender: TObject);
var
  spConnection: TFDConnection;
  spQuery: TspQuery;
begin
  spQuery := TspQuery.Create(nil);
  spConnection := TFDConnection.Create(nil);
  // Executa
  try
    try
      spQuery.Connection := spConnection;
      spQuery.spColunas.AddStrings(mem_colunas.Lines);
      spQuery.spTabelas.AddStrings(mem_tabelas.Lines);
      spQuery.spCondicoes.AddStrings(mem_condicoes.Lines);
      mem_sql.Lines.Add(spQuery.GeraSQL);
      mem_sql.SetFocus;
    finally
      spQuery.Free;
      spConnection.Free;
    end;
  except on
    e: Exception do
      MessageDlg(e.Message,mtError,[mbOk],0,mbOk);
  end;
end;

procedure TfTarefa1.btn_limparClick(Sender: TObject);
begin
  mem_sql.Clear;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
