import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/Model/cart.dart';
import 'package:shop_app/repository/cartRepository.dart';

final cartControllerProvider =
    StateNotifierProvider<CartController, AsyncValue<Cart>>((ref) {
  final a = ref.watch(cartRepositoryProvider);

  return CartController(a);
});

class CartController extends StateNotifier<AsyncValue<Cart>> {
  CartRepository a;
  CartController(this.a) : super(AsyncValue.loading()) {
    fetchData();
  }

  fetchData() async {
    final data = await a.fetch();
    state = AsyncData(data);
  }

  removeData(int productId) {
    state.whenData((cart) {
      final updatedProducts = cart.products
          .where((product) => product.productId != productId)
          .toList();
      state = AsyncData(cart.copyWith(products: updatedProducts));
    });
  }
}
