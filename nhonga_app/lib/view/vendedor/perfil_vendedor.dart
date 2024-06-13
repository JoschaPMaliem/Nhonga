import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhonga_app/model/database.dart'; // Import DBHelper class

class Perfil_Vendedor extends StatefulWidget {
  Perfil_Vendedor({Key? key}) : super(key: key);

  @override
  State<Perfil_Vendedor> createState() => _Perfil_VendedorState();
}

class _Perfil_VendedorState extends State<Perfil_Vendedor> {
  final DBHelper _dbHelper = DBHelper();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? address;

  @override
  void initState() {
    loadVendedorData();
    super.initState();
  }

  void loadVendedorData() async {
    // Replace with your logic to fetch current vendedor's data from DB
    // For demo, setting default values
    Map<String, dynamic>? vendedorData =
        await _dbHelper.getVendedorByEmail('vendedor@exemplo.com');
    if (vendedorData != null) {
      setState(() {
        _fullNameController.text = vendedorData['nome'];
        _emailController.text = vendedorData['email'];
        _phoneController.text = vendedorData['telefone'];
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
            // Prepare updated vendedor data
            Map<String, dynamic> updatedData = {
              'id': 'id_do_vendedor',
              'nome': _fullNameController.text,
              'email': _emailController.text,
              'telefone': _phoneController.text,
              'password': 'senha_do_vendedor',
            };

            // Update vendedor data in database
            int rowsAffected = await _dbHelper.updateVendedor(updatedData);
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
                style: TextStyle(
                    color: Colors.white, fontSize: 18, letterSpacing: 6),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
