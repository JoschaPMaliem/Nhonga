import 'package:nhonga_app/model/carrinho/carrinho_item.dart';

class Carrinho {
  static final Carrinho instance = Carrinho.internal();

  factory Carrinho() {
    return instance;
  }

  Carrinho.internal();

  List<CarrinhoItem> items = [];

  //List<CarrinhoItem> get items => items;

  void add(CarrinhoItem item) {
    items.add(item);
  }

  void remove(CarrinhoItem item) {
    items.remove(item);
  }

  double get precoTotal {
    double totalPrice = 0;
    for (var item in items) {
      totalPrice += double.parse(item.produto.preco);
    }
    return totalPrice;
  }

  void clear() {
    items.clear();
  }
}
