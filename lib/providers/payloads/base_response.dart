library base_response;

import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "Respuesta")
  Response response;

  @JsonKey(name: "Mensaje")
  String message;

  BaseResponse({this.response, this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
