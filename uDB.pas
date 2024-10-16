unit uDB;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.PG,
  System.SysUtils, System.Classes;

type

TuDB = class

   FDPhysPgDriverLink: TFDPhysPgDriverLink;

private
     FDConnection: TFDConnection;
public
constructor Create;
destructor Destroy; override;
procedure ConectaPostgres;


end;


implementation


constructor TuDB.Create;
begin

  inherited Create;

  FDConnection := TFDConnection.Create(nil);
  FDConnection := TFDConnection.Create(nil);
  FDConnection.Params.Add('DriverID=PG');
  FDConnection.Params.DriverID := 'PG';
  FDConnection.Params.Database := 'EnderecosViaCep';
  FDConnection.Params.UserName := 'postgres';
  FDConnection.Params.Password := 'postgres';
  FDConnection.Params.Add('Server=localhost');
  FDConnection.Params.Add('Port=5432');
  FDConnection.Connected := True;


end;

destructor TuDB.Destroy;
begin

if  FDConnection.Connected then
    FDConnection.Connected := False;
    FDConnection.Free;
    inherited;
end;

procedure TuDB.ConectaPostgres;
begin
  try

    FDConnection.Connected := True;
    WriteLn('Conexão com banco OK');

  except
  on E: Exception do
  raise Exception.Create('Erro ao conectar: ' + E.Message);
  end;
end;
end.
