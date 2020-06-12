// GENERATED CODE - DO NOT MODIFY BY HAND

part of message;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    id: json['MensajeId'] as int,
    content: json['sMensaje'] as String,
    userId: json['UsuarioID'] as int,
    accountId: json['CuentaID'] as int,
    branch: json['Sucursal'] == null
        ? null
        : Branch.fromJson(json['Sucursal'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'MensajeId': instance.id,
      'sMensaje': instance.content,
      'UsuarioID': instance.userId,
      'CuentaID': instance.accountId,
      'Sucursal': instance.branch,
    };
