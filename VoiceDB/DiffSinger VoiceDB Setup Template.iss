; 应用信息
#define MyAppName "Bailu DiffSinger VoiceDB"
#define MyAppVersion "2.1"
#define MyAppPublisher "AI Hobbyist"
#define MyAppURL "https://www.ai-hobbyist.org/"
; 其它设置
#define SetupType "DiffSinger VoiceDB"
#define OpenUtauDir "D:\Program Files\OpenUtau_Orig"
#define SingerDir "bai_lu"

[Setup]
; 注: AppId的值为单独标识该应用程序。
; 不要为其他安装程序使用相同的AppId值。
; (若要生成新的 GUID，可在菜单中点击 "工具|生成 GUID"。)
AppId={{2FFE022B-8D93-4119-90E0-6264DEF4B5E4}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={reg:HKA\Software\OpenUtau,Path|{autopf}\OpenUtau}\Singers\{#MyAppName}
DefaultGroupName=AI Hobbyist\DiffSinger VoiceDB\{#MyAppName}
LicenseFile={#SetupType}.rtf
OutputDir=Setups
OutputBaseFilename={#MyAppName}
Compression=lzma
SolidCompression=yes
WizardStyle=modern
WindowVisible=yes
WindowShowCaption=no
ArchitecturesInstallIn64BitMode=x64
SetupIconFile=icon.ico
UninstallDisplayIcon=icon.ico

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"
Name: "english"; MessagesFile: "compiler:Languages\English.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"

[Files]
Source: "{#OpenUtauDir}\Singers\{#SingerDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "App Images\{#MyAppName}.bmp"; Flags: dontcopy

[Code]
procedure InitializeWizard();
var
  BackgroundImage: TBitmapImage;
begin
  BackgroundImage := TBitmapImage.Create(MainForm);
  BackgroundImage.Parent := MainForm;
  BackgroundImage.SetBounds(0, 0, MainForm.ClientWidth, MainForm.ClientHeight);
  BackgroundImage.Stretch := True;
  ExtractTemporaryFile('{#MyAppName}.bmp');
  BackgroundImage.Bitmap.LoadFromFile(ExpandConstant('{tmp}\{#MyAppName}.bmp'));
end;

[Icons]
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"
