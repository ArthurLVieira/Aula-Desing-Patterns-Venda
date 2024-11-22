unit Prototype.Controller.Interfaces;

interface

uses
  System.Generics.Collections;

type

  iPrototype<T> = interface
    ['{5ED69F77-1A7E-422F-97FB-B40ADD23A685}']
    function Clone: T;
  end;

  iITens = interface
    ['{C6FD3336-B3E7-4640-9A59-BDDD06B537ED}']
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetPreco(const Value: Currency);
    procedure SetQuantidade(const Value: Currency);
    function GetCodigo: Integer;
    function GetDescricao: string;
    function GetPreco: Currency;
    function GetQuantidade: Currency;
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;
    property Preco: Currency read GetPreco write SetPreco;
    property Quantidade: Currency read GetQuantidade write SetQuantidade;
    function Prototype: iPrototype<iITens>;
    function PrecoVenda: Currency;
    function Total: Currency;
    function Desconto: Currency;
  end;

  iVendaOperacoes = interface;

  iVenda = interface
    ['{F374058E-C54F-4818-86FA-46FC950F84E2}']
    function Add(Value: TList<iITens>): iVenda;
    function Total: Currency;
    function Operacoes: iVendaOperacoes;
  end;

  iVendaOperacoes = interface
    ['{3E6AE97B-C1AA-4A89-8155-C4808ED80DCB}']
    function Pix: iVendaOperacoes;
    function Dinheriro: iVendaOperacoes;
    function CartaoCredito: iVendaOperacoes;
    function CartaoDebito: iVendaOperacoes;
    function &End: iVenda;
  end;

implementation

end.
