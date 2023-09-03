import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/product.dart';

import 'models/products.dart';

class ServicesP {
  static const String url_product = "https://fakestoreapi.com/products";

  static Future<Products> getProducts() async {
    try {
      final response = await http.get(Uri.parse(url_product));
      if (200 == response.statusCode) {
        return parseProducts(response.body);
      } else {
        return Products();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Products();
    }
  }

  static Products parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Product> products =
        parsed.map<Product>((json) => Product.fromJson(json)).toList();
    Products p = Products();
    p.products = products;
    return p;
  }
}
