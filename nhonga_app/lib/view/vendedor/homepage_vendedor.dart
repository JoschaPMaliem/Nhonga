import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nhonga_app/view/vendedor/adicionar_produto.dart';
import 'package:nhonga_app/view/vendedor/lista_produtos_vendedor.dart';
import 'package:nhonga_app/view/vendedor/perfil_vendedor.dart';


class HomepageVendedor extends StatefulWidget {
  const HomepageVendedor({super.key});

  @override
  State<HomepageVendedor> createState() => _HomepageVendedorState();
}

class _HomepageVendedorState extends State<HomepageVendedor> {
  int _pageIndex = 0;

  List<Widget> _paginas = [
    Adicionar_Produto(),
    Lista_Produtos(), 
    Perfil_Vendedor(),
  ];

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
                icon: Icon(CupertinoIcons.add), label: "Adicionar"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.list_bullet), label: "Produtos"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/account.svg",
                  width: 20,
                ),
                label: "Perfil"),
          ],
        ),
        body: _paginas[_pageIndex],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}