unit TestserviceApiCep;

interface

uses
  System.Net.HttpClient, System.Generics.Collections,TestFramework,
  System.SysUtils, serviceApiCep, Dialogs, AddressClass, System.JSON;

type

  TestTServiceApiCep = class(TTestCase)
  strict private
    FServiceApiCep: TServiceApiCep;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestfetchCep;
  end;

implementation

procedure TestTServiceApiCep.SetUp;
begin
  FServiceApiCep := TServiceApiCep.Create;
end;

procedure TestTServiceApiCep.TearDown;
begin
  FServiceApiCep.Free;
  FServiceApiCep := nil;
end;

procedure TestTServiceApiCep.TestfetchCep;
var
  AddressObject: TAddressClass;
  ACep: string;

begin
  ACep:= '33902030';
  AddressObject := FServiceApiCep.checkCep(ACep);

  CheckTrue( Assigned(AddressObject), 'Nenhum Objeto Address retornado no teste');
  CheckEquals(AddressObject.Cep, '33902-030', 'O CEP retornado não corresponde ao CEP consultado.');


end;

initialization

  RegisterTest(TestTServiceApiCep.Suite);
end.

