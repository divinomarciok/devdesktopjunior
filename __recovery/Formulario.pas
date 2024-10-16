unit Formulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;
type
  TFormEndereco = class(TForm)
    //FDConnection: TFDConnection;
    //testeConecta: TButton;
    //FDPhysPgDriverLink: TFDPhysPgDriverLink;
    procedure testeConectaClick(Sender: TObject);
  private
    { Private declarations }
  public

  procedure ConectaBancoPostgres;
    { Public declarations }
  end;

var
  FormEndereco: TFormEndereco;


implementation

{$R *.dfm}

procedure TFormEndereco.ConectaBancoPostgres;
begin
  try
  {FDConnection.Params.Add('DriverID=PG');
  FDConnection.Params.DriverID := 'PG';
  FDConnection.Params.Database := 'EnderecosViaCep';
  FDConnection.Params.UserName := 'postgres';
  FDConnection.Params.Password := 'postgres';
  FDConnection.Params.Add('Server=localhost');
  FDConnection.Params.Add('Port=5432');
  FDConnection.Connected := True; }

  ShowMessage('Conectado ao banco com sucesso');

except
   on E: Exception do
  ShowMessage('Erro ao conectar ao banco de dados: '+ E.message);
end;

end;




procedure TFormEndereco.testeConectaClick(Sender: TObject);
begin
ConectaBancoPostgres;
end;



end.
