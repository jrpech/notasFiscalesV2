library branch_sale;

import 'package:json_annotation/json_annotation.dart';

part 'branch_sale.g.dart';

@JsonSerializable()
class BranchSale {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "titulo")
  String title;
  @JsonKey(name: "importe")
  double amount;
  @JsonKey(name: "img")
  String image;
  @JsonKey(name: "punto")
  String salesPoint;

  BranchSale({this.id, this.title, this.amount, this.image, this.salesPoint});

  factory BranchSale.fromJson(Map<String, dynamic> json) =>
      _$BranchSaleFromJson(json);

  Map<String, dynamic> toJson() => _$BranchSaleToJson(this);
}
