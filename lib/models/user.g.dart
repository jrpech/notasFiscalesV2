// GENERATED CODE - DO NOT MODIFY BY HAND

part of user;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    username: json['username'] as String,
    email: json['email'] as String,
    url: json['url'] as String,
    displayname: json['displayname'] as String,
    firstname: json['firstname'] as String,
    lastname: json['lastname'] as String,
    nickname: json['nickname'] as String,
    description: json['description'] as String,
    capabilities: json['capabilities'] as String,
    avatar: json['avatar'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'url': instance.url,
      'displayname': instance.displayname,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'nickname': instance.nickname,
      'description': instance.description,
      'capabilities': instance.capabilities,
      'avatar': instance.avatar,
    };
