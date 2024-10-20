unit Formulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, moduleSQL,uCepService, Vcl.Mask, Vcl.ExtCtrls,Endereco_class;
type
  TFormEndereco = class(TForm)
    btnCriaTabelaTspdCep: TButton;
    edtCep: TLabeledEdit;
    memoRetorno: TMemo;
    btnConsultaSalva: TButton;
    edtUf: TLabeledEdit;
    ConsultaCepBanco: TButton;

    procedure FormCreate(Sender: TObject);

    procedure btnCriaTabelaTspdCepClick(Sender: TObject);

    procedure btnConsultaSalvaClick(Sender: TObject);
    procedure ConsultaCepBancoClick(Sender: TObject);


  private
    FURLConsulta: string;
  public
    { Public declarations }
  end;

var
  FormEndereco: TFormEndereco;

implementation

{$R *.dfm}




procedure TFormEndereco.btnConsultaSalvaClick(Sender: TObject);
var
EnderecoObjeto: TEndereco_class;
begin

   EnderecoObjeto := CepService.ConsultaCep(edtCep.Text);

   if moduloSQL.InserirouAtualiza(EnderecoObjeto) then
   begin
    memoRetorno.Text:=('[REGISTRO INSERIDO / ATUALIZADO]'+EnderecoObjeto.ToString);
   end
   else
   begin
     raise Exception.Create('Erro ao inserir no banco. Dados do Objeto :  '+EnderecoObjeto.ToString)
   end;


end;


procedure TFormEndereco.btnCriaTabelaTspdCepClick(Sender: TObject);
begin
    moduloSQL.CriarTabelaEndereco;
end;


procedure TFormEndereco.ConsultaCepBancoClick(Sender: TObject);
var
EnderecoUF : TEndereco_class;
ListaEnderecosUF : TList<TEndereco_class>;
I : Integer;
begin

    ListaEnderecosUF := moduloSQL.SelectCePUf(edtUf.Text);

    memoRetorno.Clear;

    if ListaEnderecosUF.Count > 0 then
    begin

      for I := 0 to ListaEnderecosUF.Count -1 do
      begin
        EnderecoUF := ListaEnderecosUF[I];
        memoRetorno.Lines.Add ('CEP : '+EnderecoUF.cep +', UF : '+EnderecoUF.uf)
      end;

    end;


end;

procedure TFormEndereco.FormCreate(Sender: TObject);
begin
   moduloSQL.ConectaBancoPostgres;
end;

end.
