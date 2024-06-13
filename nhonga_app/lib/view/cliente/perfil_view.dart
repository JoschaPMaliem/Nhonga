import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhonga_app/model/produto/list_produto.dart';
import 'package:nhonga_app/model/cliente/cliente.dart';
import 'package:nhonga_app/model/database.dart';

class Perfil_view extends StatefulWidget {
  Perfil_view({Key? key}) : super(key: key);

  @override
  State<Perfil_view> createState() => _Perfil_viewState();
}

class _Perfil_viewState extends State<Perfil_view> {
  final DBHelper _dbHelper = DBHelper();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? address;

  @override
  void initState() {
    // Load current user data or set defaults
    loadUserData();
    super.initState();
  }

  void loadUserData() async {
    // Replace with your logic to fetch current user's data from DB
    // For demo, setting default values
    Map<String, dynamic>? userData = await _dbHelper.getClienteByEmail('usuario@exemplo.com');
    if (userData != null) {
      setState(() {
        _fullNameController.text = userData['nome'];
        _emailController.text = userData['email'];
        _phoneController.text = userData['telefone'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Editar Perfil',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Color.fromARGB(255, 71, 194, 167),
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.photo),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _fullNameController,
                    decoration: InputDecoration(
                      labelText: 'Nome completo:',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email:',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Numero de telefone:',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      address = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Endereco',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(13.0),
        child: InkWell(
          onTap: () async {
            // Prepare updated cliente data
            Map<String, dynamic> updatedData = {
              'nome': _fullNameController.text,
              'email': _emailController.text,
              'telefone': _phoneController.text,
              'endereco': address ?? '',
              // Add other fields as necessary
            };

            // Update cliente data in database
            int rowsAffected = await _dbHelper.updateCliente(updatedData);
            if (rowsAffected > 0) {
              // Show success message or navigate to another screen
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Perfil atualizado com sucesso!'),
                duration: Duration(seconds: 2),
              ));
            } else {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Falha ao atualizar perfil. Tente novamente.'),
                duration: Duration(seconds: 2),
              ));
            }
          },
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 71, 194, 167),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'UPDATE',
                style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 6),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
