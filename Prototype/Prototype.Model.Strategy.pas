unit Prototype.Model.Strategy;

interface

type

  TPromocao = (Domingo, Segunda, Terca, Quarta, Quinta, Sexta, Sabado);

  THelperPromocao = record helper for TPromocao
    function PrecoVenda(Preco: Currency): Currency;
  end;

implementation

{ THelperPromocao }

function THelperPromocao.PrecoVenda(Preco: Currency): Currency;
begin
  case Self of
    Domingo:
      Result := (Preco);
    Segunda:
      Result := (Preco - (Preco * 0.20));
    Terca:
      Result := (Preco - (Preco * 0.30));
    Quarta:
      Result := (Preco - (Preco * 0.40));
    Quinta:
      Result := (Preco - (Preco * 0.50));
    Sexta:
      Result := (Preco - (Preco * 0.60));
    Sabado:
      Result := (Preco - (Preco * 0.70));
  end;
end;

end.
