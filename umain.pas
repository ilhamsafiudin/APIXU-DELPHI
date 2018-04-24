unit umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, XPMan, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, uLkJSON;

type
  TFrmMain = class(TForm)
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ZKoneksi: TZConnection;
    ZData: TZQuery;
    DsData: TDataSource;
    Panel2: TPanel;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    MLog: TMemo;
    Panel3: TPanel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    LbRegion: TLabel;
    LbTime: TLabel;
    LbTempC: TLabel;
    LbTempF: TLabel;
    LbWindMph: TLabel;
    LbWindKph: TLabel;
    LbWindDegree: TLabel;
    LbWindDir: TLabel;
    LbPressureMb: TLabel;
    LbPressureIn: TLabel;
    LbPrecipMm: TLabel;
    LbPrecipIn: TLabel;
    LbHumadity: TLabel;
    LbCloud: TLabel;
    LbFeelsLikeC: TLabel;
    LbFeelsLikeF: TLabel;
    LbVisKm: TLabel;
    LbVisMiles: TLabel;
    Label1: TLabel;
    Label38: TLabel;
    LbName: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    LbCondition: TLabel;
    Label41: TLabel;
    Image2: TImage;
    Label42: TLabel;
    Label43: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure pagingrec(vhal: Integer);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  posisi, tothal, hal: integer;

const
  APIXU_URL = 'https://api.apixu.com/v1/';
  APIXU_APIKEY = ''; //silahkan signup dulu di https://www.apixu.com/ untuk mendapatkan api key nya
  rec_perhalaman: integer = 100;

implementation

uses Math, DateUtils, PNGImage;

{$R *.dfm}

procedure TFrmMain.pagingrec(vhal: Integer);
begin
  Screen.Cursor := crHourGlass;
  if (vhal >= 1) then
  begin
    posisi := (vhal - 1) * rec_perhalaman;
    hal := vhal;
  end
  else
  begin
    posisi := 0;
    hal := 1;
  end;
  //
  with ZData do
  begin
    SQL.Text := 'SELECT COUNT(*) AS total FROM indonesia';
    Open;
    tothal := Ceil(Fields[0].AsInteger / rec_perhalaman);
    Edit1.Text := 'Halaman Ke ' + IntToStr(hal) + ' Dari ' + IntToStr(tothal) + ' Halaman';
    //
    SQL.Text := 'SELECT * FROM indonesia ORDER BY id LIMIT ' + IntToStr(posisi) + ',' + IntToStr(rec_perhalaman);
    Open;
  end;
  Screen.Cursor := crDefault;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  IdHTTP1.Request.Accept := 'application/json';
  IdHTTP1.Request.ContentType := 'application/json';
  IdHTTP1.Request.CharSet := 'UTF8';
  IdHTTP1.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
  //configurasi koneksi ke database
  with ZKoneksi do
  begin
    Protocol := 'mysql';
    HostName := 'localhost';
    Database := 'github';
    Port := 3307;
    User := 'root';
    Password := '';
    //proses koneksi ke database
    Connect;
  end;
  pagingrec(0);
end;

procedure TFrmMain.Button6Click(Sender: TObject);
begin
  if hal < tothal then
    pagingrec(hal + 1)
  else
    pagingrec(tothal);
end;

procedure TFrmMain.Button5Click(Sender: TObject);
begin
  if hal > 1 then
    pagingrec(hal - 1)
  else
    pagingrec(0);
end;

procedure TFrmMain.Button1Click(Sender: TObject);
var
  js: TlkJSONobject;
  js_location, js_current: TlkJSONbase;
  jsonresponse, imgday: string;
begin
  try
    jsonresponse := IdHTTP1.Get(APIXU_URL + 'current.json?key=' + APIXU_APIKEY + '&q=' + ZData.FieldByName('latitude').AsString + ',' + ZData.FieldByName('longitude').AsString);
    js := TlkJSON.ParseText(jsonresponse) as TlkJSONobject;
    js_location := js.Field['location'];
    js_current := js.Field['current'];
    //decode json parent field location
    if js_location.Count > 0 then
    begin
      LbName.Caption := js_location.Field['name'].Value;
      LbRegion.Caption := js_location.Field['region'].Value;
      LbTime.Caption := js_location.Field['localtime'].Value;
    end;
    //decode json parent field current
    if js_current.Count > 0 then
    begin
      LbCondition.Caption := js_current.Field['condition'].Field['text'].Value;
      imgday := stringreplace(stringreplace(js_current.Field['condition'].Field['icon'].Value, '//cdn.apixu.com/', ExtractFilePath(Application.ExeName),[rfReplaceAll, rfIgnoreCase]),'/','\',[rfReplaceAll, rfIgnoreCase]);
      Image1.Picture.LoadFromFile(imgday);//image day
      Image2.Picture.LoadFromFile(stringreplace(imgday, 'day', 'night',[rfReplaceAll, rfIgnoreCase]));//image night
      LbTempC.Caption := js_current.Field['temp_c'].Value;
      LbTempF.Caption := js_current.Field['temp_f'].Value;
      LbWindMph.Caption := js_current.Field['wind_mph'].Value;
      LbWindKph.Caption := js_current.Field['wind_kph'].Value;
      LbWindDegree.Caption := js_current.Field['wind_degree'].Value;
      LbWindDir.Caption := js_current.Field['wind_dir'].Value;
      LbPressureMb.Caption := js_current.Field['pressure_mb'].Value;
      LbPressureIn.Caption := js_current.Field['pressure_in'].Value;
      LbPrecipMm.Caption := js_current.Field['precip_mm'].Value;
      LbPrecipIn.Caption := js_current.Field['precip_in'].Value;
      LbHumadity.Caption := js_current.Field['humidity'].Value;
      LbCloud.Caption := js_current.Field['cloud'].Value;
      LbFeelsLikeC.Caption := js_current.Field['feelslike_c'].Value;
      LbFeelsLikeF.Caption := js_current.Field['feelslike_f'].Value;
      LbVisKm.Caption := js_current.Field['vis_km'].Value;
      LbVisMiles.Caption := js_current.Field['vis_miles'].Value;
    end;
    //MLog.Lines.Add(jsonresponse);
  except
    on E: Exception do
    begin
      MLog.Lines.Add(E.ClassName + ': ' + e.Message);
    end;
  end;
end;

procedure TFrmMain.Button2Click(Sender: TObject);
var
  js: TlkJSONobject;
  js_location, js_forecast: TlkJSONbase;
  jsonresponse, nextdate, imgday: string;
begin
  try
    nextdate := FormatDateTime('yyyy-mm-dd', IncDay(Today,1));
    jsonresponse := IdHTTP1.Get(APIXU_URL + 'forecast.json?key=' + APIXU_APIKEY + '&q=' + ZData.FieldByName('latitude').AsString + ',' + ZData.FieldByName('longitude').AsString + '&dt=' + nextdate);
    js := TlkJSON.ParseText(jsonresponse) as TlkJSONobject;
    js_location := js.Field['location'];
    js_forecast := js.Field['forecast'].Field['forecastday'].Child[0];
    //decode json parent field location
    if js_location.Count > 0 then
    begin
      LbName.Caption := js_location.Field['name'].Value;
      LbRegion.Caption := js_location.Field['region'].Value;
    end;
    //decode json parent field forecast
    if js_forecast.Count > 0 then
    begin
      LbTime.Caption := js_forecast.Field['date'].Value;
      LbCondition.Caption := js_forecast.Field['day'].Field['condition'].Field['text'].Value;
      imgday := stringreplace(stringreplace(js_forecast.Field['day'].Field['condition'].Field['icon'].Value, '//cdn.apixu.com/', ExtractFilePath(Application.ExeName),[rfReplaceAll, rfIgnoreCase]),'/','\',[rfReplaceAll, rfIgnoreCase]);
      Image1.Picture.LoadFromFile(imgday);//image day
      Image2.Picture.LoadFromFile(stringreplace(imgday, 'day', 'night',[rfReplaceAll, rfIgnoreCase]));//image night
      LbTempC.Caption := 'max= ' + FloatToStr(js_forecast.Field['day'].Field['maxtemp_c'].Value) + '; min= ' + FloatToStr(js_forecast.Field['day'].Field['mintemp_c'].Value) + '; avg= ' + FloatToStr(js_forecast.Field['day'].Field['avgtemp_c'].Value);
      LbTempF.Caption := 'max= ' + FloatToStr(js_forecast.Field['day'].Field['maxtemp_f'].Value) + '; min= ' + FloatToStr(js_forecast.Field['day'].Field['mintemp_f'].Value) + '; avg= ' + FloatToStr(js_forecast.Field['day'].Field['avgtemp_f'].Value);
      LbWindMph.Caption := 'max= ' + FloatToStr(js_forecast.Field['day'].Field['maxwind_mph'].Value);
      LbWindKph.Caption := 'max= ' + FloatToStr(js_forecast.Field['day'].Field['maxwind_kph'].Value);
      LbWindDegree.Caption := '-';
      LbWindDir.Caption := '-';
      LbPressureMb.Caption := '-';
      LbPressureIn.Caption := '-';
      LbPrecipMm.Caption := 'total= ' + FloatToStr(js_forecast.Field['day'].Field['totalprecip_mm'].Value);
      LbPrecipIn.Caption := 'total= ' + FloatToStr(js_forecast.Field['day'].Field['totalprecip_in'].Value);
      LbHumadity.Caption := 'avg= ' + FloatToStr(js_forecast.Field['day'].Field['avghumidity'].Value);
      LbCloud.Caption := '-';
      LbFeelsLikeC.Caption := '-';
      LbFeelsLikeF.Caption := '-';
      LbVisKm.Caption := 'avg= ' + FloatToStr(js_forecast.Field['day'].Field['avgvis_km'].Value);
      LbVisMiles.Caption := 'avg= ' + FloatToStr(js_forecast.Field['day'].Field['avgvis_miles'].Value);
    end;
    //MLog.Lines.Add(jsonresponse);
  except
    on E: Exception do
    begin
      MLog.Lines.Add(E.ClassName + ': ' + e.Message);
    end;
  end;
end;

procedure TFrmMain.Button3Click(Sender: TObject);
var
  js: TlkJSONobject;
  js_location, js_forecast: TlkJSONbase;
  jsonresponse, nextdate, imgday: string;
begin
  try
    nextdate := FormatDateTime('yyyy-mm-dd', IncDay(Today,7));
    jsonresponse := IdHTTP1.Get(APIXU_URL + 'forecast.json?key=' + APIXU_APIKEY + '&q=' + ZData.FieldByName('latitude').AsString + ',' + ZData.FieldByName('longitude').AsString + '&dt=' + nextdate);
    js := TlkJSON.ParseText(jsonresponse) as TlkJSONobject;
    js_location := js.Field['location'];
    js_forecast := js.Field['forecast'].Field['forecastday'].Child[0];
    //decode json parent field location
    if js_location.Count > 0 then
    begin
      LbName.Caption := js_location.Field['name'].Value;
      LbRegion.Caption := js_location.Field['region'].Value;
    end;
    //decode json parent field forecast
    if js_forecast.Count-1 > 0 then
    begin
      LbTime.Caption := js_forecast.Field['date'].Value;
      LbCondition.Caption := js_forecast.Field['day'].Field['condition'].Field['text'].Value;
      imgday := stringreplace(stringreplace(js_forecast.Field['day'].Field['condition'].Field['icon'].Value, '//cdn.apixu.com/', ExtractFilePath(Application.ExeName),[rfReplaceAll, rfIgnoreCase]),'/','\',[rfReplaceAll, rfIgnoreCase]);
      Image1.Picture.LoadFromFile(imgday);//image day
      Image2.Picture.LoadFromFile(stringreplace(imgday, 'day', 'night',[rfReplaceAll, rfIgnoreCase]));//image night
      LbTempC.Caption := 'max= ' + FloatToStr(js_forecast.Field['day'].Field['maxtemp_c'].Value) + '; min= ' + FloatToStr(js_forecast.Field['day'].Field['mintemp_c'].Value) + '; avg= ' + FloatToStr(js_forecast.Field['day'].Field['avgtemp_c'].Value);
      LbTempF.Caption := 'max= ' + FloatToStr(js_forecast.Field['day'].Field['maxtemp_f'].Value) + '; min= ' + FloatToStr(js_forecast.Field['day'].Field['mintemp_f'].Value) + '; avg= ' + FloatToStr(js_forecast.Field['day'].Field['avgtemp_f'].Value);
      LbWindMph.Caption := 'max= ' + FloatToStr(js_forecast.Field['day'].Field['maxwind_mph'].Value);
      LbWindKph.Caption := 'max= ' + FloatToStr(js_forecast.Field['day'].Field['maxwind_kph'].Value);
      LbWindDegree.Caption := '-';
      LbWindDir.Caption := '-';
      LbPressureMb.Caption := '-';
      LbPressureIn.Caption := '-';
      LbPrecipMm.Caption := 'total= ' + FloatToStr(js_forecast.Field['day'].Field['totalprecip_mm'].Value);
      LbPrecipIn.Caption := 'total= ' + FloatToStr(js_forecast.Field['day'].Field['totalprecip_in'].Value);
      LbHumadity.Caption := 'avg= ' + FloatToStr(js_forecast.Field['day'].Field['avghumidity'].Value);
      LbCloud.Caption := '-';
      LbFeelsLikeC.Caption := '-';
      LbFeelsLikeF.Caption := '-';
      LbVisKm.Caption := 'avg= ' + FloatToStr(js_forecast.Field['day'].Field['avgvis_km'].Value);
      LbVisMiles.Caption := 'avg= ' + FloatToStr(js_forecast.Field['day'].Field['avgvis_miles'].Value);
    end;
    //MLog.Lines.Add(jsonresponse);
  except
    on E: Exception do
    begin
      MLog.Lines.Add(E.ClassName + ': ' + e.Message);
    end;
  end;
end;

procedure TFrmMain.Button4Click(Sender: TObject);
begin
  close;
end;

end.

