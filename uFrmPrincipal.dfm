object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 530
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
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
          Caption = 'cxLabel1'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          AnchorX = 93
          AnchorY = 16
        end
        object dxNavBar1: TdxNavBar
          Left = 3
          Top = 28
          Width = 179
          Height = 277
          Align = alClient
          ActiveGroupIndex = 1
          TabOrder = 1
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          LookAndFeelSchemes.Flat = 2
          View = 20
          OptionsBehavior.Common.AllowExpandAnimation = True
          OptionsBehavior.NavigationPane.AdjustWidthByPopup = True
          object dxNavBar1Group4: TdxNavBarGroup
            Caption = 'Dashboard'
            SelectedLinkIndex = -1
            TopVisibleLinkIndex = 0
            OptionsGroupControl.ShowControl = True
            OptionsGroupControl.UseControl = True
            OptionsExpansion.Expandable = False
            OptionsExpansion.Expanded = False
            OptionsExpansion.ShowExpandButton = False
            OnClick = dxNavBar1Group4Click
            Links = <>
          end
          object dxNavBar1Group1: TdxNavBarGroup
            Caption = 'Cadastros'
            SelectedLinkIndex = -1
            TopVisibleLinkIndex = 0
            OptionsExpansion.Expanded = False
            Links = <
              item
                Item = dxNavBar1Item1
              end
              item
                Item = dxNavBar1Item2
              end
              item
                Item = dxNavBar1Item3
              end
              item
                Item = dxNavBar1Item4
              end
              item
                Item = dxNavBar1Item5
              end
              item
                Item = dxNavBar1Item6
              end
              item
                Item = dxNavBar1Item7
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
          object dxNavBar1Item1: TdxNavBarItem
            Caption = 'Cargos'
          end
          object dxNavBar1Item2: TdxNavBarItem
            Caption = 'Escalas'
          end
          object dxNavBar1Item3: TdxNavBarItem
            Caption = 'Lembretes'
          end
          object dxNavBar1Item4: TdxNavBarItem
            Caption = 'Localidades'
          end
          object dxNavBar1Item5: TdxNavBarItem
            Caption = 'Obreiros'
            OnClick = dxNavBar1Item5Click
          end
          object dxNavBar1Item6: TdxNavBarItem
            Caption = 'Telefones'
          end
          object dxNavBar1Item7: TdxNavBarItem
            Caption = 'Vers'#237'culos'
          end
          object dxNavBar1Item8: TdxNavBarItem
            Caption = 'Sistema'
          end
          object dxNavBar1Item9: TdxNavBarItem
            Caption = 'Envio Mensagem'
          end
          object dxNavBar1Group4Control: TdxNavBarGroupControl
            Left = 0
            Top = 0
            Width = 179
            Height = 277
            Caption = 'dxNavBar1Group4Control'
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
    Left = 551
    Top = 374
  end
end
