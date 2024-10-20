unit Endereco;

interface

type

TEndereco = class

private

FCep :string;
FLogradouro :string;
FComplemento :string;
FBairro: string;
FLocalidade: string;
FUf: string;
FIbge: string;
FGia: string;
FDdd: string;
FSiafi: string;

function GetCep :string;

public

property cep: string read Fcep write Fcep;
property logradouro: string read FLogradouro write FLogradouro;
property complemento: string read FComplemento write FComplemento;
property bairro: string read FBairro write Fbairro;
property localidade: string read FLocalidade write FLocalidade;
property uf: string read FUf write FUf;
property ibge: string read FIbge write FIbge;
property gia: string read FGia write FGia;
property ddd: string read Fddd write Fddd;
property siafi: string read Fsiafi write Fsiafi;

constructor Create (const Acep, ALogradouro, Acomplemento, ABairro, ALocalidade, AUf, AIbge, AGia, ADDD, ASiafi:string);

end;

implementation

function TEndereco.GetCep: string;
begin
  Result := Fcep;
end;

constructor TEndereco.Create(const Acep: string; const ALogradouro: string; const Acomplemento: string; const ABairro: string; const ALocalidade: string; const AUf: string; const AIbge: string; const AGia: string; const ADDD: string; const ASiafi: string);
begin
  FCep := Acep;
  FLogradouro := ALogradouro;
  FComplemento := AComplemento;
  FBairro := ABairro;
  FLocalidade := ALocalidade;
  FUf := AUf;
  FIbge := AIbge;
  FGia := Agia;
  Fddd := Addd;
  Fsiafi := Fsiafi
end;





end.
