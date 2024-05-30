import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nhonga_app/view/cliente/carrinho_view.dart';
import 'package:nhonga_app/view/cliente/gridview_Cliente.dart';
import 'package:nhonga_app/view/cliente/perfil_view.dart';
import 'package:nhonga_app/model/carrinho/carrinho.dart'; // Import Carrinho class

class Homepage_Cliente extends StatefulWidget {
  const Homepage_Cliente({Key? key}) : super(key: key);

  @override
  State<Homepage_Cliente> createState() => _Homepage_ClienteState();
}

class _Homepage_ClienteState extends State<Homepage_Cliente> {
  late int _pageIndex = 0;
  late Carrinho _carrinho;

  @override
  void initState() {
    super.initState();
    _carrinho = Carrinho();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 71, 194, 167),
          title: Row(
            children: [
              Text(
                "Nhonga",
                style: TextStyle(
                  fontFamily: 'Brand-Bold',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Usuario'),
                accountEmail: Text('usuario@exemplo.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    '',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 71, 194, 167),
                ),
              ),
              ListTile(
                title: Text('Sobre nos'),
                onTap: () {
                  // Handle item 1 tap
                },
              ),
              ListTile(
                title: Text('Sign out'),
                onTap: () {
                  // Handle item 2 tap
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _pageIndex,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          unselectedItemColor: Colors.black,
          selectedItemColor: Color.fromARGB(255, 71, 194, 167),
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: "Carrinho",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/account.svg",
                width: 20,
              ),
              label: "Perfil",
            ),
          ],
        ),
        body: _buildPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _buildPage() {
    switch (_pageIndex) {
      case 0:
        return GridView_Cliente();
      case 1:
        return CarrinhoView(carrinho: _carrinho);
      case 2:
        return Perfil_view();
      default:
        return Container();
    }
  }
}
