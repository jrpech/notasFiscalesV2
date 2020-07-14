library product_detail;

import 'package:json_annotation/json_annotation.dart';
import 'package:notas_fiscales/models/download.dart';
import 'package:notas_fiscales/models/models.dart';
import 'package:notas_fiscales/models/product_image.dart';

part 'product_detail.g.dart';

@JsonSerializable()
class ProductDetail {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "type")
  String type;

  @JsonKey(name: "downloadable")
  bool downloadable;

  @JsonKey(name: "downloads")
  List<Download> downloads;

  @JsonKey(name: "images")
  List<ProductImage> images;

  ProductDetail({this.id, this.name, this.type, this.downloadable});

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);
}
