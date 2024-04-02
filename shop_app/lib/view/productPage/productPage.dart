import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/Model/shopModel.dart';

class ProductPage extends ConsumerStatefulWidget {
  final product;
  ProductPage({super.key, required this.product});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            '${widget.product.image}',
            height: 300,
            width: double.infinity,
          ),
          Spacer(),
          Text('${widget.product.title}'),
          Spacer(),
          TextButton(onPressed: () {}, child: Text('Add to cart')),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
