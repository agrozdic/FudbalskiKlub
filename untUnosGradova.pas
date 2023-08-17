unit untUnosGradova;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TformUnosGradova = class(TForm)
    editSifra: TEdit;
    editGrad: TEdit;
    editPozivni: TEdit;
    editPostanski: TEdit;
    editStanovnici: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnPrethodni: TButton;
    btnSledeci: TButton;
    btnNovi: TButton;
    btnUpisi: TButton;
    btnIzadji: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnIzadjiClick(Sender: TObject);
    procedure btnNoviClick(Sender: TObject);
    procedure btnUpisiClick(Sender: TObject);
    procedure btnPrethodniClick(Sender: TObject);
    procedure btnSledeciClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formUnosGradova: TformUnosGradova;

implementation

uses untDM;

{$R *.dfm}

procedure TformUnosGradova.FormActivate(Sender: TObject);
  begin
    dm.GRAD.Open;
    dm.GRAD.First;                                                          //po tekstu zadatka, pri otvaranju
    editSifra.Text:=dm.GRAD.FieldByName('GradID').AsString;                 //prozora prikazuje se prvi rezultat
    editSifra.Enabled:=false;
    editGrad.Text:=dm.GRAD.FieldByName('Grad').AsString;
    editPozivni.Text:=dm.GRAD.FieldByName('PozivniBroj').AsString;
    editPostanski.Text:=dm.GRAD.FieldByName('PostanskiBroj').AsString;
    editStanovnici.Text:=dm.GRAD.FieldByName('BrojStanovnika').AsString;
    dm.GRAD.Close;
    btnPrethodni.Enabled:=false;
    btnUpisi.Enabled:=false;
    dm.GRAD.Close;
  end;

procedure TformUnosGradova.btnIzadjiClick(Sender: TObject);
  begin
    Close;
  end;

procedure TformUnosGradova.btnNoviClick(Sender: TObject);
  begin
    editSifra.enabled:=true;              //aktiviranje posivljenih objekata
    btnPrethodni.Enabled:=true;
    btnUpisi.Enabled:=true;
    editSifra.Text:='';                   //praznjenje combobox-ova, prema zadatku
    editGrad.Text:='';
    editPozivni.Text:='';
    editPostanski.Text:='';
    editStanovnici.Text:='';
    editSifra.SetFocus;                   //kursor se postavlja u polje Sifra
  end;

procedure TformUnosGradova.btnUpisiClick(Sender: TObject);
  var
    int, provera: integer;
  begin
    dm.GRAD.Open;
    val(editSifra.Text, int, provera); //proverava da li je sifra broj
    if((editSifra.Text<>'') and (editGrad.Text<>'')) //proverava da li su obavezna polja uneta
      then
        begin
          if(provera=0) //ako je broj (val ce vratiti 0 u poslednju promenljivu), moze se nastaviti
            then
              begin
                if(dm.GRAD.Locate('GradID', editSifra.Text, [])=false) //proverava da li postoji rezultat sa upisanom sifrom
                  then
                    begin
                      dm.GRAD.Append;              
                      dm.GRAD.FieldByName('GradID').Value:=StrToInt(editSifra.Text);
                      dm.GRAD.FieldByName('Grad').Value:=editGrad.Text;
                      dm.GRAD.FieldByName('PozivniBroj').Value:=editPozivni.Text;
                      dm.GRAD.FieldByName('PostanskiBroj').Value:=editPostanski.Text;
                      dm.GRAD.FieldByName('BrojStanovnika').Value:=editStanovnici.Text;
                      dm.GRAD.Post;
                      showmessage('Grad je uspesno upisan!');
                    end
                  else
                    showmessage('Vec postoji grad sa upisanom sifrom!');
              end
            else
              showmessage('Sifra mora biti broj!');
        end
      else
        showmessage('Polja Sifra i Grad su obavezna!');
    dm.GRAD.Close;
  end;

procedure TformUnosGradova.btnPrethodniClick(Sender: TObject);
  var
    int, provera: integer;
  begin
    dm.GRAD.Open;
    dm.GRAD.First;  //postavlja se na prvi red u bazi
    val(editSifra.Text, int, provera); //proverava da li je sifra broj
      if(editSifra.Text<>'') //proverava da li su obavezna polja uneta
        then
          begin
            if(provera=0) //ako je broj, moze se nastaviti
              then
                begin
                  if(editSifra.Text=dm.GRAD.FieldByName('GradID').AsString) //poverava da li je uneta sifra ujedno i prvi rezultat u bazi
                    then
                      begin
                        dm.GRAD.First;                                                      //prikazuje se, iako pre njega nema rezultata
                        editSifra.Text:=dm.GRAD.FieldByName('GradID').AsString;
                        editGrad.Text:=dm.GRAD.FieldByName('Grad').AsString;
                        editPozivni.Text:=dm.GRAD.FieldByName('PozivniBroj').AsString;
                        editPostanski.Text:=dm.GRAD.FieldByName('PostanskiBroj').AsString;
                        editStanovnici.Text:=dm.GRAD.FieldByName('BrojStanovnika').AsString;
                        showmessage('Prikazani rezultat je prvi!');
                      end
                    else
                      begin
                        dm.GRAD.Locate('GradID', editSifra.Text, []);                       //prikazuje se rezultat za upisanu sifru
                        dm.GRAD.Prior;
                        editSifra.Text:=dm.GRAD.FieldByName('GradID').AsString;
                        editGrad.Text:=dm.GRAD.FieldByName('Grad').AsString;
                        editPozivni.Text:=dm.GRAD.FieldByName('PozivniBroj').AsString;
                        editPostanski.Text:=dm.GRAD.FieldByName('PostanskiBroj').AsString;
                        editStanovnici.Text:=dm.GRAD.FieldByName('BrojStanovnika').AsString;
                      end;
                end
              else
                showmessage('Sifra mora biti broj!');
          end
        else
          begin
            dm.GRAD.First;                                                                  //po tekstu zadatka, prikazuje se prvi rezultat
            editSifra.Text:=dm.GRAD.FieldByName('GradID').AsString;
            editGrad.Text:=dm.GRAD.FieldByName('Grad').AsString;
            editPozivni.Text:=dm.GRAD.FieldByName('PozivniBroj').AsString;
            editPostanski.Text:=dm.GRAD.FieldByName('PostanskiBroj').AsString;
            editStanovnici.Text:=dm.GRAD.FieldByName('BrojStanovnika').AsString;
          end;
    dm.GRAD.Close;
  end;

procedure TformUnosGradova.btnSledeciClick(Sender: TObject);
  var
    int, provera: integer;
  begin
    editSifra.enabled:=true;    //aktiviranje posivljenih objekata
    btnPrethodni.Enabled:=true;
    dm.GRAD.Open;
    dm.GRAD.Last; //postavlja se na poslednji red u bazi
    val(editSifra.Text, int, provera); //proverava da li je sifra broj
      if(editSifra.Text<>'') //proverava da li su obavezna polja uneta
        then
          begin
            if(provera=0) //ako je broj, moze se nastaviti
              then
                begin
                  if(editSifra.Text=dm.GRAD.FieldByName('GradID').AsString) //poverava da li je uneta sifra ujedno i poslednji rezultat u bazi
                    then
                      begin
                        dm.GRAD.Last;                                                       //prikazuje se, iako posle njega nema rezultata
                        editSifra.Text:=dm.GRAD.FieldByName('GradID').AsString;
                        editGrad.Text:=dm.GRAD.FieldByName('Grad').AsString;
                        editPozivni.Text:=dm.GRAD.FieldByName('PozivniBroj').AsString;
                        editPostanski.Text:=dm.GRAD.FieldByName('PostanskiBroj').AsString;
                        editStanovnici.Text:=dm.GRAD.FieldByName('BrojStanovnika').AsString;
                        showmessage('Prikazani rezultat je poslednji!');
                      end
                    else
                      begin
                        dm.GRAD.Locate('GradID', editSifra.Text, []);                       //prikazuje se rezultat za upisanu sifru
                        dm.GRAD.Next;
                        editSifra.Text:=dm.GRAD.FieldByName('GradID').AsString;
                        editGrad.Text:=dm.GRAD.FieldByName('Grad').AsString;
                        editPozivni.Text:=dm.GRAD.FieldByName('PozivniBroj').AsString;
                        editPostanski.Text:=dm.GRAD.FieldByName('PostanskiBroj').AsString;
                        editStanovnici.Text:=dm.GRAD.FieldByName('BrojStanovnika').AsString;
                    end;
                end
              else
                showmessage('Sifra mora biti broj!');
          end
        else
          begin
            dm.GRAD.Last;
            editSifra.Text:=dm.GRAD.FieldByName('GradID').AsString;                         //po tekstu zadatka, prikazuje se poslednji rezultat
            editGrad.Text:=dm.GRAD.FieldByName('Grad').AsString;
            editPozivni.Text:=dm.GRAD.FieldByName('PozivniBroj').AsString;
            editPostanski.Text:=dm.GRAD.FieldByName('PostanskiBroj').AsString;
            editStanovnici.Text:=dm.GRAD.FieldByName('BrojStanovnika').AsString;
          end;
    dm.GRAD.Close;
  end;

end.
