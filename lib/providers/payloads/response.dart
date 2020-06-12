import 'package:json_annotation/json_annotation.dart';

enum Response {
  @JsonValue('OK')
  SUCCESS,
  @JsonValue('ERROR')
  ERROR,
}
