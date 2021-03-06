// GENERATED CODE - DO NOT MODIFY BY HAND

part of response_auth;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseAuth _$ResponseAuthFromJson(Map<String, dynamic> json) {
  return ResponseAuth(
    status: json['status'] as String,
    error: json['error'] as String,
    cookie: json['cookie'] as String,
    cookie_admin: json['cookie_admin'] as String,
    cookie_name: json['cookie_name'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResponseAuthToJson(ResponseAuth instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'cookie': instance.cookie,
      'cookie_admin': instance.cookie_admin,
      'cookie_name': instance.cookie_name,
      'user': instance.user,
    };
