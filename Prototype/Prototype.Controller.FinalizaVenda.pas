unit Prototype.Controller.FinalizaVenda;

interface

uses Prototype.Controller.Interfaces, System.Generics.Collections;

type

  TModelFinalizaVenda = class(TInterfacedObject, iFinalizaVenda,
    iFormaPagamento)
  private
    FTotalVenda: Currency;
    FlistaVenda: TDictionary<string, Currency>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFinalizaVenda;
    function TotalVenda(Value: ivenda): iFinalizaVenda;
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
    FlistaVenda.Add('CartaoCredito', Value);
end;

function TModelFinalizaVenda.CartaoDebito(Value: Currency): iFormaPagamento;
begin
  Result := Self;
  if not Assigned(Self.CartaoDebito(Value)) then
    FlistaVenda.Add('CartaoDebito', Value);
end;

constructor TModelFinalizaVenda.Create;
begin
  FlistaVenda := TDictionary<string, Currency>.Create;
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
    FlistaVenda.Add('Dinheiro', Value);
end;

function TModelFinalizaVenda.Finalizar: Currency;
begin

end;

function TModelFinalizaVenda.formaPagamento: iFormaPagamento;
begin
  Result := Self;
end;

class function TModelFinalizaVenda.New: iFinalizaVenda;
begin
  Result := Self.Create;
end;

function TModelFinalizaVenda.Pix(Value: Currency): iFormaPagamento;
begin
  Result := Self;
  if not Assigned(Self.Pix(Value)) then
    FlistaVenda.Add('Pix', Value);
end;

function TModelFinalizaVenda.TotalVenda(Value: ivenda): iFinalizaVenda;
begin
  Result := Self;
  FTotalVenda := Value.Total;
end;

end.
