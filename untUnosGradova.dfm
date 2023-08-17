object formUnosGradova: TformUnosGradova
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Gradovi'
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
    Left = 408
    Top = 88
    Width = 22
    Height = 13
    Caption = 'Sifra'
  end
  object Label2: TLabel
    Left = 408
    Top = 120
    Width = 23
    Height = 13
    Caption = 'Grad'
  end
  object Label3: TLabel
    Left = 376
    Top = 152
    Width = 55
    Height = 13
    Caption = 'Pozivni broj'
  end
  object Label4: TLabel
    Left = 368
    Top = 184
    Width = 67
    Height = 13
    Caption = 'Postanski broj'
  end
  object Label5: TLabel
    Left = 360
    Top = 216
    Width = 74
    Height = 13
    Caption = 'Broj stanovnika'
  end
  object editSifra: TEdit
    Left = 448
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object editGrad: TEdit
    Left = 448
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object editPozivni: TEdit
    Left = 448
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object editPostanski: TEdit
    Left = 448
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object editStanovnici: TEdit
    Left = 448
    Top = 216
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object btnPrethodni: TButton
    Left = 336
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Prethodni'
    TabOrder = 5
    OnClick = btnPrethodniClick
  end
  object btnSledeci: TButton
    Left = 424
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Sledeci'
    TabOrder = 6
    OnClick = btnSledeciClick
  end
  object btnNovi: TButton
    Left = 512
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Novi'
    TabOrder = 7
    OnClick = btnNoviClick
  end
  object btnUpisi: TButton
    Left = 600
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Upisi'
    TabOrder = 8
    OnClick = btnUpisiClick
  end
  object btnIzadji: TButton
    Left = 472
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Izadji'
    TabOrder = 9
    OnClick = btnIzadjiClick
  end
end
