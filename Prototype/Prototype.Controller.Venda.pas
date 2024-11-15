unit Prototype.Controller.Venda;

interface

uses Prototype.Controller.Interfaces, System.Generics.Collections;

type

  TVenda = class(TInterfacedObject, iVenda)
  private
    FItens: TList<iITens>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iVenda;
    function Add(Value: TList<iITens>): iVenda;
    function Total: Currency;
  end;

implementation

{ TVenda }

function TVenda.Add(Value: TList<iITens>): iVenda;
begin
  Result := Self;
  FItens.AddRange(Value.Last);
end;

constructor TVenda.Create;
begin
  FItens := TList<iITens>.Create;
end;

destructor TVenda.Destroy;
begin
  FItens.Free;

  inherited;
end;

class function TVenda.New: iVenda;
begin
  Result := Self.Create;
end;

function TVenda.Total: Currency;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Pred(FItens.Count) do
    Result := Result + FItens[I].Total;



end;

end.
