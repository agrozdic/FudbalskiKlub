object formMain: TformMain
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Fudbalski klubovi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 32
    Top = 16
    object Gradovi1: TMenuItem
      Caption = 'Gradovi'
      object Unos1: TMenuItem
        Caption = 'Unos'
        OnClick = Unos1Click
      end
      object Spisakigraca1: TMenuItem
        Caption = 'Spisak igraca'
        OnClick = Spisakigraca1Click
      end
    end
    object Stadioni1: TMenuItem
      Caption = 'Stadioni'
      object Unos2: TMenuItem
        Caption = 'Unos'
        OnClick = Unos2Click
      end
      object Kapacitetstadiona1: TMenuItem
        Caption = 'Kapacitet stadiona'
        OnClick = Kapacitetstadiona1Click
      end
    end
    object Izlaz1: TMenuItem
      Caption = 'Izlaz'
      object Krajrada1: TMenuItem
        Caption = 'Kraj rada'
        ShortCut = 32843
        OnClick = Krajrada1Click
      end
    end
  end
end
