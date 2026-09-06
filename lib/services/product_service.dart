import 'dart:convert';

import 'package:flutter_application_1/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/category.dart';

class ProductService {
  static const String _baseUrl = 'https://dummyjson.com/';

  Future<List<Product>> getProducts({int limit = 10}) async {
    final url = Uri.parse('$_baseUrl/products?limit=$limit');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }

    final Map<String, dynamic> data = jsonDecode(response.body);

    final List<dynamic> jsonList = data['products'];

    return jsonList.map((json) => Product.fromJson(json)).toList();
  }

  Future<List<Category>> getCategories() async {
    final url = Uri.parse('$_baseUrl/products/categories');

    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to load categories: ${response.statusCode}');
    }

    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => Category.fromJson(json)).toList();
  }

  Future<List<Product>> getProductById(int id) async {
    final url = Uri.parse('$_baseUrl/products/$id');

    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to load product: ${response.statusCode}');
    }

    final Map<String, dynamic> data = json.decode(response.body);
    return [Product.fromJson(data)];
  }

  Future<List<Product>> getProductsByCategory(String? category) async {
    final url = Uri.parse('$_baseUrl/products/category/$category');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load products by category: ${response.statusCode}',
      );
    }

    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => Product.fromJson(json)).toList();
  }
}
