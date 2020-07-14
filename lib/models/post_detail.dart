library post_detail;

import 'package:json_annotation/json_annotation.dart';
import 'package:notas_fiscales/models/models.dart';

part 'post_detail.g.dart';

@JsonSerializable()
class PostDetail {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "post_title")
  String post_title;

  @JsonKey(name: "post_content")
  String post_content;

  @JsonKey(name: "noHtml")
  String no_html;

  PostDetail({this.id, this.post_title, this.post_content, this.no_html});

  factory PostDetail.fromJson(Map<String, dynamic> json) =>
      _$PostDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PostDetailToJson(this);
}
