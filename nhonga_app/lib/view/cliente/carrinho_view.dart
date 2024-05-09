import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhonga_app/model/cliente/produto.dart';
import 'package:nhonga_app/model/cliente/list_produto_cliente.dart';
import 'package:nhonga_app/view/cliente/pagamento_view.dart';

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
        itemCount: produtos.produtosLista.length,
        itemBuilder: (context, index) {
          return Card(
            child: SizedBox(
              height: 170,
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(produtos.produtosLista[index].imagem),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          produtos.produtosLista[index].nome,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5,
                          ),
                        ),
                        Text(
                          '\$' + " " + produtos.produtosLista[index].preco,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5,
                            color: Color.fromARGB(255, 71, 194, 167),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: null,
                          child: Text(
                            "Remover",
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
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Pagamento_view();
            }));
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 71, 194, 167),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'PAGAR',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 8,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
