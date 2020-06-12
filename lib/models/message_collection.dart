library message_collection;

import 'package:json_annotation/json_annotation.dart';
import 'message.dart';
part 'message_collection.g.dart';

@JsonSerializable()
class MessageCollection {
  @JsonKey(name: "Recientes")
  final List<Message> recent;
  @JsonKey(name: "Mensajes")
  final List<Message> remained;


  const MessageCollection({
    this.recent = const [],
    this.remained = const [],
  });

  factory MessageCollection.fromJson(Map<String, dynamic> json) =>
      _$MessageCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$MessageCollectionToJson(this);
}
