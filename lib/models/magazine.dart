library magazines;

import 'package:json_annotation/json_annotation.dart';

part 'magazine.g.dart';

@JsonSerializable()
class Magazine {
  
  String ID;
  String post_author;
	String post_content;
	String post_title;
	String post_status;
	String comment_status;
	String post_name;
	String post_parent;
	String guid;
	String post_type;
	String object_id;
	String term_taxonomy_id;
	String term_order;
	String pdf_url;
	String img_url;

  Magazine({this.ID, 
        this.post_author, 
        this.post_title, 
        this.post_content, 
        this.post_status, 
        this.comment_status, 
        this.post_name,
        this.post_parent,
        this.guid,
        this.post_type,
        this.object_id,
        this.term_taxonomy_id,
        this.term_order,
        this.pdf_url,
        this.img_url});

  factory Magazine.fromJson(Map<String, dynamic> json) =>
      _$MagazineFromJson(json);

  Map<String, dynamic> toJson() => _$MagazineToJson(this);
}