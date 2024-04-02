import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/core/errorScreen.dart';
import 'package:shop_app/view/Home/home.dart';
import 'package:shop_app/view/navbar/navbar.dart';
import 'package:shop_app/view/test.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Navbar());
  }
}
