// GENERATED CODE - DO NOT MODIFY BY HAND

part of books;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(
    ID: json['ID'] as String,
    post_author: json['post_author'] as String,
    post_title: json['post_title'] as String,
    post_content: json['post_content'] as String,
    post_status: json['post_status'] as String,
    comment_status: json['comment_status'] as String,
    post_name: json['post_name'] as String,
    post_parent: json['post_parent'] as String,
    guid: json['guid'] as String,
    post_type: json['post_type'] as String,
    object_id: json['object_id'] as String,
    term_taxonomy_id: json['term_taxonomy_id'] as String,
    term_order: json['term_order'] as String,
    pdf_url: json['pdf_url'] as String,
    img_url: json['img_url'] as String,
    price: json['price'] as String,
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'ID': instance.ID,
      'post_author': instance.post_author,
      'post_content': instance.post_content,
      'post_title': instance.post_title,
      'post_status': instance.post_status,
      'comment_status': instance.comment_status,
      'post_name': instance.post_name,
      'post_parent': instance.post_parent,
      'guid': instance.guid,
      'post_type': instance.post_type,
      'object_id': instance.object_id,
      'term_taxonomy_id': instance.term_taxonomy_id,
      'term_order': instance.term_order,
      'pdf_url': instance.pdf_url,
      'img_url': instance.img_url,
      'price': instance.price,
    };
