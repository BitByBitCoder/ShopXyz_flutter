import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/Model/cart.dart';
import 'package:shop_app/controller/shopController.dart';
import 'package:shop_app/view/administrator/updateProcuctScreen/updateProductPage.dart';

class UpdateProductScreen extends ConsumerStatefulWidget {
  const UpdateProductScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateProductScreenState();
}

class _UpdateProductScreenState extends ConsumerState<UpdateProductScreen> {
  @override
  void initState() {
    // ref.read(shopControllerProvider.notifier).fetch(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(shopControllerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      body: data.when(
          data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final product = data[index];
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => UpdateProductPage(
                                product: product,
                              ))),
                  child: ListTile(
                    leading: Text('${product.id}'),
                    title: Text('${product.title}'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                );
              }),
          error: (error, StackTrace) => Text('error occured'),
          loading: () => Center(
                child: Text('loading'),
              )),
    );
  }
}
