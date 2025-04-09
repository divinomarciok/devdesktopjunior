unit UnitViewCep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TFormCepManager = class(TForm)
    lbeditUf: TLabeledEdit;
    lbeditCep: TLabeledEdit;
    btnConsultaBD: TButton;
    btnConsultaApi: TButton;
    memoReturn: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCepManager: TFormCepManager;

implementation

{$R *.dfm}

end.
