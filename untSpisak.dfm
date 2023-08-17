object formSpisak: TformSpisak
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Spisak'
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
    Left = 360
    Top = 80
    Width = 23
    Height = 13
    Caption = 'Grad'
  end
  object Label2: TLabel
    Left = 352
    Top = 120
    Width = 35
    Height = 13
    Caption = 'Pozicija'
  end
  object cbgrad: TComboBox
    Left = 400
    Top = 80
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object cbPozicija: TComboBox
    Left = 400
    Top = 120
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object btnPrikazi: TButton
    Left = 568
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Prikazi'
    TabOrder = 2
    OnClick = btnPrikaziClick
  end
  object btnIzadji: TButton
    Left = 568
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Izadji'
    TabOrder = 3
    OnClick = btnIzadjiClick
  end
  object stringGrid: TStringGrid
    Left = 304
    Top = 176
    Width = 401
    Height = 201
    ColCount = 6
    TabOrder = 4
  end
end
