import 'package:flutter/material.dart';
import 'package:nhonga_app/view/login/login.dart';
import 'package:nhonga_app/view/signup.dart';
import 'package:nhonga_app/view/cliente/homepage_cliente.dart';
import 'package:nhonga_app/view/vendedor/homepage_vendedor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/homepage_cliente': (context) => HomepageCliente(),
        '/homepage_vendedor': (context) => HomepageVendedor(),
      },
    );
  }
}
