unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var RegIni:TRegIniFile;
begin
  RegIni:=TRegIniFile.Create('Software');
  RegIni.OpenKey('online', true);
  RegIni.WriteString('Razd', 'Param', Edit1.Text);
  Label1.Caption:=RegIni.ReadString('Razd','Param','Параметр');
  RegIni.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var RegIni: TRegistry;
begin
   RegIni:= TRegistry.Create;
   RegIni.RootKey:= HKEY_CURRENT_USER;
   if RegIni.DeleteKey('Software\online\Razd')   then
   Label1.Caption:='Нетуть';
   RegIni.Free;
end;

end.
