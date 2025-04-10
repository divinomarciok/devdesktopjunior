unit UnitViewCep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Utilities,Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,serviceApiCep,AddressClass;

type
  TFormCepManager = class(TForm)
    edtUf: TLabeledEdit;
    edtCep: TLabeledEdit;
    btnConsultaBD: TButton;
    btnConsultaApi: TButton;
    memoReturn: TMemo;
    btnSalve: TButton;
    procedure btnConsultaBDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCepManager: TFormCepManager;


implementation

{$R *.dfm}

procedure TFormCepManager.btnConsultaBDClick(Sender: TObject);
var
AddresObject : TAddressClass;
serviceApi : TServiceApiCep;
UtilitiesObject : TUtilities;
begin

  UtilitiesObject := TUtilities.Create;

    if UtilitiesObject.isCEPValid(edtCep.Text) then
    begin
    AddresObject := serviceApi.fetchCep(edtCep.Text);
    memoReturn.Text := AddresObject.ToString;
    end;


end;

end.
