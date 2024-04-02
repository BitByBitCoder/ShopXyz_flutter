// ShopRepository.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/Model/categoriesModel.dart';

import 'dart:convert' as convert;
import 'package:shop_app/Model/shopModel.dart';

final categoriesRepositoryProvider = Provider((ref) {
  return jewelery();
});

class jewelery {
  String url = "https://fakestoreapi.com/products/category/jewelery";
  Future<List<Categories>> fetch() async {
    try {
      final response = await http.get(Uri.parse(url));
      List result = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('category fetch success');
        final a = result.map((e) => Categories.fromJson(e)).toList();

        return a;
      } else {
        throw Exception('faild to fetch');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

//   Future<List<Product>> fetch() async {
//     try {
//       final url = 'https://fakestoreapi.com/products/category/jewelery';
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         List result = convert.jsonDecode(response.body);
//         return result.map((e) => Product.fromJson(e)).toList();
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       throw Exception('Error occurred: $e');
//     }
//   }
// }
}
