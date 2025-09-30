unit uFrmRelatorioEscala;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmPrincipal, frxClass,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxDBSet, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait;

type
  TFrmRelatorioEscala = class(TForm)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    FDMemTable1: TFDMemTable;
    FDMemTable1codigo: TIntegerField;
    FDMemTable1data: TDateField;
    FDMemTable1turno: TStringField;
    FDMemTable1horario: TStringField;
    FDMemTable1codigo_evento: TIntegerField;
    FDMemTable1evento: TStringField;
    FDMemTable1codigo_localidade: TIntegerField;
    FDMemTable1localidade: TStringField;
    FDMemTable1obreiro: TStringField;
    FDMemTable1dia: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorioEscala: TFrmRelatorioEscala;

implementation

{$R *.dfm}

end.

{

WITH calendario AS (
    SELECT d::date AS data_dia,
           extract(dow FROM d)::int AS dow
    FROM generate_series('2025-09-01'::date, '2025-09-30'::date, '1 day') d
)
SELECT c.data_dia, a.dia
FROM calendario c
JOIN escalas a
  ON c.dow = CASE lower(a.dia)
                WHEN 'domingo'       THEN 0
                WHEN 'segunda-feira' THEN 1
                WHEN 'terça-feira'   THEN 2
                WHEN 'quarta-feira'  THEN 3
                WHEN 'quinta-feira'  THEN 4
                WHEN 'sexta-feira'   THEN 5
                WHEN 'sábado'        THEN 6
             END
ORDER BY c.data_dia;



----------------



WITH calendario AS (
    -- gera todas as datas do mês
    SELECT d::date AS data_dia,
           extract(dow FROM d)::int AS dow
    FROM generate_series('2025-09-01'::date, '2025-09-30'::date, interval '1 day') d
),
dias_tabela AS (
    -- converte os dias de texto para número (dow)
    SELECT codigo, data, dia,
           CASE lower(dia)
                WHEN 'domingo'       THEN 0
                WHEN 'segunda-feira' THEN 1
                WHEN 'terça-feira'   THEN 2
                WHEN 'quarta-feira'  THEN 3
                WHEN 'quinta-feira'  THEN 4
                WHEN 'sexta-feira'   THEN 5
                WHEN 'sábado'        THEN 6
           END AS dow
    FROM escalas
    WHERE 1=1--codigo_evento = 2   -- ajuste se precisar filtrar
)
SELECT DISTINCT ON (c.data_dia)
       c.data_dia,
       COALESCE(d.dia, to_char(c.data_dia, 'TMDay')) AS dia_semana,
       d.codigo
   --    d.situacao,
   --    d.turno,
   --    d.codigo_localidade
FROM calendario c
JOIN dias_tabela dref ON c.dow = dref.dow   -- pega só os dias que estão cadastrados
LEFT JOIN dias_tabela d ON d.data = c.data_dia  -- se já existe registro na data, sobrescreve
ORDER BY c.data_dia, d.codigo NULLS LAST;

                                  ------------------------




    SELECT
		case
		c.date AS data,
		to_char(c.date, 'TMDay') as dia,
		d.turno,
		d.horario
    FROM generate_series('2025-09-01'::date, '2025-09-30'::date, interval '1 day') c
    inner join ( select horario, turno, dia, repete from escalas where repete = 1 ) d on lower(to_char(c.date, 'TMDay')) = lower(d.dia)
    inner join ( select horario, turno, data, repete from escalas where repete = 0 ) r on lower(to_char(c.date, 'TMDay')) = lower(to_char(r.data, 'TMDay'))


}
