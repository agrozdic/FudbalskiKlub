program FudbalskiKlub;

uses
  Forms,
  untMain in 'untMain.pas' {formMain},
  untUnosGradova in 'untUnosGradova.pas' {formUnosGradova},
  untSpisak in 'untSpisak.pas' {formSpisak},
  untKapacitet in 'untKapacitet.pas' {formKapacitet},
  untUnosStadiona in 'untUnosStadiona.pas' {formUnosStadiona},
  untDM in 'untDM.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TformUnosGradova, formUnosGradova);
  Application.CreateForm(TformSpisak, formSpisak);
  Application.CreateForm(TformKapacitet, formKapacitet);
  Application.CreateForm(TformUnosStadiona, formUnosStadiona);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
