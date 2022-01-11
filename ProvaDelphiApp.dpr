program ProvaDelphiApp;

uses
  Vcl.Forms,
  principal in 'principal.pas' {fPrincipal},
  uTarefa1 in 'uTarefa1.pas' {fTarefa1},
  uTarefa2 in 'uTarefa2.pas' {fTarefa2},
  uTarefa3 in 'uTarefa3.pas' {fTarefa3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
