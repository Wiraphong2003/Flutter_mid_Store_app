import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/index.dart';

class ServicesC {
  static const String url = "https://fakestoreapi.com/carts/user/1";

  static Future<Carts> getCarts() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        return parseCarts(response.body);
      } else {
        return Carts();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Carts();
    }
  }

  static Carts parseCarts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Cart> carts = parsed.map<Cart>((json) => Cart.fromJson(json)).toList();
    Carts c = Carts();
    c.carts = carts;
    return c;
  }
}
