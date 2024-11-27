unit Prototype.Model.FormaPagamento;

interface

uses
  Prototype.Controller.Interfaces;

type

  TModelFormaPagamento = class(TInterfacedObject, iFormaPagamento)
  private
    FFormaPagamento: string;
    FFormaValor: Currency;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFormaPagamento;
    function SetFormaPagamento(Value: string): iFormaPagamento;
    function SetFormsValor(Value: Currency): iFormaPagamento;
    function GetFormaPagamento: string;
    function GetFormaValor: Currency;
  end;

implementation

{ TModelFormaPagamento }

constructor TModelFormaPagamento.Create;
begin

end;

destructor TModelFormaPagamento.Destroy;
begin

  inherited;
end;

function TModelFormaPagamento.GetFormaPagamento: string;
begin
  Result := FFormaPagamento;
end;

function TModelFormaPagamento.GetFormaValor: Currency;
begin
  Result := FFormaValor;
end;

class function TModelFormaPagamento.New: iFormaPagamento;
begin
  Result := Self.Create;
end;

function TModelFormaPagamento.SetFormaPagamento(Value: string): iFormaPagamento;
begin
  Result := Self;
  FFormaPagamento := Value;
end;

function TModelFormaPagamento.SetFormsValor(Value: Currency): iFormaPagamento;
begin
  Result := Self;
  FFormaValor := Value;
end;

end.
