unit Prototype.Controller.FinalizaVenda;

interface

uses Prototype.Controller.Interfaces, System.Generics.Collections;

type

  FormasPagamento = (CartaoCredito, CartaoDebito, Dinheiro, Pix);

  TModelFinalizaVenda = class(TInterfacedObject, iFinalizaVenda,
    iFormaPagamento)
  private
    FVenda: iVenda;
    FlistaVenda: TDictionary<FormasPagamento, Currency>;
  public
    constructor Create(Value: iVenda);
    destructor Destroy; override;
    class function New(Value: iVenda): iFinalizaVenda;
    function Finalizar: Currency;
    function formaPagamento: iFormaPagamento;
    function Pix(Value: Currency): iFormaPagamento;
    function Dinheriro(Value: Currency): iFormaPagamento;
    function CartaoCredito(Value: Currency): iFormaPagamento;
    function CartaoDebito(Value: Currency): iFormaPagamento;
  end;

implementation

uses
  System.SysUtils;

{ TModelFinalizaVenda }

function TModelFinalizaVenda.CartaoCredito(Value: Currency): iFormaPagamento;
begin
  Result := Self;
  if not Assigned(Self.CartaoCredito(Value)) then
    FlistaVenda.Add(FormasPagamento.CartaoCredito, Value);
end;

function TModelFinalizaVenda.CartaoDebito(Value: Currency): iFormaPagamento;
begin
  Result := Self;
  if not Assigned(Self.CartaoDebito(Value)) then
    FlistaVenda.Add(FormasPagamento.CartaoDebito, Value);
end;

constructor TModelFinalizaVenda.Create(Value: iVenda);
begin
  FVenda := Value;
  FlistaVenda := TDictionary<FormasPagamento, Currency>.Create;
end;

destructor TModelFinalizaVenda.Destroy;
begin
  FreeAndNil(FlistaVenda);

  inherited;
end;

function TModelFinalizaVenda.Dinheriro(Value: Currency): iFormaPagamento;
begin
  Result := Self;
  if not Assigned(Self.Dinheriro(Value)) then
    FlistaVenda.Add(FormasPagamento.Dinheiro, Value);
end;

function TModelFinalizaVenda.Finalizar: Currency;
var
  I: Integer;
begin
  for I := 0 to FlistaVenda.TryGetValue('Dinheiro', Result) do

  Result := FVenda.Total;
end;

function TModelFinalizaVenda.formaPagamento: iFormaPagamento;
begin
  Result := Self;
end;

class function TModelFinalizaVenda.New(Value: iVenda): iFinalizaVenda;
begin
  Result := Self.Create(Value);
end;

function TModelFinalizaVenda.Pix(Value: Currency): iFormaPagamento;
begin
  Result := Self;
  if not Assigned(Self.Pix(Value)) then
    FlistaVenda.Add(FormasPagamento.Pix, Value);
end;

end.
