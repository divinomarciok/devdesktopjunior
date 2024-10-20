unit Endereco_class;

interface

uses
  System.SysUtils,Dialogs;


type

TEndereco_class = class

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

//Getters

function GetCep: string;
function GetLogradouro: string;
function GetComplemento: string;
function GetBairro: string;
function GetLocalidade: string;
function GetUf: string;
function GetIbge: string;
function GetGia: string;
function GetDdd: string;
function GetSiafi: string;

// Setters

procedure SetCep(const Value: string);
procedure SetLogradouro(const Value: string);
procedure SetComplemento(const Value: string);
procedure SetBairro(const Value: string);
procedure SetLocalidade(const Value: string);
procedure SetUf(const Value: string);
procedure SetIbge(const Value: string);
procedure SetGia(const Value: string);
procedure SetDdd(const Value: string);
procedure SetSiafi(const Value: string);

public

function ToString: string; override;

property cep: string read GetCep write SetCep;
property logradouro: string read GetLogradouro write SetLogradouro;
property complemento: string read GetComplemento write SetComplemento;
property bairro: string read GetBairro write SetBairro;
property localidade: string read GetLocalidade write SetLocalidade;
property uf: string read GetUf write SetUf;
property ibge: string read GetIbge write SetIbge;
property gia: string read GetGia write SetGia;
property ddd: string read GetDdd write SetDdd;
property siafi: string read GetSiafi write SetSiafi;

{property cep: string read Fcep write Fcep;
property logradouro: string read FLogradouro write FLogradouro;
property complemento: string read FComplemento write FComplemento;
property bairro: string read FBairro write Fbairro;
property localidade: string read FLocalidade write FLocalidade;
property uf: string read FUf write FUf;
property ibge: string read FIbge write FIbge;
property gia: string read FGia write FGia;
property ddd: string read Fddd write Fddd;
property siafi: string read Fsiafi write Fsiafi;}

constructor Create (const Acep, ALogradouro, Acomplemento, ABairro, ALocalidade, AUf, AIbge, AGia, ADDD, ASiafi:string);

end;

implementation

function TEndereco_class.GetCep: string;
begin
  Result := Fcep;
end;

procedure TEndereco_class.SetCep(const Value: string);
begin
  if Value = '' then
    raise Exception.Create('CEP n�o pode ser vazio.');
  Fcep := Value;
end;

function TEndereco_class.GetLogradouro: string;
begin
  Result := Flogradouro;
end;

procedure TEndereco_class.SetLogradouro(const Value: string);
begin
  Flogradouro := Value;
end;

function TEndereco_class.GetComplemento: string;
begin
  Result := Fcomplemento;
end;

procedure TEndereco_class.SetComplemento(const Value: string);
var
semcomplemento :string;
begin


  if Value = '' then
  begin
    complemento  := 'Sem complemento';
  end
  else
  begin
       Fcomplemento := Value;
  end;


end;

function TEndereco_class.GetBairro: string;
begin
  Result := Fbairro;
end;

procedure TEndereco_class.SetBairro(const Value: string);
begin
  Fbairro := Value;
end;

function TEndereco_class.GetLocalidade: string;
begin
  Result := Flocalidade;
end;

procedure TEndereco_class.SetLocalidade(const Value: string);
begin
  Flocalidade := Value;
end;

function TEndereco_class.GetUf: string;
begin
  Result := Fuf;
end;

procedure TEndereco_class.SetUf(const Value: string);
begin
  Fuf := Value;
end;

function TEndereco_class.GetIbge: string;
begin
  Result := Fibge;
end;

procedure TEndereco_class.SetIbge(const Value: string);
begin
  Fibge := Value;
end;

function TEndereco_class.GetGia: string;
begin
  Result := Fgia;
end;

procedure TEndereco_class.SetGia(const Value: string);
begin
  Fgia := Value;
end;

function TEndereco_class.GetDdd: string;
begin
  Result := Fddd;
end;

procedure TEndereco_class.SetDdd(const Value: string);
begin
  Fddd := Value;
end;

function TEndereco_class.GetSiafi: string;
begin
  Result := Fsiafi;
end;

procedure TEndereco_class.SetSiafi(const Value: string);
begin
  Fsiafi := Value;               end;


constructor TEndereco_class.Create(const Acep: string; const ALogradouro: string; const Acomplemento: string; const ABairro: string; const ALocalidade: string; const AUf: string; const AIbge: string; const AGia: string; const ADDD: string; const ASiafi: string);

begin
  cep := ACep;
  logradouro := ALogradouro;
  complemento := AComplemento;
  bairro := ABairro;
  localidade := ALocalidade;
  uf := AUf;
  ibge := AIbge;
  gia := Agia;
  ddd := Addd;
  siafi := Fsiafi;
end;




function TEndereco_class.ToString: string;
var
complento :string;
begin
  Result := Format('%s CEP: %s %s Logradouro: %s %s Complemento: %s %s Bairro: %s %s Localidade: %s %s UF: %s %s IBGE: %s %s GIA: %s %s DDD: %s %s SIAFI: %s %s',
                   [sLineBreak,cep,sLineBreak, logradouro,sLineBreak, complemento, sLineBreak, bairro,sLineBreak, localidade,sLineBreak,uf,sLineBreak, ibge,sLineBreak, gia,sLineBreak, ddd,sLineBreak, siafi,sLineBreak]);
end;







end.
