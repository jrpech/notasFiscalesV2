// GENERATED CODE - DO NOT MODIFY BY HAND

part of branch_sale;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchSale _$BranchSaleFromJson(Map<String, dynamic> json) {
  return BranchSale(
    id: json['id'] as int,
    title: json['titulo'] as String,
    amount: (json['importe'] as num)?.toDouble(),
    image: json['img'] as String,
    salesPoint: json['punto'] as String,
  );
}

Map<String, dynamic> _$BranchSaleToJson(BranchSale instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.title,
      'importe': instance.amount,
      'img': instance.image,
      'punto': instance.salesPoint,
    };
