class Cliente {
  String nome;
  String email;
  String telefone;
  String endereco;
  String password;

  Cliente({required this.nome, required this.email, required this.telefone, required this.endereco, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'endereco': endereco,
      'password': password,
    };
  }
}
