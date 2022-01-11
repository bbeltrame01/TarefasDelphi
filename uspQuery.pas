{==============================================================================}
{  Desenvolvedor..: Bruno Beltrame                                             }
{  Criação........: 01/2022                                                    }
{  Atualização....: 01/2022                                                    }
{  Comentários....: Prova Datum TI - vaga Delphi Pleno                         }
{==============================================================================}

unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TspQuery = class(TFDQuery)
  private
    fspCondicoes: TStringList;
    fspColunas:   TStringList;
    fspTabelas:   TStringList;

    procedure SetCondicoes(const Value: TStringList);
    procedure SetColunas(const Value: TStringList);
    procedure SetTabelas(const Value: TStringList);
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GeraSQL: String;
  published
    { Published declarations }
    property spCondicoes: TStringList read fspCondicoes write SetCondicoes;
    property spColunas:   TStringList read fspColunas   write SetColunas;
    property spTabelas:   TStringList read fspTabelas   write SetTabelas;
  end;

implementation

uses
  Vcl.Dialogs, System.UITypes, System.Types;

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  spCondicoes := TStringList.Create;
  spColunas   := TStringList.Create;
  spTabelas   := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
  spCondicoes.Free;
  spColunas.Free;
  spTabelas.Free;
  inherited Destroy;
end;

function TspQuery.GeraSQL: String;
var
  sSQL,sCampos,sFiltros: String;
  i: Integer;
begin
  Result:='';

  // Validações
  if spTabelas.Count>1 then
  begin
    MessageDlg('Atenção!'+#13#10+'É permitido informar apenas uma tabela para a geração do SQL.',mtError,[mbOk],0,mbOk);
    Abort;
  end;

  try
    // Campos SQL
    for i:=0 to spColunas.Count-1 do
    begin
      if i>0 then
        sCampos := sCampos + ',';
      sCampos := sCampos + spColunas[i];
    end;

    // Filtros SQL
    for i:=0 to spCondicoes.Count-1 do
    begin
      if i=0 then
        sFiltros := ' WHERE '
      else
        sFiltros := sFiltros + ' AND ';
      sFiltros := sFiltros + spCondicoes[i];
    end;

    sSQL := 'SELECT ' + sCampos + ' FROM ' + spTabelas[0];
    if sFiltros<>'' then
      sSQL := sSQL + sFiltros;

    SQL.Clear;
    SQL.Add(sSQL);

    Result := sSQL;
  except on
    e: Exception do
      MessageDlg(e.Message,mtError,[mbOk],0,mbOk);
  end;
end;

procedure TspQuery.SetColunas(const Value: TStringList);
begin
  if (Value<>nil) then
    fspColunas := Value;
end;

procedure TspQuery.SetCondicoes(const Value: TStringList);
begin
  if (Value<>nil) then
    fspCondicoes := Value;
end;

procedure TspQuery.SetTabelas(const Value: TStringList);
begin
  if (Value<>nil) then
    fspTabelas := Value;
end;

end.
