unit DataConexao;

interface

uses
  System.SysUtils,Dialogs, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TServiceConexao = class(TDataModule)
    ConexaoDB: TFDConnection;
    FDPhysPgDriverLink: TFDPhysPgDriverLink;
    QRY_migration: TFDQuery;
  private
    { Private declarations }

  public
    { Public declarations }
    procedure ConectaBancoPostgres;
    procedure CriarTabelaEndereco;
  end;

var
  ServiceConexao: TServiceConexao;

implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}

procedure TServiceConexao.ConectaBancoPostgres;
begin
try
      ConexaoDB.DriverName := 'PG';
      ConexaoDB.Params.Database := 'EnderecosViaCep';
      ConexaoDB.Params.UserName := 'postgres';
      ConexaoDB.Params.Password := 'postgres';
      ConexaoDB.Params.Add('Server=localhost');
      ConexaoDB.Params.Add('Port=5432');
      ConexaoDB.Connected := True;

      ShowMessage('conectado ao banco');

  except on E: Exception do
    ShowMessage('Erro ao conectar com banco de dados ' +E.Message);
  end;

end;


procedure TServiceConexao.CriarTabelaEndereco;
begin
  try

   QRY_migration.SQL.Text :=
      'CREATE TABLE IF NOT EXISTS TspdCep  (' +
      'ID SERIAL PRIMARY KEY, ' +
      'cep VARCHAR(9), ' +
      'logradouro VARCHAR(100), ' +
      'complemento VARCHAR(100), ' +
      'bairro VARCHAR(100), ' +
      'localidade VARCHAR(100), ' +
      'uf VARCHAR(2), ' +
      'ibge VARCHAR(7), ' +
      'gia VARCHAR(5), ' +
      'ddd VARCHAR(3), ' +
      'siafi VARCHAR(5)' +
      ')';

    QRY_migration.ExecSQL;

    ShowMessage('Tabela Endereco criada com sucesso.');
  except
    on E: Exception do
      ShowMessage('Erro ao criar tabela: ' + E.Message);
  end;
end;



{$R *.dfm}

end.
