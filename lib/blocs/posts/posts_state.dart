import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:notas_fiscales/models/models.dart';

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