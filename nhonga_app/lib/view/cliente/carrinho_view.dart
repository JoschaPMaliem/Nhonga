import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhonga_app/model/cliente/produto.dart';
import 'package:nhonga_app/model/cliente/list_produto_cliente.dart';

class Carrinho_view extends StatelessWidget {
   Carrinho_view({super.key});

  List_Produto_Cliente produtos = new List_Produto_Cliente();

  @override
  Widget build(BuildContext context) {
    // Dummy product data
    List<Product> products = [
      Product(
        name: produtos.produtos[0].nome,
        price: produtos.produtos[0].preco,
        image: produtos.produtos[0].imagem,
      ),
      Product(
        name: produtos.produtos[0].nome,
        price: produtos.produtos[0].preco,
        image: produtos.produtos[0].imagem,
      ),
      
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: SizedBox(
              height: 170,
              child: Row(
                children: [
                  SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(produtos.produtos[index].imagem),
                      ),


                ],
                
              ),
            ),
            
            
            
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.image,
  });
}

