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
  Vcl.Imaging.pngimage, dxGDIPlusClasses;

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
  frmRelatorioEscalas: TFrmRelatorioEscala;
  MesSelecionado: Integer;
  AnoAtual: Word;
  DataPrimeiro, DataUltimo: TDate;
  vQueryPrincipal, vQueryQtdEventos, vQueryQtdLocalidades, vQueryQtdObreiros: TFDQuery;
  vDescricaoEvento: string;
begin
  frmRelatorioEscala := TFrmRelatorioEscala.Create(Self);

  vQueryPrincipal := TFDQuery.Create(Self);
  vQueryQtdEventos := TFDQuery.Create(Self);
  vQueryQtdLocalidades := TFDQuery.Create(Self);
  vQueryQtdObreiros := TFDQuery.Create(Self);

  try
    frmRelatorioEscala.ShowModal;
    if frmRelatorioEscala.ModalResult = mrOk then
    begin

      vQueryPrincipal.Connection := dmPrincipal.FDConnection;
      vQueryQtdEventos.Connection := dmPrincipal.FDConnection;
      vQueryQtdLocalidades.Connection := dmPrincipal.FDConnection;
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
      vQueryPrincipal.SQL.Add('				   to_char(data, ''TMDay'') as dia,   ');
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
      vQueryQtdLocalidades.Close;
      vQueryQtdLocalidades.SQL.Clear;
      vQueryQtdLocalidades.SQL.Add('select  l.descricao ||'';'' as localidade ');
      vQueryQtdLocalidades.SQL.Add('  from ( ');
      vQueryQtdLocalidades.SQL.Add('  			with ');
      vQueryQtdLocalidades.SQL.Add('			  	calendario as ( ');
      vQueryQtdLocalidades.SQL.Add('              		-- gera todos os dias do mês ');
      vQueryQtdLocalidades.SQL.Add('              		select d as data, ');
      vQueryQtdLocalidades.SQL.Add('                     		 extract(dow from d) as dow ');
      vQueryQtdLocalidades.SQL.Add('                     from generate_series(:dt_inicio, :dt_fim, interval ''1 day'') d ), ');
      vQueryQtdLocalidades.SQL.Add(' ');
      vQueryQtdLocalidades.SQL.Add('				repete1 as ( ');
      vQueryQtdLocalidades.SQL.Add('              		-- escalas que repetem (sem data fixa), vinculadas a dia da semana ');
      vQueryQtdLocalidades.SQL.Add('              		select e.codigo, ');
      vQueryQtdLocalidades.SQL.Add('                     	   e.codigo_localidade, ');
      vQueryQtdLocalidades.SQL.Add('	                       case lower(e.dia) ');
      vQueryQtdLocalidades.SQL.Add('	                              when ''domingo'' then 0 ');
      vQueryQtdLocalidades.SQL.Add('	                              when ''segunda-feira'' then 1 ');
      vQueryQtdLocalidades.SQL.Add('	                              when ''terça-feira'' then 2 ');
      vQueryQtdLocalidades.SQL.Add('	                              when ''quarta-feira'' then 3 ');
      vQueryQtdLocalidades.SQL.Add('	                              when ''quinta-feira'' then 4 ');
      vQueryQtdLocalidades.SQL.Add('	                              when ''sexta-feira'' then 5 ');
      vQueryQtdLocalidades.SQL.Add('	                              when ''sábado'' then 6 ');
      vQueryQtdLocalidades.SQL.Add('	                       end as dow ');
      vQueryQtdLocalidades.SQL.Add('              		  from escalas e ');
      vQueryQtdLocalidades.SQL.Add('              		 where e.repete = 1 ');
      vQueryQtdLocalidades.SQL.Add('              		   and lower(e.situacao) = ''confirmado''), ');
      vQueryQtdLocalidades.SQL.Add(' ');
      vQueryQtdLocalidades.SQL.Add('				repete0 as ( ');
      vQueryQtdLocalidades.SQL.Add('              -- escalas específicas (com data fixa) ');
      vQueryQtdLocalidades.SQL.Add('              select e.codigo, ');
      vQueryQtdLocalidades.SQL.Add('                     e.data, ');
      vQueryQtdLocalidades.SQL.Add('                     e.codigo_localidade ');
      vQueryQtdLocalidades.SQL.Add('              from   escalas e ');
      vQueryQtdLocalidades.SQL.Add('              where  e.repete = 0 ');
      vQueryQtdLocalidades.SQL.Add('              and    lower(e.situacao) = ''confirmado''), ');
      vQueryQtdLocalidades.SQL.Add(' ');
      vQueryQtdLocalidades.SQL.Add('		expandidas as ( ');
      vQueryQtdLocalidades.SQL.Add('              -- gera repete=1 expandido no calendário ');
      vQueryQtdLocalidades.SQL.Add('              select r1.codigo, ');
      vQueryQtdLocalidades.SQL.Add('                     c.data, ');
      vQueryQtdLocalidades.SQL.Add('                     r1.codigo_localidade ');
      vQueryQtdLocalidades.SQL.Add('              from   calendario c ');
      vQueryQtdLocalidades.SQL.Add('              join   repete1 r1 ');
      vQueryQtdLocalidades.SQL.Add('              on     c.dow = r1.dow ');
      vQueryQtdLocalidades.SQL.Add('              union all ');
      vQueryQtdLocalidades.SQL.Add('              -- junta com as específicas (repete=0) ');
      vQueryQtdLocalidades.SQL.Add('              select r0.codigo, ');
      vQueryQtdLocalidades.SQL.Add('                     r0.data, ');
      vQueryQtdLocalidades.SQL.Add('                     r0.codigo_localidade ');
      vQueryQtdLocalidades.SQL.Add('              from   repete0 r0) ');
      vQueryQtdLocalidades.SQL.Add(' ');
      vQueryQtdLocalidades.SQL.Add('			  select distinct on (data, codigo_localidade) expandidas.codigo, ');
      vQueryQtdLocalidades.SQL.Add('                to_char(data, ''TMDay'') as dia, ');
      vQueryQtdLocalidades.SQL.Add('                codigo_localidade ');
      vQueryQtdLocalidades.SQL.Add('from            expandidas ');
      vQueryQtdLocalidades.SQL.Add('where           data between :dt_inicio and :dt_fim ');
      vQueryQtdLocalidades.SQL.Add('order by        data, codigo_localidade) v ');
      vQueryQtdLocalidades.SQL.Add('inner join      localidades l on v.codigo_localidade = l.codigo ');
      vQueryQtdLocalidades.SQL.Add('group by l.descricao ');
      vQueryQtdLocalidades.ParamByName('dt_inicio').AsDate := DataPrimeiro;
      vQueryQtdLocalidades.ParamByName('dt_fim').AsDate := DataUltimo;
      vQueryQtdLocalidades.Open;

      // eventos
      vQueryQtdEventos.Close;
      vQueryQtdEventos.SQL.Clear;
      vQueryQtdEventos.SQL.Add('select  ev.codigo || '' - ''|| ev.descricao ||'';'' as evento ');
      vQueryQtdEventos.SQL.Add('  from ( ');
      vQueryQtdEventos.SQL.Add('  			with ');
      vQueryQtdEventos.SQL.Add('			  	calendario as ( ');
      vQueryQtdEventos.SQL.Add('              		-- gera todos os dias do mês ');
      vQueryQtdEventos.SQL.Add('              		select d as data, ');
      vQueryQtdEventos.SQL.Add('                     		 extract(dow from d) as dow ');
      vQueryQtdEventos.SQL.Add('                     from generate_series(:dt_inicio, :dt_fim, interval ''1 day'') d ), ');
      vQueryQtdEventos.SQL.Add(' ');
      vQueryQtdEventos.SQL.Add('				repete1 as ( ');
      vQueryQtdEventos.SQL.Add('              		-- escalas que repetem (sem data fixa), vinculadas a dia da semana ');
      vQueryQtdEventos.SQL.Add('              		select e.codigo, ');
      vQueryQtdEventos.SQL.Add('	                       case lower(e.dia) ');
      vQueryQtdEventos.SQL.Add('	                              when ''domingo'' then 0 ');
      vQueryQtdEventos.SQL.Add('	                              when ''segunda-feira'' then 1 ');
      vQueryQtdEventos.SQL.Add('	                              when ''terça-feira'' then 2 ');
      vQueryQtdEventos.SQL.Add('	                              when ''quarta-feira'' then 3 ');
      vQueryQtdEventos.SQL.Add('	                              when ''quinta-feira'' then 4 ');
      vQueryQtdEventos.SQL.Add('	                              when ''sexta-feira'' then 5 ');
      vQueryQtdEventos.SQL.Add('	                              when ''sábado'' then 6 ');
      vQueryQtdEventos.SQL.Add('	                       end as dow, ');
      vQueryQtdEventos.SQL.Add('                     	   codigo_evento ');
      vQueryQtdEventos.SQL.Add('              		  from escalas e ');
      vQueryQtdEventos.SQL.Add('              		 where e.repete = 1 ');
      vQueryQtdEventos.SQL.Add('              		   and lower(e.situacao) = ''confirmado''), ');
      vQueryQtdEventos.SQL.Add(' ');
      vQueryQtdEventos.SQL.Add('				repete0 as ( ');
      vQueryQtdEventos.SQL.Add('              -- escalas específicas (com data fixa) ');
      vQueryQtdEventos.SQL.Add('              select e.codigo, ');
      vQueryQtdEventos.SQL.Add('                     e.data, ');
      vQueryQtdEventos.SQL.Add('                     e.codigo_evento ');
      vQueryQtdEventos.SQL.Add('              from   escalas e ');
      vQueryQtdEventos.SQL.Add('              where  e.repete = 0 ');
      vQueryQtdEventos.SQL.Add('              and    lower(e.situacao) = ''confirmado''), ');
      vQueryQtdEventos.SQL.Add(' ');
      vQueryQtdEventos.SQL.Add('		expandidas as ( ');
      vQueryQtdEventos.SQL.Add('              -- gera repete=1 expandido no calendário ');
      vQueryQtdEventos.SQL.Add('              select r1.codigo, ');
      vQueryQtdEventos.SQL.Add('                     c.data, ');
      vQueryQtdEventos.SQL.Add('                     r1.codigo_evento ');
      vQueryQtdEventos.SQL.Add('              from   calendario c ');
      vQueryQtdEventos.SQL.Add('              join   repete1 r1 ');
      vQueryQtdEventos.SQL.Add('              on     c.dow = r1.dow ');
      vQueryQtdEventos.SQL.Add('              union all ');
      vQueryQtdEventos.SQL.Add('              -- junta com as específicas (repete=0) ');
      vQueryQtdEventos.SQL.Add('              select r0.codigo, ');
      vQueryQtdEventos.SQL.Add('                     r0.data, ');
      vQueryQtdEventos.SQL.Add('                     r0.codigo_evento ');
      vQueryQtdEventos.SQL.Add('              from   repete0 r0) ');
      vQueryQtdEventos.SQL.Add(' ');
      vQueryQtdEventos.SQL.Add('			  select distinct on (data, codigo_evento) expandidas.codigo, ');
      vQueryQtdEventos.SQL.Add('                to_char(data, ''TMDay'') as dia, ');
      vQueryQtdEventos.SQL.Add('                codigo_evento ');
      vQueryQtdEventos.SQL.Add('from            expandidas ');
      vQueryQtdEventos.SQL.Add('where           data between :dt_inicio and :dt_fim ');
      vQueryQtdEventos.SQL.Add('order by        data, codigo_evento) v ');
      vQueryQtdEventos.SQL.Add('inner join      eventos ev on v.codigo_evento = ev.codigo ');
      vQueryQtdEventos.SQL.Add('group by ev.codigo ');
      vQueryQtdEventos.ParamByName('dt_inicio').AsDate := DataPrimeiro;
      vQueryQtdEventos.ParamByName('dt_fim').AsDate := DataUltimo;
      vQueryQtdEventos.Open;

      frmRelatorioEscala.frxDBDatasetPrincipal.DataSet := vQueryPrincipal;
      frmRelatorioEscala.frxDBDatasetLocalidade.DataSet := vQueryQtdLocalidades;
      frmRelatorioEscala.frxDBDatasetEvento.DataSet := vQueryQtdEventos;

      frmRelatorioEscala.frxReport1.Variables['PeriodoEscala'] := QuotedStr('De ' + DateToStr(DataPrimeiro) + ' até ' + DateToStr(DataUltimo));

      if not (vQueryQtdEventos.IsEmpty) then
      begin

        vQueryQtdEventos.First;
        while not (vQueryQtdEventos.Eof) do
        begin

          if (vQueryQtdEventos.RecNo = Ceil(vQueryQtdEventos.RecordCount / 2)) then
            vDescricaoEvento := vDescricaoEvento + '   ' + vQueryQtdEventos.FieldByName('evento').AsString + #13#10
          else
            vDescricaoEvento := vDescricaoEvento + '   ' + vQueryQtdEventos.FieldByName('evento').AsString;
          vQueryQtdEventos.Next;
        end;
        frmRelatorioEscala.frxReport1.Variables['DescricaoEvento'] := vDescricaoEvento

      end;

      frmRelatorioEscala.frxReport1.ShowReport;
    end;

  finally
    vQueryPrincipal.Free;
    vQueryQtdEventos.Free;
    vQueryQtdLocalidades.Free;
    vQueryQtdObreiros.Free;
    FrmRelatorioEscala.Free;
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

