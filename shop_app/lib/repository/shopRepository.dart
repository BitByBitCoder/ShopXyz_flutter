// ShopRepository.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shop_app/Model/shopModel.dart';

final shopRepositoryProvider = Provider((ref) {
  return ShopRepository();
});

class ShopRepository {
  //fetch
  Future<List<Product>> fetchData() async {
    try {
      final url = 'https://fakestoreapi.com/products?limit=20';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('shop api fetch success');
        List result = convert.jsonDecode(response.body);
        return result.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  //post

  postData(request) async {
    Map<String, dynamic> requestBody = {
      'title': 'test product',
      'price': 13.5,
      'description': 'lorem ipsum set',
      'image':
          'data:image/jpeg;base64,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',
      'category': 'electronic'
    };
    try {
      final Uri url = Uri.parse('https://fakestoreapi.com/products');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: convert.jsonEncode(request),
      );

      if (response.statusCode == 200) {
        // Request successful, handle the response
        final result = convert.jsonDecode(response.body);
        // print(result);
        print('Add product successfully with id : ${result['id']}');
      } else {
        // Request failed, handle the error
        print('Request failed with status code: ${response.statusCode}');
        throw Exception(
            'Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
