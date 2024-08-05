unit uMunicipio;

interface

uses
    Data.DB,
    //classes de negócio
    SimpleAttributes, SimpleEntity;

Type
    [Table('municipio')]
    TMunicipio = class(TSimpleEntity)
    private
        FID: Integer;
        FNome: String;
        FMacroRegiao: Integer;
        FCodigo: Integer;
    public
        { Construtores e Destrutores }
        constructor Create;
        destructor Destroy; override;
    published
        [DBField('id'), PK, NotNull, AutoInc]
        property ID: Integer read FID write FID;
        [DBField('nome'), NotNull]
        property Nome: String read FNome write FNome;
        [DBField('macro_regiao'), NotNull]
        property MacroRegiao: Integer read FMacroRegiao write FMacroRegiao;
        [DBField('codigo'), NotNull]
        property Codidgo: Integer read FCodigo write FCodigo;
    end;

implementation

{ TMunicipio }

constructor TMunicipio.Create;
begin
    inherited;
end;

destructor TMunicipio.Destroy;
begin

  inherited;
end;

end.
