unit untUnosStadiona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TformUnosStadiona = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    editSifra: TEdit;
    editNaziv: TEdit;
    editAdresa: TEdit;
    editKapacitet: TEdit;
    editUlazi: TEdit;
    btnPrethodni: TButton;
    btnSledeci: TButton;
    btnNovi: TButton;
    btnUpisi: TButton;
    btnIzadji: TButton;
    Label6: TLabel;
    cbGrad: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure btnNoviClick(Sender: TObject);
    procedure btnUpisiClick(Sender: TObject);
    procedure btnIzadjiClick(Sender: TObject);
    procedure btnPrethodniClick(Sender: TObject);
    procedure btnSledeciClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formUnosStadiona: TformUnosStadiona;

implementation

uses untDM;

{$R *.dfm}

procedure TformUnosStadiona.FormActivate(Sender: TObject);
  begin
    dm.STADION.Open;
    dm.STADION.First;                                                          //po tekstu zadatka, pri otvaranju
    editSifra.Text:=dm.STADION.FieldByName('StadionID').AsString;                 //prozora prikazuje se prvi rezultat
    editSifra.Enabled:=false;
    editNaziv.Text:=dm.STADION.FieldByName('Naziv').AsString;
    editAdresa.Text:=dm.STADION.FieldByName('Adresa').AsString;
    editKapacitet.Text:=dm.STADION.FieldByName('Kapacitet').AsString;
    editUlazi.Text:=dm.STADION.FieldByName('BrojUlaza').AsString;
    cbGrad.Clear; //ciscenje combobox-a
    dm.GRAD.Open;
    dm.GRAD.First;                                            //punjenje combobo-a Grad
    while(not(dm.GRAD.Eof)) do
      begin
        cbGrad.Items.Add(dm.GRAD.FieldByName('Grad').Value);
        dm.GRAD.Next;
      end;
    cbGrad.ItemIndex:=dm.STADION.FieldByName('GradID').Value-1;
    dm.GRAD.Close; 
    dm.STADION.Close;
    btnPrethodni.Enabled:=false;
    btnUpisi.Enabled:=false;
  end;

procedure TformUnosStadiona.btnNoviClick(Sender: TObject);
  begin
    editSifra.enabled:=true;              //aktiviranje posivljenih objekata
    btnPrethodni.Enabled:=true;
    btnUpisi.Enabled:=true;
    editSifra.Text:='';
    editNaziv.Text:='';                   //praznjenje combobox-ova, prema zadatku
    editAdresa.Text:='';
    editKapacitet.Text:='';
    editUlazi.Text:='';
    cbGrad.ItemHeight:=-1;
    cbGrad.Text:='';
    editSifra.SetFocus;                   //kursor se postavlja u polje Sifra
  end;

procedure TformUnosStadiona.btnUpisiClick(Sender: TObject);
  var
    int, provera: integer;
  begin
    dm.STADION.Open;
    val(editSifra.Text, int, provera); //proverava da li je sifra broj
    if((editSifra.Text<>'') and (editNaziv.Text<>'') and (cbGrad.Text<>'')) //proverava da li su obavezna polja uneta
      then
        begin
          if(provera=0) //ako je broj (val ce vratiti 0 u poslednju promenljivu), moze se nastaviti
            then
              begin
                if(dm.STADION.Locate('StadionID', editSifra.Text, [])=false) //proverava da li postoji rezultat sa upisanom sifrom
                  then
                    begin
                      dm.STADION.Append;          
                      dm.STADION.FieldByName('StadionID').Value:=StrToInt(editSifra.Text);
                      dm.STADION.FieldByName('Naziv').Value:=editNaziv.Text;
                      dm.STADION.FieldByName('Adresa').Value:=editAdresa.Text;
                      dm.STADION.FieldByName('Kapacitet').Value:=editKapacitet.Text;
                      dm.STADION.FieldByName('BrojUlaza').Value:=editUlazi.Text;
                      dm.STADION.FieldByName('GradID').Value:=cbGrad.ItemIndex+1;
                      dm.STADION.Post;
                      showmessage('Grad je uspesno upisan!');
                    end
                  else
                    showmessage('Vec postoji stadion sa upisanom sifrom!');
              end
            else
              showmessage('Sifra mora biti broj!');
        end
      else
        showmessage('Polja Sifra, Naziv i Grad su obavezna!');
    dm.STADION.Close;
  end;

procedure TformUnosStadiona.btnIzadjiClick(Sender: TObject);
  begin
    Close;
  end;

procedure TformUnosStadiona.btnPrethodniClick(Sender: TObject);
  var
    int, provera: integer;
  begin
    dm.STADION.Open;
    dm.STADION.First;  //postavlja se na prvi red u bazi
    val(editSifra.Text, int, provera); //proverava da li je sifra broj
      if(editSifra.Text<>'') //proverava da li su obavezna polja uneta
        then
          begin
            if(provera=0) //ako je broj, moze se nastaviti
              then
                begin
                  if(editSifra.Text=dm.STADION.FieldByName('StadionID').AsString) //poverava da li je uneta sifra ujedno i prvi rezultat u bazi
                    then
                      begin
                        dm.STADION.First;                                                      //prikazuje se, iako pre njega nema rezultata
                        editSifra.Text:=dm.STADION.FieldByName('StadionID').AsString;
                        editNaziv.Text:=dm.STADION.FieldByName('Naziv').AsString;
                        editAdresa.Text:=dm.STADION.FieldByName('Adresa').AsString;
                        editKapacitet.Text:=dm.STADION.FieldByName('Kapacitet').AsString;
                        editUlazi.Text:=dm.STADION.FieldByName('BrojUlaza').AsString;
                        cbGrad.ItemIndex:=dm.STADION.FieldByName('GradID').Value-1;
                        showmessage('Prikazani rezultat je prvi!');
                      end
                    else
                      begin
                        dm.STADION.Locate('StadionID', editSifra.Text, []);                    //prikazuje se rezultat za upisanu sifru
                        dm.STADION.Prior;
                        editSifra.Text:=dm.STADION.FieldByName('StadionID').AsString;
                        editNaziv.Text:=dm.STADION.FieldByName('Naziv').AsString;
                        editAdresa.Text:=dm.STADION.FieldByName('Adresa').AsString;
                        editKapacitet.Text:=dm.STADION.FieldByName('Kapacitet').AsString;
                        editUlazi.Text:=dm.STADION.FieldByName('BrojUlaza').AsString;
                        cbGrad.ItemIndex:=dm.STADION.FieldByName('GradID').Value-1;
                      end;
                end
              else
                showmessage('Sifra mora biti broj!');
          end
        else
          begin
            dm.STADION.First;                                                                  //po tekstu zadatka, prikazuje se prvi rezultat
            editSifra.Text:=dm.STADION.FieldByName('StadionID').AsString;
            editNaziv.Text:=dm.STADION.FieldByName('Naziv').AsString;
            editAdresa.Text:=dm.STADION.FieldByName('Adresa').AsString;
            editKapacitet.Text:=dm.STADION.FieldByName('Kapacitet').AsString;
            editUlazi.Text:=dm.STADION.FieldByName('BrojUlaza').AsString;
            cbGrad.ItemIndex:=dm.STADION.FieldByName('GradID').Value-1;
          end;
    dm.STADION.Close;
  end;

procedure TformUnosStadiona.btnSledeciClick(Sender: TObject);
  var
    int, provera: integer;
  begin
    editSifra.enabled:=true; //aktiviranje posivljenih objekata
    btnPrethodni.Enabled:=true;
    dm.STADION.Open;
    dm.STADION.Last;  //postavlja se na poslednji red u bazi
    val(editSifra.Text, int, provera); //proverava da li je sifra broj
      if(editSifra.Text<>'') //proverava da li su obavezna polja uneta
        then
          begin
            if(provera=0) //ako je broj, moze se nastaviti
              then
                begin
                  if(editSifra.Text=dm.STADION.FieldByName('StadionID').AsString) //poverava da li je uneta sifra ujedno i poslednji rezultat u bazi
                    then
                      begin
                        dm.STADION.Last;                                                      //prikazuje se, iako posle njega nema rezultata
                        editSifra.Text:=dm.STADION.FieldByName('StadionID').AsString;
                        editNaziv.Text:=dm.STADION.FieldByName('Naziv').AsString;
                        editAdresa.Text:=dm.STADION.FieldByName('Adresa').AsString;
                        editKapacitet.Text:=dm.STADION.FieldByName('Kapacitet').AsString;
                        editUlazi.Text:=dm.STADION.FieldByName('BrojUlaza').AsString;
                        cbGrad.ItemIndex:=dm.STADION.FieldByName('GradID').Value-1;
                        showmessage('Prikazani rezultat je poslednji!');
                      end
                    else
                      begin
                        dm.STADION.Locate('StadionID', editSifra.Text, []);                   //prikazuje se rezultat za upisanu sifru
                        dm.STADION.Next;
                        editSifra.Text:=dm.STADION.FieldByName('StadionID').AsString;
                        editNaziv.Text:=dm.STADION.FieldByName('Naziv').AsString;
                        editAdresa.Text:=dm.STADION.FieldByName('Adresa').AsString;
                        editKapacitet.Text:=dm.STADION.FieldByName('Kapacitet').AsString;
                        editUlazi.Text:=dm.STADION.FieldByName('BrojUlaza').AsString;
                        cbGrad.ItemIndex:=dm.STADION.FieldByName('GradID').Value-1;
                      end;
                end
              else
                showmessage('Sifra mora biti broj!');
          end
        else
          begin
            dm.STADION.Last;                                                                  //po tekstu zadatka, prikazuje se poslednji rezultat
            editSifra.Text:=dm.STADION.FieldByName('StadionID').AsString;
            editNaziv.Text:=dm.STADION.FieldByName('Naziv').AsString;
            editAdresa.Text:=dm.STADION.FieldByName('Adresa').AsString;
            editKapacitet.Text:=dm.STADION.FieldByName('Kapacitet').AsString;
            editUlazi.Text:=dm.STADION.FieldByName('BrojUlaza').AsString;
            cbGrad.ItemIndex:=dm.STADION.FieldByName('GradID').Value-1;
          end;
    dm.STADION.Close;
  end;

end.
