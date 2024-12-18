unit Prototype.View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit,
  Prototype.Controller.Interfaces, Prototype.Controller.Itens,
  System.Generics.Collections, Prototype.Controller.Venda;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Edit3: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Memo2: TMemo;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Button3: TButton;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FListaItem: TList<iITens>;
    FVenda: iVenda;
    FFormaDinheiro, FFormaPix, FFormaCartaoDebito: iFormaPagamento;
    FFinalizaVenda: iFinalizaVenda;
    procedure Exibir;
    procedure ExibirVenda;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Prototype.Controller.FinalizaVenda, Prototype.Model.FormaPagamento;

procedure TForm1.Button1Click(Sender: TObject);
var
  Item: iITens;
begin
  Item := TItens.New;
  Item.Codigo := StrToInt(Edit1.Text);
  Item.Descricao := Edit2.Text;
  Item.Preco := StrToCurr(Edit3.Text);
  Item.Quantidade := StrToCurr(Edit4.Text);
  FListaItem.Add(Item);
  Exibir;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FListaItem.Add(FListaItem[Pred(FListaItem.Count)].Prototype.Clone);
  Exibir;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  FFormaDinheiro.SetFormaPagamento('Dinheiro');
  FFormaDinheiro.SetFormsValor(StrToCurr(Edit5.Text));
  FFinalizaVenda.Add(FFormaDinheiro);

  FFormaPix.SetFormaPagamento('Pix');
  FFormaPix.SetFormsValor(StrToCurr(Edit5.Text));
  FFinalizaVenda.Add(FFormaPix);

  FFormaCartaoDebito.SetFormaPagamento('CartaoDebito');
  FFormaCartaoDebito.SetFormsValor(StrToCurr(Edit5.Text));
  FFinalizaVenda.Add(FFormaCartaoDebito);

  Edit5.Text := FormatCurr('   R$ #,##0.00', FFinalizaVenda.Finalizar);
end;

procedure TForm1.Exibir;
var
  I: Integer;
begin
  Memo1.Lines.Clear;
  FVenda.Add(FListaItem);
  for I := 0 to Pred(FListaItem.Count) do
    Memo1.Lines.Add(FListaItem[I].Codigo.ToString + '   ' + FListaItem[I].Descricao +
      '   ' + CurrToStr(FListaItem[I].Quantidade) + FormatCurr('   R$ #,##0.00',
      FListaItem[I].Preco) + FormatCurr('   R$ -#,##0.00', FListaItem[I].Desconto) +
      FormatCurr('   R$ #,##0.00', FListaItem[I].PrecoVenda) +
      FormatCurr('   R$ #,##0.00', FListaItem[I].Total));

  Label4.Text := FormatCurr('R$ #,##0.00', FVenda.Total);
  //Label10.Text := FormatCurr('R$ #,##0.00', FFinalizaVenda.Finalizar);
end;

procedure TForm1.ExibirVenda;
var
  I: Integer;
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FListaItem := TList<iITens>.Create;
  FVenda := TVenda.New;
  FFormaDinheiro := TModelFormaPagamento.New;
  FFinalizaVenda := TModelFinalizaVenda.New(FVenda);
end;

end.
