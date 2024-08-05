unit uPais;

interface

uses
    Data.DB,
    //classes de negócio
    SimpleAttributes, SimpleEntity;

Type
    [Table('pais')]
    TPais = class(TSimpleEntity)
    private
        FID: Integer;
        FNome: String;
    public
        { Construtores e Destrutores }
        constructor Create;
        destructor Destroy; override;
    published
        [DBField('id'), PK, NotNull, AutoInc]
        property ID: Integer read FID write FID;
        [DBField('nome'), NotNull]
        property Nome: String read FNome write FNome;
    end;

implementation

{ TPais }

constructor TPais.Create;
begin
    inherited;
end;

destructor TPais.Destroy;
begin

  inherited;
end;

end.
