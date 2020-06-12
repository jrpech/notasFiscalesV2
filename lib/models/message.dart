library message;

import 'package:json_annotation/json_annotation.dart';
import 'branch.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: "MensajeId")
  int id;
  @JsonKey(name: "sMensaje")
  String content;
  @JsonKey(name: "UsuarioID")
  int userId;
  @JsonKey(name: "CuentaID")
  int accountId;
  @JsonKey(name: "Sucursal")
  Branch branch;

  Message({this.id, this.content, this.userId, this.accountId, this.branch});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
