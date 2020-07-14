import 'package:equatable/equatable.dart';
import 'package:notas_fiscales/models/models.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();
}

class FetchPosts extends PostsEvent {
  const FetchPosts();

  @override
  List<Object> get props => [];
}

class FetchPostDetail extends PostsEvent {
  final Post post;
  const FetchPostDetail(this.post);

  @override
  List<Object> get props => [];
}
