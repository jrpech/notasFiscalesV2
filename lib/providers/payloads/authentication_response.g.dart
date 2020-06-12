// GENERATED CODE - DO NOT MODIFY BY HAND

part of authentication_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationResponse _$AuthenticationResponseFromJson(
    Map<String, dynamic> json) {
  return AuthenticationResponse(
    token: json['Data'] as String,
    message: json['Mensaje'] as String,
    response: _$enumDecodeNullable(_$ResponseEnumMap, json['Respuesta']),
  );
}

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'Respuesta': _$ResponseEnumMap[instance.response],
      'Mensaje': instance.message,
      'Data': instance.token,
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
