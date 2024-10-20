program ConsultaCEP;

uses
  Vcl.Forms,
  Formulario in 'Formulario.pas' {FormEndereco},
  Endereco_class in '..\model\Endereco_class.pas',
  moduleSQL in '..\service\moduleSQL.pas' {ServiceConexao: TDataModule},
  uCepService in '..\service\uCepService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TServiceConexao, moduloSQL);
  Application.CreateForm(TFormEndereco, FormEndereco);
  Application.Run;
end.
