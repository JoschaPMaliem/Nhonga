import 'package:nhonga_app/model/produto/produto.dart';

class CarrinhoItem {
  final Produto produto;
  int quantidade;

  CarrinhoItem({required this.produto, this.quantidade = 1});
}
