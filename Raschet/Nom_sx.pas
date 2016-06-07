unit Nom_sx;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    TreeView1: TTreeView;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses kuurs;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  case TreeView1.Selected.AbsoluteIndex of
    1:
      begin
        Form1.Button1_Nom_sx.Caption:='1';
        close;
      end;
    2:
      begin
        Form1.Button1_Nom_sx.Caption:='2';
        close;
      end;
    3:
      begin
        Form1.Button1_Nom_sx.Caption:='3';
        close;
      end;
    4:
      begin
        Form1.Button1_Nom_sx.Caption:='4';
        close;
      end;
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  close;
end;

end.
