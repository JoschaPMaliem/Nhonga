import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhonga_app/model/cliente/produto.dart';
import 'package:nhonga_app/model/cliente/list_produto_cliente.dart';

class Carrinho_view extends StatelessWidget {
   Carrinho_view({super.key});

  List_Produto_Cliente produtos = new List_Produto_Cliente();

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: produtos.produtos.length,
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

                      Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  produtos.produtos[index].nome,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 5,
                                  ),
                                ),
                                Text(
                                  '\$' +
                                      " " +
                                      produtos.produtos[index].preco,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 5,
                                    color: Colors.yellow.shade900,
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: null,
                                  child: Text(
                                    "S",
                                  ),
                                ),
                              ],
                            ),
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



