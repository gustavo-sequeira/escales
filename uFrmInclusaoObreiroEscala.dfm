object frmInclusaoObreiroEscala: TfrmInclusaoObreiroEscala
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmInclusaoObreiroEscala'
  ClientHeight = 133
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    Caption = 'Inclus'#227'o Obreiro x Escala'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Height = 133
    Width = 314
    object btnFrameConfirmar: TcxButton
      Left = 55
      Top = 95
      Width = 100
      Height = 25
      Caption = '&Confirmar'
      ModalResult = 1
      OptionsImage.ImageIndex = 0
      TabOrder = 2
    end
    object cxButton1: TcxButton
      Left = 159
      Top = 95
      Width = 100
      Height = 25
      Caption = 'C&ancelar'
      ModalResult = 2
      OptionsImage.ImageIndex = 0
      TabOrder = 3
    end
    object cbNome: TcxComboBox
      Left = 14
      Top = 32
      AutoSize = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.OnDrawItem = cbNomePropertiesDrawItem
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Height = 24
      Width = 275
    end
    object cxCheckBox1: TcxCheckBox
      Left = 61
      Top = 62
      Caption = 'Mostrar apenas os dispon'#237'veis'
      ParentFont = False
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 1
      Transparent = True
      OnClick = cxCheckBox1Click
    end
  end
end
