unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TformMain = class(TForm)
    MainMenu1: TMainMenu;
    Gradovi1: TMenuItem;
    Unos1: TMenuItem;
    Spisakigraca1: TMenuItem;
    Stadioni1: TMenuItem;
    Unos2: TMenuItem;
    Kapacitetstadiona1: TMenuItem;
    Izlaz1: TMenuItem;
    Krajrada1: TMenuItem;
    procedure Unos1Click(Sender: TObject);
    procedure Spisakigraca1Click(Sender: TObject);
    procedure Unos2Click(Sender: TObject);
    procedure Kapacitetstadiona1Click(Sender: TObject);
    procedure Krajrada1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

uses untKapacitet, untSpisak, untUnosGradova, untUnosStadiona;

{$R *.dfm}

procedure TformMain.Unos1Click(Sender: TObject);
  begin
    formUnosGradova.ShowModal;
  end;

procedure TformMain.Spisakigraca1Click(Sender: TObject);
  begin
    formSpisak.ShowModal;
  end;

procedure TformMain.Unos2Click(Sender: TObject);
  begin
    formUnosStadiona.ShowModal;
  end;

procedure TformMain.Kapacitetstadiona1Click(Sender: TObject);
  begin
    formKapacitet.ShowModal;
  end;

procedure TformMain.Krajrada1Click(Sender: TObject);
  begin
    Close;
  end;

end.
