unit Formulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DataConexao,uCepService, Vcl.Mask,
  Vcl.ExtCtrls;
type
  TFormEndereco = class(TForm)
    Button1: TButton;
    btnConsultaAPI: TButton;
    edtCep: TLabeledEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConsultaAPIClick(Sender: TObject);
  private
    FURLConsulta: string;
  public
    { Public declarations }
  end;

var
  FormEndereco: TFormEndereco;


implementation

{$R *.dfm}

procedure TFormEndereco.btnConsultaAPIClick(Sender: TObject);
begin
        CepService.consultaCep(edtCep.Text);
end;

procedure TFormEndereco.Button1Click(Sender: TObject);
begin
    ServiceConexao.CriarTabelaEndereco;
end;



procedure TFormEndereco.FormCreate(Sender: TObject);
begin
//      ServiceDB.ConectaBancoPostgres;
      ServiceConexao.ConectaBancoPostgres;
end;

end.
