library user;

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String username;
  String email;
  String url;
  String displayname;
  String firstname;
  String lastname;
  String nickname;
  String description;
  String capabilities;
  String avatar;

  User(
      {this.id,
      this.username,
      this.email,
      this.url,
      this.displayname,
      this.firstname,
      this.lastname,
      this.nickname,
      this.description,
      this.capabilities,
      this.avatar});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
