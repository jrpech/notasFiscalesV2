// GENERATED CODE - DO NOT MODIFY BY HAND

part of posts;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id'] as int,
    post_title: json['post_title'] as String,
    post_content: json['post_content'] as String,
    picture_url: json['picture_url'] as String,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'post_title': instance.post_title,
      'post_content': instance.post_content,
      'picture_url': instance.picture_url,
    };
