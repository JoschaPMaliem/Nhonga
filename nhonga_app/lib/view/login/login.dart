import 'package:flutter/material.dart';
import 'package:nhonga_app/model/database.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DBHelper _dbHelper = DBHelper();

  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      var vendedor = await _dbHelper.getVendedorByEmail(email);
      if (vendedor != null && vendedor['password'] == password) {
        Navigator.pushNamed(context, '/homepage_vendedor');
        return;
      }

      var cliente = await _dbHelper.getClienteByEmail(email);
      if (cliente != null && cliente['password'] == password) {
        Navigator.pushNamed(context, '/homepage_cliente');
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email ou password invalido')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite seu email';
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
                    return 'Digite seu password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                child: Text('Login'),
              ),

              SizedBox(height: 20),

            
            TextButton(
              onPressed: () {
               
                Navigator.pushNamed(context, '/signup');
              },
              child: Text("Não tem conta? Cadastre-se"),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
