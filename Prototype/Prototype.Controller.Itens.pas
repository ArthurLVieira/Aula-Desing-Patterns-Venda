unit Prototype.Controller.Itens;

interface

uses
  Prototype.Controller.Interfaces;

type

  TItens = class(TInterfacedObject, iItens, iPrototype<iItens>)
  private
    FDescricao: string;
    FCodigo: Integer;
    FPreco: Currency;
    FQuantidade: Currency;
    FDesconto: Currency;
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetPreco(const Value: Currency);
    procedure SetQuantidade(const Value: Currency);
    function GetCodigo: Integer;
    function GetDescricao: string;
    function GetPreco: Currency;
    function GetQuantidade: Currency;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iItens;
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;
    property Preco: Currency read GetPreco write SetPreco;
    property Quantidade : Currency read GetQuantidade write SetQuantidade;
    function Prototype: iPrototype<iItens>;
    function Clone: iItens;
    function PrecoVenda : Currency;
    function Total: Currency;
    function Desconto: Currency;
  end;

implementation

{ TItens }

uses Prototype.Model.Strategy, System.SysUtils;

function TItens.Clone: iItens;
begin
  Result := TItens.New;
  Result.Codigo := FCodigo;
  Result.Descricao := FDescricao;
  Result.Preco := FPreco;
  Result.Quantidade := FQuantidade;
end;

constructor TItens.Create;
begin

end;

function TItens.Desconto: Currency;
begin
  Result := (FPreco - PrecoVenda);
end;

destructor TItens.Destroy;
begin

  inherited;
end;

function TItens.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TItens.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TItens.GetPreco: Currency;
begin
  Result := FPreco;
end;

function TItens.GetQuantidade: Currency;
begin
  Result := FQuantidade;
end;

class function TItens.New: iItens;
begin
  Result := Self.Create;
end;

function TItens.PrecoVenda: Currency;
begin
  Result := TPromocao(DayOfWeek(Now)-1).PrecoVenda(FPreco);
end;

function TItens.Prototype: iPrototype<iItens>;
begin
  Result := Self;
end;

procedure TItens.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TItens.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TItens.SetPreco(const Value: Currency);
begin
  FPreco := Value;
end;

procedure TItens.SetQuantidade(const Value: Currency);
begin
  FQuantidade := Value;
end;

function TItens.Total: Currency;
begin
  Result :=  (PrecoVenda * Quantidade);
end;

end.
