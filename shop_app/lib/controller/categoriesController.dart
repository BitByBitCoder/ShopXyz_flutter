import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/Model/categoriesModel.dart';
import 'package:shop_app/repository/categoriesRepository.dart';

final categoriesControlllerProvider =
    StateNotifierProvider<CategoriesController, AsyncValue<List<Categories>>>(
        (ref) {
  final a = ref.watch(categoriesRepositoryProvider);

  return CategoriesController(a);
});

class CategoriesController extends StateNotifier<AsyncValue<List<Categories>>> {
  jewelery a;

  CategoriesController(this.a) : super(AsyncValue.loading()) {
    fetch();
  }

  Future<void> fetch() async {
    try {
      List<Categories> result = await a.fetch();
      state = AsyncData(result);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
