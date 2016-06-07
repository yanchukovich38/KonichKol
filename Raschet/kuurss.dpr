program kuurss;

uses
  Forms,
  kuurs in 'kuurs.pas' {Form1},
  Unit2 in 'Unit2.pas',
  Materials in 'Materials.pas',
  Nom_sx in 'Nom_sx.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
