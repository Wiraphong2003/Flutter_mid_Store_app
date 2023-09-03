import 'package:json_annotation/json_annotation.dart';
import "cartProducts.dart";
part 'cart.g.dart';

@JsonSerializable()
class Cart {
  Cart();

  late num id;
  late num userId;
  late String date;
  late List<CartProducts> products;
  
  factory Cart.fromJson(Map<String,dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}
