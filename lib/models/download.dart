library download;

import 'package:json_annotation/json_annotation.dart';

part 'download.g.dart';

@JsonSerializable()
class Download {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "file")
  String file;

  Download({this.id, this.name, this.file});

  factory Download.fromJson(Map<String, dynamic> json) =>
      _$DownloadFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadToJson(this);
}
