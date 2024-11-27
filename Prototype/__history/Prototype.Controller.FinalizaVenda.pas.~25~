unit Prototype.Controller.FinalizaVenda;

interface

uses Prototype.Controller.Interfaces, System.Generics.Collections;

type

  FormasPagamento = (CartaoCredito, CartaoDebito, Dinheiro, Pix);

  TModelFinalizaVenda = class(TInterfacedObject, iFinalizaVenda,
    iFormaPagamento)
  private
    FVenda: iVenda;
    FlistaVenda: TDictionary<string, Currency>;
  public
    constructor Create(Value: iVenda);
    destructor Destroy; override;
    class function New(Value: iVenda): iFinalizaVenda;
    function Finalizar: string;
    function formaPagamento: iFormaPagamento;
    function Add(FomaPagamento: string; Value: Currency): iFormaPagamento;
    function listaVenda: TDictionary<string, Currency>;
  end;

implementation

uses
  System.SysUtils;

{ TModelFinalizaVenda }

function TModelFinalizaVenda.Add(FomaPagamento: string;
  Value: Currency): iFormaPagamento;
begin
  Result := Self;
  FlistaVenda.Add(FomaPagamento, Value);
end;

constructor TModelFinalizaVenda.Create(Value: iVenda);
begin
  FVenda := Value;
  FlistaVenda := TDictionary<string, Currency>.Create;
end;

destructor TModelFinalizaVenda.Destroy;
begin
  FreeAndNil(FlistaVenda);

  inherited;
end;

function TModelFinalizaVenda.Finalizar: string;
var
  I: Integer;
begin
  for I := 0 to Pred(FlistaVenda.Count) do
    Result := ' Dinheriro: ' + FormatCurr('R$ #,##0.00', FlistaVenda.Items['Dinheriro'])

end;

function TModelFinalizaVenda.formaPagamento: iFormaPagamento;
begin
  Result := Self;
end;

function TModelFinalizaVenda.listaVenda: TDictionary<string, Currency>;
begin
  Result := FlistaVenda;
end;

class function TModelFinalizaVenda.New(Value: iVenda): iFinalizaVenda;
begin
  Result := Self.Create(Value);
end;

end.
