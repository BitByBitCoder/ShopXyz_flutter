import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/controller/categoriesController.dart';
import 'package:shop_app/view/productPage/productPage.dart';

class CategoriesView extends ConsumerStatefulWidget {
  const CategoriesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends ConsumerState<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    final a = ref.watch(categoriesControlllerProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: a.when(
          data: (data) => Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black)),
                height: 250,
                width: screenWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final product = data[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductPage(product: product)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.black)),
                        height: 200,
                        width: screenWidth,
                        child: Image.network(
                          '${data[index].image}',
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),
          error: (error, StackTrace) => Text('$error'),
          loading: () => Text('Loading')),
    );
  }
}
