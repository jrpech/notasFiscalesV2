// GENERATED CODE - DO NOT MODIFY BY HAND

part of messages_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagesResponse _$MessagesResponseFromJson(Map<String, dynamic> json) {
  return MessagesResponse(
    messages: json['Data'] == null
        ? null
        : MessageCollection.fromJson(json['Data'] as Map<String, dynamic>),
    message: json['Mensaje'] as String,
    response: _$enumDecodeNullable(_$ResponseEnumMap, json['Respuesta']),
  );
}

Map<String, dynamic> _$MessagesResponseToJson(MessagesResponse instance) =>
    <String, dynamic>{
      'Respuesta': _$ResponseEnumMap[instance.response],
      'Mensaje': instance.message,
      'Data': instance.messages,
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
