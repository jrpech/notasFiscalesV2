library authentication_response;

import 'package:json_annotation/json_annotation.dart';
import 'base_response.dart';
import 'response.dart';

part 'authentication_response.g.dart';

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "Data")
  String token;

  AuthenticationResponse({
    this.token,
    String message,
    Response response,
  }) : super(message: message, response: response);

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
