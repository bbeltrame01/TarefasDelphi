unit principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TfPrincipal = class(TForm)
    menu: TMainMenu;
    tarefas: TMenuItem;
    tarefa1: TMenuItem;
    tarefa2: TMenuItem;
    tarefa3: TMenuItem;
    al_menu: TActionList;
    act_tarefa1: TAction;
    act_tarefa2: TAction;
    act_tarefa3: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure act_tarefa1Execute(Sender: TObject);
    procedure act_tarefa2Execute(Sender: TObject);
    procedure act_tarefa3Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses
  uTarefa1, uTarefa2, uTarefa3;

{$R *.dfm}

procedure TfPrincipal.act_tarefa1Execute(Sender: TObject);
var
  fTarefa1: TfTarefa1;
begin
  if not Assigned(fTarefa1) then
    fTarefa1 := TfTarefa1.Create(self);
  fTarefa1.Show;
end;

procedure TfPrincipal.act_tarefa2Execute(Sender: TObject);
var
  fTarefa2: TfTarefa2;
begin
  if not Assigned(fTarefa2) then
    fTarefa2 := TfTarefa2.Create(self);
  fTarefa2.Show;
end;

procedure TfPrincipal.act_tarefa3Execute(Sender: TObject);
var
  fTarefa3: TfTarefa3;
begin
  if not Assigned(fTarefa3) then
    fTarefa3 := TfTarefa3.Create(self);
  fTarefa3.Show;
end;

procedure TfPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;

end.
