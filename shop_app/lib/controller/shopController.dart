import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/Model/shopModel.dart';
import 'package:shop_app/core/snackbar.dart';
import 'package:shop_app/repository/shopRepository.dart';

final shopControllerProvider =
    StateNotifierProvider<ShopController, AsyncValue<List<Product>>>((ref) {
  final p = ref.watch(shopRepositoryProvider);
  return ShopController(p);
});

class ShopController extends StateNotifier<AsyncValue<List<Product>>> {
  ShopRepository shopdata;

  ShopController(this.shopdata) : super(const AsyncValue.loading()) {}
//fetch
  fetch(BuildContext context) async {
    try {
      final data = await shopdata.fetchData();
      state = AsyncData(data);
      Snack.snackbar(context, 'fetch shop api');
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      Snack.snackbar(context, 'Error occured');
    }
  }

//post
  post(request, BuildContext context) async {
    try {
      final data = await shopdata.postData(request);
      Snack.snackbar(context, 'Add data success');
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      Snack.snackbar(context, 'Add data unseccess');
    }
  }
}
