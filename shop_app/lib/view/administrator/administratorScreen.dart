import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shop_app/view/administrator/addProductPage.dart';
import 'package:shop_app/view/administrator/deleteProductScreen/deleteProductPage.dart';
import 'package:shop_app/view/administrator/updateProcuctScreen/updateProductScreen.dart';

class AdministratorScreen extends ConsumerStatefulWidget {
  const AdministratorScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdministratorScreenState();
}

class _AdministratorScreenState extends ConsumerState<AdministratorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Text(
                'Shop',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'XYz',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 9, 121, 212)),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Admin',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(9, 121, 212, 1)),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    Icons.admin_panel_settings_rounded,
                    size: 200,
                  ),
                ),
                action('Add Product', AddProductPage()),
                action('Delete Product', DeleteProductPage()),
                action('Update Product', UpdateProductScreen()),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   // Remove width and height to allow the container to expand to fit its contents
                //   child: FittedBox(
                //       fit: BoxFit.contain,
                //       child: Image.asset('assets/images/tree.jpg')),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card action(String txt, Widget page) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
        child: Container(
          height: 100,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '$txt',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center, // Optional: Adjust as needed
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
