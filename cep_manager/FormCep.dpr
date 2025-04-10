program FormCep;

uses
  Vcl.Forms,
  UnitViewCep in 'UnitViewCep.pas' {FormCepManager},
  AddressClass in 'src\model\AddressClass.pas',
  AddresModuleDAO in 'src\repository\AddresModuleDAO.pas' {AddressModule: TDataModule},
  serviceApiCep in 'src\services\serviceApiCep.pas',
  Utilities in 'src\utils\Utilities.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCepManager, FormCepManager);
  Application.CreateForm(TAddressModule, AddressModule);
  Application.Run;
end.
