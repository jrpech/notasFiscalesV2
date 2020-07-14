library response_products;

import 'package:json_annotation/json_annotation.dart';
import 'package:notas_fiscales/models/order.dart';

part 'response_products.g.dart';

@JsonSerializable()
class ResponseProducts {
  bool success;
  //String message;
  List<Order> data;

  ResponseProducts({
    this.success,
    this.data,
  });

  factory ResponseProducts.fromJson(Map<String, dynamic> json) =>
      _$ResponseProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseProductsToJson(this);
}
