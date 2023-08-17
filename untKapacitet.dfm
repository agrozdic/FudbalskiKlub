object formKapacitet: TformKapacitet
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Kapacitet'
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
    Left = 312
    Top = 104
    Width = 89
    Height = 13
    Caption = 'Kapacitet stadiona'
  end
  object btnPrikazi: TButton
    Left = 568
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Prikazi'
    TabOrder = 0
    OnClick = btnPrikaziClick
  end
  object btnIzadji: TButton
    Left = 568
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Izadji'
    TabOrder = 1
    OnClick = btnIzadjiClick
  end
  object stringGrid: TStringGrid
    Left = 304
    Top = 176
    Width = 401
    Height = 201
    ColCount = 6
    TabOrder = 2
  end
  object editKapacitet: TEdit
    Left = 408
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 3
  end
end
