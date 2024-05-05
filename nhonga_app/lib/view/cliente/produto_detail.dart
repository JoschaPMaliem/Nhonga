import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhonga_app/model/cliente/list_produto_cliente.dart';
import 'package:nhonga_app/model/cliente/produto.dart';
import 'package:nhonga_app/view/cliente/homepage_Cliente.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class ProdutoDetailView extends StatefulWidget {
  final Produto produtos;

  ProdutoDetailView({required this.produtos});

  @override
  State<ProdutoDetailView> createState() => _ProdutoDetailViewState();
  
}

class _ProdutoDetailViewState extends State<ProdutoDetailView> {
  bool addedToCart = false;
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
          widget.produtos.nome,
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
                    widget.produtos.imagem,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(
                '\$' + ' ' + widget.produtos.preco,
                style: TextStyle(
                  fontSize: 22,
                  letterSpacing: 8,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 71, 194, 167),
                ),
              ),
            ),
            Text(
              widget.produtos.nome,
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
                      widget.produtos.localizacao,
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
                      widget.produtos.estado,
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
                      widget.produtos.vendedor,
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
              color: addedToCart ? Color.fromARGB(255, 228, 13, 13) : Color.fromARGB(255, 71, 194, 167),
              size: 25,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                addedToCart = !addedToCart;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: addedToCart? Color.fromARGB(255, 228, 13, 13) : Color.fromARGB(255, 71, 194, 167),
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
