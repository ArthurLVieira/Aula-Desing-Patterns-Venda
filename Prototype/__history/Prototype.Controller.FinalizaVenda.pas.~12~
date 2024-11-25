unit Prototype.Controller.FinalizaVenda;

interface

uses Prototype.Controller.Interfaces, System.Generics.Collections;

type

  TModelFinalizaVenda = class(TInterfacedObject, iFinalizaVenda, iFormaPagamento)
  private
    FFormaPagamento: string;
    FlistaVenda: TDictionary<TList<string>, ivenda>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFinalizaVenda;
    function Finalizar(Value: iFormaPagamento): iFinalizaVenda;
    function formaPagamento: iFormaPagamento;
  end;

implementation

uses
  System.SysUtils;

{ TModelFinalizaVenda }

constructor TModelFinalizaVenda.Create;
begin
  FlistaVenda := TDictionary<string, iVenda>.Create;
end;

destructor TModelFinalizaVenda.Destroy;
begin
  FreeAndNil(FlistaVenda);

  inherited;
end;

function TModelFinalizaVenda.Finalizar(Value: iFormaPagamento): iFinalizaVenda;
begin
  Result := Self;
end;

function TModelFinalizaVenda.formaPagamento: iFormaPagamento;
begin
  Result := Self;
end;

class function TModelFinalizaVenda.New: iFinalizaVenda;
begin
  Result := Self.Create;
end;

end.
