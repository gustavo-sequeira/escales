object frmTelefone: TfrmTelefone
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 133
  ClientWidth = 221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    Caption = 'Manuten'#231#227'o de Telefone'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Height = 133
    Width = 221
    object cxMaskEdit1: TcxMaskEdit
      Left = 48
      Top = 32
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.EditMask = '!\(99\) 99999-9999;1; '
      Properties.ValidationOptions = []
      Properties.OnChange = cxMaskEdit1PropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Text = '(  )      -    '
      OnEnter = cxMaskEdit1Enter
      Width = 129
    end
    object cxCheckBox1: TcxCheckBox
      Left = 51
      Top = 62
      Caption = 'N'#250'mero Principal'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      TabOrder = 1
      Transparent = True
    end
    object btnFrameConfirmar: TcxButton
      Left = 8
      Top = 95
      Width = 100
      Height = 25
      Caption = '&Confirmar'
      ModalResult = 1
      OptionsImage.ImageIndex = 0
      TabOrder = 2
      OnClick = btnFrameConfirmarClick
    end
    object cxButton1: TcxButton
      Left = 112
      Top = 95
      Width = 100
      Height = 25
      Caption = 'C&ancelar'
      ModalResult = 2
      OptionsImage.ImageIndex = 0
      TabOrder = 3
    end
  end
end
