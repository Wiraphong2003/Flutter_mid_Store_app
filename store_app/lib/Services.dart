import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/user.dart';

class Services {
  static const String url_user = "https://fakestoreapi.com/users/1";
  static const String url_product = "https://fakestoreapi.com/products";

  static Future<User> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url_user));
      if (200 == response.statusCode) {
        return parseUsers(response.body);
      } else {
        return User();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return User();
    }
  }

  static User parseUsers(String responseBody) {
    final parsed = json.decode(responseBody);
    if (parsed is Map<String, dynamic>) {
      return User.fromJson(parsed);
    } else {
      return User();
    }
  }
}
