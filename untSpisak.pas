unit untSpisak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  igrac = record
    ime, prezime, klub, grad, pozicija: string;
  end;
  TformSpisak = class(TForm)
    cbgrad: TComboBox;
    cbPozicija: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    btnPrikazi: TButton;
    btnIzadji: TButton;
    stringGrid: TStringGrid;
    procedure btnIzadjiClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnPrikaziClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSpisak: TformSpisak;

implementation

uses untDM;

{$R *.dfm}

procedure TformSpisak.btnIzadjiClick(Sender: TObject);
  begin
    Close;
  end;

procedure TformSpisak.FormActivate(Sender: TObject);
  begin
    cbGrad.Clear;       //ciscenje combobox-ova
    cbPozicija.Clear;
    dm.GRAD.Open;
    dm.GRAD.First;                                            //punjenje combobo-a Grad
    while(not(dm.GRAD.Eof)) do
      begin
        cbGrad.Items.Add(dm.GRAD.FieldByName('Grad').Value);
        dm.GRAD.Next;
      end;
    dm.GRAD.Close;
    dm.POZICIJA.Open;
    dm.POZICIJA.First;                                        //punjenje combobo-a Pozicija
    while(not(dm.POZICIJA.Eof)) do
      begin
        cbPozicija.Items.Add(dm.POZICIJA.FieldByName('Naziv').Value);
        dm.POZICIJA.Next;
      end;
    stringGrid.RowCount:=1; //na pocetku, stringGrid pokazuje samo imena kolona, pa je potreban samo jedan red
    stringGrid.Cells[1, 0]:='Ime';
    stringGrid.Cells[2, 0]:='Prezime';
    stringGrid.Cells[3, 0]:='Klub';
    stringGrid.Cells[4, 0]:='Grad';
    stringGrid.Cells[5, 0]:='Pozicija';
    dm.POZICIJA.Close;
  end;

procedure TformSpisak.btnPrikaziClick(Sender: TObject);
  var
    gradID, pozicijaID, klubID, br, i, j: integer;
    igraci: array[1..100] of igrac;
    temp: igrac;
  begin
    dm.GRAD.Open;
    dm.POZICIJA.Open;
    dm.IGRAC.Open;
    dm.KLUB.Open;
    if((cbGrad.Text<>'') and (cbPozicija.Text<>'')) //proverava da li su obavezna polja uneta
      then
        begin
          stringGrid.RowCount:=1; //za svaki slucaj, broj redova se postavlja na 1
          dm.GRAD.Locate('Grad', cbGrad.Text, []); //locira red u kome se nalazi oznaceni grad
          gradID:=dm.GRAD.FieldByName('GradID').Value;
          dm.POZICIJA.Locate('Naziv', cbPozicija.Text, []); //locira red u kome se nalazi oznacena pozicija
          pozicijaID:=StrToInt(dm.POZICIJA.FieldByName('PozicijaID').Value);
          dm.IGRAC.First;
          br:=0;
          while(not(dm.IGRAC.Eof)) do
            begin
              if((dm.IGRAC.FieldByName('GradID').Value=gradID) and (dm.IGRAC.FieldByName('PozicijaID').Value=pozicijaID)) //za prikaz samo onih igraca kod koji zive
                then                                                                                                      //u oznacenom gradu i igraju na oznacenoj poziciji
                  begin
                    br:=br+1;                                                   //povlacenje potrebnih podataka
                    igraci[br].ime:=dm.IGRAC.FieldByName('Ime').Value;          //u niz podataka tipa 'igrac'
                    igraci[br].prezime:=dm.IGRAC.FieldByName('prezime').Value;  //(pogledaj u 'type' gore)
                    klubID:=dm.IGRAC.FieldByName('KlubID').Value;
                    dm.KLUB.Locate('KlubID', klubID, []);
                    igraci[br].klub:=dm.KLUB.FieldByName('NazivKluba').Value;
                    igraci[br].grad:=cbGrad.Text;          //s obzirom da su grad i pozicija vec poznati
                    igraci[br].pozicija:=cbPozicija.Text;  //ne moramo za njima tragati po bazi
                  end;
              dm.IGRAC.Next;
            end;
          for i:=1 to br-1 do                     //sortiranje po nazivu kluba u opadajucem redosledu
            for j:=i+1 to br do                   //prvo je jer se u zadatku trazi da nakon sortiranog
                if(igraci[i].klub<igraci[j].klub) //imena i prezimena bude ovako sortirano, pa ako bismo
                  then                            //ovako sortirali nakon sortiranja po imenu, ovo bi bilo
                    begin                         //glavno sortiranje
                      temp:=igraci[i];
                      igraci[i]:=igraci[j];
                      igraci[j]:=temp;
                    end;
          for i:=1 to br-1 do                           //sortiranje po prezimenu u rastucem redosledu
            for j:=i+1 to br do
                if(igraci[i].prezime>igraci[j].prezime)
                  then
                    begin
                      temp:=igraci[i];
                      igraci[i]:=igraci[j];
                      igraci[j]:=temp;
                    end;
          for i:=1 to br-1 do                   //sortiranje po prezimenu u rastucem redosledu
            for j:=i+1 to br do
                if(igraci[i].ime>igraci[j].ime)
                  then
                    begin
                      temp:=igraci[i];
                      igraci[i]:=igraci[j];
                      igraci[j]:=temp;
                    end;
          for i:=1 to br do                               //popunjavanje stringGrid-a
            begin
              stringGrid.Cells[1, i]:=igraci[i].ime;
              stringGrid.Cells[2, i]:=igraci[i].prezime;
              stringGrid.Cells[3, i]:=igraci[i].klub;
              stringGrid.Cells[4, i]:=igraci[i].grad;
              stringGrid.Cells[5, i]:=igraci[i].pozicija;
              stringGrid.RowCount:=br+1;
            end;
          if(stringGrid.RowCount=1) //ukoliko jos uvek postoji samo jedan red,
            then                    //nije pronadjen ni jedan igrac
              showmessage('Nema igraca za unete parametre!');
        end
      else
        showmessage('Odaberite vrednosti za Grad i Poziciju!');
    dm.GRAD.Close;
    dm.POZICIJA.Close;
    dm.IGRAC.Close;
    dm.KLUB.Close;
  end;

end.
