unit uCepService;

interface
uses
System.SysUtils,System.Net.HttpClient,Endereco_class,System.JSON,Dialogs;



type
TCepService = class

public

EnderecoViaCep: TEndereco_class;
//procedure consultaCep(const ACep: string);
procedure criaEndereco;

function ConsultaCep(const ACep: string): TEndereco_class;


end;

var
 CepService: TCepService;
 Endereco: TEndereco_class;

implementation


procedure TCepService.criaEndereco;
begin

Endereco := TEndereco_class.Create(    '01001-000',    // cep
    'Pra�a da S�',  // logradouro
    '',             // complemento
    'S�',           // bairro
    'S�o Paulo',    // localidade
    'SP',           // uf
    '3550308',      // ibge
    '',             // gia
    '11',           // ddd
    '7107'          // siafi
    );
end;

function TCepService.ConsultaCep(const ACep :string): TEndereco_class;
var
HTTPClient: THTTPClient;
Response: IHTTPResponse;
JSONValue: TJSONValue;
URL: string;

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

              Endereco := TEndereco_class.Create(
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

          {try
             if Assigned(JSONValue) then
             begin

               ShowMessage('Logradouro: ' + JSONValue.GetValue<string>('logradouro') + sLineBreak +
                      'Bairro: ' + JSONValue.GetValue<string>('bairro') + sLineBreak +
                      'Localidade: ' + JSONValue.GetValue<string>('localidade') + sLineBreak +
                      'UF: ' + JSONValue.GetValue<string>('uf'));
             end;

          finally
            JSONValue.Free;
          end; }

        end
        else
        begin
          raise Exception.Create('Erro ao consultar o CEP. Status: ' + IntToStr(Response.StatusCode));;
        end;
finally
    HTTPClient.Free;
end;

end;




end.
