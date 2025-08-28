object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'frmPrincipal'
  ClientHeight = 530
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object gbPrincipal: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 0
    Height = 530
    Width = 624
    object gbSecundarioTop: TcxGroupBox
      Left = 3
      Top = 3
      Align = alTop
      PanelStyle.Active = True
      TabOrder = 0
      Height = 105
      Width = 618
    end
    object gbSecundarioCenter: TcxGroupBox
      Left = 3
      Top = 108
      Align = alClient
      PanelStyle.Active = True
      TabOrder = 1
      Height = 314
      Width = 618
      object gbTerciarioLeft: TcxGroupBox
        Left = 3
        Top = 3
        Align = alLeft
        PanelStyle.Active = True
        TabOrder = 0
        Height = 308
        Width = 185
        object cxLabel1: TcxLabel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Align = alTop
          AutoSize = False
          Caption = 'MENU'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -17
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          Height = 16
          Width = 173
          AnchorX = 93
          AnchorY = 14
        end
        object dxNavBar1: TdxNavBar
          Left = 3
          Top = 25
          Width = 179
          Height = 280
          Align = alClient
          ActiveGroupIndex = 1
          TabOrder = 1
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          LookAndFeelSchemes.Flat = 2
          View = 20
          OptionsBehavior.Common.AllowExpandAnimation = True
          OptionsBehavior.NavigationPane.AdjustWidthByPopup = True
          object dxNavBarDashboard: TdxNavBarGroup
            Caption = 'Dashboard'
            SelectedLinkIndex = -1
            TopVisibleLinkIndex = 0
            OptionsGroupControl.ShowControl = True
            OptionsGroupControl.UseControl = True
            OptionsExpansion.Expandable = False
            OptionsExpansion.Expanded = False
            OptionsExpansion.ShowExpandButton = False
            OnClick = dxNavBarDashboardClick
            Links = <>
          end
          object dxNavBarCadastros: TdxNavBarGroup
            Caption = 'Cadastros'
            SelectedLinkIndex = -1
            TopVisibleLinkIndex = 0
            OptionsExpansion.Expanded = False
            Links = <
              item
                Item = dxNavBarCadastroCargos
              end
              item
                Item = dxNavBarCadastroEscalas
              end
              item
                Item = dxNavBarCadastroLembretes
              end
              item
                Item = dxNavBarCadastroLocalidades
              end
              item
                Item = dxNavBarCadastroObreiros
              end
              item
                Item = dxNavBarCadastroTelefones
              end
              item
                Item = dxNavBarCadastroVersiculos
              end>
          end
          object dxNavBar1Group2: TdxNavBarGroup
            Caption = 'Configura'#231#245'es'
            SelectedLinkIndex = -1
            TopVisibleLinkIndex = 0
            OptionsExpansion.Expanded = False
            Links = <
              item
                Item = dxNavBar1Item8
              end
              item
                Item = dxNavBar1Item9
              end>
          end
          object dxNavBar1Group3: TdxNavBarGroup
            Caption = 'Relat'#243'rios'
            SelectedLinkIndex = -1
            TopVisibleLinkIndex = 0
            OptionsExpansion.Expanded = False
            Links = <>
          end
          object dxNavBarCadastroCargos: TdxNavBarItem
            Action = actCadastroCargos
          end
          object dxNavBarCadastroEscalas: TdxNavBarItem
            Caption = 'Escalas'
          end
          object dxNavBarCadastroLembretes: TdxNavBarItem
            Caption = 'Lembretes'
          end
          object dxNavBarCadastroLocalidades: TdxNavBarItem
            Caption = 'Localidades'
          end
          object dxNavBarCadastroObreiros: TdxNavBarItem
            Action = actCadastroObreiros
          end
          object dxNavBarCadastroTelefones: TdxNavBarItem
            Caption = 'Telefones'
          end
          object dxNavBarCadastroVersiculos: TdxNavBarItem
            Caption = 'Vers'#237'culos'
          end
          object dxNavBar1Item8: TdxNavBarItem
            Caption = 'Sistema'
          end
          object dxNavBar1Item9: TdxNavBarItem
            Caption = 'Envio Mensagem'
          end
          object dxNavBarDashboardControl: TdxNavBarGroupControl
            Left = 0
            Top = 0
            Width = 179
            Height = 277
            Caption = 'dxNavBarDashboardControl'
            TabOrder = 0
            GroupIndex = 0
            OriginalHeight = 41
          end
        end
      end
      object gbTerciarioCenter: TcxGroupBox
        Left = 188
        Top = 3
        Align = alClient
        PanelStyle.Active = True
        TabOrder = 1
        Height = 308
        Width = 242
      end
      object gbTerciarioRight: TcxGroupBox
        Left = 430
        Top = 3
        Align = alRight
        PanelStyle.Active = True
        TabOrder = 2
        Height = 308
        Width = 185
      end
    end
    object gbSecundarioBottom: TcxGroupBox
      Left = 3
      Top = 422
      Align = alBottom
      PanelStyle.Active = True
      TabOrder = 2
      Height = 105
      Width = 618
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2010Blue'
    Left = 550
    Top = 486
  end
  object ActionManager1: TActionManager
    Left = 520
    Top = 486
    StyleName = 'Platform Default'
    object actCadastroCargos: TAction
      Category = 'Cadastros'
      Caption = 'Cargos'
      OnExecute = actCadastroCargosExecute
    end
    object actCadastroObreiros: TAction
      Category = 'Cadastros'
      Caption = 'Obreiros'
      OnExecute = actCadastroObreirosExecute
    end
    object Action1: TAction
      Category = 'Dashboard'
      AutoCheck = True
      Caption = 'Dashboard'
    end
  end
end
