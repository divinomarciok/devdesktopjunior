unit uCepService;

interface
uses
System.SysUtils,System.Net.HttpClient,Endereco_class,
System.JSON,Dialogs,moduleSQL,System.Generics.Collections;

type
TCepService = class

private

public

function ConsultaCep(const ACep: string): TEndereco_class;

procedure criaEnderecoTesTe;

end;

var
 CepService: TCepService;
 Endereco: TEndereco_class;

implementation


function TCepService.ConsultaCep(const ACep :string): TEndereco_class;
var
HTTPClient: THTTPClient;
Response: IHTTPResponse;
JSONValue: TJSONValue;
URL: string;
resultado: boolean;
JCep :string;

begin
     HTTPClient := THTTPClient.Create;
try
       URL :='https://viacep.com.br/ws/' + ACep + '/json';
       Response := HTTPClient.Get(URL);
       if Response.StatusCode = 200 then
        begin

          JSONValue := TJSONObject.ParseJSONValue(Response.ContentAsString);

          try

            if JSONValue <> nil then
            begin

             JCep := JSONValue.GetValue<string>('cep');
              Endereco := TEndereco_class.Create  (
                JSONValue.GetValue<string>('cep'),
                JSONValue.GetValue<string>('logradouro'),
                JSONValue.GetValue<string>('complemento'),
                JSONValue.GetValue<string>('bairro'),
                JSONValue.GetValue<string>('localidade'),
                JSONValue.GetValue<string>('uf'),
                JSONValue.GetValue<string>('ibge'),
                JSONValue.GetValue<string>('gia'),
                JSONValue.GetValue<string>('ddd'),
                JSONValue.GetValue<string>('siafi')
              );

              Result := Endereco;

            end;

          finally
           JSONVAlue.Free;
          end;

        end
        else
        begin
          raise Exception.Create('Erro ao consultar o CEP. Status: ' + IntToStr(Response.StatusCode));;
        end;
finally
    HTTPClient.Free;
end;

end;


procedure TCepService.criaEnderecoTesTe;
begin
try
 Endereco := TEndereco_class.Create(
    '75902030',
    'Pra�a da S�',
    'Muro Amarelo',
    'S�',
    'S�o Paulo',
    'SP',
    '3550308',
    '',
    '11',
    '7107'
  );

 if Endereco.cep <> '' then
 begin
   ShowMessage('Endereco Criado');
   ShowMessage(Endereco.toString);
 end;
except
  on E: Exception do
    ShowMessage('Erro ao criar objeto endereco : '+E.Message);
  end;


end;

end.
