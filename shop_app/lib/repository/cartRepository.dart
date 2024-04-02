// ShopRepository.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shop_app/Model/cart.dart';

final cartRepositoryProvider = Provider((ref) {
  return CartRepository();
});

class CartRepository {
  String url = 'https://fakestoreapi.com/carts';
  Future<Cart> fetch() async {
    try {
      final response = await http.get(Uri.parse(url));
      final result = convert.jsonDecode(response.body);

      if (response.statusCode == 200) {
        print('cart api fetch success');

        return Cart.fromJson(result[0]);
      } else {
        throw Exception('Error occurred: ');
      }
    } catch (e) {
      print('Error occurred: $e');
      rethrow;
    }
  }
}
