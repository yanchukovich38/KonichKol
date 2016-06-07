unit Unit2;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math2, Materials;

type
  Tt1 = array [1 .. 45] of Extended;
  TTwoInteger = array [1 .. 2] of Integer;
  ArrayTermobr = array [1 .. 4] of byte;
  ArraySigma_Flim0 = array [1 .. 6] of Integer;
  ArraySigma_t = array [1 .. 6] of Integer;
  ArraySigma_Fst0 = array [1 .. 6] of Integer;
  ArrayS_F = array [1 .. 6] of Extended;

  TLoading = record
    GraphBar: Integer;
    x, y, z, i, j, k: Extended;
  end;

  TParInput = record // входные параметры
    K_Hbeta, Da, Da1, da2, Sigma_Flim0, S_f, Sigma_Hpmax, Sigma_Fmax1,
      Sigma_Fpmax1, Sigma_Fmax2, Sigma_Fpmax2, Sigma_Hpmax1, Sigma_Hpmax2,
      Sigma_Fst0, Sigma_t: Extended;

    Loading: TLoading;
    P1, { Мощность, передаваемая быстроходным валом }
    N1, { Частота вращения быстроходного вала }
    U: Extended; { Передаточное число передачи }
    DeltaU: Integer;
    Lh: longint; { Расчетный ресурс передачи }
    Tipz: Integer; { тип зубьев колес: 0 - автовыбор
      1 - прямые
      2 - косые }
    Napr_Vr, { Направление наклона зуба }
    TipOpor: boolean;
    Forma: Integer; { Форма зуба }
    mc1: String; { марка стали для шестерни }
    mc2: String; { марка стали для колеса }
    Termobr1, { термообработка зуба шестерни, номер }
    Termobr2: Integer; { термообработка зуба колеса, номер }
    Zagotowka: TTwoInteger; { Способ получения заготовки шестерни и колеса
      = 1 для поковок
      = 2 для штамповок
      = 3 для проката
      = 4 для отливок }
    Ra1, { Шероховатость боковой поверхности зуба шестерни }
    Ra2: Integer; { Шероховатость боковой поверхности зуба колеса }
    Nom_sx: Integer; { Номер схемы расположения колес }
    Nagr, { =1 для типового режима,
      = 0 для циклограммы }
    rewers: boolean; { При реверсировании = 1; без реверсирования = 0 }
    Ka: Extended; { Коэффициент внешней динамики }
    otw1: boolean; { При стандартном межосевом расстоянии = 'Y',
      при нестандартном межосевом расстоянии ='n' }
    H_HRcs1, { Твердость сердцевины зуба шестерни по Роквеллу }
    H_HRcs2, { Твердость сердцевины зуба колеса по Роквеллу }
    H_HRcp1, { Твердость поверхности зуба шестерни по Роквеллу }
    H_HRcp2, { Твердость поверхности зуба колеса по Роквеллу }
    H_HBs1, { Твердость сердцевины зуба шестерни по Бринелю }
    H_HBs2, { Твердость сердцевины зуба колеса по Бринелю }
    H_HBp1, { Твердость поверхности зуба шестерни по Бринелю }
    H_HBp2, { Твердость поверхности зуба колеса по Бринелю }
    H_HVs1, { Твердость сердцевины зуба шестерни по Виккерсу }
    H_HVs2, { Твердость сердцевины зуба колеса по Виккерсу }
    H_HVp1, { Твердость поверхности зуба шестерни по Виккерсу }
    H_HVp2: Integer; { Твердость поверхности зуба колеса по Виккерсу }
    S_f1, { Коэффициент выносливости по изгибу для шестерни }
    S_f2:Extended; { Коэффициент выносливости по изгибу для колеса }

    Sigma_t1, { Предел текучести материала шестерни }
    Sigma_t2, { Предел текучести материала колеса }
    Sigma_Flim01, { Предел выносливости по изгибу для шестерни }
    Sigma_Flim02, { Предел выносливости по изгибу для колеса }
    Sigma_Fst01, { Предельное напряжение для шестерни }
    Sigma_Fst02: integer;  { Предельное напряжение для колеса }
    Sigma_Hp, Sigma_Hp1, Sigma_Hp2: Extended;
  end;

  TParOutput = record // выходные параметры
    { --------------------- Критерии качества --------------------------------- }
    Massa, { Суммарная масса зубчатых колес }
    Massa1, Massa2, V_p, { Объём занимаемый передачей }
    Re, Fv, Dae2, Mn, { Модуль нормальный в среднем сечении }
    Mte, { Модуль торцевой на внешнем торце }
    Me, { Модуль торцевой на внешнем торце }
    Betn, { Нормальный угол наклона в среднем сечении в радианах }
    Xtau1, Xtau2, { Коэффициенты тангенциального смещения }
    x1, x2, { Коэффициент смещения исходного контура для прямозубых колес }
    xn1, xn2: Extended; { Коэффициент смещения исходного контура
      в нормальном сечении для колес с круговым зубом }
    z1, { Число зубьев шестерни }
    z2: Integer; { Числа зубьев колеса }
    St: Integer; { Степень точности }
    Uf, { Фактическое передаточное число передачи }
    n2, { Частота вращения колеса }
    V, { Скорость, м/с }
    de1, { Диаметр делителбного конуса шестерни }
    Dae1, { Диаметр окружности вершин }
    Dfe1, { Диаметр окружности впадин шестерни }
    d1, { Средний делительный диаметр шестерни }
    Delta1, { Угол делительного конуса шестерни }
    Delta_A1, { Угол конуса вершин шестерни }
    Delta_F1, { Угол конуса впадин шестерни }
    Sce1, { Врешняя постоянная хорда }
    Hce1, { Измерительная высота }
    de2, { Диаметр делительного конуса колеса }
    Dfe2, { Диаметр окружности впадин колеса }
    d2, { Средний делительный диаметр колеса }
    Delta2, { Угол делительного конуса колеса }
    Delta_A2, { Угол конуса вершин колеса }
    Delta_F2, { Угол конуса впадин колеса }
    Sce2, { Врешняя постоянная хорда }
    Hce2, { Измерительная высота }
    Rs, { Среднее конусное расстояние по делительному конусу }
    B, { Ширина венца }
    b1, { Расстояние от вершины конуса до базовой поверхности }
    b2, H_e1, { Высота зуба на внешнем торце }
    H_e2, { Высота зуба на внешнем торце }
    d0, { Диаметр резцовой головки }
    Sigma_H, { Контактное напряжение }
    T1, { Момент, передаваемый быстроходным валом }
    T2, { Момент, передаваемый тихоходным валом }
    Ft1, { Окружное усилие шестерни }
    Fr1, { Радиальное усилие шестерни }
    Fx1, { Осевое усилие шестерни }
    Ft2, { Окружное усилие колеса }
    Fr2, { Радиальное усилие колеса }
    Fx2, { Осевое усилие колеса }
    Epsias: Extended;
    Error: Integer;
  end;

  TMark = record
  S_F1, S_F2, Sigma_t1, Sigma_t2, Sigma_Flim01,
  Sigma_Flim02, Sigma_Fst01, Sigma_Fst02: extended;
  end;

type
  TPer = class(TObject)

  private

{$REGION 'переменные свойств'}
    FP1: Extended;
    FU: Extended;
    FN1: Extended;
    FLh: Integer;
    FH_HRcp1: Integer;
    FH_HRcp2: Integer;
    FH_HRcs1: Integer;
    FH_HRcs2: Integer;
    FS_F1: Extended;
    FS_F2: Extended;
    FSigma_Fst01: Integer;
    FSigma_Fst02: Integer;
    FSigma_Flim01: Integer;
    FSigma_Flim02: Integer;
    FSigma_t1: Integer;
    FSigma_t2: Integer;
    FRa1: Integer;
    FRa2: Integer;
    FNom_sx: Integer;
    Fmc1:string;
    Fmc2:string;
    FTermobr1:integer;
    FTermobr2:integer;
{$ENDREGION 'переменные свойств'}
{$REGION 'переменные CalculateConeWheel'}
    Nu_H, Nu_F, K_HAlfa, Dm1, S_e1, H_Ae1, H_A1, H_Fe1, H_Fi1, Ha1,
      Tet_A1: Extended;

    Tet_H, Tet_F, S_ae1, Se_1, Hae_1, Alfat, Dm2, Sn1, Sn2, S_ae2,
      Se_2: Extended;

    S_e2, H_Ae2, H_A2, H_Fe2, H_Fi2, Ha2, Tet_A2, Se_y2, dey2, hae_y2,
      dy2: Extended;

    Sn_y2, Ha_y2, Hae_2, K_HB, K_Fbeta, Tet, Kbe, Zc: Extended;

    W2, delta_hf, Betn_e, Betn_i, Epsi_Bet, Epsi_Sum, x1min, x2min,
      Xmax: Extended;

    tet1, tet2, Sna1, Sna2, Rol1, Rol2, Rop1, Rop2, q_f: Extended;

    IMn: Integer;

{$ENDREGION 'переменные CalculateConeWheel'}
    Sigma_F1, Sigma_Fp1, Sigma_F2, Sigma_Fp2, Sigma_Hmax: Extended;
    NaprZub1, Zw: Integer;
    K_Hbeta, de2r: Extended;
    { Параметры исходного контура }
    Ha, c_, H_l, Ro_f, Alfa: Extended;

{$REGION 'параметры главной процедуры'}
    { Massa1, Massa2, Da1, da2, }
    Sigma_Flim0, Da, S_f, Sigma_Hpmax, Sigma_Fmax1, Sigma_Fpmax1, Sigma_Fmax2,
      Sigma_Fpmax2, Sigma_Hpmax1, Sigma_Hpmax2, Sigma_Fst0, Sigma_t: Extended;

    Loading: TLoading;
    // P1, { Мощность, передаваемая быстроходным валом }
    // N1, { Частота вращения быстроходного вала }
    // U: Extended; { Передаточное число передачи }
    DeltaU: Integer;
    // Lh: longint; { Расчетный ресурс передачи }
    Tipz: Integer; { тип зубьев колес:
      1 - прямые
      2 - косые
      0 - автовыбор }
    Napr_Vr, { Направление наклона зуба }
    TipOpor: boolean;
    Forma: Integer; { Форма зуба }
    //mc1: String; { марка стали для шестерни }   { ???????????????? }
    //mc2: String; { марка стали для колеса }     { ?????????????????? }
    //Termobr1, { термообработка зуба шестерни, номер }
    //Termobr2: Integer; { термообработка зуба колеса, номер }
    Zagotowka: TTwoInteger;
    { Способ получения заготовки шестерни и колеса
      = 1 для поковок
      = 2 для штамповок
      = 3 для проката
      = 4 для отливок }
    //Ra1, { Шероховатость боковой поверхности зуба шестерни }
    //Ra2: Integer; { Шероховатость боковой поверхности зуба колеса }
    //Nom_sx: Integer; { Номер схемы расположения колес }
    Nagr, { =1 для типового режима,
      =0 для циклограммы }
    rewers: boolean; { При реверсировании = 1; без реверсирования = 0 }
    Ka: Extended; { Коэффициент внешней динамики }
    otw1: boolean; { При стандартном межосевом расстоянии = 'Y',
      при нестандартном межосевом расстоянии ='n' }
    // H_HRcs1, { Твердость сердцевины зуба шестерни по Роквеллу }
    // H_HRcs2, { Твердость сердцевины зуба колеса по Роквеллу }
    // H_HRcp1, { Твердость поверхности зуба шестерни по Роквеллу }
    // H_HRcp2, { Твердость поверхности зуба колеса по Роквеллу }
    H_HBs1, { Твердость сердцевины зуба шестерни по Бринелю }
    H_HBs2, { Твердость сердцевины зуба колеса по Бринелю }
    H_HBp1, { Твердость поверхности зуба шестерни по Бринелю }
    H_HBp2, { Твердость поверхности зуба колеса по Бринелю }
    H_HVs1, { Твердость сердцевины зуба шестерни по Виккерсу }
    H_HVs2, { Твердость сердцевины зуба колеса по Виккерсу }
    H_HVp1, { Твердость поверхности зуба шестерни по Виккерсу }
    H_HVp2: Integer; { Твердость поверхности зуба колеса по Виккерсу }
    //S_f1, { Коэффициент выносливости по изгибу для шестерни }
    //S_f2, { Коэффициент выносливости по изгибу для колеса }
    //Sigma_t1, { Предел текучести материала шестерни }
    //Sigma_t2 { Предел текучести материала колеса }
    //Sigma_Flim01, { Предел выносливости по изгибу для шестерни }
    //Sigma_Flim02, { Предел выносливости по изгибу для колеса }
    //Sigma_Fst01, { Предельное напряжение для шестерни }
    //Sigma_Fst02: Extended; { Предельное напряжение для колеса }
    { --------------------- Критерии качества --------------------------------- }
    Massa, { Суммарная масса зубчатых колес }
    V_p, { Объём занимаемый передачей }
    Re, Fv, Dae2, Mn, { Модуль нормальный в среднем сечении }
    Mte, { Модуль торцевой на внешнем торце }
    Me, { Модуль торцевой на внешнем торце }
    Betn, { Нормальный угол наклона в среднем сечении в радианах }
    Xtau1, Xtau2, { Коэффициенты тангенциального смещения }
    x1, x2, { Коэффициент смещения исходного контура для прямозубых колес }
    xn1, xn2: Extended; { Коэффициент смещения исходного контура в нормальном
      сечении для колес с круговым зубом }
    z1, { Число зубьев шестерни }
    z2: Integer; { Числа зубьев колеса }
    St: Integer; { Степень точности }
    Uf, { Фактическое передаточное число передачи }
    n2, { Частота вращения колеса }
    V, { Скорость, м/с }
    de1, { Диаметр делителбного конуса шестерни }
    Dae1, { Диаметр окружности вершин }
    Dfe1, { Диаметр окружности впадин шестерни }
    d1, { Средний делительный диаметр шестерни }
    Delta1, { Угол делительного конуса шестерни }
    Delta_A1, { Угол конуса вершин шестерни }
    Delta_F1, { Угол конуса впадин шестерни }
    Sce1, { Врешняя постоянная хорда }
    Hce1, { Измерительная высота }
    de2, { Диаметр делительного конуса колеса }
    Dfe2, { Диаметр окружности впадин колеса }
    d2, { Средний делительный диаметр колеса }
    Delta2, { Угол делительного конуса колеса }
    Delta_A2, { Угол конуса вершин колеса }
    Delta_F2, { Угол конуса впадин колеса }
    Sce2, { Врешняя постоянная хорда }
    Hce2, { Измерительная высота }
    Rs, { Среднее конусное расстояние по делительному конусу }
    B, { Ширина венца }
    b1, { Расстояние от вершины конуса до базовой поверхности }
    b2, H_e1, { Высота зуба на внешнем торце }
    H_e2, { Высота зуба на внешнем торце }
    d0, { Диаметр резцовой головки }
    Sigma_H, { Контактное напряжение }
    T1, { Момент, передаваемый быстроходным валом }
    T2, { Момент, передаваемый тихоходным валом }
    Ft1, { Окружное усилие шестерни }
    Fr1, { Радиальное усилие шестерни }
    Fx1, { Осевое усилие шестерни }
    Ft2, { Окружное усилие колеса }
    Fr2, { Радиальное усилие колеса }
    Fx2, { Осевое усилие колеса }
    Epsias: Extended;
    Error: Integer;
    Sigma_Hp, Sigma_Hp1, Sigma_Hp2: Extended;

{$ENDREGION 'параметры главной процедуры'}
    ArTermobr1, ArTermobr2: ArrayTermobr;

{$REGION 'процедуры свойств'}
    procedure SetP1(const Value: Extended);
    procedure SetN1(const Value: Extended);
    procedure SetU(const Value: Extended);
    procedure SetLh(const Value: Integer);
    procedure SetH_HRcp1(const Value: Integer);
    procedure SetH_HRcp2(const Value: Integer);
    procedure SetH_HRcs1(const Value: Integer);
    procedure SetH_HRcs2(const Value: Integer);
    procedure SetS_F1(const Value: Extended);
    procedure SetS_F2(const Value: Extended);
    procedure SetSigma_Fst01(const Value: Integer);
    procedure SetSigma_Fst02(const Value: Integer);
    procedure SetSigma_Flim01(const Value: Integer);
    procedure SetSigma_Flim02(const Value: Integer);
    procedure SetSigma_t1(const Value: Integer);
    procedure SetSigma_t2(const Value: Integer);
    procedure SetRa1(const Value: Integer);
    procedure SetRa2(const Value: Integer);
    procedure SetNom_sx(const Value: Integer);
    procedure Setmc1(const Value: string);
    procedure Setmc2(const Value: string);
    procedure SetTermobr1(const Value: integer);
    procedure SetTermobr2(const Value: integer);
{$ENDREGION 'процедуры свойств'}
{$REGION 'процедуры и функции'}
    FUNCTION Mu_H: Extended;
    FUNCTION Mu_F(Target: Integer): Extended;
    PROCEDURE Wibor(Ac: Tt1; i_min, i_max: Integer; Ap: Extended;
      Var A: Extended; Var iA: Integer);
    PROCEDURE PNomer(A: Extended; { var } B: Tt1; i, N: Integer;
      var iA: Integer);
    PROCEDURE PrSigHp(Da, Mn, N, Mu_H, H_HBp, H_HRcp, H_HVp, Ra, Lh: Extended;
      Termobr, Zw: Integer; var Sigma_Hp, V: Extended);
    PROCEDURE PrSigFp(Da, Mn, Mu_F, N, S_f, Lh: Extended;
      H_HBp, Sigma_Flim0: Extended; Termobr, Zagotowka: Integer;
      var Sigma_Fp: Extended);
    PROCEDURE PrSigMax(Sigma_t, H_HRcp, H_HVp, Sigma_Fst0, Da: Extended;
      Zagotowka: TTwoInteger; Termobr: Integer;
      var Sigma_Hpmax, Sigma_Fpmax: Extended);
    PROCEDURE PzubC2(Da1, da2, Mn, N1 { , n2 } , Mu_H, Ra1, Ra2, Lh,
      U: Extended; Termobr1, Termobr2, Zw: Integer;
      var n2, Sigma_Hp, Sigma_Hp1, Sigma_Hp2, V: Extended);
    Procedure PrSigH(Ka, N1, U: Extended; var z1, z2: Integer; de1, B: Extended;
      St: Integer);
    Procedure PrSigF(var z1, z2: Integer; de1: Extended);
    PROCEDURE PzubKon2;
    Procedure PzubKon1;
    Procedure PrRazmer1(z: Integer; B, Mn, H_F, Tet_A, Tet_F, Xn, deltah_A,
      delta: Extended; var H_Fe, H_Fi, H_e, H_A, delta_A, delta_F, H_Ae, d, dm,
      de, dae, dfe: Extended);
    Procedure PrRazmer2(z: Integer; B, delta, Xe, Xtay, Re, Tet_A: Extended;
      var H_Ae, H_Fe, H_e, S_e, delta_A, delta_F, de, dm, dae, dfe: Extended);
    PROCEDURE PzubKon3;
    PROCEDURE PZubKon4;
    PROCEDURE PzubC8;
    Procedure PrSc(S, H: Extended; var Sce, hce: Extended);
    Procedure PrSe(S, H, delta, d: Extended; var Se, Hae: Extended);
    PROCEDURE PzubKon5;
{$ENDREGION 'процедуры и функции'}
{$REGION 'процедуры лейбел'}
    procedure Wibor_label1;
    procedure PNomer_label1;
    procedure PzubKon1_label1;
    procedure PzubKon1_label2;
    procedure PzubKon1_label3;
    procedure PzubKon1_label4;
    procedure PzubKon1_label5;
    procedure PzubKon1_label6;
    procedure PzubKon1_label7;
    procedure PZubKon4_label1;
    procedure CalculateConeWheel_label1;
    procedure CalculateConeWheel_label3;
{$ENDREGION 'процедуры лейбел'}
    { Private declarations }

  public
    { Public declarations }

    constructor create(Input: TParInput); overload;
    // создание с присваиванием и расчетом
    constructor create; overload; // предворительное создание
    PROCEDURE CalculateConeWheel; // расчет всего
    procedure vivod; // вывод в showmessage расчетов
    PROCEDURE MakeVersions;
    procedure recordOutput;
    procedure ParamToRec(Input: TParInput);
    procedure wiborTerm(mc: String; var ArTermobr: ArrayTermobr);
    procedure MakeVersionss(Input: TParInput);
    function okonchatelniy_vibor(mc:string; var ArSigma_Flim0: ArraySigma_Flim0;
    ArS_F: ArrayS_F;ArSigma_t: ArraySigma_t;ArSigma_Fst0: ArraySigma_Fst0):Tmark;
    function okonchatelniy_vibor_2(mc:string;termobr:integer):Tmark;
{$REGION 'Свойства'}
    // Мощность на ведущем валу, кВт
    property P1: Extended read FP1 write SetP1;
    // Частота вращения ведущего шкива, об/мин
    property N1: Extended read FN1 write SetN1;
    // Передаточное число
    property U: Extended read FU write SetU;
    // Расчетный ресурс передачи
    property Lh: Integer read FLh write SetLh;
    // Твердость сердцевины зуба шестерни по Роквеллу
    property H_HRcp1: Integer read FH_HRcp1 write SetH_HRcp1;
    // Твердость сердцевины зуба колеса по Роквеллу
    property H_HRcp2: Integer read FH_HRcp2 write SetH_HRcp2;
    // Твердость поверхности зуба шестерни по Роквеллу
    property H_HRcs1: Integer read FH_HRcs1 write SetH_HRcs1;
    // Твердость поверхности зуба колеса по Роквеллу
    property H_HRcs2: Integer read FH_HRcs2 write SetH_HRcs2;
    // Коэффициент выносливости по изгибу для шестерни
    property S_F1: Extended read FS_F1 write SetS_F1;
    // Коэффициент выносливости по изгибу для колеса
    property S_F2: Extended read FS_F2 write SetS_F2;
    // Предельное напряжение для шестерни
    property Sigma_Fst01: Integer read FSigma_Fst01 write SetSigma_Fst01;
    // Предельное напряжение для колеса
    property Sigma_Fst02: Integer read FSigma_Fst02 write SetSigma_Fst02;
    // Предел выносливости по изгибу для шестерни
    property Sigma_Flim01: Integer read FSigma_Flim01 write SetSigma_Flim01;
    // Предел выносливости по изгибу для колеса
    property Sigma_Flim02: Integer read FSigma_Flim02 write SetSigma_Flim02;
    // Предел текучести материала шестерни
    property Sigma_t1: Integer read FSigma_t1 write SetSigma_t1;
    // Предел текучести материала колеса
    property Sigma_t2: Integer read FSigma_t2 write SetSigma_t2;
    // Шероховатость боковой поверхности зуба шестерни
    property Ra1: Integer read FRa1 write SetRa1;
    // Шероховатость боковой поверхности зуба колеса
    property Ra2: Integer read FRa2 write SetRa2;
    // Номер схемы расположения колес
    property Nom_sx: Integer read FNom_sx write SetNom_sx;

    // Шероховатость боковой поверхности зуба шестерни
    property mc1: string read Fmc1 write Setmc1;
    // Шероховатость боковой поверхности зуба колеса
    property mc2: string read Fmc2 write Setmc2;

    // Шероховатость боковой поверхности зуба шестерни
    property Termobr1: integer read FTermobr1 write SetTermobr1;
    // Шероховатость боковой поверхности зуба колеса
    property Termobr2: integer read FTermobr2 write SetTermobr2;
{$ENDREGION 'Свойства'}
  end;

procedure MasOutputOnForm(mascount1: Integer; var Output: TParOutput);

{$REGION 'переменные CalculateConeWheel'}

var
  Output: TParOutput; // выходные параметры
  masOutput: array of TParOutput;
  mascount: Integer;

implementation

uses Math;

{$REGION 'konstanti'}

Const
  {// Максимально допустимое значение мощности на ведущем валу, кВт
  P1Max: Extended = 300;
  // Минимально допустимое значение мощности на ведущем валу, кВт
  P1Min: Extended = 0.2;
  // Максимально допустимое значение передаточного числа
  UMax: Extended = 8;
  // Минимально допустимое значение передаточного числа
  UMin: Extended = 1;
  // Максимально допустимое значение частоты вращения ведущего шкива, об/мин
  N1Max: Extended = 5000;
  // Минимально допустимое значение частоты вращения ведущего шкива, об/мин
  N1Min: Extended = 1;
  // Расчетный ресурс передачи
  LhMax: Integer = 100000;
  LhMin: Integer = 10;
  // Твердость сердцевины зуба шестерни по Роквеллу
  H_HRcs1max: Integer = 68;
  H_HRcs1min: Integer = 35;
  // Твердость сердцевины зуба колеса по Роквеллу
  H_HRcs2max: Integer = 68;
  H_HRcs2min: Integer = 35;
  // Твердость поверхности зуба шестерни по Роквеллу
  H_HRcp1max: Integer = 68;
  H_HRcp1min: Integer = 35;
  // Твердость поверхности зуба колеса по Роквеллу
  H_HRcp2max: Integer = 68;
  H_HRcp2min: Integer = 35;
  // Твердость сердцевины зуба шестерни по Бринелю
  H_HBs1max: Integer = 350;
  H_HBs1min: Integer = 0;
  // Твердость сердцевины зуба колеса по Бринелю
  H_HBs2max: Integer = 350;
  H_HBs2min: Integer = 0;
  // Твердость поверхности зуба шестерни по Бринелю
  H_HBp1max: Integer = 350;
  H_HBp1min: Integer = 0;
  // Твердость поверхности зуба колеса по Бринелю
  H_HBp2max: Integer = 350;
  H_HBp2min: Integer = 0;}

  ms: Tt1 = (1.0, 1.125, 1.25, 1.375, 1.5, 1.75, 2.0, 2.25, 2.5, 2.75, 3.0, 3.5,
    4.0, 4.5, 5.0, 5.5, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 14.0, 16.0, 18.0,
    20.0, 22.0, 25.0, 28.0, 32.0, 36.0, 40.0, 45.0, 50.0, 55.0, 60.0, 70.0,
    80.0, 90.0, 100.0, 0, 0, 0, 0);

  TArrayDe: Tt1 = (50, 56, 63, 71, 80, 90, 100, 112, 125, 140, 160, 180, 200,
    225, 250, 280, 315, 355, 400, 450, 500, 560, 630, 710, 800, 900, 1000, 1120,
    1250, 1400, 1600, 1800, 2000, 2240, 2500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

  { Массив стандартных значений разводов резцов }

  TArrayW: Tt1 = (0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.3, 1.4, 1.6, 1.8, 2.0, 2.2,
    2.6, 2.8, 3.2, 3.6, 4.0, 4.5, 5.2, 6.0, 6.5, 7, 8, 9, 10, 12, 13, 14, 16,
    18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

  { Массив значений разводов резцов резцовой головки }
  TArrayW2: Array [1 .. 25, 1 .. 8] of Extended = ((1.5, 0, 1, 0.010, 0, 0, 0,
    0), (1.75, 0, 1.1, 0.077, 0, 0, 0, 0), (2.0, 0, 1.3, 0.030, 0.04, 1.4, 0.14,
    1.6), (2.25, 0, 1.4, 0.119, 0.05, 1.6, 0.14, 1.8),
    (2.5, 0, 1.6, 0.072, 0.06, 1.8, 0.14, 2.0), (2.75, 0, 1.8, 0.024, 0.07, 2.0,
    0.14, 2.2), (3.0, 0, 2.0, 0.024, 0.07, 2.2, 0.2, 2.6),
    (3.5, 0, 2.2, 0.155, 0.08, 2.6, 0.14, 2.8), (4.0, 0, 2.6, 0.060, 0.04, 2.8,
    0.14, 3.2), (4.5, 0, 2.8, 0.239, 0.05, 3.2, 0.14, 3.6),
    (5.0, 0, 3.2, 0.143, 0.06, 3.6, 0.14, 4.0), (5.5, 0, 3.6, 0.048, 0.07, 4.0,
    0.18, 4.6), (6.0, 0, 4.0, 0.047, 0.10, 4.6, 0.20, 5.2),
    (7.0, 0, 4.6, 0.036, 0.08, 5.2, 0.20, 6.0), (8.0, 0, 5.2, 0.120, 0.09, 6.0,
    0.15, 6.5), (9.0, 0, 6.0, -0.071, 0.06, 6.5, 0.12, 7. ),
    (10, 0, 6.5, 0.150, 0.04, 7.0, 0.14, 8.0), (11, 0, 7, 0.371, 0.07, 8.0,
    0.16, 9.0), (12, 0, 8, -0.095, 0.09, 9.0, 0.17, 10. ),
    (14, 0, 9, 0.347, 0.05, 10., 0.20, 12. ), (16, 0, 10, 0.789, 0.09, 12.,
    0.15, 13. ), (18, 0, 12, -0.143, 0.06, 13., 0.12, 14. ),
    (20, 0, 12, 0.299, 0.04, 14., 0.14, 16. ), (22, 0, 14, 0.741, 0.07, 16.,
    0.16, 18. ), (25, 0, 16, 0.718, 0.06, 18., 0.14, 20));

  { Массив значений диаметров резцовой глдовки для 1-й формы зуба }
  TArray01: Array [1 .. 16, 1 .. 8] of Extended = ((88.9, 40, 55, 8, 10, 20, 2.,
    3. ), (100., 45, 65, 9, 10, 20, 2., 3. ), (125, 55, 75, 10, 12, 25, 2.,
    3.5), (152.4, 70, 90, 10, 15, 30, 2.5, 3.5), (160, 72, 95, 12, 16, 32, 2.5,
    4), (190.5, 85, 115, 15, 20, 40, 2.5, 5), (200, 90, 120, 15, 20, 40, 2.5,
    5), (228.6, 100, 135, 15, 20, 40, 2.5, 5), (250, 110, 150, 18, 25, 50, 2.5,
    6), (315, 140, 190, 24, 32, 65, 2.5, 9), (400, 180, 240, 30, 40, 80, 3.,
    10), (457.2, 200, 280, 28, 50, 100, 4., 10), (500, 225, 300, 36, 50, 100,
    4., 12), (630, 290, 380, 45, 70, 125, 4, 16), (800, 360, 480, 60, 80, 160,
    5, 20), (1000, 450, 600, 70, 100, 200, 6, 25));

  TArrayD01: Tt1 = (88.9, 100, 125, 152.4, 160, 190.5, 200, 228.6, 250, 315,
    400, 457.2, 500, 630, 800, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

  { Массив значений диаметров резцовой головки для 2-й формы зуба }
  TArray02: Array [1 .. 18, 1 .. 8] OF Extended = ((60, 18, 42, 7, 5, 15, 0.6,
    2. ), (80, 24, 56, 8, 6, 20, 1, 2.5), (88.9, 25, 60, 8, 8, 20, 1, 2.5),
    (100, 30, 70, 9, 8, 25, 1, 3. ), (125, 40, 90, 10, 10, 30, 1, 3.5),
    (152.4, 45, 105, 10, 12, 30, 1.5, 3.5), (160, 50, 110, 12, 12, 40, 1.5, 4),
    (190.5, 60, 135, 15, 15, 40, 2, 5), (200, 60, 140, 15, 16, 50, 2, 5),
    (228.6, 70, 160, 15, 18, 60, 2, 6), (250, 75, 175, 18, 20, 65, 2, 6),
    (315, 95, 220, 24, 25, 80, 3, 8), (400, 120, 280, 30, 32, 100, 3, 10),
    (457.2, 140, 320, 28, 36, 120, 4, 10), (500, 150, 350, 36, 40, 125, 4, 12),
    (630, 190, 440, 45, 50, 160, 5, 16), (800, 240, 560, 60, 65, 200, 6, 20),
    (1000, 300, 65, 70, 80, 250, 8, 25));

  TArrayD02: Tt1 = (60, 80, 88.9, 100, 125, 152.4, 160, 190.5, 200, 228.6, 250,
    315, 400, 457.2, 500, 630, 800, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

  { Массив коэффициентов смещения для круговых зубьев }
  TArrayXn: Array [1 .. 13, 1 .. 13] of Extended = ((9, 0, 0, 0, 0, 0, 0, 0, 0,
    0.46, 0.49, 0.50, 0.52), (10, 0, 0, 0, 0, 0, 0, 0, 0, 0.44, 0.47, 0.45,
    0.48), (11, 0, 0, 0, 0, 0, 0, 0, 0.38, 0.41, 0.44, 0.45, 0.46),
    (12, 0, 0, 0, 0, 0, 0, 0.32, 0.37, 0.39, 0.41, 0.42, 0.43),
    (13, 0, 0, 0, 0, 0, 0.27, 0.30, 0.36, 0.37, 0.39, 0.40, 0.41),
    (14, 0, 0, 0, 0.18, 0.23, 0.26, 0.29, 0.33, 0.35, 0.37, 0.38, 0.38),
    (15, 0, 0, 0.12, 0.17, 0.22, 0.25, 0.27, 0.31, 0.33, 0.35, 0.36, 0.37),
    (16, 0, 0.06, 0.11, 0.16, 0.21, 0.24, 0.26, 0.30, 0.32, 0.34, 0.35, 0.35),
    (18, 0, 0.05, 0.10, 0.15, 0.19, 0.22, 0.24, 0.27, 0.30, 0.32, 0.32, 0.33),
    (20, 0, 0.05, 0.09, 0.13, 0.17, 0.20, 0.22, 0.26, 0.28, 0.29, 0.29, 0.30),
    (25, 0, 0.04, 0.08, 0.11, 0.15, 0.17, 0.19, 0.21, 0.24, 0.25, 0.25, 0.26),
    (30, 0, 0.03, 0.07, 0.09, 0.11, 0.15, 0.16, 0.18, 0.21, 0.22, 0.22, 0.25),
    (40, 0, 0.03, 0.05, 0.07, 0.09, 0.11, 0.11, 0.14, 0.16, 0.17, 0.17, 0.18));

{$ENDREGION 'konstanti'}
  { TPer }

{$REGION 'проверка свойств'}

procedure TPer.SetTermobr1(const Value: integer);
var s4et,srawn:integer;
begin
  srawn:=-1;
  for s4et := low(Termobra) to high(Termobra) do
    if Termobra[Value]<>Termobra[s4et] then srawn:=srawn+1;
  if srawn=high(Termobra) then
    raise ERangeError.CreateFmt
      ('[TPer.SetTermobr1] Марка стали для колеса (Termobr1) не может быть равен %s , допустимый диапазон от %s до %s ',
      [Termobra[Value], Termobra[low(Termobra)], Termobra[High(Termobra)]]);

  FTermobr1 := Value;
end;

procedure TPer.SetTermobr2(const Value: integer);
var s4et,srawn:integer;
begin
  srawn:=-1;
  for s4et := low(Termobra) to high(Termobra) do
    if Termobra[Value]<>Termobra[s4et] then srawn:=srawn+1;
  if srawn=high(Termobra) then
    raise ERangeError.CreateFmt
      ('[TPer.SetTermobr2] Марка стали для шестерни (Termobr2) не может быть равен %s , допустимый диапазон от %s до %s ',
      [Termobra[Value], Termobra[low(Termobra)], Termobra[High(Termobra)]]);

  FTermobr2 := Value;
end;

procedure TPer.Setmc1(const Value: string);
var s4et,srawn:integer;
begin
  srawn:=0;
  for s4et := low(markaa) to high(markaa) do
    if Value<>markaa[s4et] then srawn:=srawn+1;
  if srawn=high(markaa) then
    raise ERangeError.CreateFmt
      ('[TPer.Setmc1] Марка стали для колеса (mc1) не может быть равен %s , допустимый диапазон от %s до %s ',
      [Value, markaa[low(markaa)], markaa[High(markaa)]]);

  Fmc1 := Value;
end;

procedure TPer.Setmc2(const Value: string);
var s4et,srawn:integer;
begin
  srawn:=0;
  for s4et := low(markaa) to high(markaa) do
    if Value<>markaa[s4et] then srawn:=srawn+1;
  if srawn=high(markaa) then
    raise ERangeError.CreateFmt
      ('[TPer.Setmc2] Марка стали для шестерни (mc2) не может быть равен %s , допустимый диапазон от %s до %s ',
      [Value, markaa[low(markaa)], markaa[High(markaa)]]);

  Fmc2 := Value;
end;

procedure TPer.SetNom_sx(const Value: Integer);
begin
  if (Value < Nom_sxmin) or (Value > Nom_sxmax) then
    raise ERangeError.CreateFmt
      ('[TPer.SetNom_sx] Номер схемы расположения колес (Nom_sx) не может быть равен %d , допустимый диапазон от %d до %d ',
      [Value, Nom_sxmin, Nom_sxmax]);

  FNom_sx := Value;
end;

procedure TPer.SetRa1(const Value: Integer);
begin
  if (Value < Low(Raa)) or (Value > High(Raa)) then
    raise ERangeError.CreateFmt
      ('[TPer.SetRa1] Шероховатость боковой поверхности зуба шестерни (Ra1) не может быть равна %d , допустимый диапазон от %s до %s ',
      [Value, Raa[Low(Raa)], Raa[High(Raa)]]);

  FRa1 := Value;
end;

procedure TPer.SetRa2(const Value: Integer);
begin
if (Value < Low(Raa)) or (Value > High(Raa)) then
    raise ERangeError.CreateFmt
      ('[TPer.SetRa2] Шероховатость боковой поверхности зуба колеса (Ra2) не может быть равна %d , допустимый диапазон от %d до %d ',
      [Value, Raa[Low(Raa)], Raa[High(Raa)]]);

  FRa2 := Value;
end;

procedure TPer.SetSigma_t1(const Value: Integer);
var s4et,srawn:integer;
begin
  {srawn:=0;
  for s4et := low(Sigma_ta) to high(Sigma_ta)-2 do
    if Value<>Sigma_ta[s4et] then srawn:=srawn+1;
  if srawn=high(Sigma_ta)-2 then}
   if (Value>(okonchatelniy_vibor_2(mc1, termobr1).Sigma_t1))and(Value<=0) then
    raise ERangeError.CreateFmt
      ('[TPer.SetSigma_t1] Предел текучести материала шестерни (Sigma_t1) не может быть равен %d , допустимый диапазон от %d до %d ',
      [Value, Sigma_ta[High(Sigma_ta)-1], Sigma_ta[High(Sigma_ta)]]);

  FSigma_t1 := Value;
end;

procedure TPer.SetSigma_t2(const Value: Integer);
var s4et,srawn:integer;
begin
  {srawn:=0;
  for s4et := low(Sigma_ta) to high(Sigma_ta)-2 do
    if Value<>Sigma_ta[s4et] then srawn:=srawn+1;
  if srawn=high(Sigma_ta)-2 then}
   if (Value>(okonchatelniy_vibor_2(mc2, termobr2).Sigma_t1))and(Value<=0) then
    raise ERangeError.CreateFmt
      ('[TPer.SetSigma_t2] Предел текучести материала колеса (Sigma_t2) не может быть равен %d , допустимый диапазон от %d до %d ',
      [Value, Sigma_ta[High(Sigma_ta)-1], Sigma_ta[High(Sigma_ta)]]);

  FSigma_t2 := Value;
end;

procedure TPer.SetSigma_Flim01(const Value: Integer);
var s4et,srawn:integer;
begin
  {srawn:=0;
  for s4et := low(Sigma_Flim0a) to high(Sigma_Flim0a)-2 do
    if Value<>Sigma_Flim0a[s4et] then srawn:=srawn+1;
  if srawn=high(Sigma_Flim0a)-2 then}
    if (Value>(okonchatelniy_vibor_2(mc1, termobr1).Sigma_Flim01))and(Value<=0) then
    raise ERangeError.CreateFmt
      ('[TPer.SetSigma_Flim01] Предел выносливости по изгибу для шестерни (Sigma_Flim01) не может быть равен %d , допустимый диапазон от %d до %d ',
      [Value, Sigma_Flim0a[High(Sigma_Flim0a)-1], Sigma_Flim0a[High(Sigma_Flim0a)]]);

  FSigma_Flim01 := Value;
end;

procedure TPer.SetSigma_Flim02(const Value: Integer);
var s4et,srawn:integer;
begin
  {srawn:=0;
  for s4et := low(Sigma_Flim0a) to high(Sigma_Flim0a)-2 do
    if Value<>Sigma_Flim0a[s4et] then srawn:=srawn+1;
  if srawn=high(Sigma_Flim0a)-2 then}
    if (Value>(okonchatelniy_vibor_2(mc2, termobr2).Sigma_Flim01))and(Value<=0) then
    raise ERangeError.CreateFmt
      ('[TPer.SetSigma_Flim02] Предел выносливости по изгибу для колеса (Sigma_Flim02) не может быть равен %d , допустимый диапазон от %d до %d ',
      [Value, Sigma_Flim0a[High(Sigma_Flim0a)-1], Sigma_Flim0a[High(Sigma_Flim0a)]]);

  FSigma_Flim02 := Value;
end;

procedure TPer.SetSigma_Fst01(const Value: Integer);
var s4et,srawn:integer;
begin
  {srawn:=0;
  for s4et := low(Sigma_Fst0a) to high(Sigma_Fst0a)-2 do
    if Value<>Sigma_Fst0a[s4et] then srawn:=srawn+1;
  if srawn=high(Sigma_Fst0a)-2 then}
    if (Value>(okonchatelniy_vibor_2(mc1, termobr1).Sigma_Fst01))and(Value<=0) then
    raise ERangeError.CreateFmt
      ('[TPer.SetSigma_Fst01] Предельное напряжение для шестерни (Sigma_Fst01) не может быть равна %d , допустимый диапазон от %d до %d ',
      [Value, Sigma_Fst0a[High(Sigma_Fst0a)-1], Sigma_Fst0a[High(Sigma_Fst0a)]]);

  FSigma_Fst01 := Value;
end;

procedure TPer.SetSigma_Fst02(const Value: Integer);
var s4et,srawn:integer;
begin
  {srawn:=0;
  for s4et := low(Sigma_Fst0a) to high(Sigma_Fst0a)-2 do
    if Value<>Sigma_Fst0a[s4et] then srawn:=srawn+1;
  if srawn=high(Sigma_Fst0a)-2 then}
    if (Value>(okonchatelniy_vibor_2(mc2, termobr2).Sigma_Fst01))and(Value<=0) then
    raise ERangeError.CreateFmt
      ('[TPer.SetSigma_Fst02] Предельное напряжение для колеса (Sigma_Fst02) не может быть равна %d , допустимый диапазон от %d до %d ',
      [Value, Sigma_Fst0a[High(Sigma_Fst0a)-1], Sigma_Fst0a[High(Sigma_Fst0a)]]);

  FSigma_Fst02 := Value;
end;

procedure TPer.SetS_F1(const Value: Extended);
var s4et,srawn:integer;
begin
  {srawn:=0;
  for s4et := low(S_Fa) to high(S_Fa)-2 do
    if Value<>S_Fa[s4et] then srawn:=srawn+1;
  if srawn=high(S_Fa)-2 then}
    if (Value>(okonchatelniy_vibor_2(mc1, termobr1).S_F1))and(Value<=0) then
    raise ERangeError.CreateFmt
      ('[TPer.SetS_F1] Коэффициент выносливости по изгибу для шестерни (S_F1) не может быть равна %g , допустимый диапазон от %g до %g ',
      [Value, S_Fa[High(S_Fa)-1], S_Fa[High(S_Fa)]]);

  FS_F1 := Value;
end;

procedure TPer.SetS_F2(const Value: Extended);
var s4et,srawn:integer;
begin
  {srawn:=0;
  for s4et := low(S_Fa) to high(S_Fa)-2 do
    if Value<>S_Fa[s4et] then srawn:=srawn+1;
  if srawn=high(S_Fa)-2 then}
  if (Value>(okonchatelniy_vibor_2(mc2, termobr2).S_F1))and(Value<=0) then
    raise ERangeError.CreateFmt
      ('[TPer.SetS_F2] Коэффициент выносливости по изгибу для колеса (S_F2) не может быть равна %g , допустимый диапазон от %g до %g ',
      [Value, S_Fa[High(S_Fa)-1], S_Fa[High(S_Fa)]]);

  FS_F2 := Value;
end;

procedure TPer.SetH_HRcp1(const Value: Integer);
begin
  if (Value < H_HRcp1min) or (Value > H_HRcp1max) then
    raise ERangeError.CreateFmt
      ('[TPer.SetH_HRcp1] Твердость поверхности зуба шестерни по Роквеллу (H_HRcp1) не может быть равна %d, допустимый диапазон от %d до %d ',
      [Value, H_HRcp1min, H_HRcp1max]);

  FH_HRcp1 := Value;
end;

procedure TPer.SetH_HRcp2(const Value: Integer);
begin
  if (Value < H_HRcp2min) or (Value > H_HRcp2max) then
    raise ERangeError.CreateFmt
      ('[TPer.SetH_HRcp2] Твердость поверхности зуба колеса по Роквеллу (H_HRcp2) не может быть равна %d, допустимый диапазон от %d до %d ',
      [Value, H_HRcp2min, H_HRcp2max]);

  FH_HRcp2 := Value;
end;

procedure TPer.SetH_HRcs1(const Value: Integer);
begin
  if (Value < H_HRcs1min) or (Value > H_HRcs1max) then
    raise ERangeError.CreateFmt
      ('[TPer.SetH_HRcs1] Твердость сердцевины зуба шестерни по Роквеллу (H_HRcs1) не может быть равна %d, допустимый диапазон от %d до %d ',
      [Value, H_HRcs1min, H_HRcs1max]);

  FH_HRcs1 := Value;
end;

procedure TPer.SetH_HRcs2(const Value: Integer);
begin
  if (Value < H_HRcs2min) or (Value > H_HRcs2max) then
    raise ERangeError.CreateFmt
      ('[TPer.SetH_HRcs2] Твердость сердцевины зуба колеса по Роквеллу (H_HRcs2) не может быть равна %d, допустимый диапазон от %d до %d ',
      [Value, H_HRcs2min, H_HRcs2max]);

  FH_HRcs2 := Value;
end;

procedure TPer.SetLh(const Value: Integer);
begin
  if (Value < LhMin) or (Value > LhMax) then
    raise ERangeError.CreateFmt
      ('[TPer.SetLh] Расчетный ресурс передачи (Lh) не может быть равен %d, допустимый диапазон от %d до %d ',
      [Value, LhMin, LhMax]);

  FLh := Value;
end;

procedure TPer.SetN1(const Value: Extended);
begin
  if (Value < N1Min) or (Value > N1Max) then
    raise ERangeError.CreateFmt
      ('[TPer.SetN1] Частота вращения(N1) ведущего колеса (шкива) не может быть равна %g, допустимый диапазон от %g до %g об/мин',
      [Value, N1Min, N1Max]);

  FN1 := Value;
end;

procedure TPer.SetP1(const Value: Extended);
begin
  if (Value < P1Min) or (Value > P1Max) then
    raise ERangeError.CreateFmt
      ('[TPer.SetP1] Мощность на ведущем валу (P1) не может быть равна %g, допустимый диапазон от %g до %g кВт',
      [Value, P1Min, P1Max]);

  FP1 := Value;
end;

procedure TPer.SetU(const Value: Extended);
begin
  if (Value < UMin) or (Value > UMax) then
    raise ERangeError.CreateFmt
      ('[TPer.SetU] Передаточное число (U) не может быть равно %g, допустимый диапазон от %g до %g',
      [Value, UMin, UMax]);

  FU := Value;
end;

{$ENDREGION 'проверка свойств'}
{$REGION 'сам расчет'}

FUNCTION TPer.Mu_H: Extended;
Const
  ConstMh: array [0 .. 5] of Extended = (1, 0.5, 0.25, 0.18, 0.125, 0.063);

BEGIN
  if not Nagr then
    Mu_H := ConstMh[Loading.GraphBar]
  else
    with Loading do
      Mu_H := i + j * XBY(y, 3) + k * XBY(z, 3);
END;

FUNCTION TPer.Mu_F(Target: Integer): Extended;
Const
  Mf6: array [0 .. 5] of Extended = (1, 0.3, 0.143, 0.065, 0.038, 0.013);
  Mf9: array [0 .. 5] of Extended = (1, 0.2, 0.1, 0.063, 0.016, 0.004);
Var
  qF: Integer;
  Termobr: Extended;

BEGIN
  if Target = 1 then
    Termobr := Termobr1
  else
    Termobr := Termobr2;
  if not(Termobr > 2) then
    qF := 6
  else
    qF := 9;
  if not Nagr then
    case qF of
      6:
        Mu_F := Mf6[Loading.GraphBar];
      9:
        Mu_F := Mf9[Loading.GraphBar];
    end
  else
    with Loading do
      Mu_F := i + j * XBY(y, qF) + k * XBY(z, qF);
END;

{ Процедура округления до ближайшего большего стандартного значения }
PROCEDURE TPer.Wibor(Ac: Tt1; i_min, i_max: Integer; Ap: Extended;
  Var A: Extended; Var iA: Integer);
// Label 1;
Var
  i: Integer;
Begin
  { Начало процедуры Wibor }
  For i := i_min to i_max do
  begin
    if Ac[i] >= Ap then
    begin
      A := Ac[i];
      iA := i;
      exit;
      // goto 1;
    end;
    if i = i_max then
    begin
      A := Ac[i_max];
      iA := i_max;
      exit;
      // goto 1;
    end;
  end;
  // 1:
End;

procedure TPer.Wibor_label1;
begin
  // exit;
end;

{ Выбор по переменной ее порядкового номера из массива }
PROCEDURE TPer.PNomer(A: Extended; { var } B: Tt1; i, N: Integer;
  var iA: Integer);
// Label 1;
var
  j: Integer;
Begin
  For j := i to N do
    if A <= B[j] then
    begin
      iA := j;
      // goto 1;
      exit;
    end;
  // 1:
End;

procedure TPer.PNomer_label1;
begin
  // exit;
end;

{ Процедура расчета допускаемых контактных напряжений }
PROCEDURE TPer.PrSigHp(Da, Mn, N, Mu_H, H_HBp, H_HRcp, H_HVp, Ra, Lh: Extended;
  Termobr, Zw: Integer; var Sigma_Hp, V: Extended);
var
  Zx, Zv, Zr, Sh, N_Hlim, N_sum, N_He, Zn, Sigma_Hlim: Extended;

BEGIN
  If Ra <= 1.25 then
    Zr := 1
  else if Ra <= 2.5 then
    Zr := 0.95
  else
    Zr := 0.9;

  Case Termobr of
    1, 2, 3:
      Sh := 1.1;
    4, 5, 6, 7:
      Sh := 1.2
  end;
  Case Termobr of
    1, 2:
      Sigma_Hlim := 2 * H_HBp + 70;
    3:
      Sigma_Hlim := 18 * H_HRcp + 150;
    4:
      Sigma_Hlim := 17 * H_HRcp + 200;
    5, 6:
      Sigma_Hlim := 23 * H_HRcp;
    7:
      Sigma_Hlim := 1050;
  End;
  N_Hlim := 30 * Exp(2.4 * Ln(H_HBp));
  if N_Hlim > 12E7 then
    N_Hlim := 12E7;
  N_sum := 60 * N * Lh * Zw;
  N_He := Mu_H * N_sum;
  If N_He <= N_Hlim then
  begin
    Zn := Exp(0.167 * Ln(N_Hlim / N_He));
    if Termobr <= 3 then
      if Zn > 2.6 then
        Zn := 2.6
      else if Zn > 1.8 then
        Zn := 1.8;
  end
  Else
  begin
    Zn := Exp(0.05 * Ln(N_Hlim / N_He));
    if Zn < 0.75 then
      Zn := 0.75;
  end;
  If Da = 0 then
    Sigma_Hp := Sigma_Hlim * Zn * Zr * 0.9 / Sh
  else
  begin
    if Da <= 700 then
      Zx := 1
    else
      Zx := Sqrt(1.07 - 0.0001 * Da);
    V := Pi * (Da - 2 * Mn) * N / 60000;
    if H_HBp <= 350 then
      Zv := 0.85 * Exp(0.1 * Ln(V))
    else
      Zv := 0.925 * Exp(0.05 * Ln(V));
    Sigma_Hp := Sigma_Hlim * Zn * Zr * Zv * Zx / Sh;
  End;
END;

{ Расчет допускаемых изгибных напряжений }
PROCEDURE TPer.PrSigFp(Da, Mn, Mu_F, N, S_f, Lh: Extended;
  H_HBp, Sigma_Flim0: Extended; Termobr, Zagotowka: Integer;
  var Sigma_Fp: Extended);
var
  Yx, Yr, Yn, Y_delta, Yz, N_sum, N_Fe, Sigma_Flim, Ya, q_f: Extended;
BEGIN
  Yr := 1;
  N_sum := 60 * N * Lh * Zw;
  N_Fe := Mu_F * N_sum;
  if H_HBp > 350 then
    q_f := 9
  else
    q_f := 6;
  If N_Fe > 4E6 then
    Yn := 1
  else
    Yn := Exp(q_f * Ln(4E6 / N_Fe));
  if ((q_f = 6) and (Yn > 4)) then
    Yn := 4;
  if ((q_f = 9) and (Yn > 2.5)) then
    Yn := 2.5;
  If not rewers then
    Ya := 1
  else
    Case Termobr of
      1, 2:
        Ya := 0.65;
      3, 4, 5, 6:
        Ya := 0.75;
      7:
        Ya := 0.9
    end;
  Case Zagotowka of
    1, 2:
      Yz := 1;
    3:
      Yz := 0.9;
    4:
      Yz := 0.8
  end;
  If Da = 0 then
    Sigma_Fp := 0.4 * Sigma_Flim0 * Yn * Ya
  else
  begin
    Yx := 1.05 - 0.000125 * Da;
    Y_delta := 1.082 - 0.172 * Log10(Mn);
    Sigma_Flim := Sigma_Flim0 * Yz * Ya;
    Sigma_Fp := Sigma_Flim * Yn * Y_delta * Yr * Yx / S_f;
  end;
END;

{ РАСЧЕТ максимальных допускаемых напряжений }
PROCEDURE TPer.PrSigMax(Sigma_t, H_HRcp, H_HVp, Sigma_Fst0, Da: Extended;
  Zagotowka: TTwoInteger; Termobr: Integer;
  var Sigma_Hpmax, Sigma_Fpmax: Extended);
var
  S_Fst, Yx, Yz: Extended;

BEGIN
  { -------------- }
  Da := 1;
  { -------------- }
  Case Termobr of
    1, 2, 3:
      Sigma_Hpmax := 2.8 * Sigma_t;
    4, 5, 6:
      Sigma_Hpmax := 44 * H_HRcp;
    7:
      Sigma_Hpmax := 3 * H_HVp
  end;
  Case Zagotowka[1] of
    1, 2:
      Yz := 1;
    3:
      Yz := 0.9;
    4:
      Yz := 0.8
  end;
  S_Fst := Yz * 1.75;
  Yx := 1.05 - 0.000125 * Da;
  Sigma_Fpmax := Sigma_Fst0 * Yx / S_Fst;
END;

{ Расчет допускаемых напряжений }
PROCEDURE TPer.PzubC2(Da1, da2, Mn, N1 { , n2 } , Mu_H, Ra1, Ra2, Lh,
  U: Extended; Termobr1, Termobr2, Zw: Integer; var n2, Sigma_Hp, Sigma_Hp1,
  Sigma_Hp2, V: Extended);
Var
  c1: Extended;
  Sigma_Fpmax: Extended;
BEGIN
  c1 := 1.15;
  PrSigHp(Da1, Mn, N1, Mu_H, H_HBp1, H_HRcp1, H_HVp1, Ra1, Lh, Termobr1, Zw,
    Sigma_Hp1, V);
  n2 := N1 / U;
  PrSigHp(da2, Mn, n2, Mu_H, H_HBp2, H_HRcp2, H_HVp2, Ra2, Lh, Termobr2, Zw,
    Sigma_Hp2, V);
  If Tipz = 1 then
    Sigma_Hp := Min3(Sigma_Hp1, Sigma_Hp2, Sigma_Hp2)
  else
  begin
    if 0.45 * (Sigma_Hp1 + Sigma_Hp2) > c1 * Min3(Sigma_Hp1, Sigma_Hp2,
      Sigma_Hp2) then
      Sigma_Hp := c1 * Min3(Sigma_Hp1, Sigma_Hp2, Sigma_Hp2)
    else
      Sigma_Hp := 0.45 * (Sigma_Hp1 + Sigma_Hp2);
  end;
  PrSigFp(Da1, Mn, Mu_F(1), N1, S_f1, Lh, H_HBp1, Sigma_Flim01 { , rewers } ,
    Termobr1, Zagotowka[1], Sigma_Fp1);
  PrSigFp(da2, Mn, Mu_F(2), n2, S_f2, Lh, H_HBp2, Sigma_Flim02 { , rewers } ,
    Termobr2, Zagotowka[2], Sigma_Fp2);
  PrSigMax(Sigma_t1, H_HRcp1, H_HVp1, Sigma_Fst01, Da1, Zagotowka, Termobr1,
    Sigma_Hpmax1, Sigma_Fpmax1);
  PrSigMax(Sigma_t2, H_HRcp2, H_HVp2, Sigma_Fst02, da2, Zagotowka, Termobr2,
    Sigma_Hpmax2, Sigma_Fpmax2);
  Sigma_Hpmax := Min3(Sigma_Hpmax1, Sigma_Hpmax2, Sigma_Hpmax2);
END;

{ ---------------процедура расчета контактных напряжений------------------- }
Procedure TPer.PrSigH(Ka, N1, U: Extended; var z1, z2: Integer;
  de1, B: Extended; St: Integer);
Var
  Whv, delta_H, g0, Ft, K_H, Dm1, v_m, Z_v1, Z_v2, W_Hv, K_Hv,
    K_HAlfa: Extended;
BEGIN
  { расчет K_Hv }
  Dm1 := 0.857 * de1;
  v_m := Pi * Dm1 * N1 / 60000;
  if Betn = 0 Then
  Begin
    Z_v1 := z1 / Cos(Delta1);
    Z_v2 := z2 / Cos(Delta2);
  End
  Else
  Begin
    Z_v1 := z1 / (Cos(Delta1) * Exp(3 * Ln(Cos(Betn))));
    Z_v2 := z1 / (Cos(Delta2) * Exp(3 * Ln(Cos(Betn))));
  End;
  Ft := 2000 * T1 / Dm1;
  Case St of
    6:
      if Mte <= 3.55 then
        g0 := 3.8
      else if Mte <= 10 then
        g0 := 4.2
      else
        g0 := 4.8;
    7:
      if Mte <= 3.55 then
        g0 := 4.7
      else if Mte <= 10 then
        g0 := 5.3
      else
        g0 := 6.4;
    8:
      if Mte <= 3.55 then
        g0 := 5.6
      else if Mte <= 10 then
        g0 := 6.1
      else
        g0 := 7.3;
    9:
      if Mte <= 3.55 then
        g0 := 7.3
      else if Mte <= 10 then
        g0 := 8.2
      else
        g0 := 10
  end;
  if (H_HVp1 > 350) and (H_HVp2 > 350) then
    if Betn = 0 then
      delta_H := 0.14
    else
      delta_H := 0.04
  else if Betn = 0 then
    delta_H := 0.06
  else
    delta_H := 0.02;
  W_Hv := delta_H * g0 * v_m * Sqrt(Dm1 * (U + 1) / (2 * U));
  K_Hv := 1 + W_Hv * B / (Ft * K_Hbeta);
  { ------------------------------------ }
  K_H := K_Hbeta * K_Hv;
  { --------------------------------------------- }
  Sigma_H := 32200 * Sqrt(T1 * K_H / (de1 * de1 * de1 * Kbe * (1 - Kbe) *
    U * Nu_H));
  Sigma_Hmax := Sigma_H * Sqrt(Ka);
  { конец процедуры расчета контактных напряжений }
END;

{ ------------------ Расчет изгибных напряжений --------------------------- }
Procedure TPer.PrSigF(var z1, z2: Integer; de1: Extended);
Var
  Z_v1, Z_v2, Yfs1, Yfs2, delta_F, g0, W_Fv, Y_Fs1, Y_Fs2, Ft, bw, K_FAlfa,
    K_Fv, K_F, v_m: Extended;
BEGIN
  if Betn = 0 Then
  Begin
    Z_v1 := z1 / Cos(Delta1);
    Z_v2 := z2 / Cos(Delta2);
  End
  Else
  Begin
    Z_v1 := z1 / (Cos(Delta1) * Exp(3 * Ln(Cos(Betn))));
    Z_v2 := z2 / (Cos(Delta2) * Exp(3 * Ln(Cos(Betn))));
  End;
  bw := B;
  Y_Fs1 := (3.47 + 13.2 / Z_v1 - 29.7 * x1 / Z_v1 + 0.092 * sqr(x1)) * 1.2;
  Y_Fs2 := (3.47 + 13.2 / Z_v2 - 29.7 * x2 / Z_v2 + 0.092 * sqr(x2)) * 1.2;
  If Betn = 0 then
    delta_F := 0.16
  else
    delta_F := 0.06;
  v_m := Pi * de1 * N1 / 60000;
  Case St of
    6:
      if Mte <= 3.55 then
        g0 := 3.8
      else if Mte <= 10 then
        g0 := 4.2
      else
        g0 := 4.8;
    7:
      if Mte <= 3.55 then
        g0 := 4.7
      else if Mte <= 10 then
        g0 := 5.3
      else
        g0 := 6.4;
    8:
      if Mte <= 3.55 then
        g0 := 5.6
      else if Mte <= 10 then
        g0 := 6.1
      else
        g0 := 7.3;
    9:
      if Mte <= 3.55 then
        g0 := 7.3
      else if Mte <= 10 then
        g0 := 8.2
      else
        g0 := 10
  end;
  { Коэффициент K_FBeta }
  If TipOpor then
  begin
    { На шариковых подшипниках }
    if (H_HBp1 > 350) and (H_HBp2 > 350) then
      if Betn = 0 then
        Case Nom_sx of
          1, 2, 3:
            K_Fbeta := 1 + 1.46 * Kbe * U / (2 - Kbe);
          4:
            K_Fbeta := 1 + 0.56 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
        End
      else
        Case Nom_sx of
          1, 2, 3:
            K_Fbeta := 1 + 0.69 * Kbe * U / (2 - Kbe);
          4:
            K_Fbeta := 1 + 0.282 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
        End
    else if Betn > 0 then
      Case Nom_sx of
        1, 2, 3:
          K_Fbeta := 1 + 0.355 * Kbe * U / (2 - Kbe);
        4:
          K_Fbeta := 1 + 0.114 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
      End
    else
      Case Nom_sx of
        1, 2, 3:
          K_Fbeta := 1 + 0.76 * Kbe * U / (2 - Kbe);
        4:
          K_Fbeta := 1 + 0.214 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
      End;
  End;
  If not TipOpor then
  begin
    { на роликовых подшипниках }
    if (H_HBp1 > 350) and (H_HBp2 > 350) then
      if Betn = 0 then
        Case Nom_sx of
          1, 2, 3:
            K_Fbeta := 1 + 0.87 * Kbe * U / (2 - Kbe);
          4:
            K_Fbeta := 1 + 0.56 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
        End
      else
        Case Nom_sx of
          1, 2, 3:
            K_Fbeta := 1 + 0.33 * Kbe * U / (2 - Kbe);
          4:
            K_Fbeta := 1 + 0.282 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
        End
    else if Betn > 0 then
      Case Nom_sx of
        1, 2, 3:
          K_Fbeta := 1 + 0.207 * Kbe * U / (2 - Kbe);
        4:
          K_Fbeta := 1 + 0.114 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
      End
    else
      Case Nom_sx of
        1, 2, 3:
          K_Fbeta := 1 + 0.434 * Kbe * U / (2 - Kbe);
        4:
          K_Fbeta := 1 + 0.214 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
      End;
  End;
  W_Fv := delta_F * g0 * V * Sqrt(Dm1 * (U + 1) / (2 * U));
  K_Fv := 1 + W_Fv * bw * 0.857 * de1 / (2000 * T1 * K_Hbeta);
  K_F := K_Fv * K_Fbeta;
  if Betn = 0 then
    Tet_F := 0.85
  else
  Begin
    if (H_HBp1 < 350) and (H_HBp2 < 350) then
      Tet_F := 0.94 + 0.08 * U;
    if (H_HBp1 > 350) and (H_HBp2 < 350) then
      Tet_F := 0.85 + 0.043 * U;
    if (H_HBp1 > 350) and (H_HBp2 > 350) then
      Tet_F := 0.65 + 0.11 * U;
  end;
  Ft := 2000 * T1 / (0.857 * de1);
  Sigma_F1 := 2.7 * 1000 * T1 * K_F * Y_Fs1 / (bw * de1 * Mte * Tet_F);
  Sigma_Fmax1 := Sigma_F1 * Ka;
  Sigma_F2 := Sigma_F1 * Y_Fs2 / Y_Fs1;
  Sigma_Fmax2 := Sigma_F2 * Ka;
END;

{ ------------------------ РАСЧЕТ НАПРЯЖЕНИЙ В ЗУБЬЯХ---------------------- }
PROCEDURE TPer.PzubKon2;
Var
  Yf1, Yf2: Extended;
Begin
  PrSigH(Ka, N1, U, z1, z2, de1, B, St);
  PrSigF(z1, z2, de1);
END;

{ Расчет всех напряжений }
Procedure TPer.PzubKon1;
{ проектный расчет }
{ Label 1, 2, 3, 4, 5, 6, 7;

  Const
  Us: Tt1 = (1, 1.12, 1.25, 1.4, 1.6, 1.8, 2.0, 2.5, 3.15, 4.0, 5.0, 6.3, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0);
  Const
  Zs: Tt1 = (9, 10, 11, 12, 13, 14, 15, 16, 18, 20, 25, 30, 40, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0);
  Var
  delta_u, d0min, d0minr, d0max, d0maxr, Rmin, Rmax, Mnmin, Mnmax, K0, C, Be,
  Bmin, Bmax, Gam, Gam1, Gam2, x1min, W2prim, deltaW2, Kz, delta_u1,
  deltahf: Extended;
  Iu, Iz, Id0min, Id0max, IW2: Integer;
  Z1min, z2min: integer; }

{ ---------------------------------------------------------------------- }
Begin
  { Case Metka of
    1:
    //Goto 1;
    PzubKon1_label1;
    2:
    //Goto 2;
    PzubKon1_label2;
    3:
    //Goto 3;
    PzubKon1_label3;
    4:
    //Goto 4;
    PzubKon1_label4;
    5:
    //Goto 5;
    PzubKon1_label5;
    end; }
  PzubKon1_label1;
  PzubKon1_label2;
  PzubKon1_label3;
  PzubKon1_label5;
  PzubKon1_label4;
  // 1:

  // 2:

  // 3:

  // 5:

  // 4:

  // 7:

  // 6:
  // exit;}
End; { Конец проектировчного расчета по PzubKon1 }

procedure TPer.PzubKon1_label1;
Var
  delta_u, d0min, d0minr, d0max, d0maxr, Rmin, Rmax, Mnmin, Mnmax, K0, C, Be,
    Bmin, Bmax, Gam, Gam1, Gam2, x1min, W2prim, deltaW2, Kz, delta_u1,
    deltahf: Extended;
  Iu, Iz, Id0min, Id0max, IW2: Integer;
  Z1min, z2min: Integer;
begin
  if Betn = 0 then
    Tet_H := 0.85
  else if Betn > 0 then
  Begin
    if (H_HBp1 < 350) and (H_HBp2 < 350) then
      Tet_H := 1.22 + 0.21 * U;
    if (H_HBp1 > 350) and (H_HBp2 < 350) then
      Tet_H := 1.23 + 0.13 * U;
    if (H_HBp1 > 350) and (H_HBp2 > 350) then
      Tet_H := 0.81 + 0.15 * U;
  End;
  Nu_H := Tet_H;
  { ------------------- Выбор Kbe ---------------------------------- }
  if Nom_sx = 4 then
    Kbe := 1.8 / (U + 0.9)
  else if Nom_sx < 4 then
  begin
    if (H_HBp1 > 350) and (H_HBp2 > 350) then
      Kbe := 1.2 / (U + 0.6)
    else
      Kbe := 0.285;
  end;
  if Kbe > 0.3 then
    Kbe := 0.3;
  { ---------------------- КОэффицент K_Hbeta --------------------- }
  If TipOpor then
  begin
    { На шариковых подшипниках }
    if (H_HBp1 > 350) and (H_HBp2 > 350) then
      if Betn = 0 then
        Case Nom_sx of
          1, 2, 3:
            K_Hbeta := 1 + 0.98 * Kbe * U / (2 - Kbe);
          4:
            K_Hbeta := 1 + 0.39 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
        End
      else
        Case Nom_sx of
          1, 2, 3:
            K_Hbeta := 1 + 0.46 * Kbe * U / (2 - Kbe);
          4:
            K_Hbeta := 1 + 0.189 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
        End
    else if Betn > 0 then
      K_Hbeta := 1
    else
      Case Nom_sx of
        1, 2, 3:
          K_Hbeta := 1 + 0.39 * Kbe * U / (2 - Kbe);
        4:
          K_Hbeta := 1 + 0.118 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
      End;
  End;
  If not TipOpor then
  begin
    { на роликовых подшипниках }
    if (H_HBp1 > 350) and (H_HBp2 > 350) then
      if Betn = 0 then
        Case Nom_sx of
          1, 2, 3:
            K_Hbeta := 1 + 0.54 * Kbe * U / (2 - Kbe);
          4:
            K_Hbeta := 1 + 0.39 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
        End
      else
        Case Nom_sx of
          1, 2, 3:
            K_Hbeta := 1 + 0.226 * Kbe * U / (2 - Kbe);
          4:
            K_Hbeta := 1 + 0.189 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
        End
    else if Betn > 0 then
      K_Hbeta := 1
    else
      Case Nom_sx of
        1, 2, 3:
          K_Hbeta := 1 + 0.217 * Kbe * U / (2 - Kbe);
        4:
          K_Hbeta := 1 + 0.118 * Exp(1.71 * Ln(Kbe * U / (2 - Kbe)));
      End;
  End;
  { ------------------------------------------------------------------------- }
  de2r := 1013 * Exp(0.333 * Ln(T2 * K_Hbeta * U / (Nu_H * Kbe * (1 - Kbe) *
    sqr(Sigma_Hp))));
end;

procedure TPer.PzubKon1_label2;
Var
  delta_u, d0min, d0minr, d0max, d0maxr, Rmin, Rmax, Mnmin, Mnmax, K0, C, Be,
    Bmin, Bmax, Gam, Gam1, Gam2, x1min, W2prim, deltaW2, Kz, delta_u1,
    deltahf: Extended;
  Iu, Iz, Id0min, Id0max, IW2: Integer;
  Z1min, z2min, IDe: Integer;
begin
  if otw1 then
    Wibor(TArrayDe, 1, 31, de2r, de2, IDe)
  else
    de2 := de2r;
  { ------------------ числа зубьев z1 и  z2 ------------------------------ }
  if Betn = 0 then
  begin
    z1 := round(20 / (Kbe * U));
    z2 := round(z1 * U);
  end
  else
  begin
    if (H_HBp1 < 350) and (H_HBp2 < 350) then
      Kz := 18;
    if (H_HBp1 > 350) and (H_HBp2 < 350) then
      Kz := 14;
    if (H_HBp1 > 350) and (H_HBp2 > 350) then
      Kz := 11.2;
    z2 := round(Kz * Exp(0.4 * Ln(U)) * Exp(0.167 * Ln(de2)));
    z1 := round(z2 / U)
  end;
  Z1min := round(18.4 * Cos(Delta1) * Exp(3 * Ln(Cos(Betn))));
  if Betn > 0 then
    if Z1min < 9 then
      Z1min := 9;
  if z1 < Z1min then
  begin
    z1 := Z1min;
    z2 := round(z1 * U);
  end;
  If z2 < 18 then
    if Betn = 0 then
      case z1 of
        12:
          z2min := 30;
        13:
          z2min := 21;
        14:
          z2min := 20;
        15:
          z2min := 19;
        16:
          z2min := 18;
        17:
          z2min := 17;
      end { case z1 }
    else
      case z1 of
        9:
          z2min := 31;
        10:
          z2min := 30;
        11:
          z2min := 28;
        12:
          z2min := 26;
        13:
          z2min := 22;
        14:
          z2min := 20;
        15:
          z2min := 19;
        16:
          z2min := 18;
        17:
          z2min := 17;
      end { case z1 / if Betn>0 }
  Else
    z2min := 17;
  if z2 < z2min then
  begin
    z2 := z2min;
    z1 := round(z2 / U);
  end;
  { -------------------------------------------------------------------------- }
end;

procedure TPer.PzubKon1_label3;
{ var delta_u1: Extended; } Var
  delta_u, d0min, d0minr, d0max, d0maxr, Rmin, Rmax, Mnmin, Mnmax, K0, C, Be,
    Bmin, Bmax, Gam, Gam1, Gam2, x1min, W2prim, deltaW2, Kz, delta_u1,
    deltahf: Extended;
  Iu, Iz, Id0min, Id0max, IW2: Integer;
  Z1min, z2min: Integer;
begin
  delta_u1 := (U - z2 / z1) / U;
  if delta_u1 > 0.04 then
    z1 := round(z2 / (U - 0.04 * U));
  if delta_u1 < -0.04 then
    z2 := Trunc(z1 * 1.04 * U);
  Uf := z2 / z1;
  Mte := de2 / z2;
  Zc := Sqrt(z1 * z1 + z2 * z2);
  { -------------------------------------------------------------------------- }
end;

procedure TPer.PzubKon1_label5;
Var
  delta_u, d0min, d0minr, d0max, d0maxr, Rmin, Rmax, Mnmin, Mnmax, K0, C, Be,
    Bmin, Bmax, Gam, Gam1, Gam2, x1min, W2prim, deltaW2, Kz, delta_u1,
    deltahf: Extended;
  Iu, Iz, Id0min, Id0max, IW2: Integer;
  Z1min, z2min, Ide2: Integer;
begin
  Re := 0.5 * Mte * Zc;
  B := round(Kbe * Re);
  Mn := (Mte - B / Zc) * Cos(Betn);
  if Betn = 0 then
  begin
    if Mn < 1.5 then
      Mn := 1.5;
    Mte := Mn / Cos(Betn) + B / Zc;
    de2 := Mte * z2;
    if otw1 then
      Wibor(TArrayDe, 1, 31, de2, de2, Ide2);
    Mte := de2 / z2;
    Re := 0.5 * Mte * Zc;
    B := round(Kbe * Re);
    Mn := (Mte - B / Zc) * Cos(Betn)
  end; { if  betg=0 }
  { --------------------------------------------------------------------------- }
end;

procedure TPer.PzubKon1_label7;
{ var delta_u1: Extended;
  Z1min, z2min: integer; }
Var
  delta_u, d0min, d0minr, d0max, d0maxr, Rmin, Rmax, Mnmin, Mnmax, K0, C, Be,
    Bmin, Bmax, Gam, Gam1, Gam2, x1min, W2prim, deltaW2, Kz, delta_u1,
    deltahf: Extended;
  Iu, Iz, Id0min, Id0max, IW2: Integer;
  Z1min, z2min: Integer;
begin
  Mte := Mn / Cos(Betn) + B / Zc;
  if (de2 / Mte > z2min) and (de2 / (Mte * U) > Z1min) then
  begin
    z2 := round(de2 / Mte);
    z1 := round(z2 / U);
    Zc := Sqrt(z1 + z2);
    Mte := Mn / Cos(Betn);
    U := z2 / z1;
    delta_u1 := (U - z2 / z1) / U;
    if delta_u1 > 0.04 then
      z1 := round(z2 / (U - 0.04 * U));
    if delta_u1 < -0.04 then
      z2 := Trunc(z1 * 1.04 * U);
    U := z2 / z1;
    Mte := de2 / z2;
    Zc := Sqrt(z1 * z1 + z2 * z2);
  end
  else
  begin
    if Forma = 1 then
    begin
      { --------------------------------- }
      // Mn:=1.75;
      { --------------------------------- }
      if Mn > 1.5 then
      begin
        IMn := IMn - 1;
        Mn := ms[IMn];
        // goto 7;
        PzubKon1_label7;
      end
      else
      begin
        Error := 1;
        // Goto 6;
        exit;
      end;
    end;
    If Forma = 2 then
    begin
      if Mn > 2 then
      begin
        IMn := IMn - 1;
        Mn := ms[IMn];
        // goto 7;
        PzubKon1_label7;
      end
      else
      begin
        Error := 1;
        // Goto 6;
        exit;
      end;
    end;
  End;
  de2 := Mte * z2;
  Re := 0.5 * Mte * Zc;
  B := round(Kbe * Re);
end;

procedure TPer.PzubKon1_label4;
// label 7;
Const
  Us: Tt1 = (1, 1.12, 1.25, 1.4, 1.6, 1.8, 2.0, 2.5, 3.15, 4.0, 5.0, 6.3, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0);
Const
  Zs: Tt1 = (9, 10, 11, 12, 13, 14, 15, 16, 18, 20, 25, 30, 40, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0);
  { var d0min, d0max, Rmin, Rmax, Bmin, Bmax, Mnmin, Mnmax, d0minr, d0maxr, K0,
    C, Gam, Gam1, Gam2, x1min, W2prim, deltaW2, deltahf: Extended;
    Iu, Iz, Id0min, Id0max, IW2: Integer;
    Z1min: integer; }
Var
  delta_u, d0min, d0minr, d0max, d0maxr, Rmin, Rmax, Mnmin, Mnmax, K0, C, Be,
    Bmin, Bmax, Gam, Gam1, Gam2, x1min, W2prim, deltaW2, Kz, delta_u1,
    deltahf: Extended;
  Iu, Iz, Id0min, Id0max, IW2: Integer;
  Z1min, z2min, Id0: Integer;
begin
  if Betn > 0 then
  begin
    if Mn < 1.5 then
      Mn := 1.5;
    Wibor(ms, 1, 37, Mn, Mn, IMn);
    if Forma = 1 then
      if Mn < 2 then
        Mn := 2;
    // 7:
    PzubKon1_label7;
  end; { Конец if Betg > 0 }
  Rs := Re - 0.5 * B;
  { Выбор  d0 для круговых зубьев }
  if Betn > 0 then
  begin
    if Forma = 1 then
    begin
      d0min := Rs / 0.6;
      d0max := Rs / 0.45;
      Wibor(TArrayD01, 1, 16, d0min, d0min, Id0min);
      Wibor(TArrayD01, 1, 16, d0max, d0max, Id0max);
      if Id0max - Id0min = 0 then
      begin
        d0 := d0min;
        Id0 := Id0min
      end;
      if Id0max - Id0min = 1 then
      begin
        d0 := d0min;
        Id0 := Id0min
      end;
      if Id0max - Id0min >= 2 then
      begin
        d0 := TArrayD01[Id0min + 1];
        Id0 := Id0min + 1
      end;
      Rmin := TArray01[Id0, 2];
      Rmax := TArray01[Id0, 3];
      Bmin := TArray01[Id0, 5];
      Bmax := TArray01[Id0, 6];
      Mnmin := TArray01[Id0, 7];
      Mnmax := TArray01[Id0, 8]
    end; { if forma=1 }
    if Forma = 2 then
    begin
      d0minr := Rs / 0.65;
      d0maxr := Rs / 0.4;
      Wibor(TArrayD02, 1, 18, d0minr, d0min, Id0min);
      Wibor(TArrayD02, 1, 18, d0maxr, d0max, Id0max);
      if Id0max - Id0min = 0 then
      begin
        d0 := d0min;
        Id0 := Id0min
      end;
      if Id0max - Id0min = 1 then
      begin
        d0 := d0min;
        Id0 := Id0min
      end;
      if Id0max - Id0min >= 2 then
      begin
        d0 := TArrayD02[Id0min + 1];
        Id0 := Id0min + 1
      end;
      if Id0max - Id0min = 3 then
      begin
        d0 := TArrayD02[Id0min + 1];
        Id0 := Id0min + 1
      end;
      Rmin := TArray02[Id0, 2];
      Rmax := TArray02[Id0, 3];
      Bmin := TArray02[Id0, 5];
      Bmax := TArray02[Id0, 6];
      Mnmin := TArray02[Id0, 7];
      Mnmax := TArray02[Id0, 8]
    end; { if Forma=2 }
    { --------- проверка правильности d0 по Mn ------------------ }
    if Mn > Mnmax then
    begin
      if Forma = 1 then
      begin
        Id0 := Id0 + 1;
        d0 := TArrayD01[Id0];
      end;
      if Forma = 2 then
      begin
        Id0 := Id0 + 1;
        d0 := TArrayD02[Id0];
      end;
    end; { if Mn>Mnmax }
    { ------------------- Проверка d0 на вторичное действие ---------- }
    K0 := Rs / d0;
    if (Delta2 >= 50 * Pi / 180) and (K0 > 0.7) then
    begin
      C := Cos(Delta2 + 2 * Cos(Betn) / Zc) /
        Cos(Delta2 - 2.5 * Cos(Betn) / Zc);
      Gam := arctan(2 * Rs / (d0 * Cos(Betn)) - tan(Betn)) - B * tan(Betn)
        / (2 * Rs);
      Gam1 := ArcCos(C);
      Gam2 := 0.5 * ArcCos(C) + 5 * Cos(Betn) / Zc - B * tan(Betn) / (8 * Rs);
      if Gam - Gam1 > 0.1 then
        showmessage('Возможно вторичное резание при черновой обработке');
      if (Gam - Gam2) > 0.1 then
      begin
        Id0 := Id0 + 1;
        if Forma = 1 then
          d0 := TArrayD01[Id0]
        else
          d0 := TArrayD02[Id0];
      end { if Gam-Gam2>0.1 }
    end; { if (delta>=50*PI/180) and K0>0.7 }
  end; { - if TipZ=1 - }
  { ------------ Конец выбора  d0 для круговых зубьев -------------------- }
  { ----------- выбор коэффицентов Xn1 и Xn2 или   X1 и X1 ---------- }
  if H_HBp1 - H_HBp2 < 100 then
  begin
    if Betn = 0 then
      x1 := 2 * (1 - 1 / (U * U)) * Sqrt(1 / z1)
    else
    begin
      PNomer(U, Us, 1, 12, Iu);
      PNomer(z1, Zs, 1, 13, Iz);
      xn1 := TArrayXn[Iz, Iu + 1]
    end { else/if Betg=0 }
  end { then/if H_HBp1-H_HBp2<100 }
  else
  begin
    if Betn = 0 then
    begin
      if z1 < Z1min then
        x1min := 1.068 - 0.58 * z1 / Cos(Delta1);
      if x1min < 0 then
        x1 := 0
      else
        x1 := x1min;
    end { then/if Betg=0 }
    else
    begin
      if z1 < Z1min then
        x1min := 1.068 - 0.058 * z1 / (Cos(Delta1) * Exp(3 * Ln(Cos(Betn))));
      if x1min < 0 then
        xn1 := 0
      else
        xn1 := x1min;
    end; { if Betg> 0 }
  End;
  x2 := -x1;
  xn2 := -xn1;
  { Коэффициенты Xtau1 и Xtau2 }
  If U < 2.5 then
    Xtau1 := 0
  else if Betn = 0 then
    Xtau1 := 0.03 * 0.008 * (U - 2.5)
  else
    Xtau1 := 0.11 + 0.01 * (U - 2.5);
  if Betn > 0 then
  begin
    if Mn < 2 then
      Xtau1 := 0;
    W2prim := Mn * (0.6609 + Xtau1);
    Wibor(TArrayW, 1, 30, W2prim, W2, IW2);
    deltaW2 := W2prim - W2;
    If Xtau1 = 0 then
    begin
      deltahf := 0.5 * (W2prim - W2) / 0.364;
      if ((deltaW2 > 0.06 * Mn) or (deltaW2 < -0.02 * Mn)) then
      begin
        Mn := W2 / (0.6609 - Xtau1);
        Rs := Mn * Zc / (2 * Cos(Betn));
        Mte := Mn / Cos(Betn) + B / Zc;
        Re := Mte * Zc / 2;
      end;
    End
    else
    begin
      if abs(deltaW2) <= 0.05 * Mn then
        Xtau1 := W2 / Mn - 0.6609
      else
      begin
        Mn := W2 / (0.6609 + Xtau1);
        Mte := Mn / Cos(Betn) + B / Zc;
        Rs := Mn * Zc / (2 * Cos(Betn));
        Re := Mte * Zc / 2
      end;
    end;
  End;
  Xtau2 := -Xtau1;
  de1 := Mte * z1;
  Dm1 := de1 * Rs / Re;
  Dm2 := de2 * Rs / Re;
  V := Pi * Dm1 * N1 / 60000;
  if Betn = 0 then
  begin
    if V > 14 then
      St := 5
    else
      St := 6;
    if V <= 10 then
      St := 7;
    if V <= 5 then
      St := 8;
    if V <= 2 then
      St := 9
  end; { if Betg=0 }
  if Betn > 0 then
  begin
    if V > 25 then
      St := 5
    else
      St := 6;
    if V <= 16 then
      St := 7;
    if V <= 8 then
      St := 8;
    if V < 4 then
      St := 9;
  end; { if Betg>0 }
end;

procedure TPer.PzubKon1_label6;
begin
  // exit;
end;

{ Расчет размеров для круговых зубьев }
Procedure TPer.PrRazmer1(z: Integer; B, Mn, H_F, Tet_A, Tet_F, Xn, deltah_A,
  delta: Extended; var H_Fe, H_Fi, H_e, H_A, delta_A, delta_F, H_Ae, d, dm, de,
  dae, dfe: Extended);

Var
  le, deltah_Ae, deltah_Fe: Extended;
  { ------------------------- }
Begin
  le := 0.5 * B;
  Ha := 1;
  deltah_Ae := le * tan(Tet_A);
  deltah_Fe := le * tan(Tet_F);
  { Высота головки зуба в нормальном сечении }
  H_A := (Ha + Xn) * Mn - deltah_A;
  { Высота головки зуба на торце }
  H_Ae := H_A + deltah_Ae;
  { Внешняя высота ножки зуба на торце }
  H_Fe := H_F + deltah_Fe;
  { Высота ножки зуба на внутреннем торце }
  H_Fi := H_Fe - B * tan(Tet_F);
  { Высота зуба на торце }
  H_e := H_Ae + H_Fe;
  { Угол конуса вершин }
  delta_A := delta + Tet_A;
  { Угол конуса впадин }
  delta_F := delta - Tet_F;
  dm := Mn * z / Cos(Betn);
  de := Mte * z;
  dfe := de - 2 * H_Fe * Cos(delta);
  dae := de + 2 * H_Ae * Cos(delta);
End;

{ Расчет размеров для прямых зубьев }
Procedure TPer.PrRazmer2(z: Integer; B, delta, Xe, Xtay, Re, Tet_A: Extended;
  var H_Ae, H_Fe, H_e, S_e, delta_A, delta_F, de, dm, dae, dfe: Extended);

Var
  Ha, c_, Tet_F: Extended;
Begin
  Ha := 1;
  c_ := 0.2;
  { Ынешняя высота головки зуба }
  H_Ae := (Ha + Xe) * Mte;
  { Внешняя высота ножки зуба }
  H_Fe := (Ha + c_ - Xe) * Mte;
  { Высота зуба на торце }
  H_e := H_Ae + H_Fe;
  { Толщина зуба на внешнем торце }
  S_e := (0.5 * Pi + 2 * Xe * 0.364 + Xtay) * Mte;
  { Угол ножки зуба }
  Tet_F := arctan(H_Fe / Re);
  { Угол конуса вершин }
  delta_A := delta + Tet_A;
  { Угол конуса впадин }
  delta_F := delta - Tet_F;
  dm := Mte * z * (Re - 0.5 * B) / Re;
  de := Mte * z;
  dfe := de - 2 * H_Fe * Cos(delta);
  dae := de + 2 * H_Ae * Cos(delta);
End;

{ Расчет геометрических размеров }
PROCEDURE TPer.PzubKon3;
Const
  Uka: Tt1 = (1.25, 1.6, 2.5, 4.0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0);
  Z_1: Tt1 = (9, 11, 13, 15, 17, 19, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Ka_1: array [1 .. 7, 1 .. 10] of Extended = ((0, 0, 0, 0, 0.75, 0, 0, 0, 0,
    1), (0, 0, 0, 0.8, 0.8, 0, 0, 0, 1, 1), (0, 0, 0.9, 0.85, 0.85, 0, 0, 1, 1,
    1), (0, 0.9, 0.9, 0.9, 0.85, 0, 0.9, 1, 1, 1), (0.9, 0.9, 0.9, 0.9, 0.9,
    0.9, 1, 1, 1, 1), (0.9, 0.9, 0.9, 0.9, 0.9, 0.9, 1, 1, 1, 1),
    (1, 1, 1, 1, 1, 0.9, 1, 1, 1, 1));
Var
  Tet_F1, Tet_F2, Zc, H_F1, H_F2, k, Ka1, Ka2, Tet_FSig, deltah_A1, deltah_A2,
    le: Extended;
  IUKa, Iz_1, Id0: Integer;

Begin
  le := 0.5;
  Zc := Sqrt(z1 * z1 + z2 * z2);
  If Betn > 0 then
  begin
    if Xtau1 = 0 then
    begin
      H_F1 := (Ha + c_ - xn1) * Mn + delta_hf;
      H_F2 := (Ha + c_ - xn2) * Mn + delta_hf;
    end
    else
    begin
      H_F1 := (Ha + c_ - xn1) * Mn;
      H_F2 := (Ha + c_ - xn2) * Mn;
    end;
    Sn1 := (0.5 * Pi + 2 * xn1 * 0.364 + Xtau1) * Mn;
    Sn2 := Pi * Mn - Sn1;
    If Forma = 2 then
    begin
      k := 10800 * tan(Betn) / (Zc * 0.364) * (1 - 2 * Rs * Sin(Betn) / d0);
      k := round(k / 20) * 20;
      if k <= 0 then
        d0 := TArrayD02[Id0];
      if k > 500 then
        d0 := TArrayD02[Id0 - 1];
      Tet_FSig := k / Sin(Betn);
      { }
      Tet_F1 := Tet_FSig * (0.5 - 2 / Pi * xn1 * 0.364);
      Tet_F2 := Tet_FSig - Tet_F1;
      Tet_F1 := Tet_F1 * Pi / (180 * 60);
      Tet_F2 := Tet_F2 * Pi / (180 * 60);
    end
    else
    begin
      Tet_F1 := arctan(H_F1 / Rs);
      Tet_F2 := arctan(H_F2 / Rs);
    end;
    { }
    if Forma = 2 then
    begin
      PNomer(U, Uka, 1, 5, IUKa);
      if z1 < 25 then
        PNomer(z1, Z_1, 1, 7, Iz_1);
      if z1 > 24 then
      begin
        Ka1 := 1;
        Ka2 := 1;
      end
      else
      begin
        Ka1 := Ka_1[Iz_1, IUKa];
        Ka2 := Ka_1[Iz_1, IUKa + 5];
      end;
      Tet_A1 := Ka1 * Tet_F2;
      Tet_A2 := Ka2 * Tet_F1;
    end
    else
    begin
      Tet_A1 := Tet_F2;
      Tet_A2 := Tet_F1;
    end;
    if Forma = 2 then
    begin
      deltah_A1 := (B - le) * (tan(Tet_F2) - tan(Tet_A1));
      deltah_A2 := (B - le) * (tan(Tet_F1) - tan(Tet_A2));
    end
    else
    begin
      deltah_A1 := 0;
      deltah_A2 := 0;
    end;
    PrRazmer1(z1, B, Mn { , Mte, Betn } , H_F1, Tet_A1, Tet_F1, xn1, deltah_A1,
      Delta1, H_Fe1, H_Fi1, H_e1, H_A1, Delta_A1, Delta_F1, H_Ae1, d1, Dm1, de1,
      Dae1, Dfe1);
    PrRazmer1(z2, B, Mn { , Mte, Betn } , H_F2, Tet_A2, Tet_F2, xn2, deltah_A2,
      Delta2, H_Fe2, H_Fi2, H_e2, H_A2, Delta_A2, Delta_F2, H_Ae2, d2, Dm2, de2,
      Dae2, Dfe2);
  end; { Конец для bet > 0 }
  If Betn = 0 then
  begin
    Tet_A1 := arctan((Ha + c_ - x2) * Mte / Re);
    Tet_A2 := arctan((Ha + c_ - x1) * Mte / Re);
    PrRazmer2(z1, B, Delta1, x1, Xtau1, Re, Tet_A1, H_Ae1, H_Fe1, H_e1, S_e1,
      Delta_A1, Delta_F1, de1, Dm1, Dae1, Dfe1);
    PrRazmer2(z2, B, Delta2, x2, Xtau2, Re, Tet_A2, H_Ae2, H_Fe2, H_e2, S_e2,
      Delta_A2, Delta_F2, de2, Dm2, Dae2, Dfe2);
  end;
  { Расстояние от вершины конуса до плоскости вершины зубьев }
  b1 := 0.5 * de2 - H_Ae1 * Sin(Delta1);
  b2 := 0.5 * de1 - H_Ae2 * Sin(Delta2);
END;

{ --------------------------------------------------------------------- }
PROCEDURE TPer.PZubKon4;
{ Расчет качественных показателей }
// Label 1;
Const
  RoK01: Array [1 .. 23] of Extended = (0.22, 0.22, 0.3, 0.3, 0.38, 0.38, 0.45,
    0.5, 0.6, 0.6, 0.75, 0.75, 0.9, 1.0, 1.2, 1.3, 1.5, 1.6, 1.8, 2.1, 2.4,
    2.7, 3.0);
  TArrayW21: Tt1 = (0.6, 0.7, 0.8, 0.8, 1.0, 1.1, 1.3, 1.4, 1.6, 1.8, 2.0, 2.2,
    2.6, 2.8, 3.2, 3.6, 4.0, 4.6, 5.2, 6.0, 6.5, 7.0, 8.0, 9.0, 10, 12, 13, 14,
    16, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  RoK02: Array [1 .. 30] of Extended = (0.2, 0.2, 0.2, 0.4, 0.4, 0.4, 0.5, 0.5,
    0.5, 0.8, 0.8, 0.8, 1.1, 1.1, 1.1, 1.5, 1.5, 1.5, 2.3, 2.3, 2.3, 2.5, 2.5,
    2.5, 4.2, 4.2, 4.2, 5.6, 5.6, 5.6);
  { ----------------------------------- }
Type
  TT = Array [1 .. 2] of Extended;
Var
  S_Ae: Array [1 .. 2] of Extended;
  Sn_a: Array [1 .. 2] of Extended;
  Kgam: Array [1 .. 2] of Extended;
  invAlfa, invAlfat_Ae, RoK0, Epsia_1, Epsia_2, Epsia_c, Epsia, Betn_Ae, Betn_A,
    Betn_Ai, Alfat_e, Alfat_i, Alfat_a, invAlfat_e, invAlfat, invAlfat_a,
    invAlfat_i, invAlfat_Ai, CosBet_e, CosBet_i, H_tae, H_tai, C_te, C_ti, dvt,
    dvte, dvti, davte, H_Ai, davti, davt, Upr, e, Epsi_max: Extended;
  IW2, Ixn: Integer;
  H_Femax, H_Fe, Alfat_Ae, H_A, H_Ae, Alfat_Ai, Tet_A, Alfat_pi, Alfat_le,
    Alfat_Li, St_e, St_i, Sn, Sn_Ae, Sn_Ai, H_Fimax, H_Fi, Alfat_pe, Alfa_pi,
    Alfa_pe, Zvt, delta, de, S_e, Xte, Xti, xi, Alfa_li, Alfa_le, K_gam,
    H_HBp: TT;
  i, ISna, Ixx: Integer;
  { ---------------------- }
Begin
  Zvt[1] := z1 / (Cos(Delta1) * Exp(3 * Ln(Cos(Betn))));
  Zvt[2] := z2 / (Cos(Delta2) * Exp(3 * Ln(Cos(Betn))));
  Sn[1] := Sn1;
  Sn[2] := Sn2;
  H_Ae[1] := H_Ae1;
  H_Ae[2] := H_Ae2;
  H_Fe[1] := H_Fe1;
  H_Fe[2] := H_Fe2;
  H_Fi[1] := H_Fi1;
  H_Fi[2] := H_Fi2;
  H_A[1] := H_A1;
  H_A[2] := H_A2;
  H_HBp[1] := H_HBp1;
  H_HBp[2] := H_HBp2;
  Tet_A[1] := Tet_A1;
  Tet_A[2] := Tet_A2;
  delta[1] := Delta1;
  delta[2] := Delta2;
  de[1] := de1;
  S_e[1] := S_e1;
  de[2] := de2;
  S_e[2] := S_e2;
  xi[1] := x1;
  xi[2] := x2;
  PNomer(Mn, ms, 1, 23, IMn);
  { --------------------------- }
  If Betn = 0 then
  begin
    { Для прямозубых колес }
    For i := 1 to 2 Do
    begin
      dvte := Zvt[i] * Mte;
      dvti := dvte * (Re - B) / Re;
      davte := dvte + 2 * H_Ae[i];
      H_Ai := H_Ae[i] - B * tan(Tet_A[i]);
      davti := dvti + 2 * H_Ai;
      Alfat_Ae[i] := ArcCos(dvte * 0.9397 / davte);
      Alfat_Ai[i] := ArcCos(dvti * 0.9397 / davti);
      Alfat_Li[i] := arctan(0.364 - 4 * (1.2 - xi[i] - 0.1974 * Re / (Re - B)) /
        (Zvt[i] * 0.6428));
      { Проверка заострения }
      If Zvt[i] > 150 then
        S_Ae[i] := S_e[i] - 2 * H_Ae[i] * 0.364
      else
      begin
        invAlfa := 0.364 - Pi / 9;
        invAlfat_Ae := tan(Alfat_Ae[i]) - Alfat_Ae[i];
        S_Ae[i] := davte * (S_e[i] / dvte + invAlfa - invAlfat_Ae);
      end;
      { Проверка подрезания }
      RoK0 := RoK01[IMn];
      H_Femax[i] := Re * tan(delta[i]) * sqr(0.342) + RoK0 * (1 - 0.342);
    End; { конец For i:=1 to 2 }
    { ----------------------- }
    { Проверка интерференции }
    Alfat_pi[1] := arctan(0.364 - Zvt[2] / Zvt[1] * (tan(Alfat_Ai[2]) - 0.364));
    Alfat_pi[2] := arctan(0.364 - Zvt[1] / Zvt[2] * (tan(Alfat_Ai[1]) - 0.364));
    { Коэффициент перекрытия }
    Epsia_1 := Sqrt(sqr(Zvt[1] / 2 + H_Ae1 / Mte) - sqr(0.5 * Zvt[1] * 0.9397))
      / (Pi * 0.9397);
    Epsia_2 := Sqrt(sqr(Zvt[2] / 2 + H_Ae2 / Mte) - sqr(0.5 * Zvt[2] * 0.9397))
      / (Pi * 0.9397);
    Epsia_c := (Zvt[1] + Zvt[2]) * 0.364 / (2 * Pi);
    Epsia := Epsia_1 + Epsia_2 - Epsia_c;
    Epsias := Epsia;
  END; { Конец для Betg =0 }
  { ----------------------- }
  { Для круговых зубьев }
  If Betn > 0 then
  begin
    PNomer(W2, TArrayW21, 1, 30, IW2);
    RoK0 := RoK02[IW2];
    For i := 1 to 2 Do
    Begin
      dvt := Zvt[i] * Mn / Cos(Betn);
      dvte := dvt * Re / Rs;
      dvti := dvt * (Re - B) / Rs;
      H_Ai := H_Ae[i] - B * tan(Tet_A[i]);
      davt := dvt + 2 * H_A[i];
      davte := dvte + 2 * H_Ae[i];
      davti := dvti + 2 * H_Ai;
      Betn_e := ArcSin(Rs / Re * Sin(Betn) + (Re / Rs - Rs / Re) * Rs / d0);
      Betn_i := ArcSin(Rs / (Re - B) * Sin(Betn) +
        ((Re - B) / Rs - Rs / (Re - B)) * Rs / d0);
      Betn_Ae := arctan(davte * tan(Betn_e) / dvte);
      Betn_A := arctan(davt * tan(Betn) / dvt);
      Betn_Ai := arctan(davti * tan(Betn_i) / dvti);
      CosBet_e := Cos(Betn_e);
      CosBet_i := Cos(Betn_i);
      H_tae := Ha * CosBet_e;
      C_te := c_ * CosBet_e;
      Xte[1] := xn1 * CosBet_e;
      Xte[2] := xn2 * CosBet_e;
      H_tai := Ha * CosBet_i;
      C_ti := c_ * CosBet_i;
      Xti[1] := xn1 * CosBet_i;
      Xti[2] := xn2 * CosBet_i;
      Alfat_e := arctan(0.364 / Cos(Betn_e));
      Alfat := arctan(0.364 / Cos(Betn));
      Alfat_i := arctan(0.364 / Cos(Betn_i));
      Alfat_Ae[i] := ArcCos(dvte * Cos(Alfat_e) / davte);
      Alfat_a := ArcCos(dvt * Cos(Alfat) / davt);
      Alfat_Ai[i] := ArcCos(dvti * Cos(Alfat_i) / davti);
      Alfat_Li[i] := arctan(0.364 - 4 * (1.25 - Xti[i] - 0.1645 * Re / (Re - B))
        / (Zvt[i] * 0.6428));
      Alfat_le[i] := arctan(0.364 - 4 * (1.25 - Xte[i] - 0.1645) /
        (Zvt[i] * 0.6428));
      { Заострение }
      If Forma = 1 then
      Begin
        St_e[1] := Sn[i] / Cos(Betn) * Re / Rs;
        St_i[1] := Sn[i] / Cos(Betn) * (Re - B) / Rs;
      end
      else
      begin
        St_e[1] := (W2 - 2 * H_Fe2 * 0.364) / Cos(Betn_e);
        St_i[1] := (W2 - 2 * H_Fe2 * 0.364) / Cos(Betn_i);
      end;
      St_e[2] := Pi * Mn * Re / (Cos(Betn) * Rs) - St_e[1];
      St_i[2] := Pi * Mn * (Re - B) / (Cos(Betn) * Rs) - St_i[1];
      If Zvt[i] > 150 then
      begin
        Sn_Ae[i] := St_e[i] * Cos(Betn_e) - 2 * H_Ae[i] * 0.364;
        Sn_a[i] := Sn[i] - 2 * H_A[i] * 0.364;
        Sn_Ai[i] := St_i[i] * Cos(Betn_i) - 2 * H_Ai * 0.364;
      end
      else
      begin
        invAlfat_e := tan(Alfat_e) - Alfat_e;
        invAlfat_Ae := tan(Alfat_Ae[i]) - Alfat_Ae[i];
        Sn_Ae[i] := davte * (St_e[i] / dvte + invAlfat_e - invAlfat_Ae) *
          Cos(Betn_Ae);
        invAlfat := tan(Alfat) - Alfat;
        invAlfat_a := tan(Alfat_a) - Alfat_a;
        Sn_a[i] := davt * (Sn[i] / (dvt * Cos(Betn)) + invAlfat - invAlfat_a) *
          Cos(Betn_A);
        invAlfat_i := tan(Alfat_i) - Alfat_i;
        invAlfat_Ai := tan(Alfat_Ai[i]) - Alfat_Ai[i];
        Sn_Ai[i] := davti * (St_i[i] / dvti + invAlfat_i - invAlfat_Ai) *
          Cos(Betn_Ai);
      end;
      { Коэффициент сужения }
      K_gam[i] := Sn_Ae[i] / Sn_Ai[i];
      if ((K_gam[i] < 0.7) or (K_gam[i] > 1.3)) then
      begin
        Error := 2;
        // goto 1;
        exit;
      End;
      { Проверка подрезания зуба }
      H_Femax[i] := Re * tan(delta[i]) * sqr(Alfat_e) + RoK0 * (1 - 0.342);
      H_Fimax[i] := (Re - B) * tan(delta[i]) * 0.342 + RoK0 * (1 - 0.342);
    END; { Конец For i=1 to 2 }
    { Проверка интерференции }
    Upr := Zvt[2] / Zvt[1];
    Alfat_pe[1] := arctan(tan(Alfat_e) - Upr *
      (tan(Alfat_Ae[2]) - tan(Alfat_e)));
    Alfat_pe[2] := arctan(tan(Alfat_e) - 1 / Upr *
      (tan(Alfat_Ae[1]) - tan(Alfat_e)));
    Alfat_pi[1] := arctan(tan(Alfat_i) - Upr *
      (tan(Alfat_Ai[2]) - tan(Alfat_i)));
    Alfat_pi[2] := arctan(tan(Alfat_i) - 1 / Upr *
      (tan(Alfat_Ai[1]) - tan(Alfat_i)));
    { Коэффициент перекрытия }
    Epsia_1 := Sqrt(sqr(0.5 * Zvt[1] + H_A1 * Cos(Betn) / Mn) -
      sqr(0.5 * Zvt[1] * Cos(Alfat))) / (Pi * Cos(Alfat));
    Epsia_2 := Sqrt(sqr(0.5 * Zvt[2] + H_A2 * Cos(Betn) / Mn) -
      sqr(0.5 * Zvt[2] * Cos(Alfat))) / (Pi * Cos(Alfat));
    Epsia_c := (Zvt[1] + Zvt[2]) * tan(Alfat) / (2 * Pi);
    Epsi_Bet := B * Sin(Betn) / (Pi * Mn);
    Epsia := Epsia_1 + Epsia_2 - Epsia_c;
    Epsias := Sqrt(sqr(Epsia) + sqr(Epsi_Bet));
  END; { Конец  Bet > 0 }
  { ---------------------------------- }
  For i := 1 to 2 Do
  Begin
    { Проверка заострения }
    If H_HBp[i] < 350 then
      e := 0.3
    else
      e := 0.4;
    If Betn = 0 then
    begin
      If S_Ae[i] < (e * Mte) { or Sn_ai[i] < (e*Mn) } then
      begin
        if i = 1 then
        begin
          Error := 3;
          // Goto 1;
          exit;
        end
        else
        begin
          Error := 4;
          // Goto 1;
          exit;
        end;
        ISna := 0;
        // goto 1;
        exit;
      end;
    End
    else
    begin
      If Sn_Ae[i] < (e * Mte) then
      begin
        if i = 1 then
        begin
          Error := 3;
          // Goto 1;
          exit;
        end
        else
        begin
          Error := 4;
          // Goto 1;
          exit;
        end;
        ISna := 0;
        // goto 1;
        exit;
      end;
      if Sn_Ai[i] < (e * Mn) then
      begin
        if i = 1 then
        begin
          Error := 5;
          // Goto 1;
          exit;
        end
        else
        begin
          Error := 6;
          // Goto 1;
          exit;
        end;
        ISna := 0;
        // goto 1;
        exit;
      end;
    End;
    { Проверка подрезания }
    If H_Femax[i] < H_Fe[i] then
    begin
      If i = 1 Then
      begin
        Error := 7;
        // Goto 1;
        exit;
      end
      else
      begin
        Error := 8;
        // goto 1;
        exit;
      end;
      Ixx := 0;
      // Goto 1;
      exit;
    end;
    If Betn > 0 then
    begin
      If H_Fimax[i] < H_Fi[i] then
      begin
        If i = 1 Then
        begin
          Error := 9;
          // Goto 1;
          exit;
        end
        else
        begin
          Error := 10;
          // goto 1;
          exit;
        end;
        Ixx := 0;
        // Goto 1;
        exit;
      end;
    end;
    { Проверка интерференции }
    If Alfat_pi[i] <= Alfat_Li[i] then
    begin
      If i = 1 Then
      begin
        Error := 11;
        // Goto 1;
        exit;
      end
      else
      begin
        Error := 12;
        // goto 1;
        exit;
      end;
    end;
    If Betn > 0 then
    Begin
      If Alfat_pe[i] <= Alfat_le[i] then
      begin
        If i = 1 Then
        begin
          Error := 13;
          // Goto 1;
          exit;
        end
        else
        begin
          Error := 14;
          // goto 1;
          exit;
        end;
      end;
    End;
  END;
  If Betn = 0 then
    Epsi_max := 1.3
  else
    Epsi_max := 1.15;
  If Epsia < Epsi_max then
  begin
    Error := 15;
    // Goto 1;
    exit;
  End;

  If ((Betn > 0) and (Epsi_Bet < 1.25)) then
  begin
    Error := 16;
    // Goto 1;
    exit;
  End;

  // 1:
END;

procedure TPer.PZubKon4_label1;
begin
  // exit;
end;

{ Расчет усилий в зацеплении }
PROCEDURE TPer.PzubC8;
Var
  Gam_A, Gam_R: Extended;
  Kfx: Extended;
BEGIN
  if Betn = 0 then
  begin
    Gam_A := 0.364 * Sin(Delta1);
    Gam_R := 0.364 * Cos(Delta1);
    Kfx := 1;
  end
  else
  begin
    if NaprZub1 = 1 then
      Case Napr_Vr of
        False:
          begin
            Gam_A := 0.444 * Sin(Delta1) + 0.7 * Cos(Delta1);
            Gam_R := 0.444 * Cos(Delta1) - 0.7 * Sin(Delta1);
            Kfx := 1;
          end;
        True:
          begin
            Gam_A := 0.444 * Sin(Delta1) - 0.7 * Cos(Delta1);
            Gam_R := 0.444 * Cos(Delta1) + 0.7 * Sin(Delta1);
            Kfx := -1;
          end;
      end;
    if NaprZub1 = 2 then
      Case Napr_Vr of
        False:
          begin
            Gam_A := 0.444 * Sin(Delta1) - 0.7 * Cos(Delta1);
            Gam_R := 0.444 * Cos(Delta1) + 0.7 * Sin(Delta1);
            Kfx := -1;
          end;
        True:
          begin
            Gam_A := 0.444 * Sin(Delta1) + 0.7 * Cos(Delta1);
            Gam_R := 0.444 * Cos(Delta1) - 0.7 * Sin(Delta1);
            Kfx := 1;
          end;
      end;
  End;
  Ft1 := 2 * T2 / (0.857 * de2) * 1E3;
  Ft2 := Ft1;
  Fr1 := Ft1 * Gam_R;
  Fr2 := Ft1 * Gam_A;
  Fx1 := Kfx * Ft1 * Gam_A;
  Fx2 := Kfx * Ft1 * Gam_R;
  Fv := Sqrt(sqr(Ft1) + sqr(Fr1));
END; { Конец    PzubC8 }

Procedure TPer.PrSc(S, H: Extended; var Sce, hce: Extended);
Begin
  Sce := S * 0.883;
  hce := H - 0.1607 * S;
End;

Procedure TPer.PrSe(S, H, delta, d: Extended; var Se, Hae: Extended);
Var
  Psi_e: Extended;
Begin
  Psi_e := S * Cos(delta) / d;
  If Betn = 0 then
    Se := d * Sin(Psi_e) / Cos(delta)
  else
    Se := S * (1 - sqr(Psi_e) / 6);
  Hae := H + 0.25 * S * Psi_e;
End;

{ Расчет контрольного комплекса }
PROCEDURE TPer.PzubKon5;
Begin
  If Betn = 0 then
  begin
    if x2 > (-0.4) then
    begin
      PrSc(S_e1, H_Ae1, Sce1, Hce1);
      PrSc(S_e2, H_Ae2, Sce2, Hce2);
      PrSe(Betn, S_e1, H_Ae1, Delta1, de1, Se_1);
      PrSe(Betn, S_e2, H_Ae2, Delta2, de2, Se_2);
    end
    else
    begin
      PrSc(S_e1, H_Ae1, Sce1, Hce1);
      PrSe(Betn, S_e1, H_Ae1, Delta1, de1, Se_1);
      dey2 := de2 - Mte * Cos(Delta2);
      Se_y2 := de2 * Sin(S_e2 * Cos(Delta2) / de2) / Cos(Delta2) + 0.364 * Mte;
      hae_y2 := H_Ae2 + 0.25 * S_e2 * S_e2 * Cos(Delta2) / de2 + 0.5 * Mte;
    end;
  end;
  If Betn > 0 then
  begin
    if xn2 > (-0.4) then
    begin
      PrSc(Sn1, H_Ae1, Sce1, Hce1);
      PrSc(Sn2, H_Ae2, Sce2, Hce2);
      PrSe(Betn, Sn1, H_A1, Delta1, d1, Se_1);
      PrSe(Betn, Sn2, H_A2, Delta2, d2, Se_2);
    end
    else
    begin
      PrSc(Sn1, H_Ae1, Sce1, Hce1);
      PrSe(Betn, Sn1, H_A1, Delta1, d1, Se_1);
      dey2 := d2 - Mn * Cos(Delta2);
      Sn_y2 := Sn2 * (1 - sqr(Sn2 * Cos(Delta2) * Cos(Betn) / d2) / 6) +
        0.364 * Mn;
      Ha_y2 := H_A2 + 0.25 * Sn2 * Sn2 * Cos(Delta2) * Cos(Betn) / d2 +
        0.25 * Mn;
    end;
  end;
End;

PROCEDURE TPer.CalculateConeWheel;
{ Label 1, 2, 3; }
var
  Da1, da2: Extended;
BEGIN { Начало процедуры Expandata }

  T1 := P1 * 30 * 1000 / (Pi * N1);
  T2 := T1 * U;
  Zw := 1;
  if Tipz = 1 then
    Betn := 0
  else
    Betn := 35 * Pi / 180;
  if Napr_Vr then
    NaprZub1 := 2
  else
    NaprZub1 := 1;
  { Парметры исходного контура }
  If Betn = 0 then
  begin
    Ha := 1;
    c_ := 0.20;
    H_l := 2;
    Ro_f := 0.30;
    Alfa := 20;
  end
  else
  begin
    Ha := 1;
    c_ := 0.25;
    H_l := 2;
    Ro_f := 0.25;
    Alfa := 20;
  end;
  Delta1 := arctan(1 / U);
  Delta2 := arctan(U);
  Da1 := 0;
  da2 := 0;
  // Metka := 1;
  // PzubKon1_label1;
  { Предварительный расчет допускаемых напряжений }
  PzubC2(Da1, da2, Mn, N1 { , n2 } , Mu_H, Ra1, Ra2, Lh, U, Termobr1, Termobr2,
    Zw, n2, Sigma_Hp, Sigma_Hp1, Sigma_Hp2, V);
  { Проектный расчет передачи }
  // 1:
  CalculateConeWheel_label1;
  CalculateConeWheel_label3;
  // 3:

END; { Конец процедуры Expandata }

procedure TPer.CalculateConeWheel_label1;
begin
  PzubKon1;
  // PzubKon1_label1;
  // PzubKon1_label2;
  // PzubKon1_label3;
  // PzubKon1_label7;
  // PzubKon1_label4;
  // PzubKon1_label5;
  { Расчет фактических напряжений }
  If Error <> 0 then
    exit;
end;

procedure TPer.CalculateConeWheel_label3;
var
  Zw, z2min, Z1min, IDe: Integer;
  Massa1, Massa2, Da1, da2, dv2: Extended;
begin
  PzubKon2;
  { Уточнение допускаемых напряжений }
  Da1 := de1 + 2 * Mte * Cos(Delta1);
  da2 := de2 + 2 * Mte * Cos(Delta2);
  PzubC2(Da1, da2, Mn, N1 { , n2 } , Mu_H, Ra1, Ra2, Lh, U, Termobr1, Termobr2,
    Zw, n2, Sigma_Hp, Sigma_Hp1, Sigma_Hp2, V);
  { Проверка условия: допускаемое напряжение больше фактического }
  { Проверка по контактным напряжениям }
  if Sigma_H > Sigma_Hp then
  begin
    de2r := de2 * Exp(0.666 * Ln(Sigma_H / Sigma_Hp));
    Wibor(TArrayDe, 1, 31, de2r, de2, IDe);
    z2 := round(de2 / Mte);
    z1 := round(z2 / U);
    // Metka := 3;
    // PzubKon1_label3;
    // Goto 1;
    CalculateConeWheel_label1;
  End;
  if Sigma_Hmax > Sigma_Hpmax then
  begin
    de2r := de2 * Exp(0.666 * Ln(Sigma_H / Sigma_Hp));
    // Metka := 2;
    // PzubKon1_label2;
    // Goto 1;
    CalculateConeWheel_label1;
  end;
  { Проверка по изгибным напряжениям }
  If ((Sigma_F1 > Sigma_Fp1) or (Sigma_F2 > Sigma_Fp2)) then
  Begin
    if Betn > 0 then
    begin
      IMn := IMn + 1;
      Mn := ms[IMn];
      // Metka := 4;
      // PzubKon1_label4;
      // Goto 1;
      CalculateConeWheel_label1;
    End
    else
    begin
      if (Mte * Sqrt(Sigma_F1 / Sigma_Fp1)) > (Mte * Sqrt(Sigma_F2 / Sigma_Fp2))
      then
        Mte := Mte * Sqrt(Sigma_F1 / Sigma_Fp1)
      else
        Mte := Mte * Sqrt(Sigma_F2 / Sigma_Fp2);
      if (de2 / Mte > z2min) and (de1 / Mte > Z1min) then
      begin
        z2 := round(de2 / Mte);
        z1 := round(de1 / Mte);
        // Metka := 3;
        // PzubKon1_label3;
        // Goto 1;
        CalculateConeWheel_label1;
      end
      else
      begin
        de2 := Mte * z2;
        de1 := Mte * z1;
        // Metka := 5;
        // PzubKon1_label5;
        // Goto 1;
        CalculateConeWheel_label1;
      end;
    end;
  End;
  If ((Sigma_Fmax1 > Sigma_Fpmax1) or (Sigma_Fmax2 > Sigma_Fpmax2)) then
  Begin
    if Betn > 0 then
    begin
      IMn := IMn + 1;
      Mn := ms[IMn];
      // Metka := 4;
      // PzubKon1_label4;
      // Goto 1;
      CalculateConeWheel_label1;
    End
    else
    begin
      if (Mte * Sqrt(Sigma_F1 / Sigma_Fp1)) > (Mte * Sqrt(Sigma_F2 / Sigma_Fp2))
      then
        Mte := Mte * Sqrt(Sigma_F1 / Sigma_Fp1)
      else
        Mte := Mte * Sqrt(Sigma_F2 / Sigma_Fp2);
      if (de2 / Mte > z2min) and (de1 / Mte > Z1min) then
      begin
        z2 := round(de2 / Mte);
        z1 := round(de1 / Mte);
        // Metka := 3;
        // PzubKon1_label3;
        // Goto 1;
        CalculateConeWheel_label1;
      end
      else
      begin
        de2 := Mte * z2;
        de1 := Mte * z1;
        // Metka := 5;
        // PzubKon1_label5;
        // Goto 1;
        CalculateConeWheel_label1;
      end;
    end;
  End;
  { Расчет усилий }
  PzubC8;
  { Расчет размеров }
  PzubKon3;
  { Расчет качественных показателей }
  PZubKon4;
  If Error <> 0 then
    exit;
  { Расчет массы колес }
  dv2 := Exp(0.333 * Ln(T2 / 5)) * 10;
  Massa1 := Pi * 0.25 * (Dm1 * Dm1 * B + 0.54 * B * (Dm2 * Dm2 + dv2 * dv2)) *
  { 1.E-6 } 0.000001 * 7.81;
  Massa2 := Pi * 0.25 * (Dm1 * Dm1 * B + B * (Dm2 * Dm2 + dv2 * dv2)) *
  { 1.E-6 } 0.000001 * 7.81;
  Massa := Min3(Massa1, Massa2, Massa2);
  { Расчет объема, занимаемого передачей }
  V_p := Pi * sqr(Dae2) * Dae1 / (4 * { E6 } 1000000); { в  куб. дециметрах }
end;

{$ENDREGION 'сам расчет'}

constructor TPer.create;
begin
  Loading.GraphBar := 0;
  With Loading do
  begin
    x := 2;
    y := 0.3;
    z := 0.2;
    i := 0.6;
    j := 0.2;
    k := 0.2;
  end;
  Sigma_Hp := 434.7;
  Sigma_Hp1 := 434.7;
  Sigma_Hp2 := 434.7;
  Da := 1;
//  Nom_sx := 3;
  Ka := 1.0;
  DeltaU := 2;

//  P1 := 10; { 0.2..300 }
//  N1 := 750; { 1 .. 5000 об/мин }
//  U := 3.5; { 1 .. 8 }
//  H_HBp1 := 240; { 0..350 }
//  H_HBp2 := 240; { 0 .. 350 }
//  H_HBs1 := 240; { 0 .. 350 }
//  H_HBs2 := 240; { 0 .. 350 }
//  H_HRcp1 := 35; { 35 .. 68 }
//  H_HRcp2 := 35; { 35 .. 68 }
//  H_HRcs1 := 35;
//  H_HRcs2 := 35;
//  mc1 := '45 ГОСТ 1050-74';
//  mc2 := '45 ГОСТ 1050-74';
//  Termobr1 := 1; { 1 .. 8 }
//  Termobr2 := 1; { 1 .. 8 }
//  Lh := 6300; { 10 ... 100000 ч }
//  Ra1 := 2;
//  Ra2 := 2;
//  Tipz := 2;
//  Nagr := False;
//  rewers := False;
//  Zagotowka[1] := 1;
//  Zagotowka[2] := 1;
//  Napr_Vr := False;
//  TipOpor := False;
//  otw1 := True;
//  Forma := 1;
//  Sigma_Fst0 := 1500;
//  Sigma_Fst01 := 1500;
//  Sigma_Fst02 := 1500;
//  Sigma_Flim0 := 240;
//  Sigma_Flim01 := 240;
//  Sigma_Flim02 := 240;
//  S_f := 1.7;
//  S_f1 := 1.7;
//  S_f2 := 1.7;
//  Sigma_t := 450;
//  Sigma_t1 := 450;
//  Sigma_t2 := 450;

//  CalculateConeWheel;
//  vivod;
//  MaterialsDB:=nil;
end;

constructor TPer.create(Input: TParInput);
var
  Massa1, Massa2, Da, Da1, da2, Sigma_Flim0, Sigma_Fst0, Sigma_t: Extended;
begin
  // K_Hbeta:=Input.K_Hbeta;
  // {Massa1:=Input.Massa1;
  // Massa2:=Input.Massa2;}
  // Da:=Input.Da;
  // Da1:=Input.Da1;
  // da2:=Input.da2;
  // Sigma_Flim0:=Input.Sigma_Flim0;
  // S_f:=Input.S_f;
  // Sigma_Hpmax:=Input.Sigma_Hpmax;
  // Sigma_Fmax1:=Input.Sigma_Fmax1;
  // Sigma_Fpmax1:=Input.Sigma_Fpmax1;
  // Sigma_Fmax2:=Input.Sigma_Fmax2;
  // Sigma_Fpmax2:=Input.Sigma_Fpmax2;
  // Sigma_Hpmax1:=Input.Sigma_Hpmax1;
  // Sigma_Hpmax2:=Input.Sigma_Hpmax2;
  // Sigma_Fst0:=Input.Sigma_Fst0;
  // Sigma_t:=Input.Sigma_t;
  // Loading:=Input.Loading;
  // P1:=Input.P1;{ Мощность, передаваемая быстроходным валом }
  // N1:=Input.N1;{ Частота вращения быстроходного вала }
  // U:=Input.U; { Передаточное число передачи }
  // DeltaU:=Input.DeltaU;
  // Lh:=Input.Lh; { Расчетный ресурс передачи }
  // Tipz:=Input.Tipz; { тип зубьев колес: 1 - прямые
  // 2 - косые
  // 0 - автовыбор }
  // Napr_Vr:=Input.Napr_Vr;{Направление наклона зуба}
  // TipOpor:=Input.TipOpor;
  // Forma:=Input.Forma;  {Форма зуба}
  // mc1:=Input.mc1; { марка стали для шестерни }
  // mc2:=Input.mc2; { марка стали для колеса }
  // Termobr1:=Input.Termobr1;{ термообработка зуба шестерни, номер }
  // Termobr2:=Input.Termobr2; { термообработка зуба колеса, номер }
  // Zagotowka:=Input.Zagotowka; { Способ получения заготовки шестерни и колеса
  // = 1 для поковок
  // = 2 для штамповок
  // = 3 для проката
  // = 4 для отливок }
  // Ra1:=Input.Ra1;{ Шероховатость боковой поверхности зуба шестерни }
  // Ra2:=Input.Ra2; { Шероховатость боковой поверхности зуба колеса }
  // Nom_sx:=Input.Nom_sx; { Номер схемы расположения колес }
  // Nagr:=Input.Nagr;{ =1 для типового режима,
  // = 0 для циклограммы }
  // rewers:=Input.rewers; { При реверсировании = 1; без реверсирования = 0 }
  // Ka:=Input.Ka; { Коэффициент внешней динамики }
  // otw1:=Input.otw1; { При стандартном межосевом расстоянии = 'Y',
  // при нестандартном межосевом расстоянии ='n' }
  // H_HRcs1:=Input.H_HRcs1;{ Твердость сердцевины зуба шестерни по Роквеллу }
  // H_HRcs2:=Input.H_HRcs2;{ Твердость сердцевины зуба колеса по Роквеллу }
  // H_HRcp1:=Input.H_HRcp1;{ Твердость поверхности зуба шестерни по Роквеллу }
  // H_HRcp2:=Input.H_HRcp2;{ Твердость поверхности зуба колеса по Роквеллу }
  // H_HBs1:=Input.H_HBs1;{ Твердость сердцевины зуба шестерни по Бринелю }
  // H_HBs2:=Input.H_HBs2;{ Твердость сердцевины зуба колеса по Бринелю }
  // H_HBp1:=Input.H_HBp1;{ Твердость поверхности зуба шестерни по Бринелю }
  // H_HBp2:=Input.H_HBp2;{ Твердость поверхности зуба колеса по Бринелю }
  // H_HVs1:=Input.H_HVs1;{ Твердость сердцевины зуба шестерни по Виккерсу }
  // H_HVs2:=Input.H_HVs2;{ Твердость сердцевины зуба колеса по Виккерсу }
  // H_HVp1:=Input.H_HVp1;{ Твердость поверхности зуба шестерни по Виккерсу }
  // H_HVp2:=Input.H_HVp2; { Твердость поверхности зуба колеса по Виккерсу }
  // S_f1:=Input.S_f1;{ Коэффициент выносливости по изгибу для шестерни }
  // S_f2:=Input.S_f2;{ Коэффициент выносливости по изгибу для колеса }
  // Sigma_t1:=Input.Sigma_t1;{ Предел текучести материала шестерни }
  // Sigma_t2:=Input.Sigma_t2;{ Предел текучести материала колеса }
  // Sigma_Flim01:=Input.Sigma_Flim01;{ Предел выносливости по изгибу для шестерни }
  // Sigma_Flim02:=Input.Sigma_Flim02;{ Предел выносливости по изгибу для колеса }
  // Sigma_Fst01:=Input.Sigma_Fst01;{ Предельное напряжение для шестерни }
  // Sigma_Fst02:=Input.Sigma_Fst02; { Предельное напряжение для колеса }
  // Sigma_Hp:=Input.Sigma_Hp;
  // Sigma_Hp1:=Input.Sigma_Hp1;
  // Sigma_Hp2:=Input.Sigma_Hp2;

  // CalculateConeWheel;

  // { --------------------- Критерии качества --------------------------------- }
  // Output.Massa:=Massa;{ Суммарная масса зубчатых колес }
  // Output.Massa1:=Massa1;
  // Output.Massa2:=Massa2;
  // Output.V_p:=V_p;{ Объём занимаемый передачей }
  // Output.Re:=Re;
  // Output.Fv:=Fv;
  // Output.Dae2:=Dae2;
  // Output.Mn:=Mn;{ Модуль нормальный в среднем сечении }
  // Output.Mte:=Mte;{ Модуль торцевой на внешнем торце }
  // Output.Me:=Me;{ Модуль торцевой на внешнем торце }
  // Output.Betn:=Betn;{ Нормальный угол наклона в среднем сечении в радианах }
  // Output.Xtau1:=Xtau1;
  // Output.Xtau2:=Xtau2;{ Коэффициенты тангенциального смещения }
  // Output.x1:=x1;
  // Output.x2:=x2;{ Коэффициент смещения исходного контура для прямозубых колес }
  // Output.xn1:=xn1;
  // Output.xn2:=xn2; { Коэффициент смещения исходного контура
  // в нормальном сечении для колес с круговым зубом }
  // Output.z1:=z1; { Число зубьев шестерни }
  // Output.z2:=z2; { Числа зубьев колеса }
  // Output.St:=St; { Степень точности }
  // Output.Uf:=Uf;{ Фактическое передаточное число передачи }
  // Output.n2:=n2;{ Частота вращения колеса }
  // Output.V:=V;{ Скорость, м/с }
  // Output.de1:=de1;{ Диаметр делителбного конуса шестерни }
  // Output.Dae1:=Dae1;{ Диаметр окружности вершин }
  // Output.Dfe1:=Dfe1;{ Диаметр окружности впадин шестерни }
  // Output.d1:=d1;{ Средний делительный диаметр шестерни }
  // Output.Delta1:=Delta1;{ Угол делительного конуса шестерни }
  // Output.Delta_A1:=Delta_A1;{ Угол конуса вершин шестерни }
  // Output.Delta_F1:=Delta_F1;{ Угол конуса впадин шестерни }
  // Output.Sce1:=Sce1;{ Врешняя постоянная хорда }
  // Output.Hce1:=Hce1;{ Измерительная высота }
  // Output.de2:=de2;{ Диаметр делительного конуса колеса }
  // Output.Dfe2:=Dfe2;{ Диаметр окружности впадин колеса }
  // Output.d2:=d2;{ Средний делительный диаметр колеса }
  // Output.Delta2:=Delta2;{ Угол делительного конуса колеса }
  // Output.Delta_A2:=Delta_A2;{ Угол конуса вершин колеса }
  // Output.Delta_F2:=Delta_F2;{ Угол конуса впадин колеса }
  // Output.Sce2:=Sce2;{ Врешняя постоянная хорда }
  // Output.Hce2:=Hce2;{ Измерительная высота }
  // Output.Rs:=Rs;{ Среднее конусное расстояние по делительному конусу }
  // Output.B:=B;{ Ширина венца }
  // Output.b1:=b1;{ Расстояние от вершины конуса до базовой поверхности }
  // Output.b2:=b2;
  // Output.H_e1:=H_e1;{ Высота зуба на внешнем торце }
  // Output.H_e2:=H_e2;{ Высота зуба на внешнем торце }
  // Output.d0:=d0;{ Диаметр резцовой головки }
  // Output.Sigma_H:=Sigma_H;{ Контактное напряжение }
  // Output.T1:=T1;{ Момент, передаваемый быстроходным валом }
  // Output.T2:=T2;{ Момент, передаваемый тихоходным валом }
  // Output.Ft1:=Ft1;{ Окружное усилие шестерни }
  // Output.Fr1:=Fr1;{ Радиальное усилие шестерни }
  // Output.Fx1:=Fx1;{ Осевое усилие шестерни }
  // Output.Ft2:=Ft2;{ Окружное усилие колеса }
  // Output.Fr2:=Fr2;{ Радиальное усилие колеса }
  // Output.Fx2:=Fx2;{ Осевое усилие колеса }
  // Output.Epsias:=Epsias;
  // Output.Error:=Error;

  // vivod;
end;

function TPer.okonchatelniy_vibor(mc:string; var ArSigma_Flim0: ArraySigma_Flim0;
    ArS_F: ArrayS_F; ArSigma_t: ArraySigma_t; ArSigma_Fst0: ArraySigma_Fst0):TMark;
begin
  if mc = '12ХН2 ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[1];
    ArS_F[1] := S_Fa[1];
    ArSigma_t[1] := Sigma_ta[1];
    ArSigma_Fst0[1] := Sigma_Fst0a[1];
  end;

  if mc = '12ХН3А ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[2];
    ArS_F[1] := S_Fa[2];
    ArSigma_t[1] := Sigma_ta[2];
    ArSigma_Fst0[1] := Sigma_Fst0a[2];
  end;

  if mc = '12Х2Н4А ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[3];
    ArS_F[1] := S_Fa[3];
    ArSigma_t[1] := Sigma_ta[3];
    ArSigma_Fst0[1] := Sigma_Fst0a[3];
  end;

  if mc = '15ХГНТА ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[4];
    ArS_F[1] := S_Fa[4];
    ArSigma_t[1] := Sigma_ta[4];
    ArSigma_Fst0[1] := Sigma_Fst0a[4];
  end;

  if mc = '18ХГТ ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[5];
    ArS_F[1] := S_Fa[5];
    ArSigma_t[1] := Sigma_ta[5];
    ArSigma_Fst0[1] := Sigma_Fst0a[5];

    ArSigma_Flim0[1] := Sigma_Flim0a[6];
    ArS_F[1] := S_Fa[6];
    ArSigma_t[1] := Sigma_ta[6];
    ArSigma_Fst0[1] := Sigma_Fst0a[6];
  end;

  if mc = '18Х2Н4ВА ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[7];
    ArS_F[1] := S_Fa[7];
    ArSigma_t[1] := Sigma_ta[7];
    ArSigma_Fst0[1] := Sigma_Fst0a[7];

    ArSigma_Flim0[1] := Sigma_Flim0a[8];
    ArS_F[1] := S_Fa[8];
    ArSigma_t[1] := Sigma_ta[8];
    ArSigma_Fst0[1] := Sigma_Fst0a[8];
  end;

  if mc = '20Х ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[9];
    ArS_F[1] := S_Fa[9];
    ArSigma_t[1] := Sigma_ta[9];
    ArSigma_Fst0[1] := Sigma_Fst0a[9];
  end;

  if mc = '20ХН ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[10];
    ArS_F[1] := S_Fa[10];
    ArSigma_t[1] := Sigma_ta[10];
    ArSigma_Fst0[1] := Sigma_Fst0a[10];
  end;

  if mc = '20ХН2М ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[11];
    ArS_F[1] := S_Fa[11];
    ArSigma_t[1] := Sigma_ta[11];
    ArSigma_Fst0[1] := Sigma_Fst0a[11];
  end;

  if mc = '20ХН3А ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[12];
    ArS_F[1] := S_Fa[12];
    ArSigma_t[1] := Sigma_ta[12];
    ArSigma_Fst0[1] := Sigma_Fst0a[12];

    ArSigma_Flim0[2] := Sigma_Flim0a[13];
    ArS_F[2] := S_Fa[13];
    ArSigma_t[2] := Sigma_ta[13];
    ArSigma_Fst0[2] := Sigma_Fst0a[13];
  end;

  if mc = '20Х2Н4А ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[14];
    ArS_F[1] := S_Fa[14];
    ArSigma_t[1] := Sigma_ta[14];
    ArSigma_Fst0[1] := Sigma_Fst0a[14];

    ArSigma_Flim0[1] := Sigma_Flim0a[15];
    ArS_F[1] := S_Fa[15];
    ArSigma_t[1] := Sigma_ta[15];
    ArSigma_Fst0[1] := Sigma_Fst0a[15];
  end;

  if mc = '20ХГР ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[16];
    ArS_F[1] := S_Fa[16];
    ArSigma_t[1] := Sigma_ta[16];
    ArSigma_Fst0[1] := Sigma_Fst0a[16];
  end;

  if mc = '25ХГТМА ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[17];
    ArS_F[1] := S_Fa[17];
    ArSigma_t[1] := Sigma_ta[17];
    ArSigma_Fst0[1] := Sigma_Fst0a[17];
  end;

  if mc = '30ХГТ ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[18];
    ArS_F[1] := S_Fa[18];
    ArSigma_t[1] := Sigma_ta[18];
    ArSigma_Fst0[1] := Sigma_Fst0a[18];

    ArSigma_Flim0[1] := Sigma_Flim0a[19];
    ArS_F[1] := S_Fa[19];
    ArSigma_t[1] := Sigma_ta[19];
    ArSigma_Fst0[1] := Sigma_Fst0a[19];

    ArSigma_Flim0[1] := Sigma_Flim0a[22];
    ArS_F[1] := S_Fa[22];
    ArSigma_t[1] := Sigma_ta[22];
    ArSigma_Fst0[1] := Sigma_Fst0a[22];
  end;

  if mc = '25ХГМ ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[20];
    ArS_F[1] := S_Fa[20];
    ArSigma_t[1] := Sigma_ta[20];
    ArSigma_Fst0[1] := Sigma_Fst0a[20];
  end;

  if mc = '25ХГТ ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[21];
    ArS_F[1] := S_Fa[21];
    ArSigma_t[1] := Sigma_ta[21];
    ArSigma_Fst0[1] := Sigma_Fst0a[21];
  end;

  if mc = '35ХМ ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[23];
    ArS_F[1] := S_Fa[23];
    ArSigma_t[1] := Sigma_ta[23];
    ArSigma_Fst0[1] := Sigma_Fst0a[23];

    ArSigma_Flim0[1] := Sigma_Flim0a[24];
    ArS_F[1] := S_Fa[24];
    ArSigma_t[1] := Sigma_ta[24];
    ArSigma_Fst0[1] := Sigma_Fst0a[24];
  end;

  if mc = '40 ГОСТ 1050-74' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[25];
    ArS_F[1] := S_Fa[25];
    ArSigma_t[1] := Sigma_ta[25];
    ArSigma_Fst0[1] := Sigma_Fst0a[25];

    ArSigma_Flim0[2] := Sigma_Flim0a[26];
    ArS_F[2] := S_Fa[26];
    ArSigma_t[2] := Sigma_ta[26];
    ArSigma_Fst0[2] := Sigma_Fst0a[26];
  end;

  if mc = '40Х ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[27];
    ArS_F[1] := S_Fa[27];
    ArSigma_t[1] := Sigma_ta[27];
    ArSigma_Fst0[1] := Sigma_Fst0a[27];

    ArSigma_Flim0[2] := Sigma_Flim0a[28];
    ArS_F[2] := S_Fa[28];
    ArSigma_t[2] := Sigma_ta[28];
    ArSigma_Fst0[2] := Sigma_Fst0a[28];

    ArSigma_Flim0[3] := Sigma_Flim0a[29];
    ArS_F[3] := S_Fa[29];
    ArSigma_t[3] := Sigma_ta[29];
    ArSigma_Fst0[3] := Sigma_Fst0a[29];

    ArSigma_Flim0[4] := Sigma_Flim0a[30];
    ArS_F[4] := S_Fa[30];
    ArSigma_t[4] := Sigma_ta[30];
    ArSigma_Fst0[4] := Sigma_Fst0a[30];

    ArSigma_Flim0[3] := Sigma_Flim0a[31];
    ArS_F[3] := S_Fa[31];
    ArSigma_t[3] := Sigma_ta[31];
    ArSigma_Fst0[3] := Sigma_Fst0a[31];

    ArSigma_Flim0[4] := Sigma_Flim0a[32];
    ArS_F[4] := S_Fa[32];
    ArSigma_t[4] := Sigma_ta[32];
    ArSigma_Fst0[4] := Sigma_Fst0a[32];
  end;

  if mc = '40ХН ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[33];
    ArS_F[1] := S_Fa[33];
    ArSigma_t[1] := Sigma_ta[33];
    ArSigma_Fst0[1] := Sigma_Fst0a[33];

    ArSigma_Flim0[2] := Sigma_Flim0a[34];
    ArS_F[2] := S_Fa[34];
    ArSigma_t[2] := Sigma_ta[34];
    ArSigma_Fst0[2] := Sigma_Fst0a[34];

    ArSigma_Flim0[3] := Sigma_Flim0a[35];
    ArS_F[3] := S_Fa[35];
    ArSigma_t[3] := Sigma_ta[35];
    ArSigma_Fst0[3] := Sigma_Fst0a[35];

    ArSigma_Flim0[4] := Sigma_Flim0a[36];
    ArS_F[4] := S_Fa[36];
    ArSigma_t[4] := Sigma_ta[36];
    ArSigma_Fst0[4] := Sigma_Fst0a[36];

    ArSigma_Flim0[3] := Sigma_Flim0a[37];
    ArS_F[3] := S_Fa[37];
    ArSigma_t[3] := Sigma_ta[37];
    ArSigma_Fst0[3] := Sigma_Fst0a[37];

    ArSigma_Flim0[4] := Sigma_Flim0a[38];
    ArS_F[4] := S_Fa[38];
    ArSigma_t[4] := Sigma_ta[38];
    ArSigma_Fst0[4] := Sigma_Fst0a[38];
  end;

  if mc = '40ХФА ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[39];
    ArS_F[1] := S_Fa[39];
    ArSigma_t[1] := Sigma_ta[39];
    ArSigma_Fst0[1] := Sigma_Fst0a[39];

    ArSigma_Flim0[2] := Sigma_Flim0a[40];
    ArS_F[2] := S_Fa[40];
    ArSigma_t[2] := Sigma_ta[40];
    ArSigma_Fst0[2] := Sigma_Fst0a[40];

    ArSigma_Flim0[3] := Sigma_Flim0a[41];
    ArS_F[3] := S_Fa[41];
    ArSigma_t[3] := Sigma_ta[41];
    ArSigma_Fst0[3] := Sigma_Fst0a[41];

    ArSigma_Flim0[3] := Sigma_Flim0a[42];
    ArS_F[3] := S_Fa[42];
    ArSigma_t[3] := Sigma_ta[42];
    ArSigma_Fst0[3] := Sigma_Fst0a[42];
  end;

  if mc = '40ХН2МА ГОСТ 4543-71' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[43];
    ArS_F[1] := S_Fa[43];
    ArSigma_t[1] := Sigma_ta[43];
    ArSigma_Fst0[1] := Sigma_Fst0a[43];

    ArSigma_Flim0[2] := Sigma_Flim0a[44];
    ArS_F[2] := S_Fa[44];
    ArSigma_t[2] := Sigma_ta[44];
    ArSigma_Fst0[2] := Sigma_Fst0a[44];

    ArSigma_Flim0[3] := Sigma_Flim0a[45];
    ArS_F[3] := S_Fa[45];
    ArSigma_t[3] := Sigma_ta[45];
    ArSigma_Fst0[3] := Sigma_Fst0a[45];

    ArSigma_Flim0[4] := Sigma_Flim0a[46];
    ArS_F[4] := S_Fa[46];
    ArSigma_t[4] := Sigma_ta[46];
    ArSigma_Fst0[4] := Sigma_Fst0a[46];

    ArSigma_Flim0[4] := Sigma_Flim0a[47];
    ArS_F[4] := S_Fa[47];
    ArSigma_t[4] := Sigma_ta[47];
    ArSigma_Fst0[4] := Sigma_Fst0a[47];
  end;

  if mc = '45 ГОСТ 1050-74' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[48];
    ArS_F[1] := S_Fa[48];
    ArSigma_t[1] := Sigma_ta[48];
    ArSigma_Fst0[1] := Sigma_Fst0a[48];

    ArSigma_Flim0[2] := Sigma_Flim0a[49];
    ArS_F[2] := S_Fa[49];
    ArSigma_t[2] := Sigma_ta[49];
    ArSigma_Fst0[2] := Sigma_Fst0a[49];
  end;

  if mc = '50ХН ГОСТ 1050-74' then
  begin
    ArSigma_Flim0[1] := Sigma_Flim0a[50];
    ArS_F[1] := S_Fa[50];
    ArSigma_t[1] := Sigma_ta[50];
    ArSigma_Fst0[1] := Sigma_Fst0a[50];
  end;
end;

function TPer.okonchatelniy_vibor_2(mc: string; termobr: integer): Tmark;
begin
  if (mc = '12ХН2 ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[1];
    Result.S_F1  := S_Fa[1];
    Result.Sigma_t1  := Sigma_ta[1];
    Result.Sigma_Fst01  := Sigma_Fst0a[1];
  end;

  if (mc = '12ХН3А ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[2];
    Result.S_F1  := S_Fa[2];
    Result.Sigma_t1  := Sigma_ta[2];
    Result.Sigma_Fst01  := Sigma_Fst0a[2];
  end;

  if (mc = '12Х2Н4А ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[3];
    Result.S_F1  := S_Fa[3];
    Result.Sigma_t1  := Sigma_ta[3];
    Result.Sigma_Fst01  := Sigma_Fst0a[3];
  end;

  if (mc = '15ХГНТА ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[4];
    Result.S_F1  := S_Fa[4];
    Result.Sigma_t1  := Sigma_ta[4];
    Result.Sigma_Fst01  := Sigma_Fst0a[4];
  end;

  if (mc = '18ХГТ ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[5];
    Result.S_F1  := S_Fa[5];
    Result.Sigma_t1  := Sigma_ta[5];
    Result.Sigma_Fst01  := Sigma_Fst0a[5];
  end;

  {if (mc = '18ХГТ ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[6];
    Result.S_F1  := S_Fa[6];
    Result.Sigma_t1  := Sigma_ta[6];
    Result.Sigma_Fst01  := Sigma_Fst0a[6];
  end;}

  if (mc = '18Х2Н4ВА ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[7];
    Result.S_F1  := S_Fa[7];
    Result.Sigma_t1  := Sigma_ta[7];
    Result.Sigma_Fst01  := Sigma_Fst0a[7];
  end;

  {if (mc = '18Х2Н4ВА ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[8];
    Result.S_F1  := S_Fa[8];
    Result.Sigma_t1  := Sigma_ta[8];
    Result.Sigma_Fst01  := Sigma_Fst0a[8];
  end;}

  if (mc = '20Х ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[9];
    Result.S_F1  := S_Fa[9];
    Result.Sigma_t1  := Sigma_ta[9];
    Result.Sigma_Fst01  := Sigma_Fst0a[9];
  end;

  if (mc = '20ХН ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[10];
    Result.S_F1  := S_Fa[10];
    Result.Sigma_t1  := Sigma_ta[10];
    Result.Sigma_Fst01  := Sigma_Fst0a[10];
  end;

  if (mc = '20ХН2М ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[11];
    Result.S_F1  := S_Fa[11];
    Result.Sigma_t1  := Sigma_ta[11];
    Result.Sigma_Fst01  := Sigma_Fst0a[11];
  end;

  if (mc = '20ХН3А ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[12];
    Result.S_F1  := S_Fa[12];
    Result.Sigma_t1  := Sigma_ta[12];
    Result.Sigma_Fst01  := Sigma_Fst0a[12];
  end;

  if (mc = '20ХН3А ГОСТ 4543-71') and (termobr=6) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[13];
    Result.S_F1  := S_Fa[13];
    Result.Sigma_t1  := Sigma_ta[13];
    Result.Sigma_Fst01  := Sigma_Fst0a[13];
  end;

  if (mc = '20Х2Н4А ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[14];
    Result.S_F1  := S_Fa[14];
    Result.Sigma_t1  := Sigma_ta[14];
    Result.Sigma_Fst01  := Sigma_Fst0a[14];
  end;

  {if (mc = '20Х2Н4А ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[15];
    Result.S_F1  := S_Fa[15];
    Result.Sigma_t1  := Sigma_ta[15];
    Result.Sigma_Fst01  := Sigma_Fst0a[15];
  end;}

  if (mc = '20ХГР ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[16];
    Result.S_F1  := S_Fa[16];
    Result.Sigma_t1  := Sigma_ta[16];
    Result.Sigma_Fst01  := Sigma_Fst0a[16];
  end;

  if (mc = '25ХГТМА ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[17];
    Result.S_F1  := S_Fa[17];
    Result.Sigma_t1  := Sigma_ta[17];
    Result.Sigma_Fst01  := Sigma_Fst0a[17];
  end;

  if (mc = '30ХГТ ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[18];
    Result.S_F1  := S_Fa[18];
    Result.Sigma_t1  := Sigma_ta[18];
    Result.Sigma_Fst01  := Sigma_Fst0a[18];
  end;

  {if (mc = '30ХГТ ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[19];
    Result.S_F1  := S_Fa[19];
    Result.Sigma_t1  := Sigma_ta[19];
    Result.Sigma_Fst01  := Sigma_Fst0a[19];
  end;

  if (mc = '30ХГТ ГОСТ 4543-71') and (termobr=5) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[22];
    Result.S_F1  := S_Fa[22];
    Result.Sigma_t1  := Sigma_ta[22];
    Result.Sigma_Fst01  := Sigma_Fst0a[22];
  end;}

  if (mc = '25ХГМ ГОСТ 4543-71') and (termobr=6) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[20];
    Result.S_F1  := S_Fa[20];
    Result.Sigma_t1  := Sigma_ta[20];
    Result.Sigma_Fst01  := Sigma_Fst0a[20];
  end;

  {if (mc = '25ХГТ ГОСТ 4543-71') and (termobr=) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[21];
    Result.S_F1  := S_Fa[21];
    Result.Sigma_t1  := Sigma_ta[21];
    Result.Sigma_Fst01  := Sigma_Fst0a[21];
  end;}

  if (mc = '35ХМ ГОСТ 4543-71') and (termobr=4) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[23];
    Result.S_F1  := S_Fa[23];
    Result.Sigma_t1  := Sigma_ta[23];
    Result.Sigma_Fst01  := Sigma_Fst0a[23];
  end;

  {if (mc = '35ХМ ГОСТ 4543-71') and (termobr=4) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[24];
    Result.S_F1  := S_Fa[24];
    Result.Sigma_t1  := Sigma_ta[24];
    Result.Sigma_Fst01  := Sigma_Fst0a[24];
  end;}

  if (mc = '40 ГОСТ 1050-74') and (termobr=1) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[25];
    Result.S_F1  := S_Fa[25];
    Result.Sigma_t1  := Sigma_ta[25];
    Result.Sigma_Fst01  := Sigma_Fst0a[25];
  end;

  if (mc = '40 ГОСТ 1050-74') and (termobr=2) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[26];
    Result.S_F1  := S_Fa[26];
    Result.Sigma_t1  := Sigma_ta[26];
    Result.Sigma_Fst01  := Sigma_Fst0a[26];
  end;

  if (mc = '40Х ГОСТ 4543-71') and (termobr=1) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[27];
    Result.S_F1  := S_Fa[27];
    Result.Sigma_t1  := Sigma_ta[27];
    Result.Sigma_Fst01  := Sigma_Fst0a[27];
  end;

  if (mc = '40Х ГОСТ 4543-71') and (termobr=2) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[28];
    Result.S_F1  := S_Fa[28];
    Result.Sigma_t1  := Sigma_ta[28];
    Result.Sigma_Fst01  := Sigma_Fst0a[28];
  end;

  if (mc = '40Х ГОСТ 4543-71') and (termobr=3) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[29];
    Result.S_f1  := S_Fa[29];
    Result.Sigma_t1  := Sigma_ta[29];
    Result.Sigma_Fst01  := Sigma_Fst0a[29];
  end;

  if (mc = '40Х ГОСТ 4543-71') and (termobr=4) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[30];
    Result.S_f1  := S_Fa[30];
    Result.Sigma_t1  := Sigma_ta[30];
    Result.Sigma_Fst01  := Sigma_Fst0a[30];
  end;

  {if (mc = '40Х ГОСТ 4543-71') and (termobr=) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[31];
    Result.S_f1  := S_Fa[31];
    Result.Sigma_t1  := Sigma_ta[31];
    Result.Sigma_Fst01  := Sigma_Fst0a[31];
  end;

  if (mc = '40Х ГОСТ 4543-71') and (termobr=) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[32];
    Result.S_f1  := S_Fa[32];
    Result.Sigma_t1  := Sigma_ta[32];
    Result.Sigma_Fst01  := Sigma_Fst0a[32];
  end;}

  if (mc = '40ХН ГОСТ 4543-71') and (termobr=1) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[33];
    Result.S_F1  := S_Fa[33];
    Result.Sigma_t1  := Sigma_ta[33];
    Result.Sigma_Fst01  := Sigma_Fst0a[33];
  end;

  if (mc = '40ХН ГОСТ 4543-71') and (termobr=2) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[34];
    Result.S_F1  := S_Fa[34];
    Result.Sigma_t1  := Sigma_ta[34];
    Result.Sigma_Fst01  := Sigma_Fst0a[34];
  end;

  if (mc = '40ХН ГОСТ 4543-71') and (termobr=3) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[35];
    Result.S_f1  := S_Fa[35];
    Result.Sigma_t1  := Sigma_ta[35];
    Result.Sigma_Fst01  := Sigma_Fst0a[35];
  end;

  if (mc = '40ХН ГОСТ 4543-71') and (termobr=4) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[36];
    Result.S_f1  := S_Fa[36];
    Result.Sigma_t1  := Sigma_ta[36];
    Result.Sigma_Fst01  := Sigma_Fst0a[36];
  end;

  {if (mc = '40ХН ГОСТ 4543-71') and (termobr=) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[37];
    Result.S_f1  := S_Fa[37];
    Result.Sigma_t1  := Sigma_ta[37];
    Result.Sigma_Fst01  := Sigma_Fst0a[37];
  end;

  if (mc = '40ХН ГОСТ 4543-71') and (termobr=) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[38];
    Result.S_f1  := S_Fa[38];
    Result.Sigma_t1  := Sigma_ta[38];
    Result.Sigma_Fst01  := Sigma_Fst0a[38];
  end;}

  if (mc = '40ХФА ГОСТ 4543-71') and (termobr=1) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[39];
    Result.S_F1  := S_Fa[39];
    Result.Sigma_t1  := Sigma_ta[39];
    Result.Sigma_Fst01  := Sigma_Fst0a[39];
  end;

  if (mc = '40ХФА ГОСТ 4543-71') and (termobr=2) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[40];
    Result.S_F1  := S_Fa[40];
    Result.Sigma_t1  := Sigma_ta[40];
    Result.Sigma_Fst01  := Sigma_Fst0a[40];
  end;

  if (mc = '40ХФА ГОСТ 4543-71') and (termobr=3) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[41];
    Result.S_f1  := S_Fa[41];
    Result.Sigma_t1  := Sigma_ta[41];
    Result.Sigma_Fst01  := Sigma_Fst0a[41];
  end;

  {if (mc = '40ХФА ГОСТ 4543-71') and (termobr=) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[42];
    Result.S_f1  := S_Fa[42];
    Result.Sigma_t1  := Sigma_ta[42];
    Result.Sigma_Fst01  := Sigma_Fst0a[42];
  end;}

  if (mc = '40ХН2МА ГОСТ 4543-71') and (termobr=1) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[43];
    Result.S_F1  := S_Fa[43];
    Result.Sigma_t1  := Sigma_ta[43];
    Result.Sigma_Fst01  := Sigma_Fst0a[43];
  end;

  if (mc = '40ХН2МА ГОСТ 4543-71') and (termobr=2) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[44];
    Result.S_F1  := S_Fa[44];
    Result.Sigma_t1  := Sigma_ta[44];
    Result.Sigma_Fst01  := Sigma_Fst0a[44];
  end;

  if (mc = '40ХН2МА ГОСТ 4543-71') and (termobr=3) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[45];
    Result.S_f1  := S_Fa[45];
    Result.Sigma_t1  := Sigma_ta[45];
    Result.Sigma_Fst01  := Sigma_Fst0a[45];
  end;

  if (mc = '40ХН2МА ГОСТ 4543-71') and (termobr=4) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[46];
    Result.S_f1  := S_Fa[46];
    Result.Sigma_t1  := Sigma_ta[46];
    Result.Sigma_Fst01  := Sigma_Fst0a[46];
  end;

  {if (mc = '40ХН2МА ГОСТ 4543-71') and (termobr=) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[47];
    Result.S_f1  := S_Fa[47];
    Result.Sigma_t1  := Sigma_ta[47];
    Result.Sigma_Fst01  := Sigma_Fst0a[47];
  end;}

  if (mc = '45 ГОСТ 1050-74') and (termobr=1) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[48];
    Result.S_F1  := S_Fa[48];
    Result.Sigma_t1  := Sigma_ta[48];
    Result.Sigma_Fst01  := Sigma_Fst0a[48];
  end;

  if (mc = '45 ГОСТ 1050-74') and (termobr=2) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[49];
    Result.S_F1  := S_Fa[49];
    Result.Sigma_t1  := Sigma_ta[49];
    Result.Sigma_Fst01  := Sigma_Fst0a[49];
  end;

  if (mc = '50ХН ГОСТ 1050-74') and (termobr=3) then
  begin
    Result.Sigma_Flim01  := Sigma_Flim0a[50];
    Result.S_F1  := S_Fa[50];
    Result.Sigma_t1  := Sigma_ta[50];
    Result.Sigma_Fst01  := Sigma_Fst0a[50];
  end;
end;

procedure TPer.vivod;
begin
  showmessage('       1. Исходные данные' + #13#10 +
    'Мощность на ведущем валу, кВт............' + FloatToStrF(P1, ffFixed, 20,
    2) + #13#10 + 'Частота вращения шестерни, об/мин........' + FloatToStrF(N1,
    ffFixed, 20, 2) + #13#10 + 'Проектное передаточное число.............' +
    FloatToStrF(U, ffFixed, 20, 2) + #13#10 +
    'Расчетный срок службы, час...............' + IntToStr(Lh) + #13#10 +
    'Материал шестерни........................' + mc1 + #13#10 +
    'Термообработка шестерни..................' + IntToStr(Termobr1) + #13#10 +
    'Материал колеса..........................' + mc2 + #13#10 +
    'Термообработка колеса....................' + IntToStr(Termobr2) + #13#10 +
    'Заготовка шестерни.......................' + IntToStr(Zagotowka[1]) +
    #13#10 + 'Заготовка колеса.........................' + IntToStr(Zagotowka[2]
    ) + #13#10 + 'Тип зубьев...............................' + IntToStr(Tipz) +
    #13#10 + 'Форма зуба...............................' + IntToStr(Forma) +
    #13#10 + 'Направление вращения.....................' + rewers.ToString +
    #13#10 + 'Направление наклона зуба.................' + Napr_Vr.ToString +
    #13#10 + 'Фактическое передаточное число...........' + FloatToStrF(Uf,
    ffFixed, 20, 2) + #13#10 + '' + #13#10 +
    '       2. Кинематические параметры' + #13#10 +
    'Частота вращения шестерни, об/мин........' + FloatToStrF(N1, ffFixed, 20,
    2) + #13#10 + 'Частота вращения колеса, об/мин..........' + FloatToStrF(n2,
    ffFixed, 20, 2) + #13#10 + 'Линейная скорость, м/с...................' +
    FloatToStrF(V, ffFixed, 20, 2) + #13#10 +
    'Нормальный модуль, мм....................' + FloatToStrF(Mn, ffFixed, 20,
    2) + #13#10 + '' + #13#10 + '       3. Параметры передачи' + #13#10 +
    'Торцевой модуль, мм......................' + FloatToStrF(Mte, ffFixed, 20,
    2) + #13#10 + 'Конусное расстояние передачи, мм.........' + FloatToStrF(Re,
    ffFixed, 20, 2) + #13#10 + 'Угол делительного конуса шестерни........' +
    IntToStr(Trunc(Delta1 * 180 / Pi)) + '°' +
    IntToStr(Trunc(frac(Delta1 * 180 / Pi) * 60)) + '''' +
    IntToStr(Trunc(frac(frac(Delta1 * 180 / Pi) * 60) * 60)) + '"' + #13#10 +
    'Угол делительного конуса колеса..........' +
    IntToStr(Trunc(Delta2 * 180 / Pi)) + '°' +
    IntToStr(Trunc(frac(Delta2 * 180 / Pi) * 60)) + '''' +
    IntToStr(Trunc(frac(frac(Delta2 * 180 / Pi) * 60) * 60)) + '"' + #13#10 +
    'Угол выступов конуса шестерни............' +
    IntToStr(Trunc(Delta_A1 * 180 / Pi)) + '°' +
    IntToStr(Trunc(frac(Delta_A1 * 180 / Pi) * 60)) + '''' +
    IntToStr(Trunc(frac(frac(Delta_A1 * 180 / Pi) * 60) * 60)) + '"' + #13#10 +
    'Угол выступов конуса колеса..............' +
    IntToStr(Trunc(Delta_A2 * 180 / Pi)) + '°' +
    IntToStr(Trunc(frac(Delta_A2 * 180 / Pi) * 60)) + '''' +
    IntToStr(Trunc(frac(frac(Delta_A2 * 180 / Pi) * 60) * 60)) + '"' + #13#10 +
    'Угол впадин конуса шестерни..............' +
    IntToStr(Trunc(Delta_F1 * 180 / Pi)) + '°' +
    IntToStr(Trunc(frac(Delta_F1 * 180 / Pi) * 60)) + '''' +
    IntToStr(Trunc(frac(frac(Delta_F1 * 180 / Pi) * 60) * 60)) + '"' + #13#10 +
    'Угол впадин конуса колеса................' +
    IntToStr(Trunc(Delta_F2 * 180 / Pi)) + '°' +
    IntToStr(Trunc(frac(Delta_F2 * 180 / Pi) * 60)) + '''' +
    IntToStr(Trunc(frac(frac(Delta_F2 * 180 / Pi) * 60) * 60)) + '"' + #13#10 +
    'Суммарный коэфф. перекрытия..............' + FloatToStrF(Epsias, ffFixed,
    20, 2) + #13#10 + 'Степень точности.........................' + IntToStr(St)
    + #13#10 + 'Число зубьев шестерни....................' + IntToStr(z1) +
    #13#10 + 'Число зубьев колеса......................' + IntToStr(z2) + #13#10
    + 'Коэфф. смещения исх. контура шестерни....' + FloatToStrF(x1, ffFixed, 20,
    2) + #13#10 + 'Коэфф. смещения исх. контура колеса......' + FloatToStrF(x2,
    ffFixed, 20, 2) + #13#10 + 'Коэфф. тангенц. смещения для шестерни....' +
    FloatToStrF(xn1, ffFixed, 20, 2) + #13#10 +
    'Коэфф. тангенц. смещения для колеса......' + FloatToStrF(xn2, ffFixed, 20,
    2) + #13#10 + '' + #13#10 + '       4. Размеры колес' + #13#10 +
    'Диаметр конуса вершин шестерни, мм.......' + FloatToStrF(de1, ffFixed, 20,
    2) + #13#10 + 'Делительный диаметр шестерни, мм.........' +
    FloatToStrF(Dae1, ffFixed, 20, 2) + #13#10 +
    'Диаметр конуса впадин шестерни, мм.......' + FloatToStrF(Dfe1, ffFixed, 20,
    2) + #13#10 + 'Расст. до базовой поверх. шестерни, мм...' + FloatToStrF(b1,
    ffFixed, 20, 2) + #13#10 + 'Диаметр конуса вершин колеса, мм.........' +
    FloatToStrF(de2, ffFixed, 20, 2) + #13#10 +
    'Делительный диаметр колеса, мм...........' + FloatToStrF(Dae2, ffFixed, 20,
    2) + #13#10 + 'Диаметр конуса впадин колеса, мм.........' +
    FloatToStrF(Dfe2, ffFixed, 20, 2) + #13#10 +
    'Расст. до базовой поверх. колеса, мм.....' + FloatToStrF(b2, ffFixed, 20,
    2) + #13#10 + 'Ширина венца, мм.........................' + FloatToStrF(B,
    ffFixed, 20, 2) + #13#10 + '' + #13#10 +
    '       5. Прочностные и силовые параметры' + #13#10 +
    'Контактное напряжение, Мпа...............' + FloatToStrF(Sigma_H, ffFixed,
    20, 2) + #13#10 + 'Момент на быстроходном валу, Нм..........' +
    FloatToStrF(T1, ffFixed, 20, 2) + #13#10 +
    'Момент на тихоходном валу, Нм............' + FloatToStrF(T2, ffFixed, 20,
    2) + #13#10 + 'Суммарное давление на вал, Н.............' + FloatToStrF(Fv,
    ffFixed, 20, 2) + #13#10 + 'Окружное усилие шестерни, Н..............' +
    FloatToStrF(Ft1, ffFixed, 20, 2) + #13#10 +
    'Радиальное усилие шестерни, Н............' + FloatToStrF(Fr1, ffFixed, 20,
    2) + #13#10 + 'Осевое усилие шестерни, Н................' + FloatToStrF(Fx1,
    ffFixed, 20, 2) + #13#10 + 'Окружное усилие колеса, Н................' +
    FloatToStrF(Ft2, ffFixed, 20, 2) + #13#10 +
    'Радиальное усилие колеса, Н..............' + FloatToStrF(Fr2, ffFixed, 20,
    2) + #13#10 + 'Осевое усилие колеса, Н..................' + FloatToStrF(Fx2,
    ffFixed, 20, 2));
end;

procedure MasOutputOnForm(mascount1: Integer; var Output: TParOutput);
begin
  Output := masOutput[mascount1];
end;

procedure TPer.ParamToRec(Input: TParInput);
var
  Da, Da1, da2, Sigma_Flim0, Sigma_Fst0, Sigma_t: Extended;
begin
  K_Hbeta := Input.K_Hbeta;
  Da := Input.Da;
  Da1 := Input.Da1;
  da2 := Input.da2;
  Sigma_Flim0 := Input.Sigma_Flim0;
  S_f := Input.S_f;
  Sigma_Hpmax := Input.Sigma_Hpmax;
  Sigma_Fmax1 := Input.Sigma_Fmax1;
  Sigma_Fpmax1 := Input.Sigma_Fpmax1;
  Sigma_Fmax2 := Input.Sigma_Fmax2;
  Sigma_Fpmax2 := Input.Sigma_Fpmax2;
  Sigma_Hpmax1 := Input.Sigma_Hpmax1;
  Sigma_Hpmax2 := Input.Sigma_Hpmax2;
  Sigma_Fst0 := Input.Sigma_Fst0;
  Sigma_t := Input.Sigma_t;
  Loading := Input.Loading;
  P1 := Input.P1; { Мощность, передаваемая быстроходным валом }
  N1 := Input.N1; { Частота вращения быстроходного вала }
  U := Input.U; { Передаточное число передачи }
  DeltaU := Input.DeltaU;
  Lh := Input.Lh; { Расчетный ресурс передачи }
  Tipz := Input.Tipz; { тип зубьев колес: 1 - прямые
    2 - косые
    0 - автовыбор }
  Napr_Vr := Input.Napr_Vr; { Направление наклона зуба }
  TipOpor := Input.TipOpor;
  Forma := Input.Forma; { Форма зуба }
  mc1 := Input.mc1; { марка стали для шестерни }
  mc2 := Input.mc2; { марка стали для колеса }
  Termobr1 := Input.Termobr1; { термообработка зуба шестерни, номер }
  Termobr2 := Input.Termobr2; { термообработка зуба колеса, номер }
  Zagotowka := Input.Zagotowka; { Способ получения заготовки шестерни и колеса
    = 1 для поковок
    = 2 для штамповок
    = 3 для проката
    = 4 для отливок }
  Ra1 := Input.Ra1; { Шероховатость боковой поверхности зуба шестерни }
  Ra2 := Input.Ra2; { Шероховатость боковой поверхности зуба колеса }
  Nom_sx := Input.Nom_sx; { Номер схемы расположения колес }
  Nagr := Input.Nagr; { =1 для типового режима,
    = 0 для циклограммы }
  rewers := Input.rewers; { При реверсировании = 1; без реверсирования = 0 }
  Ka := Input.Ka; { Коэффициент внешней динамики }
  otw1 := Input.otw1; { При стандартном межосевом расстоянии = 'Y',
    при нестандартном межосевом расстоянии ='n' }
  H_HRcs1 := Input.H_HRcs1; { Твердость сердцевины зуба шестерни по Роквеллу }
  H_HRcs2 := Input.H_HRcs2; { Твердость сердцевины зуба колеса по Роквеллу }
  H_HRcp1 := Input.H_HRcp1; { Твердость поверхности зуба шестерни по Роквеллу }
  H_HRcp2 := Input.H_HRcp2; { Твердость поверхности зуба колеса по Роквеллу }
  H_HBs1 := Input.H_HBs1; { Твердость сердцевины зуба шестерни по Бринелю }
  H_HBs2 := Input.H_HBs2; { Твердость сердцевины зуба колеса по Бринелю }
  H_HBp1 := Input.H_HBp1; { Твердость поверхности зуба шестерни по Бринелю }
  H_HBp2 := Input.H_HBp2; { Твердость поверхности зуба колеса по Бринелю }
  H_HVs1 := Input.H_HVs1; { Твердость сердцевины зуба шестерни по Виккерсу }
  H_HVs2 := Input.H_HVs2; { Твердость сердцевины зуба колеса по Виккерсу }
  H_HVp1 := Input.H_HVp1; { Твердость поверхности зуба шестерни по Виккерсу }
  H_HVp2 := Input.H_HVp2; { Твердость поверхности зуба колеса по Виккерсу }
  S_f1 := Input.S_f1; { Коэффициент выносливости по изгибу для шестерни }
  S_f2 := Input.S_f2; { Коэффициент выносливости по изгибу для колеса }
  Sigma_t1 := Input.Sigma_t1; { Предел текучести материала шестерни }
  Sigma_t2 := Input.Sigma_t2; { Предел текучести материала колеса }
  Sigma_Flim01 := Input.Sigma_Flim01;
  { Предел выносливости по изгибу для шестерни }
  Sigma_Flim02 := Input.Sigma_Flim02;
  { Предел выносливости по изгибу для колеса }
  Sigma_Fst01 := Input.Sigma_Fst01; { Предельное напряжение для шестерни }
  Sigma_Fst02 := Input.Sigma_Fst02; { Предельное напряжение для колеса }
  Sigma_Hp := Input.Sigma_Hp;
  Sigma_Hp1 := Input.Sigma_Hp1;
  Sigma_Hp2 := Input.Sigma_Hp2;
end;

procedure TPer.recordOutput;
var
  Massa1, Massa2: Extended;
begin
  { --------------------- Критерии качества --------------------------------- }
  Output.Massa := Massa; { Суммарная масса зубчатых колес }
  Output.Massa1 := Massa1;
  Output.Massa2 := Massa2;
  Output.V_p := V_p; { Объём занимаемый передачей }
  Output.Re := Re;
  Output.Fv := Fv;
  Output.Dae2 := Dae2;
  Output.Mn := Mn; { Модуль нормальный в среднем сечении }
  Output.Mte := Mte; { Модуль торцевой на внешнем торце }
  Output.Me := Me; { Модуль торцевой на внешнем торце }
  Output.Betn := Betn; { Нормальный угол наклона в среднем сечении в радианах }
  Output.Xtau1 := Xtau1;
  Output.Xtau2 := Xtau2; { Коэффициенты тангенциального смещения }
  Output.x1 := x1;
  Output.x2 := x2;
  { Коэффициент смещения исходного контура для прямозубых колес }
  Output.xn1 := xn1;
  Output.xn2 := xn2; { Коэффициент смещения исходного контура
    в нормальном сечении для колес с круговым зубом }
  Output.z1 := z1; { Число зубьев шестерни }
  Output.z2 := z2; { Числа зубьев колеса }
  Output.St := St; { Степень точности }
  Output.Uf := Uf; { Фактическое передаточное число передачи }
  Output.n2 := n2; { Частота вращения колеса }
  Output.V := V; { Скорость, м/с }
  Output.de1 := de1; { Диаметр делителбного конуса шестерни }
  Output.Dae1 := Dae1; { Диаметр окружности вершин }
  Output.Dfe1 := Dfe1; { Диаметр окружности впадин шестерни }
  Output.d1 := d1; { Средний делительный диаметр шестерни }
  Output.Delta1 := Delta1; { Угол делительного конуса шестерни }
  Output.Delta_A1 := Delta_A1; { Угол конуса вершин шестерни }
  Output.Delta_F1 := Delta_F1; { Угол конуса впадин шестерни }
  Output.Sce1 := Sce1; { Врешняя постоянная хорда }
  Output.Hce1 := Hce1; { Измерительная высота }
  Output.de2 := de2; { Диаметр делительного конуса колеса }
  Output.Dfe2 := Dfe2; { Диаметр окружности впадин колеса }
  Output.d2 := d2; { Средний делительный диаметр колеса }
  Output.Delta2 := Delta2; { Угол делительного конуса колеса }
  Output.Delta_A2 := Delta_A2; { Угол конуса вершин колеса }
  Output.Delta_F2 := Delta_F2; { Угол конуса впадин колеса }
  Output.Sce2 := Sce2; { Врешняя постоянная хорда }
  Output.Hce2 := Hce2; { Измерительная высота }
  Output.Rs := Rs; { Среднее конусное расстояние по делительному конусу }
  Output.B := B; { Ширина венца }
  Output.b1 := b1; { Расстояние от вершины конуса до базовой поверхности }
  Output.b2 := b2;
  Output.H_e1 := H_e1; { Высота зуба на внешнем торце }
  Output.H_e2 := H_e2; { Высота зуба на внешнем торце }
  Output.d0 := d0; { Диаметр резцовой головки }
  Output.Sigma_H := Sigma_H; { Контактное напряжение }
  Output.T1 := T1; { Момент, передаваемый быстроходным валом }
  Output.T2 := T2; { Момент, передаваемый тихоходным валом }
  Output.Ft1 := Ft1; { Окружное усилие шестерни }
  Output.Fr1 := Fr1; { Радиальное усилие шестерни }
  Output.Fx1 := Fx1; { Осевое усилие шестерни }
  Output.Ft2 := Ft2; { Окружное усилие колеса }
  Output.Fr2 := Fr2; { Радиальное усилие колеса }
  Output.Fx2 := Fx2; { Осевое усилие колеса }
  Output.Epsias := Epsias;
  Output.Error := Error;
end;

PROCEDURE TPer.MakeVersions;
Var
  TransChk: byte;

  FUNCTION Process(ProcessID: char): byte;
  BEGIN
    case ProcessID of
      'U':
        Process := 0;
      'л':
        Process := 1;
      'о':
        Process := 2;
      'б':
        Process := 3;
      'а':
        Process := 4;
      'е':
        Process := 5;
      'и':
        Process := 6;
      'з':
        Process := 7;
      'т':
        Process := 8;
    end;
  END;

Var
  BufRec: string[64];
  ConvChk, i: Integer;
  CWC: byte;
  CTH: array [1 .. 2] of Integer;
  // THandles: array [1..2] of PCollection;
  TPTemp: array [1 .. 2] of byte;
  CogTemp: word;

Const
  ValStr: string[4] = '    ';

BEGIN

  CogTemp := Tipz;
  { TPTemp[1]:=Termobr1; TPTemp[2]:=Termobr2;
    THandles[1]:=New(PStringCollection, Init(5, 5));
    THandles[2]:=New(PStringCollection, Init(5, 5));
    if Termobr1 = 0 then
    ReadMaterials(Termobr1, mc1, THandles[1]);
    if Termobr2 = 0 then
    ReadMaterials(Termobr2, mc2, THandles[2]);
    CTH[1]:=0;
    repeat
    if TPTemp[1] = 0 then
    begin
    Termobr1:=Process(string(THandles[1]^.At(CTH[1])^)[2]);
    Inc(CTH[1]);
    end;
    ReadMaterials(Termobr1, mc1, @BufRec);
    Move(BufRec[3], ValStr[2], 3);
    Val(ValStr, H_HRcp1, ConvChk);
    Move(BufRec[6], ValStr[2], 3);
    Val(ValStr, H_HRcs1, ConvChk);
    Move(BufRec[13], ValStr[1], 4);
    Val(ValStr, Sigma_t1, ConvChk);
    Move(BufRec[17], ValStr[1], 4);
    Val(ValStr, Sigma_Flim01, ConvChk);
    Move(BufRec[21], ValStr[1], 4);
    Val(ValStr, Sigma_Fst01, ConvChk);
    Move(BufRec[25], ValStr[1], 4);
    Val(ValStr, S_F1, ConvChk);
    Move(BufRec[29], ValStr[1], 4);
    FillChar(ValStr[1], 4, ' ');
    CTH[2]:=0;
    repeat
    if TPTemp[2] = 0 then
    begin
    Termobr2:=Process(string(THandles[2]^.At(CTH[2])^)[2]);
    Inc(CTH[2]);
    end;
    ReadMaterials(Termobr2, mc2, @BufRec);
    Move(BufRec[3], ValStr[2], 3);
    Val(ValStr, H_HRcp2, ConvChk);
    Move(BufRec[6], ValStr[2], 3);
    Val(ValStr, H_HRcs2, ConvChk);
    Move(BufRec[13], ValStr[1], 4);
    Val(ValStr, Sigma_t2, ConvChk);
    Move(BufRec[17], ValStr[1], 4);
    Val(ValStr, Sigma_Flim02, ConvChk);
    Move(BufRec[21], ValStr[1], 4);
    Val(ValStr, Sigma_Fst02, ConvChk);
    Move(BufRec[25], ValStr[1], 4);
    Val(ValStr, S_F2, ConvChk);
    Move(BufRec[29], ValStr[1], 4);
    FillChar(ValStr[1], 4, ' '); }
  if H_HRcp1 > 100 then
  begin
    H_HBp1 := H_HRcp1;
    H_HRcp1 := 0;
  end;
  if H_HRcp2 > 100 then
  begin
    H_HBp2 := H_HRcp2;
    H_HRcp2 := 0;
  end;
  if H_HRcs1 > 100 then
  begin
    H_HBs1 := H_HRcs1;
    H_HRcs1 := 0;
  end;
  if H_HRcs2 > 100 then
  begin
    H_HBs2 := H_HRcs2;
    H_HRcs2 := 0;
  end;

  { Перевод твердостей }
  { Из  HRc  в  HB }
  If (H_HRcs1 <= 30) and (H_HRcs1 > 0) then
    H_HBs1 := round(220 * Exp(0.665 * Ln(H_HRcs1 / 20)))
  else if H_HRcs1 > 30 then
    H_HBs1 := round(300 * Exp(0.96 * Ln(H_HRcs1 / 32.5)));
  If (H_HRcs2 <= 30) and (H_HRcs2 > 0) then
    H_HBs2 := round(220 * Exp(0.665 * Ln(H_HRcs2 / 20)))
  else if H_HRcs2 > 30 then
    H_HBs2 := round(300 * Exp(0.96 * Ln(H_HRcs2 / 32.5)));

  If (H_HRcp1 <= 30) and (H_HRcp1 > 0) then
    H_HBp1 := round(220 * Exp(0.665 * Ln(H_HRcp1 / 20)))
  else if H_HRcp1 > 30 then
    H_HBp1 := round(300 * Exp(0.96 * Ln(H_HRcp1 / 32.5)));
  If (H_HRcp2 <= 30) and (H_HRcp2 > 0) then
    H_HBp2 := round(220 * Exp(0.665 * Ln(H_HRcp2 / 20)))
  else if H_HRcp2 > 30 then
    H_HBp2 := round(300 * Exp(0.96 * Ln(H_HRcp2 / 32.5)));

  { Из HB в HV }
  If H_HBp1 < 100 then
    H_HVp1 := round(0.13 * sqr(H_HBp1));
  If H_HBp2 < 100 then
    H_HVp2 := round(0.13 * sqr(H_HBp2));
  if (H_HBp1 > 100) and (H_HBp1 < 350) then
    H_HVp1 := H_HBp1;
  if (H_HBp2 > 100) and (H_HBp2 < 350) then
    H_HVp2 := H_HBp2;
  if (H_HBp1 >= 350) and (H_HBp1 < 450) then
    H_HVp1 := round(350 + (H_HBp1 - 350) * 1.4);
  if (H_HBp2 >= 350) and (H_HBp2 < 450) then
    H_HVp2 := round(350 + (H_HBp2 - 350) * 1.4);
  if H_HBp1 > 450 then
    H_HVp1 := round(450 + (H_HBp1 - 450) * 1.6);
  if H_HBp2 > 450 then
    H_HVp2 := round(450 + (H_HBp2 - 450) * 1.6);

  CogTemp := Tipz;
  if Tipz = 0 then
  begin
    for i := Low(Tipza) + 1 to High(Tipza) do
    begin
      Tipz := i;
      Forma := 1;
      Error := 0;
      CalculateConeWheel;
      // vivod;
      if Error = 0 then
      begin
        // добавляем к массиву masOutput один элемент
        SetLength(masOutput, Length(masOutput) + 1);
        recordOutput;
        // записываем в последний элемент masOutput результаты
        masOutput[High(masOutput)] := Output;
      end;

      if Tipz = 2 then
      begin
        Forma := 2;
        Error := 0;
        CalculateConeWheel;
        // vivod;
        if Error = 0 then
        begin
          // добавляем к массиву masOutput один элемент
          SetLength(masOutput, Length(masOutput) + 1);
          recordOutput;
          // записываем в последний элемент masOutput результаты
          masOutput[High(masOutput)] := Output;
        end;
      end;
    end;
  END;
  Tipz := CogTemp;

  if Tipz = 1 then
  begin
    Forma := 1;
    Error := 0;
    CalculateConeWheel;
    // vivod;
    if Error = 0 then
    begin
      // добавляем к массиву masOutput один элемент
      SetLength(masOutput, Length(masOutput) + 1);
      recordOutput;
      // записываем в последний элемент masOutput результаты
      masOutput[High(masOutput)] := Output;
    end;
  end;

  if Tipz = 2 then
  begin
    Forma := 1;
    Error := 0;
    CalculateConeWheel;
    // vivod;
    if Error = 0 then
    begin
      // добавляем к массиву masOutput один элемент
      SetLength(masOutput, Length(masOutput) + 1);
      recordOutput;
      // записываем в последний элемент masOutput результаты
      masOutput[High(masOutput)] := Output;
    end;

    Forma := 2;
    Error := 0;
    CalculateConeWheel;
    // vivod;
    if Error = 0 then
    begin
      // добавляем к массиву masOutput один элемент
      SetLength(masOutput, Length(masOutput) + 1);
      recordOutput;
      // записываем в последний элемент masOutput результаты
      masOutput[High(masOutput)] := Output;
    end;
  end;
end;

procedure TPer.wiborTerm(mc: String; var ArTermobr: ArrayTermobr);
begin
  if mc = '12ХН2 ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '12ХН3А ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '12Х2Н4А ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '15ХГНТА ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '18ХГТ ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '18Х2Н4ВА ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '20Х ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '20ХН ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '20ХН2М ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '20ХН3А ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
    ArTermobr[2] := 6;
  end;
  if mc = '20Х2Н4А ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '20ХГР ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '25ХГТМА ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '30ХГТ ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 5;
  end;
  if mc = '25ХГМ ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 6;
  end;
  if mc = '35ХМ ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 4;
  end;
  if mc = '40 ГОСТ 1050-74' then
  begin
    ArTermobr[1] := 1;
    ArTermobr[2] := 2;
  end;
  if mc = '40Х ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 1;
    ArTermobr[2] := 2;
    ArTermobr[3] := 3;
    ArTermobr[4] := 4;
  end;
  if mc = '40ХН ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 1;
    ArTermobr[2] := 2;
    ArTermobr[3] := 3;
    ArTermobr[4] := 4;
  end;
  if mc = '40ХФА ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 1;
    ArTermobr[2] := 2;
    ArTermobr[3] := 3;
  end;
  if mc = '40ХН2МА ГОСТ 4543-71' then
  begin
    ArTermobr[1] := 1;
    ArTermobr[2] := 2;
    ArTermobr[3] := 3;
    ArTermobr[4] := 4;
  end;
  if mc = '45 ГОСТ 1050-74' then
  begin
    ArTermobr[1] := 1;
    ArTermobr[2] := 2;
  end;
  if mc = '50ХН ГОСТ 1050-74' then
  begin
    ArTermobr[1] := 3;
  end;

end;

procedure TPer.MakeVersionss(Input: TParInput);
var
  i4, i3: Integer;
begin
  i3 := 1;

  ParamToRec(Input);
  if Termobr1 = 0 then
  begin
    wiborTerm(mc1, ArTermobr1);

  end
  else
    ArTermobr1[1] := Termobr1;
  if Termobr2 = 0 then
  begin
    wiborTerm(mc2, ArTermobr2);

  end
  else
    ArTermobr2[1] := Termobr2;
  repeat
    if ArTermobr1[i3] <> 0 then
    begin
      i4 := 1;
      Termobr1 := ArTermobr1[i3];
      SetLength(masOutput, 0);
      repeat
        if ArTermobr2[i4] <> 0 then
        begin
          Termobr2 := ArTermobr1[i4];
          MakeVersions;
        end;
        Inc(i4)
      until i4 = 5;
    end;
    Inc(i3);
  until i3 = 5;
end;

end.
