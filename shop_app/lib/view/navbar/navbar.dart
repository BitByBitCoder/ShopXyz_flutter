import 'package:flutter/material.dart';
import 'package:shop_app/view/Home/home.dart';
import 'package:shop_app/view/administrator/administratorScreen.dart';
import 'package:shop_app/view/cart/cartPage.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List page = [Home(), CartScreen()];
  int selected = 0;
  void pageSelected(value) {
    selected = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selected,
        children: [Home(), CartScreen(), AdministratorScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings), label: '')
        ],
        onTap: (value) => pageSelected(value),
      ),
    );
  }
}
