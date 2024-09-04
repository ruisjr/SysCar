unit uUsuario;

interface

uses
    Data.DB, System.Classes,
    //classes de negócio
    SimpleAttributes, SimpleEntity;

Type
  [Table('usuario')]
  TUsuario = class(TSimpleEntity)
  private
    FID: Integer;
    FPerfil: Integer;
    FSenha: String;
    FLogin: String;
    FNome: String;
    FEmail: String;
    FAtivo: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
  published
    [DBField('id'), PK, AutoInc, NotNull]
    property ID: Integer read FID write FID;
    [DBField('nome'), NotNull]
    property Nome: String read FNome write FNome;
    [DBField('login'), NotNull]
    property Login: String read FLogin write FLogin;
    [DBField('email')]
    property Email: String read FEmail write FEmail;
    [DBField('senha')]
    property Senha: String read FSenha write FSenha;
    [DBField('ativo'), NotNull]
    property Ativo: Boolean read FAtivo write FAtivo;
    [DBField('perfil')]
    property Perfil: Integer read FPerfil write FPerfil;
  end;

  [Table('perfil_usuario')]
  TPerfilUsuario = class(TSimpleEntity)
  private
    FAtivo: Boolean;
    FID: Integer;
    FNome: String;
  public
    constructor Create;
    destructor Destroy; override;
  published
    [DBField('id'), PK, AutoInc, NotNull]
    property ID: Integer read FID write FID;
    [DBField('nome'), NotNull]
    property Nome: String read FNome write FNome;
    [DBField('ativo'), NotNull]
    property Ativo: Boolean read FAtivo write FAtivo;
  end;

implementation

{ TUsuario }

constructor TUsuario.Create;
begin
    inherited Create;
end;

destructor TUsuario.Destroy;
begin
    inherited Destroy;
end;

{ TPerfilUsuario }

constructor TPerfilUsuario.Create;
begin
    inherited Create;
end;

destructor TPerfilUsuario.Destroy;
begin
    inherited Destroy;
end;

end.
