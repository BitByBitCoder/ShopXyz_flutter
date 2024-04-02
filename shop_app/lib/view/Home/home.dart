import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/Model/shopModel.dart';
import 'package:shop_app/controller/shopController.dart';
import 'package:shop_app/core/drower.dart';
import 'package:shop_app/view/Home/categoriesWigits.dart';
import 'package:shop_app/view/productPage/productPage.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final scrollController = ScrollController();

  @override
  void initState() {
    ref.read(shopControllerProvider.notifier).fetch(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(shopControllerProvider);

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
                  color: const Color.fromARGB(255, 9, 121, 212),
                ),
              )
            ],
          ),
        ),
      ),
      body: data.when(
        data: (products) => _ProductsView(products: products),
        error: (error, stackTrace) => _ErrorView(
          errorMessage: '$error',
          onRetry: () {
            ref.read(shopControllerProvider.notifier).fetch(context);
          },
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: Drower(),
    );
  }
}

class _ProductsView extends ConsumerWidget {
  final List<Product> products;

  const _ProductsView({required this.products});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(shopControllerProvider.notifier).fetch(context);
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 255,
              child: CategoriesView(),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'All Items',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 9, 121, 212),
                ),
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            ),
            _AllItemsView(products: products),
          ],
        ),
      ),
    );
  }
}

class _AllItemsView extends ConsumerWidget {
  final List<Product> products;

  const _AllItemsView({required this.products});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductPage(product: product),
              ),
            );
          },
          child: ListTile(
            title: Text('${product.title}'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage('${product.image}'),
              radius: 25,
            ),
          ),
        );
      },
    );
  }
}

class _ErrorView extends ConsumerWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const _ErrorView({
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage),
          ElevatedButton(
            onPressed: () {
              onRetry();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
