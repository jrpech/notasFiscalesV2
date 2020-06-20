library books_response;

import 'package:json_annotation/json_annotation.dart';
import 'package:notas_fiscales/models/models.dart';

part 'books_response.g.dart';

@JsonSerializable()
class BooksResponse {
  
  final List<Book> data;

  BooksResponse({this.data});

  factory BooksResponse.fromJson(Map<String, dynamic> json) =>
      _$BooksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BooksResponseToJson(this);
}
