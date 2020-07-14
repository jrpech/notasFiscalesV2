library product;

import 'package:json_annotation/json_annotation.dart';
import 'package:notas_fiscales/models/product_detail.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "product_id")
  int product_id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "product")
  ProductDetail detail;

  Product({this.product_id, this.name, this.detail});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
