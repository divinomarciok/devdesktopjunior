object FormEndereco: TFormEndereco
  Left = 0
  Top = 0
  Caption = 'Formulario'
  ClientHeight = 402
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object btnCriaTabelaTspdCep: TButton
    Left = 76
    Top = 7
    Width = 165
    Height = 24
    Caption = '1 - Cria Tabela "TspdCEP"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnCriaTabelaTspdCepClick
  end
  object edtCep: TLabeledEdit
    Left = 168
    Top = 53
    Width = 142
    Height = 23
    EditLabel.Width = 21
    EditLabel.Height = 15
    EditLabel.Caption = 'CEP'
    TabOrder = 1
    Text = ''
  end
  object memoRetorno: TMemo
    Left = 7
    Top = 125
    Width = 303
    Height = 263
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btnConsultaSalva: TButton
    Left = 168
    Top = 88
    Width = 142
    Height = 27
    Caption = 'Consulta CEP na API'
    TabOrder = 3
    OnClick = btnConsultaSalvaClick
  end
  object edtUf: TLabeledEdit
    Left = 8
    Top = 53
    Width = 146
    Height = 23
    EditLabel.Width = 14
    EditLabel.Height = 15
    EditLabel.Caption = 'UF'
    TabOrder = 4
    Text = ''
  end
  object ConsultaCepBanco: TButton
    Left = 8
    Top = 88
    Width = 146
    Height = 27
    Caption = 'Consulta CEP por UF BD'
    TabOrder = 5
    OnClick = ConsultaCepBancoClick
  end
end
