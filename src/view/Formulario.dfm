object FormEndereco: TFormEndereco
  Left = 0
  Top = 0
  Caption = 'Formulario'
  ClientHeight = 300
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Button1: TButton
    Left = 424
    Top = 224
    Width = 201
    Height = 41
    Caption = 'Conecta ao banco'
    TabOrder = 0
    OnClick = Button1Click
  end
  object btnConsultaAPI: TButton
    Left = 24
    Top = 176
    Width = 105
    Height = 25
    Caption = 'Consulta API'
    TabOrder = 1
    OnClick = btnConsultaAPIClick
  end
  object edtCep: TLabeledEdit
    Left = 24
    Top = 56
    Width = 185
    Height = 23
    EditLabel.Width = 21
    EditLabel.Height = 15
    EditLabel.Caption = 'CEP'
    TabOrder = 2
    Text = ''
  end
  object Memo1: TMemo
    Left = 184
    Top = 113
    Width = 169
    Height = 145
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
