// GENERATED CODE - DO NOT MODIFY BY HAND

part of sales_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesResponse _$SalesResponseFromJson(Map<String, dynamic> json) {
  return SalesResponse(
    sales: (json['Data'] as List)
        ?.map((e) =>
            e == null ? null : BranchSale.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    message: json['Mensaje'] as String,
    response: _$enumDecodeNullable(_$ResponseEnumMap, json['Respuesta']),
  );
}

Map<String, dynamic> _$SalesResponseToJson(SalesResponse instance) =>
    <String, dynamic>{
      'Respuesta': _$ResponseEnumMap[instance.response],
      'Mensaje': instance.message,
      'Data': instance.sales,
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$ResponseEnumMap = <Response, dynamic>{
  Response.SUCCESS: 'OK',
  Response.ERROR: 'ERROR'
};
