object formUnosStadiona: TformUnosStadiona
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Stadion'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 416
    Top = 88
    Width = 22
    Height = 13
    Caption = 'Sifra'
  end
  object Label2: TLabel
    Left = 408
    Top = 120
    Width = 26
    Height = 13
    Caption = 'Naziv'
  end
  object Label3: TLabel
    Left = 400
    Top = 152
    Width = 34
    Height = 13
    Caption = 'Adresa'
  end
  object Label4: TLabel
    Left = 392
    Top = 184
    Width = 45
    Height = 13
    Caption = 'Kapacitet'
  end
  object Label5: TLabel
    Left = 392
    Top = 216
    Width = 47
    Height = 13
    Caption = 'Broj ulaza'
  end
  object Label6: TLabel
    Left = 416
    Top = 248
    Width = 23
    Height = 13
    Caption = 'Grad'
  end
  object editSifra: TEdit
    Left = 448
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object editNaziv: TEdit
    Left = 448
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object editAdresa: TEdit
    Left = 448
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object editKapacitet: TEdit
    Left = 448
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object editUlazi: TEdit
    Left = 448
    Top = 216
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object btnPrethodni: TButton
    Left = 336
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Prethodni'
    TabOrder = 5
    OnClick = btnPrethodniClick
  end
  object btnSledeci: TButton
    Left = 424
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Sledeci'
    TabOrder = 6
    OnClick = btnSledeciClick
  end
  object btnNovi: TButton
    Left = 512
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Novi'
    TabOrder = 7
    OnClick = btnNoviClick
  end
  object btnUpisi: TButton
    Left = 600
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Upisi'
    TabOrder = 8
    OnClick = btnUpisiClick
  end
  object btnIzadji: TButton
    Left = 472
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Izadji'
    TabOrder = 9
    OnClick = btnIzadjiClick
  end
  object cbGrad: TComboBox
    Left = 448
    Top = 248
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 10
  end
end
