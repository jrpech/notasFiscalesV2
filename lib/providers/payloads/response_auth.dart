library response_auth;

import 'package:json_annotation/json_annotation.dart';
import 'package:notas_fiscales/models/user.dart';

part 'response_auth.g.dart';

@JsonSerializable()
class ResponseAuth {
  String status;
  String error;
  String cookie;
  String cookie_admin;
  String cookie_name;
  User user;

  ResponseAuth(
      {this.status,
      this.error,
      this.cookie,
      this.cookie_admin,
      this.cookie_name,
      this.user});

  factory ResponseAuth.fromJson(Map<String, dynamic> json) =>
      _$ResponseAuthFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseAuthToJson(this);
}
