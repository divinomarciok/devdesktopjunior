program FormCepTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestAddressClass in 'TestAddressClass.pas',
  AddressClass in '..\src\class\AddressClass.pas',
  TestAddresModuleDAO in 'TestAddresModuleDAO.pas',
  AddresModuleDAO in '..\src\repository\AddresModuleDAO.pas',
  TestserviceApiCep in 'TestserviceApiCep.pas',
  serviceApiCep in '..\src\services\serviceApiCep.pas',
  TestUtilities in 'TestUtilities.pas',
  Utilities in '..\src\utils\Utilities.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

