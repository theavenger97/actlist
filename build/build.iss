; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define AppVersion "@AppVersion@"
;#define AppArchitecture "@AppArchitecture@"

#define AppName "Actlist"
#define AppPublisher "silentsoft.org"
#define AppURL "https://actlist.silentsoft.org/"
#define AppExeName "Actlist.exe"
#define AppIcoName "Actlist.ico"
#define WizardSmallImageFile "Actlist-setup-icon.bmp"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{9ABB1597-F400-4AD7-B12F-1F94A42FEE8F}
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}
AppPublisher={#AppPublisher}
;AppPublisherURL={#AppURL}
;AppSupportURL={#AppURL}
;AppUpdatesURL={#AppURL}
DefaultDirName={pf}\{#AppName}
DisableDirPage=No
DefaultGroupName={#AppName}
DisableProgramGroupPage=yes
AllowNoIcons=yes
OutputBaseFilename={#AppName}-{#AppVersion}
;OutputBaseFilename={#AppName}-{#AppVersion}-windows-{#AppArchitecture}
Compression=lzma
SolidCompression=yes
SetupIconFile={#AppName}\{#AppIcoName}
WizardImageStretch=No
WizardSmallImageFile={#WizardSmallImageFile}
Uninstallable=not PortableCheck
UninstallDisplayIcon={app}\{#AppIcoName}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "{#AppName}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#AppName}"; Filename: "{app}\{#AppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#AppName}}"; Filename: "{#AppURL}"
Name: "{group}\{cm:UninstallProgram,{#AppName}}"; Filename: "{uninstallexe}"; IconFilename: "{app}\{#AppIcoName}"
Name: "{userdesktop}\{#AppName}"; Filename: "{app}\{#AppExeName}"; IconFilename: "{app}\{#AppIcoName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#AppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
function PortableCheck: Boolean;
begin
  Result := ExpandConstant('{param:portable|0}') = '1';
end;