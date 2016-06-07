unit kuurs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unit2, Vcl.ComCtrls, Materials;

type
{$REGION 'Класс формы'}
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label1_P1: TLabel;
    Label1_N1: TLabel;
    Label1_U: TLabel;
    Label1_Lh: TLabel;
    Label1_Tipz: TLabel;
    Edit1_P1: TEdit;
    Edit1_N1: TEdit;
    Edit1_U: TEdit;
    Edit1_Lh: TEdit;
    CheckBox1_Napr_Vr: TCheckBox;
    CheckBox1_TipOpor: TCheckBox;
    CheckBox1_Nagr: TCheckBox;
    CheckBox1_rewers: TCheckBox;
    CheckBox1_otw1: TCheckBox;
    ComboBox1_Tipz: TComboBox;
    GroupBox2: TGroupBox;
    Label1_mc1: TLabel;
    Label1_Termobr1: TLabel;
    Label1_Ra1: TLabel;
    Label1_H_HRcs1: TLabel;
    Label1_H_HRcp1: TLabel;
    Label1_Zagotowka1: TLabel;
    ComboBox1_mc1: TComboBox;
    ComboBox1_Ra1: TComboBox;
    ComboBox1_Termobr1: TComboBox;
    Edit1_H_HRcs1: TEdit;
    Edit1_H_HRcp1: TEdit;
    ComboBox1_Zagotowka1: TComboBox;
    GroupBox3: TGroupBox;
    Label1_Termobr2: TLabel;
    Label1_mc2: TLabel;
    Label1_Ra2: TLabel;
    Label1_H_HRcs2: TLabel;
    Label1_H_HRcp2: TLabel;
    Label1_Zagotowka2: TLabel;
    ComboBox1_mc2: TComboBox;
    ComboBox1_Termobr2: TComboBox;
    ComboBox1_Ra2: TComboBox;
    Edit1_H_HRcs2: TEdit;
    Edit1_H_HRcp2: TEdit;
    ComboBox1_Zagotowka2: TComboBox;
    Подсчет: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1_Forma: TLabel;
    ComboBox1_Forma: TComboBox;
    Label1_Sigma_Fst02: TLabel;
    Label1_Sigma_Fst01: TLabel;
    Label1_S_f1: TLabel;
    Label1_Sigma_t1: TLabel;
    Label1_Sigma_Flim01: TLabel;
    Label1_S_f2: TLabel;
    Label1_Sigma_t2: TLabel;
    Label1_Sigma_Flim02: TLabel;
    ComboBox1_Sigma_Fst01: TComboBox;
    ComboBox1_S_f1: TComboBox;
    ComboBox1_Sigma_t1: TComboBox;
    ComboBox1_Sigma_Flim01: TComboBox;
    ComboBox1_Sigma_Fst02: TComboBox;
    ComboBox1_S_f2: TComboBox;
    ComboBox1_Sigma_t2: TComboBox;
    ComboBox1_Sigma_Flim02: TComboBox;
    Button1_Nom_sx: TButton;
    Label1_Nom_sx: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1_P1Exit(Sender: TObject);
    procedure Edit1_N1Exit(Sender: TObject);
    procedure Edit1_UExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1_P1KeyPress(Sender: TObject; var Key: Char);
    procedure ПодсчетClick(Sender: TObject);
    procedure Edit1_LhExit(Sender: TObject);
    procedure Edit1_LhKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1_H_HRcs1Exit(Sender: TObject);
    procedure Edit1_H_HRcp1Exit(Sender: TObject);
    procedure Edit1_H_HRcs2Exit(Sender: TObject);
    procedure Edit1_H_HRcp2Exit(Sender: TObject);
    procedure ComboBox1_S_f1Exit(Sender: TObject);
    procedure ComboBox1_S_f2Exit(Sender: TObject);
    procedure ComboBox1_Sigma_Fst01Exit(Sender: TObject);
    procedure ComboBox1_Sigma_Fst02Exit(Sender: TObject);
    procedure ComboBox1_Sigma_t1Exit(Sender: TObject);
    procedure ComboBox1_Sigma_Flim01Exit(Sender: TObject);
    procedure ComboBox1_Sigma_t2Exit(Sender: TObject);
    procedure ComboBox1_Sigma_Flim02Exit(Sender: TObject);
    procedure ComboBox1_Ra1Exit(Sender: TObject);
    procedure ComboBox1_Ra2Exit(Sender: TObject);
    procedure Button1_Nom_sxClick(Sender: TObject);
    procedure ComboBox1_mc1Exit(Sender: TObject);
    procedure ComboBox1_mc2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$endREGION 'ненужное'}

var
  Form1: TForm1;
  a: TPer;
  Input: TParInput;
  Output: TParOutput;
  problem, i: Integer;
  mascount1: Integer;
  masOutput1: array of TParOutput;

implementation

uses Nom_sx;
{$R *.dfm}
{$REGION 'ненужное'}

procedure TForm1.Button1Click(Sender: TObject);
var
  i, cnt: Integer;
begin
{$REGION 'задание переменных'}
  Input.Loading.GraphBar := 0;
  With Input.Loading do
  begin
    x := 2;
    y := 0.3;
    z := 0.2;
    i := 0.6;
    j := 0.2;
    k := 0.2;
  end;
  // Input.P1 := 0.2;//10; { 0.2..300 }
  // Input.N1 := 1;//750; { 1 .. 5000 об/мин }
  // Input.U := 1;//3.5; { 1 .. 8 }
  Input.DeltaU := 2;
  Input.mc1 := '45 ГОСТ 1050-74';
  Input.mc2 := '45 ГОСТ 1050-74';
  // Input.Lh := 10;//6300; { 10 ... 100000 ч }
  Input.Ka := 1.0;
  Input.Ra1 := 2;
  Input.Ra2 := 2;
  Input.TipZ := { 0 } 1; // исправлял на 1 программа виснет
  Input.nagr := False;
  Input.Rewers := False;
  Input.Zagotowka[1] := { 1 } 2; // изменил на 2 т.к нужно значение штамповка
  Input.Zagotowka[2] := { 1 } 2; // изменил на 2 т.к нужно значение штамповка
  Input.Napr_Vr := False;
  Input.TipOpor := False;
  Input.Nom_Sx := 3;
  Input.otw1 := True;
  Input.Termobr1 := 1; { 1 .. 8 }
  Input.Termobr2 := 1; { 1 .. 8 }
  Input.H_HBp1 := 240 { 269 }; { 0..350 }
  Input.H_HBp2 := 240 { 269 }; { 0 .. 350 }
  Input.H_HBs1 := 240 { 269 }; { 0 .. 350 }
  Input.H_HBs2 := 240 { 269 }; { 0 .. 350 }
  // Input.H_HRcp1 := 24{45}; { 35 .. 68 }
  // Input.H_HRcp2 := 24{45}; { 35 .. 68 }
  // Input.H_HRcs1 := 24{45};
  // Input.H_HRcs2 := 24{45};
  Input.Forma := 1;
  Input.Sigma_Fst0 := 1500;
  Input.Sigma_Fst01 := 1500;
  Input.Sigma_Fst02 := 1500;
  Input.Sigma_Flim0 := 240;
  Input.Sigma_Flim01 := 240;
  Input.Sigma_Flim02 := 240;
  Input.S_f := 1.7;
  Input.S_f1 := 1.7;
  Input.S_f2 := 1.7;
  Input.Sigma_Hp := 434.7;
  Input.Sigma_Hp1 := 434.7;
  Input.Sigma_Hp2 := 434.7;
  Input.Sigma_t := 450;
  Input.Sigma_t1 := 450;
  Input.Sigma_t2 := 450;
  Input.da := 1;
{$ENDREGION 'задание переменных'}
  cnt := 0;
  Input.P1 := P1Min;
  Input.N1 := N1Min;
  Input.U := UMin;
  Input.Lh := LhMin;
  Input.H_HRcs1 := H_HRcs1min;
  Input.H_HRcs2 := H_HRcs2min;
  Input.H_HRcp1 := H_HRcp1min;
  Input.H_HRcp2 := H_HRcp2min;

  while Input.H_HRcp2 <= H_HRcp2max - 6 do
  begin
    Input.P1 := P1Min;
    Input.N1 := N1Min;
    Input.U := UMin;
    Input.Lh := LhMin;
    Input.H_HRcs1 := H_HRcs1min;
    Input.H_HRcs2 := H_HRcs2min;
    Input.H_HRcp1 := H_HRcp1min;
    while Input.H_HRcp1 <= H_HRcp1max - 6 do
    begin
      Input.P1 := P1Min;
      Input.N1 := N1Min;
      Input.U := UMin;
      Input.Lh := LhMin;
      Input.H_HRcs1 := H_HRcs1min;
      Input.H_HRcs2 := H_HRcs2min;
      while Input.H_HRcs2 <= H_HRcs2max - 6 do
      begin
        Input.P1 := P1Min;
        Input.N1 := N1Min;
        Input.U := UMin;
        Input.Lh := LhMin;
        Input.H_HRcs1 := H_HRcs1min;
        while Input.H_HRcs1 <= H_HRcs1max - 6 do
        begin
          Input.P1 := P1Min;
          Input.N1 := N1Min;
          Input.U := UMin;
          Input.Lh := LhMin;
          while Input.Lh <= LhMax - 100 do
          begin
            Input.P1 := P1Min;
            Input.N1 := N1Min;
            Input.U := UMin;
            while Input.P1 <= P1Max - 10 do
            begin
              Input.N1 := N1Min;
              Input.U := UMin;
              while Input.N1 <= N1Max - 100 do
              begin
                Input.U := UMin;
                while Input.U <= UMax - 1 do
                begin
                  // Memo2.Clear;
                  a := TPer.create(Input { ,Memo2  , Output } );
                  inc(cnt);
                  StatusBar1.Panels[0].Text :=
                    'Количество рассчитанных передач: ' + IntToStr(cnt);
                  Refresh;
                  a.Free;
                end;
                Input.U := Input.U + 1;
              end;
              Input.N1 := Input.N1 + 100;
            end;
            Input.P1 := Input.P1 + 10;
          end;
          Input.Lh := Input.Lh + 100;
        end;
        Input.H_HRcs1 := Input.H_HRcs1 + 6;
      end;
      Input.H_HRcs2 := Input.H_HRcs2 + 6;
    end;
    Input.H_HRcp1 := Input.H_HRcp1 + 6;
  end;
  Input.H_HRcp2 := Input.H_HRcp2 + 6;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Input.Loading.GraphBar := 0;
  With Input.Loading do
  begin
    x := 2;
    y := 0.3;
    z := 0.2;
    i := 0.6;
    j := 0.2;
    k := 0.2;
  end;
  Input.P1 := 10; { 0.2..300 }
  Input.N1 := 750; { 1 .. 5000 об/мин }
  Input.U := 3.5; { 1 .. 8 }
  Input.DeltaU := 2;
  Input.mc1 := '45 ГОСТ 1050-74';
  Input.mc2 := '45 ГОСТ 1050-74';
  Input.Lh := 6300; { 10 ... 100000 ч }
  Input.Ka := 1.0;
  Input.Ra1 := 2;
  Input.Ra2 := 2;
  Input.TipZ := { 0 } 1; // исправлял на 1 программа виснет
  Input.nagr := False;
  Input.Rewers := False;
  Input.Zagotowka[1] := { 1 } 2; // изменил на 2 т.к нужно значение штамповка
  Input.Zagotowka[2] := { 1 } 2; // изменил на 2 т.к нужно значение штамповка
  Input.Napr_Vr := False;
  Input.TipOpor := False;
  Input.Nom_Sx := 3;
  Input.otw1 := True;
  Input.Termobr1 := 1; { 1 .. 8 }
  Input.Termobr2 := 1; { 1 .. 8 }
  Input.H_HBp1 := 240 { 269 }; { 0..350 }
  Input.H_HBp2 := 240 { 269 }; { 0 .. 350 }
  Input.H_HBs1 := 240 { 269 }; { 0 .. 350 }
  Input.H_HBs2 := 240 { 269 }; { 0 .. 350 }
  Input.H_HRcp1 := 24 { 45 }; { 35 .. 68 }
  Input.H_HRcp2 := 24 { 45 }; { 35 .. 68 }
  Input.H_HRcs1 := 24 { 45 };
  Input.H_HRcs2 := 24 { 45 };
  Input.Forma := 1;
  Input.Sigma_Fst0 := 1500;
  Input.Sigma_Fst01 := 1500;
  Input.Sigma_Fst02 := 1500;
  Input.Sigma_Flim0 := 240;
  Input.Sigma_Flim01 := 240;
  Input.Sigma_Flim02 := 240;
  Input.S_f := 1.7;
  Input.S_f1 := 1.7;
  Input.S_f2 := 1.7;
  Input.Sigma_Hp := 434.7;
  Input.Sigma_Hp1 := 434.7;
  Input.Sigma_Hp2 := 434.7;
  Input.Sigma_t := 450;
  Input.Sigma_t1 := 450;
  Input.Sigma_t2 := 450;
  Input.da := 1;
  { da1:= 1;
    da2:= 1; }

  // Memo2.Clear;
  TPer.create(Input { ,Memo2  , Output } );
end;

{$ENDREGION 'ненужное'}

procedure TForm1.Button1_Nom_sxClick(Sender: TObject);
var FChild: TForm3;
begin
  FChild:=TForm3.Create(Self);
  FChild.Show;
end;

{$REGION 'Нужная кнопка'}
procedure TForm1.ПодсчетClick(Sender: TObject);
begin
  while PageControl1.PageCount > 0 do
    PageControl1.Pages[0].Free;
  Input.Loading.GraphBar := 0;
  With Input.Loading do
  begin
    x := 2;
    y := 0.3;
    z := 0.2;
    i := 0.6;
    j := 0.2;
    k := 0.2;
  end;
  Input.Sigma_Hp := 434.7;
  Input.Sigma_Hp1 := 434.7;
  Input.Sigma_Hp2 := 434.7;
  Input.DeltaU := 2;
  Input.Ka := 1.0;
  Input.da := 1;

  val(Edit1_P1.Text, Input.P1, problem);
  val(Edit1_N1.Text, Input.N1, problem);
  val(Edit1_U.Text, Input.U, problem);
  val(Edit1_Lh.Text, Input.Lh, problem);
  val(Edit1_H_HRcp1.Text, Input.H_HRcp1, problem);
  val(Edit1_H_HRcp2.Text, Input.H_HRcp2, problem);
  val(Edit1_H_HRcs1.Text, Input.H_HRcs1, problem);
  val(Edit1_H_HRcs2.Text, Input.H_HRcs2, problem);

  Input.Nom_Sx := StrToInt(Button1_Nom_sx.Caption);
  a.Nom_Sx := Input.Nom_Sx;

  Input.Termobr1 := ComboBox1_Termobr1.ItemIndex;
  a.Termobr1:=Input.Termobr1;
  Input.Termobr2 := ComboBox1_Termobr2.ItemIndex;
  a.Termobr2:=Input.Termobr2;
  Input.mc1 := ComboBox1_mc1.Text;
  a.mc1:= Input.mc1;
  Input.mc2 := ComboBox1_mc2.Text;
  a.mc2:= Input.mc2;

  Input.Sigma_Fst01 := StrToInt(ComboBox1_Sigma_Fst01.Text);
  a.Sigma_Fst01 := Input.Sigma_Fst01;
  Input.Sigma_Fst02 := StrToInt(ComboBox1_Sigma_Fst02.Text);
  a.Sigma_Fst02 := Input.Sigma_Fst02;

  Input.S_f1 := StrToFloat(ComboBox1_S_f1.Text);
  a.S_f1:=Input.S_f1;
  Input.S_f2 := StrToFloat(ComboBox1_S_f2.Text);
  a.S_f2:=Input.S_f2;

  Input.Sigma_t1 := StrToInt(ComboBox1_Sigma_t1.Text);
  a.Sigma_t1 := Input.Sigma_t1;
  Input.Sigma_t2 := StrToInt(ComboBox1_Sigma_t2.Text);
  a.Sigma_t2 := Input.Sigma_t2;

  Input.Sigma_Flim01 := StrToInt(ComboBox1_Sigma_Flim01.Text);
  a.Sigma_Flim01 := Input.Sigma_Flim01;
  Input.Sigma_Flim02 := StrToInt(ComboBox1_Sigma_Flim02.Text);
  a.Sigma_Flim02 := Input.Sigma_Flim02;

  Input.Ra1 := ComboBox1_Ra1.ItemIndex;
  a.Ra1 := Input.Ra1;

  Input.Ra2 := ComboBox1_Ra2.ItemIndex;
  a.Ra2 := Input.Ra2;

  Input.Forma := ComboBox1_Forma.ItemIndex;
  Input.Zagotowka[1] := ComboBox1_Zagotowka1.ItemIndex;
  Input.Zagotowka[2] := ComboBox1_Zagotowka2.ItemIndex;;
  Input.TipZ := ComboBox1_Tipz.ItemIndex;
  Input.nagr := CheckBox1_Nagr.Checked;
  Input.Rewers := CheckBox1_rewers.Checked;
  Input.Napr_Vr := CheckBox1_Napr_Vr.Checked;
  Input.TipOpor := CheckBox1_TipOpor.Checked;
  Input.otw1 := CheckBox1_otw1.Checked;


  a.ParamToRec(Input);
  a.MakeVersionss(Input);
  ShowMessage('Всего вариантов =   ' + IntToStr(Length(masOutput)));
  SetLength(masOutput1, Length(masOutput));
  for i := Low(masOutput1) to High(masOutput1) do
  begin
    unit2.MasOutputOnForm(i, Output);
    masOutput1[i] := Output;
    // Создаем первую страницу и связываем ее с PageControl
    TabSheet1 := TTabSheet.create(Self);
    TabSheet1.Caption := 'Вариант' + IntToStr(i + 1);
    TabSheet1.PageControl := PageControl1;
    // Создаем первую страницу
    with Tmemo.create(Self) do
    begin
      width := 505;
      Height := 566;
      Parent := TabSheet1;
      ScrollBars := ssVertical;
      Lines.Append('       1. Исходные данные');
      Lines.Append('Мощность на ведущем валу, кВт............' +
        FloatToStrF(Input.P1, ffFixed, 20, 2));
      Lines.Append('Частота вращения шестерни, об/мин........' +
        FloatToStrF(Input.N1, ffFixed, 20, 2));
      Lines.Append('Проектное передаточное число.............' +
        FloatToStrF(Input.U, ffFixed, 20, 2));
      Lines.Append('Расчетный срок службы, час...............' +
        IntToStr(Input.Lh));
      Lines.Append('Материал шестерни........................' + Input.mc1);
      Lines.Append('Термообработка шестерни..................' +
        IntToStr(Input.Termobr1));
      Lines.Append('Материал колеса..........................' + Input.mc2);
      Lines.Append('Термообработка колеса....................' +
        IntToStr(Input.Termobr2));
      Lines.Append('Заготовка шестерни.......................' +
        IntToStr(Input.Zagotowka[1]));
      Lines.Append('Заготовка колеса.........................' +
        IntToStr(Input.Zagotowka[2]));
      Lines.Append('Тип зубьев...............................' +
        IntToStr(Input.TipZ));
      Lines.Append('Форма зуба...............................' +
        IntToStr(Input.Forma));
      Lines.Append('Направление вращения.....................' +
        Input.Rewers.ToString);
      Lines.Append('Направление наклона зуба.................' +
        Input.Napr_Vr.ToString);
      Lines.Append('Фактическое передаточное число...........' +
        FloatToStrF(Output.Uf, ffFixed, 20, 2));
      Lines.Append('');
      Lines.Append('       2. Кинематические параметры');
      Lines.Append('Частота вращения шестерни, об/мин........' +
        FloatToStrF(Input.N1, ffFixed, 20, 2));
      Lines.Append('Частота вращения колеса, об/мин..........' +
        FloatToStrF(Output.n2, ffFixed, 20, 2));
      Lines.Append('Линейная скорость, м/с...................' +
        FloatToStrF(Output.V, ffFixed, 20, 2));
      Lines.Append('Нормальный модуль, мм....................' +
        FloatToStrF(Output.Mn, ffFixed, 20, 2));
      Lines.Append('');
      Lines.Append('       3. Параметры передачи');
      Lines.Append('Торцевой модуль, мм......................' +
        FloatToStrF(Output.Mte, ffFixed, 20, 2));
      Lines.Append('Конусное расстояние передачи, мм.........' +
        FloatToStrF(Output.Re, ffFixed, 20, 2));
      Lines.Append('Угол делительного конуса шестерни........' +
        IntToStr(trunc(Output.Delta1 * 180 / Pi)) + '°' +
        IntToStr(trunc(frac(Output.Delta1 * 180 / Pi) * 60)) + '''' +
        IntToStr(trunc(frac(frac(Output.Delta1 * 180 / Pi) * 60) * 60)) + '"');
      Lines.Append('Угол делительного конуса колеса..........' +
        IntToStr(trunc(Output.Delta2 * 180 / Pi)) + '°' +
        IntToStr(trunc(frac(Output.Delta2 * 180 / Pi) * 60)) + '''' +
        IntToStr(trunc(frac(frac(Output.Delta2 * 180 / Pi) * 60) * 60)) + '"');
      Lines.Append('Угол выступов конуса шестерни............' +
        IntToStr(trunc(Output.Delta_A1 * 180 / Pi)) + '°' +
        IntToStr(trunc(frac(Output.Delta_A1 * 180 / Pi) * 60)) + '''' +
        IntToStr(trunc(frac(frac(Output.Delta_A1 * 180 / Pi) * 60) *
        60)) + '"');
      Lines.Append('Угол выступов конуса колеса..............' +
        IntToStr(trunc(Output.Delta_A2 * 180 / Pi)) + '°' +
        IntToStr(trunc(frac(Output.Delta_A2 * 180 / Pi) * 60)) + '''' +
        IntToStr(trunc(frac(frac(Output.Delta_A2 * 180 / Pi) * 60) *
        60)) + '"');
      Lines.Append('Угол впадин конуса шестерни..............' +
        IntToStr(trunc(Output.Delta_F1 * 180 / Pi)) + '°' +
        IntToStr(trunc(frac(Output.Delta_F1 * 180 / Pi) * 60)) + '''' +
        IntToStr(trunc(frac(frac(Output.Delta_F1 * 180 / Pi) * 60) *
        60)) + '"');
      Lines.Append('Угол впадин конуса колеса................' +
        IntToStr(trunc(Output.Delta_F2 * 180 / Pi)) + '°' +
        IntToStr(trunc(frac(Output.Delta_F2 * 180 / Pi) * 60)) + '''' +
        IntToStr(trunc(frac(frac(Output.Delta_F2 * 180 / Pi) * 60) *
        60)) + '"');
      Lines.Append('Суммарный коэфф. перекрытия..............' +
        FloatToStrF(Output.epsias, ffFixed, 20, 2));
      Lines.Append('Степень точности.........................' +
        IntToStr(Output.St));
      Lines.Append('Число зубьев шестерни....................' +
        IntToStr(Output.z1));
      Lines.Append('Число зубьев колеса......................' +
        IntToStr(Output.z2));
      Lines.Append('Коэфф. смещения исх. контура шестерни....' +
        FloatToStrF(Output.x1, ffFixed, 20, 2));
      Lines.Append('Коэфф. смещения исх. контура колеса......' +
        FloatToStrF(Output.x2, ffFixed, 20, 2));
      Lines.Append('Коэфф. тангенц. смещения для шестерни....' +
        FloatToStrF(Output.xn1, ffFixed, 20, 2));
      Lines.Append('Коэфф. тангенц. смещения для колеса......' +
        FloatToStrF(Output.xn2, ffFixed, 20, 2));
      Lines.Append('');
      Lines.Append('       4. Размеры колес');
      Lines.Append('Диаметр конуса вершин шестерни, мм.......' +
        FloatToStrF(Output.De1, ffFixed, 20, 2));
      Lines.Append('Делительный диаметр шестерни, мм.........' +
        FloatToStrF(Output.Dae1, ffFixed, 20, 2));
      Lines.Append('Диаметр конуса впадин шестерни, мм.......' +
        FloatToStrF(Output.Dfe1, ffFixed, 20, 2));
      Lines.Append('Расст. до базовой поверх. шестерни, мм...' +
        FloatToStrF(Output.B1, ffFixed, 20, 2));
      Lines.Append('Диаметр конуса вершин колеса, мм.........' +
        FloatToStrF(Output.De2, ffFixed, 20, 2));
      Lines.Append('Делительный диаметр колеса, мм...........' +
        FloatToStrF(Output.Dae2, ffFixed, 20, 2));
      Lines.Append('Диаметр конуса впадин колеса, мм.........' +
        FloatToStrF(Output.Dfe2, ffFixed, 20, 2));
      Lines.Append('Расст. до базовой поверх. колеса, мм.....' +
        FloatToStrF(Output.B2, ffFixed, 20, 2));
      Lines.Append('Ширина венца, мм.........................' +
        FloatToStrF(Output.B, ffFixed, 20, 2));
      Lines.Append('');
      Lines.Append('       5. Прочностные и силовые параметры');
      Lines.Append('Контактное напряжение, Мпа...............' +
        FloatToStrF(Output.Sigma_H, ffFixed, 20, 2));
      Lines.Append('Момент на быстроходном валу, Нм..........' +
        FloatToStrF(Output.T1, ffFixed, 20, 2));
      Lines.Append('Момент на тихоходном валу, Нм............' +
        FloatToStrF(Output.T2, ffFixed, 20, 2));
      Lines.Append('Суммарное давление на вал, Н.............' +
        FloatToStrF(Output.Fv, ffFixed, 20, 2));
      Lines.Append('Окружное усилие шестерни, Н..............' +
        FloatToStrF(Output.Ft1, ffFixed, 20, 2));
      Lines.Append('Радиальное усилие шестерни, Н............' +
        FloatToStrF(Output.Fr1, ffFixed, 20, 2));
      Lines.Append('Осевое усилие шестерни, Н................' +
        FloatToStrF(Output.Fx1, ffFixed, 20, 2));
      Lines.Append('Окружное усилие колеса, Н................' +
        FloatToStrF(Output.Ft2, ffFixed, 20, 2));
      Lines.Append('Радиальное усилие колеса, Н..............' +
        FloatToStrF(Output.Fr2, ffFixed, 20, 2));
      Lines.Append('Осевое усилие колеса, Н..................' +
        FloatToStrF(Output.Fx2, ffFixed, 20, 2));
    end;
  end;
  // a:=TPer.create(Input);
end;


{$endREGION 'Нужная кнопка'}

{$region 'Защита'}
procedure TForm1.Edit1_P1KeyPress(Sender: TObject; var Key: Char);
var
  i: Integer;
begin
  if not(Key in ['0' .. '9', '.', #8]) then
    Key := #0;
  for i := 1 to Length((Sender as TEdit).Text) do
    if ((Key = '.') and ((Sender as TEdit).Text[i] = '.')) then
      Key := #0;
end;

procedure TForm1.Edit1_LhKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8]) then
    Key := #0;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Repaint;
end;
{$endregion 'Защита'}

{$region 'Потеря фокуса'}
procedure TForm1.ComboBox1_mc1Exit(Sender: TObject);
begin
  Input.mc1 := ComboBox1_mc1.Text;
  a.mc1:= Input.mc1;
end;

procedure TForm1.ComboBox1_mc2Exit(Sender: TObject);
begin
  Input.mc2 := ComboBox1_mc2.Text;
  a.mc2:= Input.mc2;
end;

procedure TForm1.ComboBox1_Ra1Exit(Sender: TObject);
begin
  Input.Ra1 := ComboBox1_Ra1.ItemIndex;
  a.Ra1 := Input.Ra1;
end;

procedure TForm1.ComboBox1_Ra2Exit(Sender: TObject);
begin
  Input.Ra2 := ComboBox1_Ra2.ItemIndex;
  a.Ra2 := Input.Ra2;
end;

procedure TForm1.ComboBox1_Sigma_Flim01Exit(Sender: TObject);
begin
  Input.Sigma_Flim01 := strtoint(ComboBox1_Sigma_Flim01.Text);
  a.Sigma_Flim01 := Input.Sigma_Flim01;
end;

procedure TForm1.ComboBox1_Sigma_Flim02Exit(Sender: TObject);
begin
  Input.Sigma_Flim02 := strtoint(ComboBox1_Sigma_Flim02.Text);
  a.Sigma_Flim02 := Input.Sigma_Flim02;
end;

procedure TForm1.ComboBox1_Sigma_Fst01Exit(Sender: TObject);
begin
  Input.Sigma_Fst01 := strtoint(ComboBox1_Sigma_Fst01.Text);
  a.Sigma_Fst01 := Input.Sigma_Fst01;
end;

procedure TForm1.ComboBox1_Sigma_Fst02Exit(Sender: TObject);
begin
  Input.Sigma_Fst02 := strtoint(ComboBox1_Sigma_Fst02.Text);
  a.Sigma_Fst02 := Input.Sigma_Fst02;
end;

procedure TForm1.ComboBox1_Sigma_t1Exit(Sender: TObject);
begin
  Input.Sigma_t1 := strtoint(ComboBox1_Sigma_t1.Text);
  a.Sigma_t1 := Input.Sigma_t1;
end;

procedure TForm1.ComboBox1_Sigma_t2Exit(Sender: TObject);
begin
  Input.Sigma_t2 := strtoint(ComboBox1_Sigma_t2.Text);
  a.Sigma_t2 := Input.Sigma_t2;
end;

procedure TForm1.ComboBox1_S_f1Exit(Sender: TObject);
begin
  Input.S_f1 := strtofloat(ComboBox1_S_f1.Text);
  a.S_f1 := Input.S_f1;
end;

procedure TForm1.ComboBox1_S_f2Exit(Sender: TObject);
begin
  Input.S_f2 := strtofloat(ComboBox1_S_f2.Text);
  a.S_f2 := Input.S_f2;
end;

procedure TForm1.Edit1_H_HRcs1Exit(Sender: TObject);
begin
  val(Edit1_H_HRcs1.Text, Input.H_HRcs1, problem);
  if problem <> 0 then
    ShowMessage('Введено не верное значение')
  else
    a.H_HRcs1 := Input.H_HRcs1;
end;

procedure TForm1.Edit1_LhExit(Sender: TObject);
begin
  val(Edit1_Lh.Text, Input.Lh, problem);
  if problem <> 0 then
    ShowMessage('Введено не верное значение')
  else
    a.Lh := Input.Lh;
end;

procedure TForm1.Edit1_P1Exit(Sender: TObject);
begin
  val(Edit1_P1.Text, Input.P1, problem);
  if problem <> 0 then
    ShowMessage('Введено не верное значение')
  else
    a.P1 := Input.P1;
end;

procedure TForm1.Edit1_H_HRcp1Exit(Sender: TObject);
begin
  val(Edit1_H_HRcp1.Text, Input.H_HRcp1, problem);
  if problem <> 0 then
    ShowMessage('Введено не верное значение')
  else
    a.H_HRcp1 := Input.H_HRcp1;
end;

procedure TForm1.Edit1_N1Exit(Sender: TObject);
begin
  val(Edit1_N1.Text, Input.N1, problem);
  if problem <> 0 then
    ShowMessage('Введено не верное значение')
  else
    a.N1 := Input.N1;
end;

procedure TForm1.Edit1_H_HRcs2Exit(Sender: TObject);
begin
  val(Edit1_H_HRcs2.Text, Input.H_HRcs2, problem);
  if problem <> 0 then
    ShowMessage('Введено не верное значение')
  else
    a.H_HRcs2 := Input.H_HRcs2;
end;

procedure TForm1.Edit1_UExit(Sender: TObject);
begin
  val(Edit1_U.Text, Input.U, problem);
  if problem <> 0 then
    ShowMessage('Введено не верное значение')
  else
    a.U := Input.U;
end;

procedure TForm1.Edit1_H_HRcp2Exit(Sender: TObject);
begin
  val(Edit1_H_HRcp2.Text, Input.H_HRcp2, problem);
  if problem <> 0 then
    ShowMessage('Введено не верное значение')
  else
    a.H_HRcp2 := Input.H_HRcp2;
end;
{$endregion 'Потеря фокуса'}

{$region 'Скрейчивание и заполнение боксов'}
procedure TForm1.FormShow(Sender: TObject);
var
  i: Integer;
begin
  a := TPer.create;

// Марка стали для шестерни и колеса
  for i := low(markaa) to High(markaa) do
  begin
    ComboBox1_mc1.Items.Add(markaa[i]);
    ComboBox1_mc2.Items.Add(markaa[i]);
  end;
  ComboBox1_mc1.ItemIndex := High(markaa)-2;
  ComboBox1_mc2.ItemIndex := High(markaa)-2;

// Термообработка зуба шестерни и колеса, номер
  for i := low(Termobra) to High(Termobra) do
  begin
    ComboBox1_Termobr1.Items.Add(Termobra[i]);
    ComboBox1_Termobr2.Items.Add(Termobra[i]);
  end;
  ComboBox1_Termobr1.ItemIndex := low(Termobra);
  ComboBox1_Termobr2.ItemIndex := low(Termobra);

// Шероховатость боковой поверхности зуба шестерни и колеса
  for i := low(Raa) to High(Raa) do
  begin
    ComboBox1_Ra1.Items.Add(Raa[i]);
    ComboBox1_Ra2.Items.Add(Raa[i]);
  end;
  ComboBox1_Ra1.ItemIndex:=low(raa)+2;
  ComboBox1_Ra2.ItemIndex:=low(raa)+2;

// Тип зубьев колес
  for i := low(TipZa) to High(TipZa) do
    ComboBox1_Tipz.Items.Add(TipZa[i]);
  ComboBox1_Tipz.ItemIndex:=low(TipZa);

// Способ получения заготовки шестерни и колеса
  for i := low(Zagotowkaa) to High(Zagotowkaa) do
  begin
    ComboBox1_Zagotowka1.Items.Add(Zagotowkaa[i]);
    ComboBox1_Zagotowka2.Items.Add(Zagotowkaa[i]);
  end;
  ComboBox1_Zagotowka1.ItemIndex:=Low(Zagotowkaa);
  ComboBox1_Zagotowka2.ItemIndex:=Low(Zagotowkaa);

// Осевая форма зуба
  for i := low(Formaa) to High(Formaa) do
    ComboBox1_Forma.Items.Add(Formaa[i]);
  ComboBox1_Forma.ItemIndex:=low(Formaa)+1;

// Предел текучести материала шестерни и колеса
  for i := low(Sigma_ta) to High(Sigma_ta)-2 do
  begin
    ComboBox1_Sigma_t1.Items.Add(IntToStr(Sigma_ta[i]));
    ComboBox1_Sigma_t2.Items.Add(IntToStr(Sigma_ta[i]));
  end;
  ComboBox1_Sigma_t1.ItemIndex:=High(Sigma_ta)-5;
  ComboBox1_Sigma_t2.ItemIndex:=High(Sigma_ta)-5;

// Предел выносливости по изгибу для шестерни и колеса
  for i := low(Sigma_Flim0a) to High(Sigma_Flim0a)-2 do
  begin
    ComboBox1_Sigma_Flim01.Items.Add(IntToStr(Sigma_Flim0a[i]));
    ComboBox1_Sigma_Flim02.Items.Add(IntToStr(Sigma_Flim0a[i]));
  end;
  ComboBox1_Sigma_Flim01.ItemIndex:=High(Sigma_Flim0a)-5;
  ComboBox1_Sigma_Flim02.ItemIndex:=High(Sigma_Flim0a)-5;

// Предельное напряжение для шестерни и колеса
  for i := low(Sigma_Fst0a) to High(Sigma_Fst0a)-2 do
  begin
    ComboBox1_Sigma_Fst01.Items.Add(IntToStr(Sigma_Fst0a[i]));
    ComboBox1_Sigma_Fst02.Items.Add(IntToStr(Sigma_Fst0a[i]));
  end;
  ComboBox1_Sigma_Fst01.ItemIndex:=High(Sigma_Fst0a)-5;
  ComboBox1_Sigma_Fst02.ItemIndex:=High(Sigma_Fst0a)-5;

// Коэффициент выносливости по изгибу для шестерни и колеса
  for i := low(S_Fa) to High(S_Fa)-2 do
  begin
    ComboBox1_S_F1.Items.Add(FloatToStr(S_Fa[i]));
    ComboBox1_S_F2.Items.Add(FloatToStr(S_Fa[i]));
  end;
  ComboBox1_S_F1.ItemIndex:=High(S_Fa)-3;
  ComboBox1_S_F2.ItemIndex:=High(S_Fa)-3;
end;
{$endregion 'Скрейчивание и заполнение боксов'}

end.
