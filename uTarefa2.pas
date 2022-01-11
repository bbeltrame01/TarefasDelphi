{==============================================================================}
{  Desenvolvedor..: Bruno Beltrame                                             }
{  Criação........: 01/2022                                                    }
{  Atualização....: 01/2022                                                    }
{  Comentários....: Prova Datum TI - Tarefa 02                                 }
{==============================================================================}

unit uTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfTarefa2 = class(TForm)
    btn_iniciar: TButton;

    { Campos Thread 1 }
    pgb_trd1: TProgressBar;
    edt_mils_trd1: TEdit;
    upd_mils_trd1: TUpDown;
    lbl_mils_trd1: TLabel;
    txt_pgb_t1: TStaticText;

    { Campos Thread 2 }
    pgb_trd2: TProgressBar;
    edt_mils_trd2: TEdit;
    upd_mils_trd2: TUpDown;
    lbl_mils_trd2: TLabel;
    txt_pgb_t2: TStaticText;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_iniciarClick(Sender: TObject);
    procedure upd_mils_trd1Click(Sender: TObject; Button: TUDBtnType);
    procedure edt_mils_trd1KeyPress(Sender: TObject; var Key: Char);
    procedure upd_mils_trd2Click(Sender: TObject; Button: TUDBtnType);
    procedure edt_mils_trd2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure UpDown(Button: TUDBtnType; Edit: TEdit);
  public
    { Public declarations }
  end;

  { Thread 1 }
  TThread1 = class(TThread)
    private
      pb_01: TProgressBar;
      txt_01: TStaticText;
      edt_01: TEdit;
      Posicao: Integer;
    public
      { Public declarations }
      constructor Create(aProgressBar: TProgressBar; aStaticText: TStaticText; aEdit: TEdit); reintroduce;
      procedure Execute; override;
      procedure AtualizaPB;
  end;

  { Thread 2 }
  TThread2 = class(TThread)
    private
      pb_02: TProgressBar;
      txt_02: TStaticText;
      edt_02: TEdit;
      Posicao: Integer;
    public
      { Public declarations }
      constructor Create(aProgressBar: TProgressBar; aStaticText: TStaticText; aEdit: TEdit); reintroduce;
      procedure Execute; override;
      procedure AtualizaPB;
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

procedure TfTarefa2.btn_iniciarClick(Sender: TObject);
var
  Thread1: TThread1;
  Thread2: TThread2;
begin
  // Validações
  if StrToFloatDef(edt_mils_trd1.Text, 0)=0 then
  begin
    ShowMessage('Milissegundos Thread 1 deve ser maior que zero.');
    edt_mils_trd1.SetFocus;
    Exit;
  end else
  if StrToFloatDef(edt_mils_trd2.Text, 0)=0 then
  begin
    ShowMessage('Milissegundos Thread 2 deve ser maior que zero.');
    edt_mils_trd2.SetFocus;
    Exit;
  end;

  // Processamento
  try
    Thread1 := TThread1.Create(pgb_trd1, txt_pgb_t1, edt_mils_trd1);
    Thread2 := TThread2.Create(pgb_trd2, txt_pgb_t2, edt_mils_trd2);
    Thread1.Start;
    Thread2.Start;
  except on
    e: Exception do
      MessageDlg(e.Message,mtError,[mbOk],0,mbOk)
  end;
end;

procedure TThread1.AtualizaPB;
begin
  txt_01.Caption:=IntToStr(Posicao);
  pb_01.Position:=Posicao;
end;

constructor TThread1.Create(aProgressBar: TProgressBar; aStaticText: TStaticText; aEdit: TEdit);
begin
  inherited Create(True);
  FreeOnTerminate:=True;

  pb_01  := aProgressBar;
  txt_01 := aStaticText;
  edt_01 := aEdit;
end;

procedure TfTarefa2.edt_mils_trd1KeyPress(Sender: TObject; var Key: Char);
begin
  // #8 - Backspace
  if not (Key in [#8, '0'..'9']) then begin
    ShowMessage('Somente número');
    // Descarta a tecla
    Key := #0;
  end;
end;

procedure TThread2.AtualizaPB;
begin
  txt_02.Caption:=IntToStr(Posicao);
  pb_02.Position:=Posicao;
end;

constructor TThread2.Create(aProgressBar: TProgressBar; aStaticText: TStaticText; aEdit: TEdit);
begin
  inherited Create(True);
  FreeOnTerminate:=True;

  pb_02  := aProgressBar;
  txt_02 := aStaticText;
  edt_02 := aEdit;
end;

procedure TfTarefa2.edt_mils_trd2KeyPress(Sender: TObject; var Key: Char);
begin
  // #8 - Backspace
  if not (Key in [#8, '0'..'9']) then begin
    ShowMessage('Somente número');
    // Descarta a tecla
    Key := #0;
  end;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfTarefa2.UpDown(Button: TUDBtnType; Edit: TEdit);
var iValue: integer;
begin
  iValue := StrToIntDef(Edit.Text, 0);
  case Button of
    btNext: iValue := iValue + 1;
    btPrev: begin
      if iValue>0 then
        iValue := iValue -1;
    end;
  end;
  Edit.Text := IntToStr(iValue);
end;

procedure TfTarefa2.upd_mils_trd1Click(Sender: TObject; Button: TUDBtnType);
begin
  UpDown(Button, edt_mils_trd1);
end;

procedure TfTarefa2.upd_mils_trd2Click(Sender: TObject; Button: TUDBtnType);
begin
  UpDown(Button, edt_mils_trd2);
end;

{ TThread1 }

procedure TThread1.Execute;
var
  i,iSleep: Integer;
begin
  inherited;

  iSleep := StrToInt(edt_01.Text);
  Posicao:=0;
  Self.Queue(Self.AtualizaPB);
  for i:=0 to 100 do
  begin
    Posicao:=i;
    Self.Queue(Self.AtualizaPB);
    Sleep(iSleep);
  end;
end;

{ TThread2 }

procedure TThread2.Execute;
var
  i,iSleep: Integer;
begin
  inherited;

  iSleep := StrToInt(edt_02.Text);
  Posicao:=0;
  Self.Queue(Self.AtualizaPB);
  for i:=0 to 100 do
  begin
    Posicao:=i;
    Self.Queue(Self.AtualizaPB);
    Sleep(iSleep);
  end;
end;

end.
