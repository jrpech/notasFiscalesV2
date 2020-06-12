library auth_request;

import 'package:json_annotation/json_annotation.dart';

part 'authentication_request.g.dart';

@JsonSerializable()
class AuthenticationRequest {
  @JsonKey(name: "Username")
  String username;

  @JsonKey(name: "Password")
  String password;

  AuthenticationRequest({
    this.username,
    this.password,
  });

  factory AuthenticationRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationRequestToJson(this);
}
