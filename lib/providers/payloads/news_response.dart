library news_response;

import 'package:json_annotation/json_annotation.dart';
import 'package:notas_fiscales/models/models.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  
  final List<Post> data;

  NewsResponse({this.data});

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
