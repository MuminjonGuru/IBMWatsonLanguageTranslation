program LanguageTranslationAPI;

uses
  System.StartUpCopy,
  FMX.Forms,
  LanguageTranslationAPI.MainUnit in 'LanguageTranslationAPI.MainUnit.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
