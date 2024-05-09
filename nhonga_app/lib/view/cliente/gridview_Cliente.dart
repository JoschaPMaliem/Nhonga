import 'package:flutter/material.dart';
import 'package:nhonga_app/model/cliente/produto.dart';
import 'package:nhonga_app/model/cliente/list_produto_cliente.dart';
import 'package:flutter/cupertino.dart';
import 'package:nhonga_app/view/cliente/produto_detail.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GridView_Cliente extends StatelessWidget {
  GridView_Cliente({super.key});

  final List_Produto_Cliente produtos = List_Produto_Cliente();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.yellow.shade900,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: PageView.builder(
                itemCount: 3, //quantos banners tem?????
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    
                    child: CachedNetworkImage(
                       "${produtos.produtosLista[index].imagem}",
                     // height: 170,
                     // width: double.infinity,
                      fit: BoxFit.cover,

                      /*
                      placeholder: (context, url) => Shimmer(
                        duration: Duration(seconds: 10), //Default value
                        interval: Duration(
                            seconds:
                                10), //Default value: Duration(seconds: 0)
                        color: const Color.fromARGB(255, 198, 51, 51), //Default value
                        colorOpacity: 0, //Default value
                        enabled: true, //Default value
                        direction:
                            ShimmerDirection.fromLTRB(), //Default Value
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error),

                          */
                    ),
                  );
                },
              ),
            ),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              mainAxisExtent: 310,
            ),
            itemCount: produtos.produtosLista.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProdutoDetailView(
                        produtos: produtos.produtosLista[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 76, 76, 76),
                        width: 1.0),
                    color: const Color.fromARGB(255, 226, 226, 226),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                        child: Image.network(
                          "${produtos.produtosLista[index].imagem}",
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${produtos.produtosLista[index].nome}",
                              style:
                                  Theme.of(context).textTheme.subtitle1!.merge(
                                        const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                            ),
                            Row(
                              children: [
                                Icon(CupertinoIcons.person),
                                Text(
                                  "${produtos.produtosLista[index].vendedor}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(
                                        const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "${produtos.produtosLista[index].preco}",
                              style:
                                  Theme.of(context).textTheme.subtitle2!.merge(
                                        TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.star,
                                ),
                                Icon(CupertinoIcons.star),
                                Icon(CupertinoIcons.star),
                                Icon(CupertinoIcons.star),
                                Icon(CupertinoIcons.star),
                              ],
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
        ],
      ),
    );
  }
}
