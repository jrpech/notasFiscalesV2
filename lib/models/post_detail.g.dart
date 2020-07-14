// GENERATED CODE - DO NOT MODIFY BY HAND

part of post_detail;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDetail _$PostDetailFromJson(Map<String, dynamic> json) {
  return PostDetail(
    id: json['id'] as int,
    post_title: json['post_title'] as String,
    post_content: json['post_content'] as String,
    no_html: json['noHtml'] as String,
  );
}

Map<String, dynamic> _$PostDetailToJson(PostDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_title': instance.post_title,
      'post_content': instance.post_content,
      'noHtml': instance.no_html,
    };
