import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/controller/cartControler.dart';
import 'package:shop_app/core/errorScreen.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(cartControllerProvider);
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
                'Cart',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 9, 121, 212)),
              )
            ],
          ),
        ),
      ),
      body: data.when(
          data: (data) => ListView.builder(
              itemCount: data.products.length,
              itemBuilder: (context, index) {
                final cartp = data.products[index];
                return ListTile(
                  leading: Text('Product Id ${cartp.productId}'),
                  title: Text('Quantity ${cartp.quantity}'),
                  trailing: IconButton(
                    onPressed: () {
                      ref
                          .read(cartControllerProvider.notifier)
                          .removeData(cartp.productId);
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                  ),
                );
              }),
          error: (error, StackTrace) => ErrorScreen(),
          loading: () => ErrorScreen()),
    );
  }
}
