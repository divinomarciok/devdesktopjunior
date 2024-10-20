object FormEndereco: TFormEndereco
  Left = 0
  Top = 0
  Caption = 'Formulario'
  ClientHeight = 501
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
    Left = 165
    Top = 10
    Width = 146
    Height = 27
    Caption = '2 - Cria Tabela "TspdCEP"'
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
    Left = 169
    Top = 176
    Width = 142
    Height = 23
    EditLabel.Width = 21
    EditLabel.Height = 15
    EditLabel.Caption = 'CEP'
    TabOrder = 1
    Text = ''
  end
  object memoRetorno: TMemo
    Left = 8
    Top = 232
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
    Left = 169
    Top = 204
    Width = 142
    Height = 22
    Caption = 'Consulta CEP na API'
    TabOrder = 3
    OnClick = btnConsultaSalvaClick
  end
  object edtUf: TLabeledEdit
    Left = 9
    Top = 178
    Width = 146
    Height = 23
    EditLabel.Width = 14
    EditLabel.Height = 15
    EditLabel.Caption = 'UF'
    TabOrder = 4
    Text = ''
  end
  object ConsultaCepBanco: TButton
    Left = 9
    Top = 204
    Width = 146
    Height = 22
    Caption = 'Consulta CEP por UF BD'
    TabOrder = 5
    OnClick = ConsultaCepBancoClick
  end
  object pnConfigBD: TPanel
    Left = 8
    Top = 43
    Width = 303
    Height = 110
    TabOrder = 6
    Visible = False
    object edtNomeBD: TLabeledEdit
      Left = 8
      Top = 26
      Width = 136
      Height = 23
      EditLabel.Width = 58
      EditLabel.Height = 12
      EditLabel.Caption = 'Nome Banco'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -10
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      TabOrder = 0
      Text = ''
    end
    object btnUserBD: TLabeledEdit
      Left = 150
      Top = 26
      Width = 137
      Height = 23
      EditLabel.Width = 35
      EditLabel.Height = 12
      EditLabel.Caption = 'User BD'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -10
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      TabOrder = 1
      Text = ''
    end
    object LabeledEdit3: TLabeledEdit
      Left = 8
      Top = 61
      Width = 135
      Height = 23
      EditLabel.Width = 43
      EditLabel.Height = 12
      EditLabel.Hint = '*'
      EditLabel.Caption = 'Senha BD'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -10
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      EditLabel.ParentShowHint = False
      EditLabel.ShowHint = False
      TabOrder = 2
      Text = ''
    end
    object edrPortBD: TLabeledEdit
      Left = 149
      Top = 61
      Width = 136
      Height = 23
      EditLabel.Width = 39
      EditLabel.Height = 12
      EditLabel.Caption = 'Porta BD'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -10
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      TabOrder = 3
      Text = ''
    end
    object btnConfigBD: TButton
      Left = 80
      Top = 85
      Width = 129
      Height = 18
      Caption = 'OK Config'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnConfigBDClick
    end
  end
  object btnConfiguraBanco: TButton
    Left = 8
    Top = 10
    Width = 140
    Height = 27
    Caption = '1- Configura BD'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnConfiguraBancoClick
  end
end
