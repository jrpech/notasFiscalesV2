import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:notas_fiscales/models/models.dart';
import 'package:notas_fiscales/models/post_detail.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsEmpty extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;

  const PostsLoaded({@required this.posts}) : assert(posts != null);

  @override
  List<Object> get props => [posts];
}

class PostsError extends PostsState {}

/*CARGA DE POS DE FORMA INDIVIDUAL*/

class PostDetailEmpty extends PostsState {}

class PostDetailLoading extends PostsState {}

class PostDetailLoaded extends PostsState {
  final PostDetail post;

  const PostDetailLoaded({@required this.post}) : assert(post != null);

  @override
  List<Object> get props => [post];
}

class PostDetailError extends PostsState {}
