// GENERATED CODE - DO NOT MODIFY BY HAND

part of product_image;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) {
  return ProductImage(
    id: json['id'] as int,
    src: json['src'] as String,
    name: json['name'] as String,
    alt: json['alt'] as String,
  );
}

Map<String, dynamic> _$ProductImageToJson(ProductImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'src': instance.src,
      'name': instance.name,
      'alt': instance.alt,
    };
