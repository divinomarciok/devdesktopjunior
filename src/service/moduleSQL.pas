unit moduleSQL;

interface

uses
  System.SysUtils,Dialogs, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet,Endereco_class,System.Generics.Collections;

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
    function SelectCePUf(const AUf: string): TList<TEndereco_class>;
    function InserirouAtualiza(const Endereco: TEndereco_class): boolean;
  end;

var
  moduloSQL: TServiceConexao;

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

     // ShowMessage('conectado ao banco');

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
      'cep VARCHAR(9) UNIQUE, ' +
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
    QRY_migration.Close;

    ShowMessage('Tabela "TspdCep" criada com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao criar tabela : ' + E.Message);
  end;
end;



function TServiceConexao.InserirouAtualiza(const Endereco: TEndereco_class): boolean;
begin
try
  QRY_migration.SQL.Text := 'INSERT INTO TspdCep (cep, logradouro, complemento, bairro, localidade, uf, ibge, ddd) ' +
                      'VALUES (:cep, :logradouro, :complemento, :bairro, :localidade, :uf, :ibge, :ddd) ' +
                      'ON CONFLICT (cep) DO UPDATE SET ' +
                      'logradouro = EXCLUDED.logradouro, complemento = EXCLUDED.complemento, ' +
                      'bairro = EXCLUDED.bairro, localidade = EXCLUDED.localidade, uf = EXCLUDED.uf, ' +
                      'ibge = EXCLUDED.ibge, ddd = EXCLUDED.ddd';

    QRY_migration.ParamByName('cep').AsString := Endereco.cep;
    QRY_migration.ParamByName('logradouro').AsString := Endereco.logradouro;
    QRY_migration.ParamByName('complemento').AsString := Endereco.complemento;
    QRY_migration.ParamByName('bairro').AsString := Endereco.bairro;
    QRY_migration.ParamByName('localidade').AsString := Endereco.localidade;
    QRY_migration.ParamByName('uf').AsString := Endereco.uf;
    QRY_migration.ParamByName('ibge').AsString := Endereco.ibge;
    QRY_migration.ParamByName('ddd').AsString := Endereco.ddd;
    QRY_migration.ExecSQL;
    QRY_migration.Close;
    Result:= True;
  except
    on E: Exception do
       raise Exception.Create('Erro ao Inserir Registro SQL : ' + E.Message);
   end;
end;



function TServiceConexao.SelectCePUf(const AUf:string): TList<TEndereco_class>;
var

Endereco_banco : TEndereco_class;
ListaEnderecos : TList<TEndereco_class>;

begin
    ListaEnderecos := TList<TEndereco_class>.Create;

    QRY_migration.SQL.Text :='SELECT * FROM TspdCep WHERE uf = :UF';
    QRY_migration.ParamByName('UF').AsString := AUf;
    QRY_migration.Open;

    if not QRY_migration.IsEmpty then
    begin

      QRY_migration.First;

       while not QRY_migration.Eof do
       begin

         Endereco_banco := TEndereco_class.Create(
         QRY_migration.FieldByName('cep').AsString,
         QRY_migration.FieldByName('logradouro').AsString,
         QRY_migration.FieldByName('complemento').AsString,
         QRY_migration.FieldByName('bairro').AsString,
         QRY_migration.FieldByName('localidade').AsString,
         QRY_migration.FieldByName('uf').AsString,
         QRY_migration.FieldByName('ibge').AsString,
         QRY_migration.FieldByName('gia').AsString,
         QRY_migration.FieldByName('ddd').AsString,
         QRY_migration.FieldByName('siafi').AsString

         );

         ListaEnderecos.Add(Endereco_banco);
         QRY_migration.Next;
       end;

    end
    else
    begin
      ShowMessage('Nenhum resultado de CEP para UF : '+AUf);
    end;

    Result:=ListaEnderecos;
    QRY_migration.Close;


end;

{$R *.dfm}

end.
