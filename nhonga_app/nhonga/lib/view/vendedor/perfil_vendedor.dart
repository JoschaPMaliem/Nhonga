import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Perfil_Vendedor extends StatefulWidget {
 Perfil_Vendedor({super.key});

  @override
  State<Perfil_Vendedor> createState() => _Perfil_VendedorState();
}

class _Perfil_VendedorState extends State<Perfil_Vendedor> {

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  String? address;

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
            //letterSpacing: 6,
            //fontSize: 18,
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
                    controller: fullNameController,
                    decoration: InputDecoration(
                      labelText: 'Nome completo:',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email:',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: phoneController,
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
            )),
          ),
        ),
      ),
    );
  }
}