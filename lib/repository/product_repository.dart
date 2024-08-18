import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_bloc/models/products_model.dart';

class ProductRepository {
  Future<ProductsModel?> getProductDetails() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products')); //string
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ProductsModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Products?> getProductDetailsById(int id) async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products/$id'));
      if (response.statusCode == 200) {
        return Products.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
