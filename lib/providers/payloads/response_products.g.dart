// GENERATED CODE - DO NOT MODIFY BY HAND

part of response_products;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseProducts _$ResponseProductsFromJson(Map<String, dynamic> json) {
  return ResponseProducts(
    success: json['success'] as bool,
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Order.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseProductsToJson(ResponseProducts instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
