unit Prototype.Controller.FinalizaVenda;

interface

uses Prototype.Controller.Interfaces, System.Generics.Collections;

type

  FormasPagamento = (CartaoCredito, CartaoDebito, Dinheiro, Pix);

  TModelFinalizaVenda = class(TInterfacedObject, iFinalizaVenda)
  private
    FVenda: iVenda;
    Flista: TList<iFormaPagamento>;
  public
    constructor Create(Value: iVenda);
    destructor Destroy; override;
    class function New(Value: iVenda): iFinalizaVenda;
    function Total: Currency;
    function Finalizar: string;
    function Add(Value: iFormaPagamento): iFinalizaVenda;
    function FormaPagamento: TList<iFormaPagamento>;
  end;

implementation

uses
  System.SysUtils;

{ TModelFinalizaVenda }

function TModelFinalizaVenda.Add(Value: iFormaPagamento): iFinalizaVenda;
begin
  Result := Self;
  Flista.Add(Value);
end;

constructor TModelFinalizaVenda.Create(Value: iVenda);
begin
  FVenda := Value;
end;

destructor TModelFinalizaVenda.Destroy;
begin
  inherited;
end;

function TModelFinalizaVenda.Finalizar: string;
begin
  try

  except
    raise Exception.Create('Pagamento Difere do total da venda');
  end;

end;

function TModelFinalizaVenda.FormaPagamento: TList<iFormaPagamento>;
begin
  Result := Flista;
end;

class function TModelFinalizaVenda.New(Value: iVenda): iFinalizaVenda;
begin
  Result := Self.Create(Value);
end;

function TModelFinalizaVenda.Total: Currency;
var
  I: Integer;
begin
  Result := FVenda.Total;
  if Assigned(Flista) then
    for I := 0 to Pred(Flista.Count) do
      Result := Flista[I].GetFormaValor - Result;
end;

end.
