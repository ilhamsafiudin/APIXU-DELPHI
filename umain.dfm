object FrmMain: TFrmMain
  Left = 120
  Top = 35
  BorderStyle = bsToolWindow
  Caption = 'CUACA HARI INI DI SELURUH DAERAH INDONESIA - APIXU'
  ClientHeight = 619
  ClientWidth = 1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 600
    Width = 1081
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Text = 'Dibuat Oleh: Wak Ilham - 2018'
        Width = 50
      end>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 800
    Height = 472
    Align = alClient
    BorderStyle = bsNone
    DataSource = DsData
    FixedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'id'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'propinsi'
        Title.Caption = 'Propinsi'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kabupaten'
        Title.Caption = 'Kota/Kabupaten'
        Width = 178
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kecamatan'
        Title.Caption = 'Kecamatan'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'latitude'
        Title.Alignment = taCenter
        Title.Caption = 'Latitude'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'longitude'
        Title.Alignment = taCenter
        Title.Caption = 'Longitude'
        Width = 101
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1081
    Height = 32
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      1081
      32)
    object Label41: TLabel
      Left = 263
      Top = 15
      Width = 384
      Height = 13
      Caption = 
        '*Maksimal request ke APIXU untuk peramalan (forecast) adalah 10 ' +
        'hari kedepan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Button1: TButton
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Hari Ini'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 81
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Besok'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 158
      Top = 4
      Width = 99
      Height = 25
      Caption = '7 Hari Kedepan'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 1001
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Keluar'
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 568
    Width = 1081
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 3
    object Button5: TButton
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Caption = '<<'
      TabOrder = 0
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 330
      Top = 4
      Width = 75
      Height = 25
      Caption = '>>'
      TabOrder = 1
      OnClick = Button6Click
    end
    object Edit1: TEdit
      Left = 80
      Top = 6
      Width = 249
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object MLog: TMemo
    Left = 0
    Top = 504
    Width = 1081
    Height = 64
    Align = alBottom
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object Panel3: TPanel
    Left = 800
    Top = 32
    Width = 281
    Height = 472
    Align = alRight
    BevelInner = bvRaised
    TabOrder = 5
    object Image1: TImage
      Left = 48
      Top = 32
      Width = 73
      Height = 73
      Center = True
      Transparent = True
    end
    object Label2: TLabel
      Left = 8
      Top = 176
      Width = 22
      Height = 13
      Caption = 'Time'
      Transparent = True
    end
    object Label3: TLabel
      Left = 8
      Top = 192
      Width = 42
      Height = 13
      Caption = 'Temp (c)'
      Transparent = True
    end
    object Label4: TLabel
      Left = 8
      Top = 208
      Width = 41
      Height = 13
      Caption = 'Temp (f)'
      Transparent = True
    end
    object Label5: TLabel
      Left = 8
      Top = 224
      Width = 55
      Height = 13
      Caption = 'Wind (mph)'
      Transparent = True
    end
    object Label6: TLabel
      Left = 8
      Top = 240
      Width = 52
      Height = 13
      Caption = 'Wind (kph)'
      Transparent = True
    end
    object Label7: TLabel
      Left = 8
      Top = 256
      Width = 69
      Height = 13
      Caption = 'Wind (degree)'
      Transparent = True
    end
    object Label8: TLabel
      Left = 8
      Top = 272
      Width = 47
      Height = 13
      Caption = 'Wind (dir)'
      Transparent = True
    end
    object Label9: TLabel
      Left = 8
      Top = 288
      Width = 67
      Height = 13
      Caption = 'Pressure (mb)'
      Transparent = True
    end
    object Label10: TLabel
      Left = 8
      Top = 304
      Width = 61
      Height = 13
      Caption = 'Pressure (in)'
      Transparent = True
    end
    object Label11: TLabel
      Left = 8
      Top = 320
      Width = 56
      Height = 13
      Caption = 'Precip (mm)'
      Transparent = True
    end
    object Label12: TLabel
      Left = 8
      Top = 336
      Width = 48
      Height = 13
      Caption = 'Precip (in)'
      Transparent = True
    end
    object Label13: TLabel
      Left = 8
      Top = 352
      Width = 45
      Height = 13
      Caption = 'Humadity'
      Transparent = True
    end
    object Label14: TLabel
      Left = 8
      Top = 368
      Width = 27
      Height = 13
      Caption = 'Cloud'
      Transparent = True
    end
    object Label15: TLabel
      Left = 8
      Top = 384
      Width = 62
      Height = 13
      Caption = 'Feels Like (c)'
      Transparent = True
    end
    object Label16: TLabel
      Left = 8
      Top = 400
      Width = 61
      Height = 13
      Caption = 'Feels Like (f)'
      Transparent = True
    end
    object Label17: TLabel
      Left = 8
      Top = 416
      Width = 37
      Height = 13
      Caption = 'Vis (km)'
      Transparent = True
    end
    object Label18: TLabel
      Left = 8
      Top = 432
      Width = 47
      Height = 13
      Caption = 'Vis (miles)'
      Transparent = True
    end
    object Label19: TLabel
      Left = 88
      Top = 176
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label20: TLabel
      Left = 88
      Top = 192
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label21: TLabel
      Left = 88
      Top = 208
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label22: TLabel
      Left = 88
      Top = 224
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label23: TLabel
      Left = 88
      Top = 240
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label24: TLabel
      Left = 88
      Top = 256
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label25: TLabel
      Left = 88
      Top = 272
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label26: TLabel
      Left = 88
      Top = 288
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label27: TLabel
      Left = 88
      Top = 304
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label28: TLabel
      Left = 88
      Top = 320
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label29: TLabel
      Left = 88
      Top = 336
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label30: TLabel
      Left = 88
      Top = 352
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label31: TLabel
      Left = 88
      Top = 368
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label32: TLabel
      Left = 88
      Top = 384
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label33: TLabel
      Left = 88
      Top = 400
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label34: TLabel
      Left = 88
      Top = 416
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label35: TLabel
      Left = 88
      Top = 432
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object Label36: TLabel
      Left = 8
      Top = 160
      Width = 33
      Height = 13
      Caption = 'Region'
      Transparent = True
    end
    object Label37: TLabel
      Left = 88
      Top = 160
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object LbRegion: TLabel
      Left = 96
      Top = 160
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbTime: TLabel
      Left = 96
      Top = 176
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbTempC: TLabel
      Left = 96
      Top = 192
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbTempF: TLabel
      Left = 96
      Top = 208
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbWindMph: TLabel
      Left = 96
      Top = 224
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbWindKph: TLabel
      Left = 96
      Top = 240
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbWindDegree: TLabel
      Left = 96
      Top = 256
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbWindDir: TLabel
      Left = 96
      Top = 272
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbPressureMb: TLabel
      Left = 96
      Top = 288
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbPressureIn: TLabel
      Left = 96
      Top = 304
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbPrecipMm: TLabel
      Left = 96
      Top = 320
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbPrecipIn: TLabel
      Left = 96
      Top = 336
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbHumadity: TLabel
      Left = 96
      Top = 352
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbCloud: TLabel
      Left = 96
      Top = 368
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbFeelsLikeC: TLabel
      Left = 96
      Top = 384
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbFeelsLikeF: TLabel
      Left = 96
      Top = 400
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbVisKm: TLabel
      Left = 96
      Top = 416
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object LbVisMiles: TLabel
      Left = 96
      Top = 432
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object Label1: TLabel
      Left = 8
      Top = 144
      Width = 27
      Height = 13
      Caption = 'Name'
      Transparent = True
    end
    object Label38: TLabel
      Left = 88
      Top = 144
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object LbName: TLabel
      Left = 96
      Top = 144
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object Label39: TLabel
      Left = 8
      Top = 128
      Width = 45
      Height = 13
      Caption = 'Condition'
      Transparent = True
    end
    object Label40: TLabel
      Left = 88
      Top = 128
      Width = 4
      Height = 13
      Caption = ':'
      Transparent = True
    end
    object LbCondition: TLabel
      Left = 96
      Top = 128
      Width = 4
      Height = 13
      Caption = '-'
      Transparent = True
    end
    object Image2: TImage
      Left = 152
      Top = 32
      Width = 73
      Height = 73
      Center = True
      Transparent = True
    end
    object Label42: TLabel
      Left = 72
      Top = 16
      Width = 19
      Height = 13
      Caption = 'Day'
    end
    object Label43: TLabel
      Left = 176
      Top = 16
      Width = 25
      Height = 13
      Caption = 'Night'
    end
  end
  object ZKoneksi: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Port = 0
    Left = 40
    Top = 248
  end
  object ZData: TZQuery
    Connection = ZKoneksi
    Params = <>
    Left = 72
    Top = 248
  end
  object DsData: TDataSource
    DataSet = ZData
    Left = 104
    Top = 248
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 40
    Top = 320
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 72
    Top = 320
  end
end
