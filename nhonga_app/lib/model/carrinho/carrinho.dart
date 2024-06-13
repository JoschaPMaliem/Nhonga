import 'package:nhonga_app/model/carrinho/carrinho_item.dart';

class Carrinho {
  static final Carrinho instance = Carrinho.internal();

  factory Carrinho() {
    return instance;
  }

  Carrinho.internal();

  List<CarrinhoItem> items = [];

  double get precoTotal {
    double totalPrice = 0;
    for (var item in items) {
      totalPrice += double.parse(item.produto.preco) * item.quantidade;
    }
    return totalPrice;
  }

  void add(CarrinhoItem item) {
    // Check if the item is already in the cart
    var existingItem = items.firstWhere(
      (element) => element.produto.id == item.produto.id,
      orElse: () => CarrinhoItem(produto: item.produto),
    );

    // If found, increase the quantity; otherwise, add new item
    if (items.contains(existingItem)) {
      existingItem.quantidade++;
    } else {
      items.add(item);
    }
  }

  void remove(CarrinhoItem item) {
    // Decrease quantity and remove if quantity becomes zero
    var existingItem = items.firstWhere(
      (element) => element.produto.id == item.produto.id,
      orElse: () => CarrinhoItem(produto: item.produto),
    );

    if (existingItem.quantidade > 1) {
      existingItem.quantidade--;
    } else {
      items.remove(item);
    }
  }

  void clear() {
    items.clear();
  }
}
