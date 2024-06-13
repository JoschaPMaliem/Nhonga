class Vendedor {
  String id;
  String nome;
  String email;
  String telefone;
  String password;

  Vendedor({required this.id, required this.nome, required this.email, required this.telefone, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'password': password,
    };
  }
}
