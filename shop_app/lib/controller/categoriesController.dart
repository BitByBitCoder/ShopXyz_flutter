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

  void fetch() async {
    List<Categories> result = await a.fetch();
    state = AsyncData(result);
  }
}
