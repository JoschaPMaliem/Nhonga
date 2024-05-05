import 'package:flutter/material.dart';

class Produto {
  String nome;
  String vendedor;
  String imagem;
  String preco;
  String estado;
  String localizacao;

  Produto(
      {required this.nome,
      required this.vendedor,
      required this.imagem,
      required this.preco,
      required this.estado,
      required this.localizacao});
}
