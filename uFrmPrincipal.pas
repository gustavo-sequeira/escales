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
  uFrmSplash, uFrmRelatorioEscala, uFraEventos;

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
  fCargo, fObreiro, fLocalidade, fVersiculo, fLembrete, fEscala, fParametros,
  fEventos: TFraModelo;
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
begin
  frmRelatorioEscala := TFrmRelatorioEscala.Create(Self);
  try

    dmPrincipal.FDQuery1.Close;
    dmPrincipal.FDQuery1.SQL.Clear;
    dmPrincipal.FDQuery1.SQL.Add('       select v.codigo, ');
    dmPrincipal.FDQuery1.SQL.Add('	            to_char(v.data, ''DD/MM/YYYY'' ) as data,  ');
    dmPrincipal.FDQuery1.SQL.Add('				      v.dia,  ');
    dmPrincipal.FDQuery1.SQL.Add('				      v.turno,  ');
    dmPrincipal.FDQuery1.SQL.Add('				      to_char(horario, ''HH24:MI'') as horario,  ');
    dmPrincipal.FDQuery1.SQL.Add('				      ev.codigo as codigo_evento,  ');
    dmPrincipal.FDQuery1.SQL.Add('				      ev.nome as evento,  ');
    dmPrincipal.FDQuery1.SQL.Add('		  		    l.codigo as codigo_localidade,  ');
    dmPrincipal.FDQuery1.SQL.Add('		 	 	      l.nome as localidade,   ');
    dmPrincipal.FDQuery1.SQL.Add('	  			    c.abreviacao ||'' ''|| o.nome as obreiro ');
    dmPrincipal.FDQuery1.SQL.Add('			   from (with calendario as ( ');
    dmPrincipal.FDQuery1.SQL.Add('    									   -- gera todos os dias do mês ');
    dmPrincipal.FDQuery1.SQL.Add('    									   select d as data, ');
    dmPrincipal.FDQuery1.SQL.Add('           									      extract(dow from d) as dow ');
    dmPrincipal.FDQuery1.SQL.Add('    									     from generate_series(''2025-09-01'', ''2025-09-30'', interval ''1 day'') d ');
    dmPrincipal.FDQuery1.SQL.Add('										   /*from generate_series(:dt_inicio, :dt_fim, interval ''1 day'') d	*/), ');
    dmPrincipal.FDQuery1.SQL.Add('                             repete1 as ( ');
    dmPrincipal.FDQuery1.SQL.Add('    									   -- escalas que repetem (sem data fixa), vinculadas a dia da semana ');
    dmPrincipal.FDQuery1.SQL.Add('    									   select e.codigo,  ');
    dmPrincipal.FDQuery1.SQL.Add('        									      e.turno, ');
    dmPrincipal.FDQuery1.SQL.Add('        									      e.codigo_localidade, ');
    dmPrincipal.FDQuery1.SQL.Add('        									      e.repete, ');
    dmPrincipal.FDQuery1.SQL.Add('											      e.horario, ');
    dmPrincipal.FDQuery1.SQL.Add('										         case lower(e.dia) ');
    dmPrincipal.FDQuery1.SQL.Add('										              when ''domingo''       then 0 ');
    dmPrincipal.FDQuery1.SQL.Add('										              when ''segunda-feira'' then 1 ');
    dmPrincipal.FDQuery1.SQL.Add('										              when ''terça-feira''   then 2 ');
    dmPrincipal.FDQuery1.SQL.Add('										              when ''quarta-feira''  then 3 ');
    dmPrincipal.FDQuery1.SQL.Add('										              when ''quinta-feira''  then 4 ');
    dmPrincipal.FDQuery1.SQL.Add('										              when ''sexta-feira''   then 5 ');
    dmPrincipal.FDQuery1.SQL.Add('										              when ''sábado''        then 6 ');
    dmPrincipal.FDQuery1.SQL.Add('										          end as dow, ');
    dmPrincipal.FDQuery1.SQL.Add('											      codigo_evento ');
    dmPrincipal.FDQuery1.SQL.Add('    									     from escalas e ');
    dmPrincipal.FDQuery1.SQL.Add('    									    where e.repete = 1 ');
    dmPrincipal.FDQuery1.SQL.Add('      									      and e.situacao = ''Confirmado''), ');
    dmPrincipal.FDQuery1.SQL.Add('						     repete0 as ( ');
    dmPrincipal.FDQuery1.SQL.Add('    									   -- escalas específicas (com data fixa) ');
    dmPrincipal.FDQuery1.SQL.Add('    									   select e.codigo,  ');
    dmPrincipal.FDQuery1.SQL.Add('											      e.data,  ');
    dmPrincipal.FDQuery1.SQL.Add('											      e.turno,  ');
    dmPrincipal.FDQuery1.SQL.Add('											      e.codigo_localidade,  ');
    dmPrincipal.FDQuery1.SQL.Add('											      e.repete,  ');
    dmPrincipal.FDQuery1.SQL.Add('											      e.codigo_evento,  ');
    dmPrincipal.FDQuery1.SQL.Add('											      e.horario ');
    dmPrincipal.FDQuery1.SQL.Add('    								   	     from escalas e ');
    dmPrincipal.FDQuery1.SQL.Add('                                            where e.repete = 0 ');
    dmPrincipal.FDQuery1.SQL.Add('                                              and e.situacao = ''Confirmado''), ');
    dmPrincipal.FDQuery1.SQL.Add('					      expandidas as ( ');
    dmPrincipal.FDQuery1.SQL.Add('    									       -- gera repete=1 expandido no calendário ');
    dmPrincipal.FDQuery1.SQL.Add('    									       select r1.codigo,  ');
    dmPrincipal.FDQuery1.SQL.Add('										              c.data,  ');
    dmPrincipal.FDQuery1.SQL.Add('											          r1.turno,  ');
    dmPrincipal.FDQuery1.SQL.Add('											          r1.codigo_localidade,  ');
    dmPrincipal.FDQuery1.SQL.Add('											          r1.repete,  ');
    dmPrincipal.FDQuery1.SQL.Add('											          r1.codigo_evento,  ');
    dmPrincipal.FDQuery1.SQL.Add('											          r1.horario ');
    dmPrincipal.FDQuery1.SQL.Add('    								   	         from calendario c ');
    dmPrincipal.FDQuery1.SQL.Add('    									         join repete1 r1  ');
    dmPrincipal.FDQuery1.SQL.Add('										           on c.dow = r1.dow ');
    dmPrincipal.FDQuery1.SQL.Add('    							            union all ');
    dmPrincipal.FDQuery1.SQL.Add('    										   -- junta com as específicas (repete=0) ');
    dmPrincipal.FDQuery1.SQL.Add('    									       select    r0.codigo,  ');
    dmPrincipal.FDQuery1.SQL.Add('											          r0.data,  ');
    dmPrincipal.FDQuery1.SQL.Add('												      r0.turno,  ');
    dmPrincipal.FDQuery1.SQL.Add('												      r0.codigo_localidade,  ');
    dmPrincipal.FDQuery1.SQL.Add('												      r0.repete,  ');
    dmPrincipal.FDQuery1.SQL.Add('												      r0.codigo_evento,  ');
    dmPrincipal.FDQuery1.SQL.Add('												      r0.horario ');
    dmPrincipal.FDQuery1.SQL.Add('    										     from repete0 r0) ');
    dmPrincipal.FDQuery1.SQL.Add('            -- regra: se existir repete=0, descartar repete=1 duplicado ');
    dmPrincipal.FDQuery1.SQL.Add('            select distinct on (data, turno, codigo_localidade) ');
    dmPrincipal.FDQuery1.SQL.Add('                   expandidas.codigo,  ');
    dmPrincipal.FDQuery1.SQL.Add('				   to_char(data, ''TMDay'') as dia,   ');
    dmPrincipal.FDQuery1.SQL.Add('				   data,  ');
    dmPrincipal.FDQuery1.SQL.Add('				   turno,  ');
    dmPrincipal.FDQuery1.SQL.Add('				   codigo_localidade,  ');
    dmPrincipal.FDQuery1.SQL.Add('				   repete,  ');
    dmPrincipal.FDQuery1.SQL.Add('				   codigo_evento,  ');
    dmPrincipal.FDQuery1.SQL.Add('				   horario ');
    dmPrincipal.FDQuery1.SQL.Add('              from expandidas ');
    dmPrincipal.FDQuery1.SQL.Add('             where data between ''2025-09-01'' and ''2025-09-30'' ');
    dmPrincipal.FDQuery1.SQL.Add('           --where data  between :dt_inicio and :dt_inicio ');
    dmPrincipal.FDQuery1.SQL.Add('          order by data,  ');
    dmPrincipal.FDQuery1.SQL.Add('	               turno,  ');
    dmPrincipal.FDQuery1.SQL.Add('				   codigo_localidade,  ');
    dmPrincipal.FDQuery1.SQL.Add('   				   repete) v ');
    dmPrincipal.FDQuery1.SQL.Add('inner join escalados e  ');
    dmPrincipal.FDQuery1.SQL.Add('		    on v.codigo = e.codigo_escala ');
    dmPrincipal.FDQuery1.SQL.Add('inner join obreiros o  ');
    dmPrincipal.FDQuery1.SQL.Add('		    on e.codigo_obreiro = o.codigo ');
    dmPrincipal.FDQuery1.SQL.Add('inner join cargos c  ');
    dmPrincipal.FDQuery1.SQL.Add('		    on o.codigo_cargo = c.codigo ');
    dmPrincipal.FDQuery1.SQL.Add('inner join localidades l  ');
    dmPrincipal.FDQuery1.SQL.Add('		    on v.codigo_localidade = l.codigo ');
    dmPrincipal.FDQuery1.SQL.Add('inner join eventos ev  ');
    dmPrincipal.FDQuery1.SQL.Add('    		on v.codigo_evento = ev.codigo ');
    dmPrincipal.FDQuery1.SQL.Add('  order by data,  ');
    dmPrincipal.FDQuery1.SQL.Add('       	   to_char(horario, ''HH24:MI''),  ');
    dmPrincipal.FDQuery1.SQL.Add('		       turno,  ');
    dmPrincipal.FDQuery1.SQL.Add('		       codigo_localidade,  ');
    dmPrincipal.FDQuery1.SQL.Add('		       repete ');
    dmPrincipal.FDQuery1.Open;

    frmRelatorioEscala.frxDBDataset1.DataSet := dmPrincipal.FDQuery1;
    frmRelatorioEscala.frxReport1.ShowReport;

  finally
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

