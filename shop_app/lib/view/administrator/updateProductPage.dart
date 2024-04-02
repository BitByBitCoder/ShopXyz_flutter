import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpadteProductPage extends ConsumerStatefulWidget {
  const UpadteProductPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpadteProductPageState();
}

class _UpadteProductPageState extends ConsumerState<UpadteProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('update'),
    );
  }
}
