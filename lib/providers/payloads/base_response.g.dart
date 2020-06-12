// GENERATED CODE - DO NOT MODIFY BY HAND

part of base_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse(
    response: _$enumDecodeNullable(_$ResponseEnumMap, json['Respuesta']),
    message: json['Mensaje'] as String,
  );
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'Respuesta': _$ResponseEnumMap[instance.response],
      'Mensaje': instance.message,
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
