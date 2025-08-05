unit uModeloBase;

interface

uses
  FireDAC.Comp.Client;

type
  TModeloBase = class
  protected
    FQuery: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Inserir; virtual; abstract;
    procedure Atualizar; virtual; abstract;
    procedure Excluir; virtual; abstract;
    procedure BuscarPorID(ID: Integer); virtual; abstract;
  end;

implementation

uses
  uDmPrincipal;

constructor TModeloBase.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := dmPrincipal.FDConnection;
end;

destructor TModeloBase.Destroy;
begin
  FQuery.Free;
  inherited;
end;

end.

