import 'package:flutter/material.dart';
import 'package:nhonga_app/model/database.dart';
import 'package:nhonga_app/model/vendedor/vendedor.dart';
import 'package:nhonga_app/model/cliente/cliente.dart';

class SignupPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DBHelper _dbHelper = DBHelper();

  void _signup(BuildContext context, String role) async {
    if (_formKey.currentState!.validate()) {
      if (role == 'vendedor') {
        Vendedor vendedor = Vendedor(
          id: DateTime.now().toString(),
          nome: _nomeController.text,
          email: _emailController.text,
          telefone: _telefoneController.text,
          password: _passwordController.text,
        );
        await _dbHelper.insertVendedor(vendedor.toMap());
        Navigator.pushNamed(context, '/homepage_vendedor');
      } else if (role == 'cliente') {
        Cliente cliente = Cliente(
          nome: _nomeController.text,
          email: _emailController.text,
          telefone: _telefoneController.text,
          endereco: _enderecoController.text,
          password: _passwordController.text,
        );
        await _dbHelper.insertCliente(cliente.toMap());
        Navigator.pushNamed(context, '/homepage_cliente');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _enderecoController,
                decoration: InputDecoration(labelText: 'Endereco'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _signup(context, 'cliente'),
                child: Text('Signup as Cliente'),
              ),
              ElevatedButton(
                onPressed: () => _signup(context, 'vendedor'),
                child: Text('Signup as Vendedor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
