library magazines_response;

import 'package:json_annotation/json_annotation.dart';
import 'package:notas_fiscales/models/models.dart';

part 'magazines_response.g.dart';

@JsonSerializable()
class MagazinesResponse {
  
  final List<Magazine> data;

  MagazinesResponse({this.data});

  factory MagazinesResponse.fromJson(Map<String, dynamic> json) =>
      _$MagazinesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MagazinesResponseToJson(this);
}
