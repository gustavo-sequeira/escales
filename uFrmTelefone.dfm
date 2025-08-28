object frmTelefone: TfrmTelefone
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 148
  ClientWidth = 221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
    ExplicitLeft = 136
    ExplicitTop = 64
    ExplicitWidth = 185
    ExplicitHeight = 105
    Height = 148
    Width = 221
    object cxMaskEdit1: TcxMaskEdit
      Left = 48
      Top = 32
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.EditMask = '!\(99\) 0000-0000;1; '
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Text = '(99) 9999-9999'
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
      Left = 60
      Top = 111
      Width = 100
      Height = 25
      Caption = '&Confirmar'
      OptionsImage.ImageIndex = 0
      TabOrder = 2
      OnClick = btnFrameConfirmarClick
    end
  end
end
