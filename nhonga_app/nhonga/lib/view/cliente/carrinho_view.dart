// carrinho_view.dart
import 'package:flutter/material.dart';
import 'package:nhonga_app/model/carrinho/carrinho.dart';
import 'package:nhonga_app/model/carrinho/carrinho_item.dart';

class CarrinhoView extends StatefulWidget {
  final Carrinho carrinho; // Pass Carrinho instance to CarrinhoView
  CarrinhoView({required this.carrinho}); // Constructor

  @override
  _CarrinhoViewState createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: ListView.builder(
        itemCount: widget.carrinho.items.length,
        itemBuilder: (context, index) {
          final item = widget.carrinho.items[index];
          return ListTile(
            title: Text(item.produto.nome),
            subtitle: Text('Preco: ${item.produto.preco}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  widget.carrinho.remove(item); // Remove item from the cart
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${widget.carrinho.precoTotal.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18.0),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement checkout logic here
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
