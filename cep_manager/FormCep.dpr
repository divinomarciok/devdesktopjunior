program FormCep;

uses
  Vcl.Forms,
  UnitViewCep in 'src\view\UnitViewCep.pas' {FormCepManager},
  AddressClass in 'src\model\AddressClass.pas',
  AddresModuleDAO in 'src\repository\AddresModuleDAO.pas' {AddressModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCepManager, FormCepManager);
  Application.CreateForm(TAddressModule, AddressModule);

  Application.Run;
end.
