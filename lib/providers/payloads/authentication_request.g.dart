// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_request;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationRequest _$AuthenticationRequestFromJson(
    Map<String, dynamic> json) {
  return AuthenticationRequest(
    username: json['Username'] as String,
    password: json['Password'] as String,
  );
}

Map<String, dynamic> _$AuthenticationRequestToJson(
        AuthenticationRequest instance) =>
    <String, dynamic>{
      'Username': instance.username,
      'Password': instance.password,
    };
