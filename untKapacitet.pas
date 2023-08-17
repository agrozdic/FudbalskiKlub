unit untKapacitet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Grids;

type
 stadion = record
    naziv, klub, sajt: string;
    kapacitet, ulazi: integer;
  end;
  TformKapacitet = class(TForm)
    Label1: TLabel;
    btnPrikazi: TButton;
    btnIzadji: TButton;
    stringGrid: TStringGrid;
    editKapacitet: TEdit;
    procedure btnPrikaziClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnIzadjiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formKapacitet: TformKapacitet;

implementation

uses untDM;

{$R *.dfm}

procedure TformKapacitet.btnPrikaziClick(Sender: TObject);
  var
    int, provera, br, i, j: integer;
    stadioni: array[1..100] of stadion;
    temp: stadion;
  begin
    dm.STADION.Open;
    dm.KLUB.Open;
    val(editKapacitet.Text, int, provera); //proverava da li je kapacitet broj
    if(editKapacitet.Text<>'') //proverava da li su obavezna polja uneta
      then
        begin
          if(provera=0) //ako je broj, moze se nastaviti
            then
              begin
                stringGrid.RowCount:=1; //za svaki slucaj, broj redova se postavlja na 1
                dm.STADION.First;
                br:=0;
                while(not(dm.STADION.Eof)) do
                  begin
                    if(dm.STADION.FieldByName('Kapacitet').Value>StrToInt(editKapacitet.Text)) //proverava da li je kapacitet veci od upisanog
                      then
                        begin
                          br:=br+1;                                                           //povlacenje potrebnih podataka
                          stadioni[br].naziv:=dm.STADION.FieldByName('Naziv').Value;          //u niz podataka tipa 'stadion'
                          stadioni[br].kapacitet:=dm.STADION.FieldByName('Kapacitet').Value;  //(pogledaj u 'type' gore)
                          stadioni[br].ulazi:=dm.STADION.FieldByName('BrojUlaza').Value;
                          if(dm.KLUB.Locate('StadionID', dm.STADION.FieldByName('StadionID').Value, [])=true) //proverava da li neki klub
                            then                                                                              //koristi dati stadion
                              begin
                                stadioni[br].klub:=dm.KLUB.FieldByName('NazivKluba').Value;
                                stadioni[br].sajt:=dm.KLUB.FieldByName('Sajt').Value;
                              end
                            else
                              begin
                                stadioni[br].klub:='';
                                stadioni[br].sajt:='';
                              end;
                          for i:=1 to br-1 do                             //sortiranje po broju ulaza u opadajucem redosledu
                            for j:=i+1 to br do                           //prvo je jer se u zadatku trazi da nakon sortiranog
                              if(stadioni[i].ulazi<stadioni[j].ulazi)     //kapaciteta bude ovako sortirano, pa ako bismo
                                then                                      //ovako sortirali nakon sortiranja po kapacitetu, ovo bi bilo
                                  begin                                   //glavno sortiranje
                                    temp:=stadioni[i];
                                    stadioni[i]:=stadioni[j];
                                    stadioni[j]:=temp;
                                  end;
                          for i:=1 to br-1 do                             //sortiranje po kapacitetu u rastucem redosledu
                            for j:=i+1 to br do
                              if(stadioni[i].kapacitet>stadioni[j].kapacitet)
                                then
                                  begin
                                    temp:=stadioni[i];
                                    stadioni[i]:=stadioni[j];
                                    stadioni[j]:=temp;
                                  end;
                          for i:=1 to br do                                       //popunjavanje stringGrid-a
                            begin
                              stringGrid.Cells[1, i]:=stadioni[i].naziv;
                              stringGrid.Cells[2, i]:=stadioni[i].klub;
                              stringGrid.Cells[3, i]:=stadioni[i].sajt;
                              stringGrid.Cells[4, i]:=IntToStr(stadioni[i].kapacitet);
                              stringGrid.Cells[5, i]:=IntToStr(stadioni[i].ulazi);
                              stringGrid.RowCount:=br+1;
                            end;
                          if(stringGrid.RowCount=1) //ukoliko jos uvek postoji samo jedan red,
                            then                    //nije pronadjen ni jedan igrac
                              showmessage('Nema stadiona za unete parametre!');
                        end;
                  dm.STADION.Next;
              end;
            end
          else
            showmessage('Kapacitet mora biti broj!');
        end
      else
        showmessage('Unesite kapacitet!');
    dm.STADION.Close;
    dm.KLUB.Close;
  end;

procedure TformKapacitet.FormActivate(Sender: TObject);
  begin
    stringGrid.RowCount:=1; //na pocetku, stringGrid pokazuje samo imena kolona, pa je potreban samo jedan red
    stringGrid.Cells[1, 0]:='Naziv';
    stringGrid.Cells[2, 0]:='Klub';
    stringGrid.Cells[3, 0]:='Sajt';
    stringGrid.Cells[4, 0]:='Kapacitet';
    stringGrid.Cells[5, 0]:='Broj ulaza';
  end;

procedure TformKapacitet.btnIzadjiClick(Sender: TObject);
  begin
    Close;
  end;

end.
