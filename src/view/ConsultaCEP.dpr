program ConsultaCEP;

uses
  Vcl.Forms,
  Formulario in 'Formulario.pas' {FormEndereco},
  Endereco_class in '..\model\Endereco_class.pas',
  DataConexao in '..\service\DataConexao.pas' {ServiceConexao: TDataModule},
  uCepService in '..\service\uCepService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TServiceConexao, ServiceConexao);
  Application.CreateForm(TFormEndereco, FormEndereco);
  Application.Run;
end.
