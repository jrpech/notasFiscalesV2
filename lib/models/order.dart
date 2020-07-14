library order;

import 'package:json_annotation/json_annotation.dart';
import 'package:notas_fiscales/models/product.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: "status")
  String status;

  @JsonKey(name: "products")
  List<Product> products;

  Order({this.status});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
