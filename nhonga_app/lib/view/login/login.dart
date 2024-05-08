import 'package:flutter/material.dart';
import 'package:nhonga_app/view/cliente/homepage_Cliente.dart';
import 'package:nhonga_app/view/vendedor/homepage_vendedor.dart';

class Login_page extends StatelessWidget {
  const Login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Nhonga",
              style: TextStyle(
                fontFamily: 'Brand-Bold',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homepage_Vendedor(),
                      ),

                    );
                  },
                  child: Text('Vendedor'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homepage_Cliente(),
                      ),

                    );
                  },
                  child: Text('Cliente'),
                ),
              ],
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
