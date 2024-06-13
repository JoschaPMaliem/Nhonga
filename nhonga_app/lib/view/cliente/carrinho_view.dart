import 'package:flutter/material.dart';
import 'package:nhonga_app/model/carrinho/carrinho.dart';

class CarrinhoView extends StatefulWidget {
  final Carrinho carrinho; 
  CarrinhoView({required this.carrinho}); 

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
          double totalPrice = double.parse(item.produto.preco) * item.quantidade;

          return ListTile(
            title: Text(item.produto.nome),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Preco unitario: \$${item.produto.preco}'),
                Text('Quantidade: ${item.quantidade}'),
                Text('Total: \$${totalPrice.toStringAsFixed(2)}'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  widget.carrinho.remove(item); 
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
                  // Implement your checkout logic here
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
