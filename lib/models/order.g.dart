// GENERATED CODE - DO NOT MODIFY BY HAND

part of order;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    status: json['status'] as String,
  )..products = (json['products'] as List)
      ?.map(
          (e) => e == null ? null : Product.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'status': instance.status,
      'products': instance.products,
    };
