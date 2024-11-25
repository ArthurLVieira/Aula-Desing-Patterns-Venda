unit Prototype.Model.Forma.Dinheiro;

interface

uses Prototype.Controller.Interfaces;

type

  TModelFormaDinheiro = class(TInterfacedObject, iFormaPagamento)
  private

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFormaPagamento;
  end;

implementation

end.
