unit serviceApiCep;

interface
uses
System.SysUtils,System.Net.HttpClient,System.JSON,Dialogs,System.Generics.Collections,AddressClass;

type
TServiceApiCep = class

private

public

function checkCep(const ACep: string): TAddressClass;
function JsonHaveErro(const AJSONValue: TJSONValue): Boolean;

end;

implementation



function TServiceApiCep.checkCep(const ACep: string):TAddressClass;
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

            if JsonHaveErro(JSONValue) then
             begin
              ShowMessage('Retorno OK - Por�m sem nenhuma informa��o [CEP N�O EXISTE]');
              Result:= nil;
              end
             else
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
        end;
  except
    on E: Exception do
      begin
          ShowMessage('Retorno ERRO - '+E.Message);
      end;
  end;

end;

function TServiceApiCep.JsonHaveErro(const AJSONValue: TJSONValue): Boolean;
var
  JSONObject: TJSONObject;
  ErroValue: TJSONValue;
begin
  Result := False;
  if AJSONValue is TJSONObject then
  begin
    JSONObject := AJSONValue as TJSONObject;
    if JSONObject.TryGetValue('erro', ErroValue) then
    begin
      if (ErroValue is TJSONString) and (TJSONString(ErroValue).Value.ToLower = 'true') then
      begin
        Result := True;
      end;
    end;
  end;
end;


end.
