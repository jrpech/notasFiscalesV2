// GENERATED CODE - DO NOT MODIFY BY HAND

part of message_collection;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageCollection _$MessageCollectionFromJson(Map<String, dynamic> json) {
  return MessageCollection(
    recent: (json['Recientes'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    remained: (json['Mensajes'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MessageCollectionToJson(MessageCollection instance) =>
    <String, dynamic>{
      'Recientes': instance.recent,
      'Mensajes': instance.remained,
    };
