library sales_response;

import 'package:json_annotation/json_annotation.dart';
import 'base_response.dart';
import 'response.dart';
import 'package:notas_fiscales/models/models.dart';

part 'sales_response.g.dart';

@JsonSerializable()
class SalesResponse extends BaseResponse {
  @JsonKey(name: "Data")
  List<BranchSale> sales;

  SalesResponse({
    this.sales,
    String message,
    Response response,
  }) : super(message: message, response: response);

  factory SalesResponse.fromJson(Map<String, dynamic> json) =>
      _$SalesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SalesResponseToJson(this);
}
