library posts;

import 'package:json_annotation/json_annotation.dart';
import 'package:notas_fiscales/models/models.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "post_title")
  String post_title;

  @JsonKey(name: "post_content")
  String post_content;

  @JsonKey(name: "picture_url")
  String picture_url;

  Post({this.id, this.post_title, this.post_content, this.picture_url});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
