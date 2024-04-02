import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/controller/shopController.dart';
import 'package:shop_app/core/errorScreen.dart';

class DeleteProductPage extends ConsumerStatefulWidget {
  const DeleteProductPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DeleteProductPageState();
}

class _DeleteProductPageState extends ConsumerState<DeleteProductPage> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(shopControllerProvider);
    return Scaffold(
        appBar: AppBar(),
        body: data.when(
            data: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final product = data[index];

                  return ListTile(
                    title: Text('${product.title}'),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('${product.image}'),
                      radius: 25,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        ref
                            .read(shopControllerProvider.notifier)
                            .delete(product.id, context);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  );
                }),
            error: (error, StackTrace) => ErrorScreen(),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
