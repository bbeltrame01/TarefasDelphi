{==============================================================================}
{  Desenvolvedor..: Bruno Beltrame                                             }
{  Criação........: 01/2022                                                    }
{  Atualização....: 01/2022                                                    }
{  Comentários....: Prova Datum TI - Tarefa 03                                 }
{==============================================================================}

unit uTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Mask,
  Data.DB, Datasnap.DBClient, Vcl.DBGrids;

type
  TfTarefa3 = class(TForm)
    lbl_titulo: TLabel;
    btn_total: TButton;
    lbl_tot: TLabel;
    edt_tot: TMaskEdit;
    lbl_tot_div: TLabel;
    edt_tot_div: TMaskEdit;
    btn_total_div: TButton;
    DBGrid1: TDBGrid;
    cds: TClientDataSet;
    src: TDataSource;
    cdsidProjeto: TIntegerField;
    cdsNomeProjeto: TStringField;
    cdsValor: TFloatField;
    cdsTotValor: TAggregateField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_totalClick(Sender: TObject);
    procedure btn_total_divClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btn_totalClick(Sender: TObject);
begin
  if cds.State in dsEditModes then
    cds.Post;
  edt_tot.Text := FormatFloat('#,###,##0.00',StrToFloatDef(cdsTotValor.AsString, 0));
end;

procedure TfTarefa3.btn_total_divClick(Sender: TObject);
var dSoma,dVlrAnt: double;
begin
  dSoma:=0;
  cds.First;
  while not cds.Eof do
  begin
    if cds.RecNo>1 then
      dSoma := dSoma + (cdsValor.AsFloat / dVlrAnt);
    // Valor Registro Anterior
    dVlrAnt := cdsValor.AsFloat;
    // Próximo
    cds.Next;
  end;
  edt_tot_div.Text := FormatFloat('#,###,##0.00', dSoma);
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;                 // Cria um DataSet fictício
  cds.IndexFieldNames:='idProjeto';  // Define as Fields index
  cds.LogChanges:=False;             // Sem Comunicação com o Banco de Dados - Melhorar a perfomance
  cds.EmptyDataSet;                  // Limpar os Registros
end;

end.
