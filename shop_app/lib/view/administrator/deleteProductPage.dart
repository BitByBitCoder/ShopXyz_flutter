import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteProductPage extends ConsumerStatefulWidget {
  const DeleteProductPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DeleteProductPageState();
}

class _DeleteProductPageState extends ConsumerState<DeleteProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('delete'),
    );
  }
}
