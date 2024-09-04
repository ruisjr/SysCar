unit uPessoa;

interface

uses
    Data.DB, System.Classes,
    //classes de negócio
    SimpleAttributes, SimpleEntity;

Type
  [Table('pessoa')]
  TPessoa = class(TSimpleEntity)
  private
    FId: integer;
    FDataCadastro: TDateTime;
    fNome: string;
    FAtivo: Boolean;
    FEmail: String;
    FDataNascimento: TDateTime;
    FCPF: String;
    FSexo: String;
    FTelefone: String;
    FCelular: String;
    FCep: String;
    FLogradouro: String;
    FNumero: Integer;
    FComplemento: String;
    FBairro: String;
    FCidade: String;
    FEstado: String;
    FMensalista: Boolean;
    FEmpresa: Boolean;
    FPais: String;
    FNomeResumido: string;
  public
    constructor Create;
    destructor Destroy; override;
  published
    [DBField('id'), PK, AutoInc, NotNull]
    property Id: Integer read FId write FId;
    [DBField('nome'), NotNull]
    property Nome: string read fNome write FNome;
    [DBField('nome_resumido'), Display('Nome Resumido')]
    property NomeResumido: string read FNomeResumido write FNomeResumido;
    [DBField('dt_cadastro')]
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
    [DBField('ativo')]
    property Ativo: Boolean read FAtivo write FAtivo;
    [DBField('email')]
    property Email: String read FEmail write FEmail;
    [DBField('dt_nascimento'), Display('Data de Nascimento')]
    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
    [DBField('cpf_cnpj')]
    property Cpf: String read FCPF write FCPF;
    [DBField('sexo')]
    property Sexo: String read FSexo write FSexo;
    [DBField('telefone')]
    property Telefone: String read FTelefone write FTelefone;
    [DBField('celular')]
    property Celular: String read FCelular write FCelular;
    [DBField('cep')]
    property Cep: String read FCep write FCep;
    [DBField('logradouro')]
    property Logradouro: String read FLogradouro write FLogradouro;
    [DBField('numero')]
    property Numero: Integer read FNumero write FNumero;
    [DBField('complemento')]
    property Complemento: String read FComplemento write FComplemento;
    [DBField('cidade')]
    property Cidade: String read FCidade write FCidade;
    [DBField('estado')]
    property Estado: String read FEstado write FEstado;
    [DBField('bairro')]
    property Bairro: String read FBairro write FBairro;
    [DBField('pais')]
    property Pais: String read FPais write FPais;
    [DBField('mensalista')]
    property Mensalista: Boolean read FMensalista write FMensalista;
    [DBField('empresa')]
    property Empresa: Boolean read FEmpresa write FEmpresa;
  end;

implementation

{ TPessoa }

constructor TPessoa.Create;
begin
    inherited Create;
end;

destructor TPessoa.Destroy;
begin
    inherited Destroy;
end;

Initialization
    RegisterClass(TPessoa);

finalization
  UnRegisterClass(TPessoa);

end.
