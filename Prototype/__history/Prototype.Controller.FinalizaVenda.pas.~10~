unit Prototype.Controller.FinalizaVenda;

interface

uses Prototype.Controller.Interfaces, System.Generics.Collections;

type

  TModelFinalizaVenda = class(TInterfacedObject, iFinalizaVenda)
  private
    FlistaVenda: TDictionary<string, ivenda>;
    FLista: TList<ivenda>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFinalizaVenda;
    function Finalizar(Value: ivenda): iFinalizaVenda;
    function FormaPagamento: iFormaPagamento;
  end;

implementation

{ TModelFinalizaVenda }

constructor TModelFinalizaVenda.Create;
begin

end;

destructor TModelFinalizaVenda.Destroy;
begin

  inherited;
end;

function TModelFinalizaVenda.Finalizar(Value: ivenda): iFinalizaVenda;
begin
  Result := Self;
  FLista.Add(Value);
end;

function TModelFinalizaVenda.FormaPagamento: iFormaPagamento;
begin
  //Result := Self;
end;

class function TModelFinalizaVenda.New: iFinalizaVenda;
begin
  Result := Self.Create;
end;

end.
