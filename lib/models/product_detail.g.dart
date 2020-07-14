// GENERATED CODE - DO NOT MODIFY BY HAND

part of product_detail;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) {
  return ProductDetail(
    id: json['id'] as int,
    name: json['name'] as String,
    type: json['type'] as String,
    downloadable: json['downloadable'] as bool,
  )
    ..downloads = (json['downloads'] as List)
        ?.map((e) =>
            e == null ? null : Download.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..images = (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ProductImage.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ProductDetailToJson(ProductDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'downloadable': instance.downloadable,
      'downloads': instance.downloads,
      'images': instance.images,
    };
