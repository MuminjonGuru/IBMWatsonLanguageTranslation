unit LanguageTranslationAPI.MainUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Edit,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TFormMain = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Memo2: TMemo;
    Button2: TButton;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    StyleBook1: TStyleBook;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses
  System.JSON
, System.Threading;

procedure TFormMain.Button1Click(Sender: TObject);
begin
  // POST  /identify
  TTask.Run(
    procedure
    begin
      RESTClient1.ResetToDefaults;
      RESTClient1.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
      RESTClient1.AcceptCharset := 'utf-8, *;q=0.8';
      RESTClient1.BaseURL := 'https://api.apilayer.com/language_translation/identify';
      RESTClient1.ContentType := 'application/json';

      RESTRequest1.ClearBody;
      RESTRequest1.Params.Clear;

      // API acc. key
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[0].Kind := pkHTTPHEADER;
      RESTRequest1.Params.Items[0].Name := 'apikey';
      RESTRequest1.Params.Items[0].Value := 'MOEfJWv6dtiJ35Kht7iYlsjai7J1JWjB';
      RESTRequest1.Params.Items[0].Options := [poDoNotEncode];

      // set the url for checking
      RESTRequest1.Params.AddItem;
      RESTRequest1.Params.Items[1].Kind := pkREQUESTBODY;
      RESTRequest1.Params.Items[1].Name := 'body';
      RESTRequest1.Params.Items[1].Value := Memo1.Text; // sample body inserted
      RESTRequest1.Params.Items[1].ContentTypeStr := 'application/json';

      RESTRequest1.Execute;
    end);

  Memo1.Lines.Add(RESTResponse1.Content);
end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
  // POST  /translate

  TTask.Run(
    procedure
    begin
      RESTClient2.ResetToDefaults;
      RESTClient2.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
      RESTClient2.AcceptCharset := 'utf-8, *;q=0.8';
      RESTClient2.BaseURL := 'https://api.apilayer.com/language_translation/translate';
      RESTClient2.ContentType := 'application/json';

      RESTRequest2.ClearBody;
      RESTRequest2.Params.Clear;

      // API acc. key
      RESTRequest2.Params.AddItem;
      RESTRequest2.Params.Items[0].Kind := pkHTTPHEADER;
      RESTRequest2.Params.Items[0].Name := 'apikey';
      RESTRequest2.Params.Items[0].Value := '79OotEfUSu0ngH36CCQIaEkC0Vp601og';
      RESTRequest2.Params.Items[0].Options := [poDoNotEncode];

      RESTRequest2.Params.AddItem;
      RESTRequest2.Params.Items[1].Kind := pkHTTPHEADER;
      RESTRequest2.Params.Items[1].Name := 'target';
      RESTRequest2.Params.Items[1].Value := Edit1.Text;
      RESTRequest2.Params.Items[1].ContentTypeStr := 'application/json';

      RESTRequest2.Params.AddItem;
      RESTRequest2.Params.Items[2].Kind := pkHTTPHEADER;
      RESTRequest2.Params.Items[2].Name := 'source';
      RESTRequest2.Params.Items[2].Value := Edit2.Text;
      RESTRequest2.Params.Items[2].ContentTypeStr := 'application/json';

      RESTRequest2.Params.AddItem;
      RESTRequest2.Params.Items[3].Kind := pkREQUESTBODY;
      RESTRequest2.Params.Items[3].Name := 'body';
      RESTRequest2.Params.Items[3].Value := Memo2.Text; // sample body inserted
      RESTRequest2.Params.Items[3].ContentTypeStr := 'application/json';

      RESTRequest2.Execute;
    end);

  Memo2.Lines.Add(RESTResponse2.Content);
end;

end.
