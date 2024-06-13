import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhonga_app/model/carrinho/carrinho_item.dart';
import 'package:nhonga_app/model/produto/produto.dart';
import 'package:nhonga_app/model/carrinho/carrinho.dart'; // Import Carrinho class

class ProdutoDetailView extends StatefulWidget {
  final Produto produto;

  ProdutoDetailView({required this.produto});

  @override
  State<ProdutoDetailView> createState() => _ProdutoDetailViewState();
}

class _ProdutoDetailViewState extends State<ProdutoDetailView> {
  int quantidade = 1;
  bool addedToCart = false;

  void _incrementQuantity() {
    setState(() {
      quantidade++;
    });
  }

  void _decrementQuantity() {
    if (quantidade > 1) {
      setState(() {
        quantidade--;
      });
    }
  }

  void _toggleCartState() {
    setState(() {
      addedToCart = !addedToCart;
      if (addedToCart) {
        Carrinho().add(CarrinhoItem(produto: widget.produto));
      } else {
        Carrinho().remove(CarrinhoItem(produto: widget.produto));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          widget.produto.nome,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    widget.produto.imagem,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Preco Total: \$${(double.parse(widget.produto.preco) * quantidade).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 8,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 71, 194, 167),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: _decrementQuantity,
                      ),
                      Text(
                        quantidade.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _incrementQuantity,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              widget.produto.nome,
              style: TextStyle(
                fontSize: 22,
                letterSpacing: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
            ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Descricao do produto',
                    style: TextStyle(color: Color.fromARGB(255, 71, 194, 167)),
                  ),
                  Text(
                    'Ver mais',
                    style: TextStyle(color: Color.fromARGB(255, 71, 194, 167)),
                  ),
                ],
              ),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Localizacao:",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        letterSpacing: 3,
                      ),
                    ),
                    Text(
                      widget.produto.localizacao,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Estado:",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        letterSpacing: 3,
                      ),
                    ),
                    Text(
                      widget.produto.estado,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Vendedor:",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        letterSpacing: 3,
                      ),
                    ),
                    Text(
                      widget.produto.vendedor,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              CupertinoIcons.cart,
              color: addedToCart
                  ? Color.fromARGB(255, 228, 13, 13)
                  : Color.fromARGB(255, 71, 194, 167),
              size: 25,
            ),
          ),
          ElevatedButton(
            onPressed: _toggleCartState,
            style: ElevatedButton.styleFrom(
              backgroundColor: addedToCart
                  ? Color.fromARGB(255, 228, 13, 13)
                  : Color.fromARGB(255, 71, 194, 167),
            ),
            child: Text(
              addedToCart ? 'REMOVER' : 'METER NO CARRINHO',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
