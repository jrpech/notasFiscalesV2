library messages_response;

import 'package:json_annotation/json_annotation.dart';
import 'package:notas_fiscales/models/models.dart';
import 'base_response.dart';
import 'response.dart';

part 'messages_response.g.dart';

@JsonSerializable()
class MessagesResponse extends BaseResponse {
  @JsonKey(name: "Data")
  MessageCollection messages;

  MessagesResponse({
    this.messages,
    String message,
    Response response,
  }) : super(message: message, response: response);

  factory MessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$MessagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesResponseToJson(this);
}
