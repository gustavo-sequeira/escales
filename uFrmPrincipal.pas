unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox,
  AdvSmoothStepControl, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvGridWorkbook, cxTextEdit, cxMemo, tmsAdvGridExcel, System.ImageList,
  Vcl.ImgList, cxImageList, dxCore, cxClasses, dxSkinsForm, dxSkinWhiteprint,
  cxSplitter, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, uLibary, dxSkinOffice2010Blue,
  dxNavBarCollns, dxNavBarBase, dxNavBar, cxLabel, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, cxLocalization,
  Vcl.Imaging.pngimage, dxGDIPlusClasses, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinXmas2008Blue;

type
  TfrmPrincipal = class(TForm)
    dxSkinController1: TdxSkinController;
    gbPrincipal: TcxGroupBox;
    gbSecundarioTop: TcxGroupBox;
    gbSecundarioCenter: TcxGroupBox;
    gbSecundarioBottom: TcxGroupBox;
    gbTerciarioLeft: TcxGroupBox;
    gbTerciarioCenter: TcxGroupBox;
    gbTerciarioRight: TcxGroupBox;
    cxLabel1: TcxLabel;
    dxNavBar1: TdxNavBar;
    dxNavBarCadastros: TdxNavBarGroup;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBar1Group3: TdxNavBarGroup;
    dxNavBarDashboard: TdxNavBarGroup;
    dxNavBarCadastroCargos: TdxNavBarItem;
    dxNavBarCadastroEscalas: TdxNavBarItem;
    dxNavBarCadastroLembretes: TdxNavBarItem;
    dxNavBarCadastroLocalidades: TdxNavBarItem;
    dxNavBarCadastroObreiros: TdxNavBarItem;
    dxNavBarCadastroTelefones: TdxNavBarItem;
    dxNavBarCadastroVersiculos: TdxNavBarItem;
    dxNavBarDashboardControl: TdxNavBarGroupControl;
    dxNavBar1Item8: TdxNavBarItem;
    dxNavBar1Item9: TdxNavBarItem;
    ActionManager1: TActionManager;
    actCadastroCargos: TAction;
    actCadastroObreiros: TAction;
    Action1: TAction;
    actCadastroLocalidades: TAction;
    actCadastroVersiculos: TAction;
    actCadastroLembretes: TAction;
    actCadastroEscalas: TAction;
    actConfiguracaoParametros: TAction;
    pbPrincipal: TPaintBox;
    Image1: TImage;
    dxNavBarCadastroEventos: TdxNavBarItem;
    actCadastroEventos: TAction;
    cxLabel2: TcxLabel;
    procedure actCadastroCargosExecute(Sender: TObject);
    procedure actCadastroObreirosExecute(Sender: TObject);
    procedure dxNavBarDashboardClick(Sender: TObject);
    procedure actCadastroLocalidadesExecute(Sender: TObject);
    procedure actCadastroVersiculosExecute(Sender: TObject);
    procedure actCadastroLembretesExecute(Sender: TObject);
    procedure actCadastroEscalasExecute(Sender: TObject);
    procedure actConfiguracaoParametrosExecute(Sender: TObject);
    procedure pbPrincipalPaint(Sender: TObject);
    procedure dxNavBar1Group3Click(Sender: TObject);
    procedure actCadastroEventosExecute(Sender: TObject);
  private
    { Private declarations }
    FImg: TPngImage;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure ControleFrame(pFrame: string; pLimparTodos: Boolean = False);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uFraObreiros, uFraModelo, uFraCargos, uFraLocalidades, uFraVersiculos,
  uFraLembretes, uFraEscalas, Math, uFraParametros, System.IOUtils, uDmPrincipal,
  uFrmSplash, uFrmRelatorioEscala, uFraEventos, DateUtils;

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.actCadastroCargosExecute(Sender: TObject);
begin
  ControleFrame('cargos');
end;

procedure TfrmPrincipal.actCadastroLocalidadesExecute(Sender: TObject);
begin
  ControleFrame('localidades');
end;

procedure TfrmPrincipal.actCadastroObreirosExecute(Sender: TObject);
begin
  ControleFrame('obreiros');
end;

procedure TfrmPrincipal.actCadastroVersiculosExecute(Sender: TObject);
begin
  ControleFrame('versiculos');
end;

procedure TfrmPrincipal.actConfiguracaoParametrosExecute(Sender: TObject);
begin
  ControleFrame('parametros');
end;

procedure TfrmPrincipal.actCadastroEventosExecute(Sender: TObject);
begin
  ControleFrame('eventos');
end;

procedure TfrmPrincipal.actCadastroEscalasExecute(Sender: TObject);
begin
  ControleFrame('escalas');
end;

procedure TfrmPrincipal.actCadastroLembretesExecute(Sender: TObject);
begin
  ControleFrame('lembretes');
end;

procedure TfrmPrincipal.ControleFrame(pFrame: string; pLimparTodos: Boolean = False);
var
  fCargo, fObreiro, fLocalidade, fVersiculo, fLembrete, fEscala, fParametros, fEventos: TFraModelo;
  i: Integer;
begin

  for i := gbTerciarioCenter.ControlCount - 1 downto 0 do
  begin
    if gbTerciarioCenter.Controls[i] is TFrame then
    begin
      if pFrame = 'obreiros' then
      begin
        if TfraObreiros(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end
      else if pFrame = 'cargos' then
      begin
        if TfraCargos(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end
      else if pFrame = 'localidades' then
      begin
        if TfraLocalidades(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end
      else if pFrame = 'versiculos' then
      begin
        if TFraVersiculos(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end
      else if pFrame = 'lembretes' then
      begin
        if TFraLembretes(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end
      else if pFrame = 'escalas' then
      begin
        if TFraEscalas(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end
      else if pFrame = 'parametros' then
      begin
        if TFraParametros(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end
      else if pFrame = 'eventos' then
      begin
        if TFraParametros(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end;

      gbTerciarioCenter.Controls[i].Free;
    end;
  end;

  if not (pLimparTodos) then
  begin
    if pFrame = 'obreiros' then
    begin
      fObreiro := TfraObreiros.Create(Self);
      fObreiro.Parent := gbTerciarioCenter;
      fObreiro.Align := alClient;
      fObreiro.pcFramePrincipal.ActivePageIndex := 0;
    end
    else if pFrame = 'cargos' then
    begin
      fCargo := TfraCargos.Create(Self);
      fCargo.Parent := gbTerciarioCenter;
      fCargo.Align := alClient;
      fCargo.pcFramePrincipal.ActivePageIndex := 0;

    end
    else if pFrame = 'localidades' then
    begin
      fLocalidade := TfraLocalidades.Create(Self);
      fLocalidade.Parent := gbTerciarioCenter;
      fLocalidade.Align := alClient;
      fLocalidade.pcFramePrincipal.ActivePageIndex := 0;

    end
    else if pFrame = 'versiculos' then
    begin
      fVersiculo := TfraVersiculos.Create(Self);
      fVersiculo.Parent := gbTerciarioCenter;
      fVersiculo.Align := alClient;
      fVersiculo.pcFramePrincipal.ActivePageIndex := 0;
    end
    else if pFrame = 'lembretes' then
    begin
      fLembrete := TfraLembretes.Create(Self);
      fLembrete.Parent := gbTerciarioCenter;
      fLembrete.Align := alClient;
      fLembrete.pcFramePrincipal.ActivePageIndex := 0;
    end
    else if pFrame = 'escalas' then
    begin
      fEscala := TfraEscalas.Create(Self);
      fEscala.Parent := gbTerciarioCenter;
      fEscala.Align := alClient;
      fEscala.pcFramePrincipal.ActivePageIndex := 0;
    end
    else if pFrame = 'parametros' then
    begin
      fParametros := TFraParametros.Create(Self);
      fParametros.Parent := gbTerciarioCenter;
      fParametros.Align := alClient;
      fParametros.pcFramePrincipal.ActivePageIndex := 0;
    end
    else if pFrame = 'eventos' then
    begin
      fEventos := TFraEventos.Create(Self);
      fEventos.Parent := gbTerciarioCenter;
      fEventos.Align := alClient;
      fEventos.pcFramePrincipal.ActivePageIndex := 0;
    end;
  end;
end;

constructor TfrmPrincipal.Create(AOwner: TComponent);
var
  frmSplash: TfrmSplash;
begin
  if VarAsType(dmPrincipal.GetParamValue('SPLASH'), varInteger) = 1 then
  begin
    frmSplash := TfrmSplash.Create(Self);
    try
      frmSplash.Show;
    finally
      frmSplash.Free;
    end;
  end;
  inherited;
  FImg := TPngImage.Create;
  FImg.LoadFromFile(TPath.GetDirectoryName(ParamStr(0)) + PathDelim + 'logo.png');
  pbPrincipal.Visible := VarAsType(dmPrincipal.GetParamValue('IMG_FUNDO_DASHBOARD'), varInteger) = 1;
end;

procedure TfrmPrincipal.dxNavBar1Group3Click(Sender: TObject);
var
  frmRelatorioEscala: TFrmRelatorioEscala;
  MesSelecionado: Integer;
  AnoAtual: Word;
  DataPrimeiro, DataUltimo: TDate;
  vQueryPrincipal, vQueryAuxiliar, vQueryLocalidades, vQueryQtdObreiros: TFDQuery;
  vDescricaoEvento: string;
begin
  frmRelatorioEscala := TFrmRelatorioEscala.Create(Self);

  vQueryPrincipal := TFDQuery.Create(Self);
  vQueryAuxiliar := TFDQuery.Create(Self);
  vQueryLocalidades := TFDQuery.Create(Self);
  vQueryQtdObreiros := TFDQuery.Create(Self);

  try
    frmRelatorioEscala.ShowModal;
    if frmRelatorioEscala.ModalResult = mrOk then
    begin

      vQueryPrincipal.Connection := dmPrincipal.FDConnection;
      vQueryAuxiliar.Connection := dmPrincipal.FDConnection;
      vQueryLocalidades.Connection := dmPrincipal.FDConnection;
      vQueryQtdObreiros.Connection := dmPrincipal.FDConnection;

      // Pega o índice do Combo (0 = Janeiro, 11 = Dezembro)
      MesSelecionado := frmRelatorioEscala.cbMeses.ItemIndex + 1;

      // Usa o ano atual (ou você pode pedir ao usuário)
      AnoAtual := YearOf(Date);
      // Primeiro dia do mês
      DataPrimeiro := StartOfTheMonth(EncodeDate(AnoAtual, MesSelecionado, 1));

      // Último dia do mês
      DataUltimo := EndOfTheMonth(EncodeDate(AnoAtual, MesSelecionado, 1));

      vQueryPrincipal.Close;
      vQueryPrincipal.SQL.Clear;
      vQueryPrincipal.SQL.Add('       select v.codigo, ');
      vQueryPrincipal.SQL.Add('	            to_char(v.data, ''DD/MM/YYYY'' ) as data,  ');
      vQueryPrincipal.SQL.Add('				      v.dia,  ');
      vQueryPrincipal.SQL.Add('				      v.turno,  ');
      vQueryPrincipal.SQL.Add('				      to_char(horario, ''HH24:MI'') as horario,  ');
      vQueryPrincipal.SQL.Add('				      ev.codigo as codigo_evento,  ');
      vQueryPrincipal.SQL.Add('				      ev.nome as evento,  ');
      vQueryPrincipal.SQL.Add('		  		    l.codigo as codigo_localidade,  ');
      vQueryPrincipal.SQL.Add('		 	 	      l.nome as localidade,   ');
      vQueryPrincipal.SQL.Add('	  			    c.abreviacao ||'' ''|| o.nome as obreiro ');
      vQueryPrincipal.SQL.Add('			   from (with calendario as ( ');
      vQueryPrincipal.SQL.Add('    									   -- gera todos os dias do mês ');
      vQueryPrincipal.SQL.Add('    									   select d as data, ');
      vQueryPrincipal.SQL.Add('           									      extract(dow from d) as dow ');
//    vQueryPrincipal.SQL.Add('    									     from generate_series(''2025-09-01'', ''2025-09-30'', interval ''1 day'') d ');
      vQueryPrincipal.SQL.Add('										       from generate_series(:dt_inicio, :dt_fim, interval ''1 day'') d	), ');
      vQueryPrincipal.SQL.Add('                             repete1 as ( ');
      vQueryPrincipal.SQL.Add('    									   -- escalas que repetem (sem data fixa), vinculadas a dia da semana ');
      vQueryPrincipal.SQL.Add('    									   select e.codigo,  ');
      vQueryPrincipal.SQL.Add('        									      e.turno, ');
      vQueryPrincipal.SQL.Add('        									      e.codigo_localidade, ');
      vQueryPrincipal.SQL.Add('        									      e.repete, ');
      vQueryPrincipal.SQL.Add('											      e.horario, ');
      vQueryPrincipal.SQL.Add('										         case lower(e.dia) ');
      vQueryPrincipal.SQL.Add('										              when ''domingo''       then 0 ');
      vQueryPrincipal.SQL.Add('										              when ''segunda-feira'' then 1 ');
      vQueryPrincipal.SQL.Add('										              when ''terça-feira''   then 2 ');
      vQueryPrincipal.SQL.Add('										              when ''quarta-feira''  then 3 ');
      vQueryPrincipal.SQL.Add('										              when ''quinta-feira''  then 4 ');
      vQueryPrincipal.SQL.Add('										              when ''sexta-feira''   then 5 ');
      vQueryPrincipal.SQL.Add('										              when ''sábado''        then 6 ');
      vQueryPrincipal.SQL.Add('										          end as dow, ');
      vQueryPrincipal.SQL.Add('											      codigo_evento ');
      vQueryPrincipal.SQL.Add('    									     from escalas e ');
      vQueryPrincipal.SQL.Add('    									    where e.repete = 1 ');
      vQueryPrincipal.SQL.Add('      									      and lower(e.situacao) = ''confirmado''), ');
      vQueryPrincipal.SQL.Add('						     repete0 as ( ');
      vQueryPrincipal.SQL.Add('    									   -- escalas específicas (com data fixa) ');
      vQueryPrincipal.SQL.Add('    									   select e.codigo,  ');
      vQueryPrincipal.SQL.Add('											      e.data,  ');
      vQueryPrincipal.SQL.Add('											      e.turno,  ');
      vQueryPrincipal.SQL.Add('											      e.codigo_localidade,  ');
      vQueryPrincipal.SQL.Add('											      e.repete,  ');
      vQueryPrincipal.SQL.Add('											      e.codigo_evento,  ');
      vQueryPrincipal.SQL.Add('											      e.horario ');
      vQueryPrincipal.SQL.Add('    								   	     from escalas e ');
      vQueryPrincipal.SQL.Add('                                            where e.repete = 0 ');
      vQueryPrincipal.SQL.Add('                                              and lower(e.situacao) = ''confirmado''), ');
      vQueryPrincipal.SQL.Add('					      expandidas as ( ');
      vQueryPrincipal.SQL.Add('    									       -- gera repete=1 expandido no calendário ');
      vQueryPrincipal.SQL.Add('    									       select r1.codigo,  ');
      vQueryPrincipal.SQL.Add('										              c.data,  ');
      vQueryPrincipal.SQL.Add('											          r1.turno,  ');
      vQueryPrincipal.SQL.Add('											          r1.codigo_localidade,  ');
      vQueryPrincipal.SQL.Add('											          r1.repete,  ');
      vQueryPrincipal.SQL.Add('											          r1.codigo_evento,  ');
      vQueryPrincipal.SQL.Add('											          r1.horario ');
      vQueryPrincipal.SQL.Add('    								   	         from calendario c ');
      vQueryPrincipal.SQL.Add('    									         join repete1 r1  ');
      vQueryPrincipal.SQL.Add('										           on c.dow = r1.dow ');
      vQueryPrincipal.SQL.Add('    							            union all ');
      vQueryPrincipal.SQL.Add('    										   -- junta com as específicas (repete=0) ');
      vQueryPrincipal.SQL.Add('    									       select    r0.codigo,  ');
      vQueryPrincipal.SQL.Add('											          r0.data,  ');
      vQueryPrincipal.SQL.Add('												      r0.turno,  ');
      vQueryPrincipal.SQL.Add('												      r0.codigo_localidade,  ');
      vQueryPrincipal.SQL.Add('												      r0.repete,  ');
      vQueryPrincipal.SQL.Add('												      r0.codigo_evento,  ');
      vQueryPrincipal.SQL.Add('												      r0.horario ');
      vQueryPrincipal.SQL.Add('    										     from repete0 r0) ');
      vQueryPrincipal.SQL.Add('            -- regra: se existir repete=0, descartar repete=1 duplicado ');
      vQueryPrincipal.SQL.Add('            select distinct on (data, turno, codigo_localidade) ');
      vQueryPrincipal.SQL.Add('                   expandidas.codigo,  ');
      vQueryPrincipal.SQL.Add('CASE extract(dow from data) ');
      vQueryPrincipal.SQL.Add('    WHEN 0 THEN ''Domingo'' ');
      vQueryPrincipal.SQL.Add('    WHEN 1 THEN ''Segunda-feira'' ');
      vQueryPrincipal.SQL.Add('    WHEN 2 THEN ''Terça-feira'' ');
      vQueryPrincipal.SQL.Add('    WHEN 3 THEN ''Quarta-feira'' ');
      vQueryPrincipal.SQL.Add('    WHEN 4 THEN ''Quinta-feira'' ');
      vQueryPrincipal.SQL.Add('    WHEN 5 THEN ''Sexta-feira'' ');
      vQueryPrincipal.SQL.Add('    WHEN 6 THEN ''Sábado''  ');
      vQueryPrincipal.SQL.Add('END AS dia, ');
//      vQueryPrincipal.SQL.Add('				   to_char(data, ''TMDay'') as dia,   ');
      vQueryPrincipal.SQL.Add('				   data,  ');
      vQueryPrincipal.SQL.Add('				   turno,  ');
      vQueryPrincipal.SQL.Add('				   codigo_localidade,  ');
      vQueryPrincipal.SQL.Add('				   repete,  ');
      vQueryPrincipal.SQL.Add('				   codigo_evento,  ');
      vQueryPrincipal.SQL.Add('				   horario ');
      vQueryPrincipal.SQL.Add('              from expandidas ');
//      vQueryPrincipal.SQL.Add('             where data between ''2025-09-01'' and ''2025-09-30'' ');
      vQueryPrincipal.SQL.Add('             where data  between :dt_inicio and :dt_fim ');
      vQueryPrincipal.SQL.Add('          order by data,  ');
      vQueryPrincipal.SQL.Add('	               turno,  ');
      vQueryPrincipal.SQL.Add('				   codigo_localidade,  ');
      vQueryPrincipal.SQL.Add('   				   repete) v ');
      vQueryPrincipal.SQL.Add('inner join escalados e  ');
      vQueryPrincipal.SQL.Add('		    on v.codigo = e.codigo_escala ');
      vQueryPrincipal.SQL.Add('inner join obreiros o  ');
      vQueryPrincipal.SQL.Add('		    on e.codigo_obreiro = o.codigo ');
      vQueryPrincipal.SQL.Add('inner join cargos c  ');
      vQueryPrincipal.SQL.Add('		    on o.codigo_cargo = c.codigo ');
      vQueryPrincipal.SQL.Add('inner join localidades l  ');
      vQueryPrincipal.SQL.Add('		    on v.codigo_localidade = l.codigo ');
      vQueryPrincipal.SQL.Add('inner join eventos ev  ');
      vQueryPrincipal.SQL.Add('    		on v.codigo_evento = ev.codigo ');
      vQueryPrincipal.SQL.Add('  order by data,  ');
      vQueryPrincipal.SQL.Add('       	   to_char(horario, ''HH24:MI''),  ');
      vQueryPrincipal.SQL.Add('		       turno,  ');
      vQueryPrincipal.SQL.Add('		       codigo_localidade,  ');
      vQueryPrincipal.SQL.Add('		       repete ');
      vQueryPrincipal.ParamByName('dt_inicio').AsDate := DataPrimeiro;
      vQueryPrincipal.ParamByName('dt_fim').AsDate := DataUltimo;
      vQueryPrincipal.Open;

      // localidades
      vQueryLocalidades.Close;
      vQueryLocalidades.SQL.Clear;
      vQueryLocalidades.SQL.Add('select  l.descricao ||'';'' as localidade ');
      vQueryLocalidades.SQL.Add('  from ( ');
      vQueryLocalidades.SQL.Add('  			with ');
      vQueryLocalidades.SQL.Add('			  	calendario as ( ');
      vQueryLocalidades.SQL.Add('              		-- gera todos os dias do mês ');
      vQueryLocalidades.SQL.Add('              		select d as data, ');
      vQueryLocalidades.SQL.Add('                     		 extract(dow from d) as dow ');
      vQueryLocalidades.SQL.Add('                     from generate_series(:dt_inicio, :dt_fim, interval ''1 day'') d ), ');
      vQueryLocalidades.SQL.Add(' ');
      vQueryLocalidades.SQL.Add('				repete1 as ( ');
      vQueryLocalidades.SQL.Add('              		-- escalas que repetem (sem data fixa), vinculadas a dia da semana ');
      vQueryLocalidades.SQL.Add('              		select e.codigo, ');
      vQueryLocalidades.SQL.Add('                     	   e.codigo_localidade, ');
      vQueryLocalidades.SQL.Add('	                       case lower(e.dia) ');
      vQueryLocalidades.SQL.Add('	                              when ''domingo'' then 0 ');
      vQueryLocalidades.SQL.Add('	                              when ''segunda-feira'' then 1 ');
      vQueryLocalidades.SQL.Add('	                              when ''terça-feira'' then 2 ');
      vQueryLocalidades.SQL.Add('	                              when ''quarta-feira'' then 3 ');
      vQueryLocalidades.SQL.Add('	                              when ''quinta-feira'' then 4 ');
      vQueryLocalidades.SQL.Add('	                              when ''sexta-feira'' then 5 ');
      vQueryLocalidades.SQL.Add('	                              when ''sábado'' then 6 ');
      vQueryLocalidades.SQL.Add('	                       end as dow ');
      vQueryLocalidades.SQL.Add('              		  from escalas e ');
      vQueryLocalidades.SQL.Add('              		 where e.repete = 1 ');
      vQueryLocalidades.SQL.Add('              		   and lower(e.situacao) = ''confirmado''), ');
      vQueryLocalidades.SQL.Add(' ');
      vQueryLocalidades.SQL.Add('				repete0 as ( ');
      vQueryLocalidades.SQL.Add('              -- escalas específicas (com data fixa) ');
      vQueryLocalidades.SQL.Add('              select e.codigo, ');
      vQueryLocalidades.SQL.Add('                     e.data, ');
      vQueryLocalidades.SQL.Add('                     e.codigo_localidade ');
      vQueryLocalidades.SQL.Add('              from   escalas e ');
      vQueryLocalidades.SQL.Add('              where  e.repete = 0 ');
      vQueryLocalidades.SQL.Add('              and    lower(e.situacao) = ''confirmado''), ');
      vQueryLocalidades.SQL.Add(' ');
      vQueryLocalidades.SQL.Add('		expandidas as ( ');
      vQueryLocalidades.SQL.Add('              -- gera repete=1 expandido no calendário ');
      vQueryLocalidades.SQL.Add('              select r1.codigo, ');
      vQueryLocalidades.SQL.Add('                     c.data, ');
      vQueryLocalidades.SQL.Add('                     r1.codigo_localidade ');
      vQueryLocalidades.SQL.Add('              from   calendario c ');
      vQueryLocalidades.SQL.Add('              join   repete1 r1 ');
      vQueryLocalidades.SQL.Add('              on     c.dow = r1.dow ');
      vQueryLocalidades.SQL.Add('              union all ');
      vQueryLocalidades.SQL.Add('              -- junta com as específicas (repete=0) ');
      vQueryLocalidades.SQL.Add('              select r0.codigo, ');
      vQueryLocalidades.SQL.Add('                     r0.data, ');
      vQueryLocalidades.SQL.Add('                     r0.codigo_localidade ');
      vQueryLocalidades.SQL.Add('              from   repete0 r0) ');
      vQueryLocalidades.SQL.Add(' ');
      vQueryLocalidades.SQL.Add('			  select distinct on (data, codigo_localidade) expandidas.codigo, ');
      vQueryLocalidades.SQL.Add('                to_char(data, ''TMDay'') as dia, ');
      vQueryLocalidades.SQL.Add('                codigo_localidade ');
      vQueryLocalidades.SQL.Add('from            expandidas ');
      vQueryLocalidades.SQL.Add('where           data between :dt_inicio and :dt_fim ');
      vQueryLocalidades.SQL.Add('order by        data, codigo_localidade) v ');
      vQueryLocalidades.SQL.Add('inner join      localidades l on v.codigo_localidade = l.codigo ');
      vQueryLocalidades.SQL.Add('group by l.descricao ');
      vQueryLocalidades.ParamByName('dt_inicio').AsDate := DataPrimeiro;
      vQueryLocalidades.ParamByName('dt_fim').AsDate := DataUltimo;
      vQueryLocalidades.Open;

      // eventos
      vQueryAuxiliar.Close;
      vQueryAuxiliar.SQL.Clear;
      vQueryAuxiliar.SQL.Add('select  ev.codigo || '' - ''|| ev.descricao ||'';'' as evento ');
      vQueryAuxiliar.SQL.Add('  from ( ');
      vQueryAuxiliar.SQL.Add('  			with ');
      vQueryAuxiliar.SQL.Add('			  	calendario as ( ');
      vQueryAuxiliar.SQL.Add('              		-- gera todos os dias do mês ');
      vQueryAuxiliar.SQL.Add('              		select d as data, ');
      vQueryAuxiliar.SQL.Add('                     		 extract(dow from d) as dow ');
      vQueryAuxiliar.SQL.Add('                     from generate_series(:dt_inicio, :dt_fim, interval ''1 day'') d ), ');
      vQueryAuxiliar.SQL.Add(' ');
      vQueryAuxiliar.SQL.Add('				repete1 as ( ');
      vQueryAuxiliar.SQL.Add('              		-- escalas que repetem (sem data fixa), vinculadas a dia da semana ');
      vQueryAuxiliar.SQL.Add('              		select e.codigo, ');
      vQueryAuxiliar.SQL.Add('	                       case lower(e.dia) ');
      vQueryAuxiliar.SQL.Add('	                              when ''domingo'' then 0 ');
      vQueryAuxiliar.SQL.Add('	                              when ''segunda-feira'' then 1 ');
      vQueryAuxiliar.SQL.Add('	                              when ''terça-feira'' then 2 ');
      vQueryAuxiliar.SQL.Add('	                              when ''quarta-feira'' then 3 ');
      vQueryAuxiliar.SQL.Add('	                              when ''quinta-feira'' then 4 ');
      vQueryAuxiliar.SQL.Add('	                              when ''sexta-feira'' then 5 ');
      vQueryAuxiliar.SQL.Add('	                              when ''sábado'' then 6 ');
      vQueryAuxiliar.SQL.Add('	                       end as dow, ');
      vQueryAuxiliar.SQL.Add('                     	   codigo_evento ');
      vQueryAuxiliar.SQL.Add('              		  from escalas e ');
      vQueryAuxiliar.SQL.Add('              		 where e.repete = 1 ');
      vQueryAuxiliar.SQL.Add('              		   and lower(e.situacao) = ''confirmado''), ');
      vQueryAuxiliar.SQL.Add(' ');
      vQueryAuxiliar.SQL.Add('				repete0 as ( ');
      vQueryAuxiliar.SQL.Add('              -- escalas específicas (com data fixa) ');
      vQueryAuxiliar.SQL.Add('              select e.codigo, ');
      vQueryAuxiliar.SQL.Add('                     e.data, ');
      vQueryAuxiliar.SQL.Add('                     e.codigo_evento ');
      vQueryAuxiliar.SQL.Add('              from   escalas e ');
      vQueryAuxiliar.SQL.Add('              where  e.repete = 0 ');
      vQueryAuxiliar.SQL.Add('              and    lower(e.situacao) = ''confirmado''), ');
      vQueryAuxiliar.SQL.Add(' ');
      vQueryAuxiliar.SQL.Add('		expandidas as ( ');
      vQueryAuxiliar.SQL.Add('              -- gera repete=1 expandido no calendário ');
      vQueryAuxiliar.SQL.Add('              select r1.codigo, ');
      vQueryAuxiliar.SQL.Add('                     c.data, ');
      vQueryAuxiliar.SQL.Add('                     r1.codigo_evento ');
      vQueryAuxiliar.SQL.Add('              from   calendario c ');
      vQueryAuxiliar.SQL.Add('              join   repete1 r1 ');
      vQueryAuxiliar.SQL.Add('              on     c.dow = r1.dow ');
      vQueryAuxiliar.SQL.Add('              union all ');
      vQueryAuxiliar.SQL.Add('              -- junta com as específicas (repete=0) ');
      vQueryAuxiliar.SQL.Add('              select r0.codigo, ');
      vQueryAuxiliar.SQL.Add('                     r0.data, ');
      vQueryAuxiliar.SQL.Add('                     r0.codigo_evento ');
      vQueryAuxiliar.SQL.Add('              from   repete0 r0) ');
      vQueryAuxiliar.SQL.Add(' ');
      vQueryAuxiliar.SQL.Add('			  select distinct on (data, codigo_evento) expandidas.codigo, ');
      vQueryAuxiliar.SQL.Add('                to_char(data, ''TMDay'') as dia, ');
      vQueryAuxiliar.SQL.Add('                codigo_evento ');
      vQueryAuxiliar.SQL.Add('from            expandidas ');
      vQueryAuxiliar.SQL.Add('where           data between :dt_inicio and :dt_fim ');
      vQueryAuxiliar.SQL.Add('order by        data, codigo_evento) v ');
      vQueryAuxiliar.SQL.Add('inner join      eventos ev on v.codigo_evento = ev.codigo ');
      vQueryAuxiliar.SQL.Add('group by ev.codigo ');
      vQueryAuxiliar.ParamByName('dt_inicio').AsDate := DataPrimeiro;
      vQueryAuxiliar.ParamByName('dt_fim').AsDate := DataUltimo;
      vQueryAuxiliar.Open;

      frmRelatorioEscala.frxDBDatasetPrincipal.DataSet := vQueryPrincipal;
      frmRelatorioEscala.frxDBDatasetLocalidade.DataSet := vQueryLocalidades;
      frmRelatorioEscala.frxDBDatasetEvento.DataSet := vQueryAuxiliar;

      frmRelatorioEscala.frxReport1.Variables['PeriodoEscala'] := QuotedStr('De ' + DateToStr(DataPrimeiro) + ' até ' + DateToStr(DataUltimo));

      if not (vQueryAuxiliar.IsEmpty) then
      begin
        vQueryAuxiliar.First;
        while not (vQueryAuxiliar.Eof) do
        begin

          if (vQueryAuxiliar.RecNo = Ceil(vQueryAuxiliar.RecordCount / 2)) then
            vDescricaoEvento := vDescricaoEvento + '   ' + vQueryAuxiliar.FieldByName('evento').AsString + #13#10
          else
            vDescricaoEvento := vDescricaoEvento + '   ' + vQueryAuxiliar.FieldByName('evento').AsString;
          vQueryAuxiliar.Next;
        end;
        frmRelatorioEscala.frxReport1.Variables['DescricaoEvento'] := vDescricaoEvento
      end;

      // Quantidades
      vQueryAuxiliar.Close;
      vQueryAuxiliar.SQL.Clear;
      vQueryAuxiliar.SQL.Add('select eventos.nome as nome, count(*) as qtd from escalas ');
      vQueryAuxiliar.SQL.Add('inner join eventos on eventos.codigo = escalas.codigo_evento ');
      vQueryAuxiliar.SQL.Add('where data between :dt_inicio and :dt_fim ');
      vQueryAuxiliar.SQL.Add('group by 1 ');
      vQueryAuxiliar.SQL.Add('union ');
      vQueryAuxiliar.SQL.Add('select ''Obreiros'', count(codigo_obreiro) from escalados ');
      vQueryAuxiliar.SQL.Add('inner join escalas on escalas.codigo = escalados.codigo_escala ');
      vQueryAuxiliar.SQL.Add('where data between :dt_inicio and :dt_fim ');
      vQueryAuxiliar.ParamByName('dt_inicio').AsDate := DataPrimeiro;
      vQueryAuxiliar.ParamByName('dt_fim').AsDate := DataUltimo;
      vQueryAuxiliar.Open;

      if not (vQueryAuxiliar.IsEmpty) then
      begin
        vQueryAuxiliar.First;
        while not (vQueryAuxiliar.Eof) do
        begin
          if vQueryAuxiliar.FieldByName('nome').AsString = 'Obreiros' then
            frmRelatorioEscala.frxReport1.Variables['QtdObreiros'] := vQueryAuxiliar.FieldByName('qtd').AsString
          else if vQueryAuxiliar.FieldByName('nome').AsString = 'Culto' then
            frmRelatorioEscala.frxReport1.Variables['QtdCultos'] := vQueryAuxiliar.FieldByName('qtd').AsString
          else if vQueryAuxiliar.FieldByName('nome').AsString = 'Círculo de Oração' then
            frmRelatorioEscala.frxReport1.Variables['QtdCC'] := vQueryAuxiliar.FieldByName('qtd').AsString;
          vQueryAuxiliar.Next;
        end;
      end;

      // localidades por eventos
      vQueryAuxiliar.Close;
      vQueryAuxiliar.SQL.Clear;
      vQueryAuxiliar.SQL.Add('select eventos.nome as nome, string_agg( distinct localidades.descricao,''; '') as localidade from escalas ');
      vQueryAuxiliar.SQL.Add('inner join localidades on localidades.codigo = escalas.codigo_localidade ');
      vQueryAuxiliar.SQL.Add('inner join eventos on eventos.codigo = escalas.codigo_evento ');
      vQueryAuxiliar.SQL.Add('where data between :dt_inicio and :dt_fim ');
      vQueryAuxiliar.SQL.Add('group by eventos.nome ');
      vQueryAuxiliar.ParamByName('dt_inicio').AsDate := DataPrimeiro;
      vQueryAuxiliar.ParamByName('dt_fim').AsDate := DataUltimo;
      vQueryAuxiliar.Open;

      if not (vQueryAuxiliar.IsEmpty) then
      begin
        vQueryAuxiliar.First;
        while not (vQueryAuxiliar.Eof) do
        begin
          if vQueryAuxiliar.FieldByName('nome').AsString = 'Culto' then
            frmRelatorioEscala.frxReport1.Variables['DescricaoPregracao'] := QuotedStr(vQueryAuxiliar.FieldByName('localidade').AsString)
          else if vQueryAuxiliar.FieldByName('nome').AsString = 'Círculo de Oração' then
            frmRelatorioEscala.frxReport1.Variables['DescricaoCirculo'] := QuotedStr(vQueryAuxiliar.FieldByName('localidade').AsString);
          vQueryAuxiliar.Next;
        end;
      end;

      frmRelatorioEscala.frxReport1.ShowReport;
    end;
  finally
    vQueryPrincipal.Free;
    vQueryAuxiliar.Free;
    vQueryLocalidades.Free;
    vQueryQtdObreiros.Free;
    frmRelatorioEscala.Free;
  end;
end;

procedure TfrmPrincipal.dxNavBarDashboardClick(Sender: TObject);
begin
  ControleFrame(EmptyStr, True);
  pbPrincipal.Visible := VarAsType(dmPrincipal.GetParamValue('IMG_FUNDO_DASHBOARD'), varInteger) = 1;
end;

procedure TfrmPrincipal.pbPrincipalPaint(Sender: TObject);
var
  DestRect: TRect;
  RatioImg, RatioBox: Double;
  NewWidth, NewHeight: Integer;
begin
  if (FImg = nil) or FImg.Empty then
    Exit;

  // proporção da imagem e do paintbox
  RatioImg := FImg.Width / FImg.Height;
  RatioBox := pbPrincipal.Width / pbPrincipal.Height;

  if RatioImg > RatioBox then
  begin
    // imagem é mais "larga" → ajusta pela largura do paintbox
    NewWidth := pbPrincipal.Width;
    NewHeight := Round(pbPrincipal.Width / RatioImg);
  end
  else
  begin
    // imagem é mais "alta" → ajusta pela altura do paintbox
    NewHeight := pbPrincipal.Height;
    NewWidth := Round(pbPrincipal.Height * RatioImg);
  end;

  // centraliza
  DestRect.Left := (pbPrincipal.Width - NewWidth) div 2;
  DestRect.Top := (pbPrincipal.Height - NewHeight) div 2;
  DestRect.Right := DestRect.Left + NewWidth;
  DestRect.Bottom := DestRect.Top + NewHeight;

  // desenha redimensionando
  pbPrincipal.Canvas.StretchDraw(DestRect, FImg);
end;

end.

