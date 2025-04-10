unit serviceApiCep;

interface
uses
System.SysUtils,System.Net.HttpClient,System.JSON,Dialogs,System.Generics.Collections,AddressClass;

type
TServiceApiCep = class

private

public

function fetchCep(const ACep: string): TAddressClass;

end;

implementation


function TServiceApiCep.fetchCep(const ACep: string):TAddressClass;
var
HTTPClient: THTTPClient;
Response: IHTTPResponse;
JSONValue: TJSONValue;
URL: string;
JCep :string;
AddressObject: TAddressClass;

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
              AddressObject := TAddressClass.Create  (
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

              Result := AddressObject;

            end;

          finally
           JSONVAlue.Free;
          end;

        end
        else
        begin
          raise Exception.Create('Erro na consulta da API STATUS CODE >>  ' + IntToStr(Response.StatusCode));;
        end;
finally
    HTTPClient.Free;
end;
end;

end.
