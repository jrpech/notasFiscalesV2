import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:notas_fiscales/blocs/posts/posts_event.dart';
import 'package:notas_fiscales/blocs/posts/posts_state.dart';
import 'package:notas_fiscales/models/models.dart';
import 'package:notas_fiscales/models/post_detail.dart';
import 'package:notas_fiscales/repositories/repository.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository repository;

  PostsBloc({@required this.repository})
      : assert(repository != null),
        super(null);

  @override
  PostsState get initialState => PostsEmpty();

  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    if (event is FetchPosts) {
      yield PostsLoading();
      try {
        final List<Post> quote = await repository.getPosts();
        print("RES: " + quote.length.toString());
        yield PostsLoaded(posts: quote);
      } catch (_) {
        print("ERROR");
        yield PostsError();
      }
    }

    if (event is FetchPostDetail) {
      yield PostDetailLoading();
      try {
        final PostDetail post = await repository.getPostDetail(event.post.id);
        print(jsonEncode(post));
        yield PostDetailLoaded(post: post);
      } catch (error) {
        print(error);
        yield PostDetailError();
      }
    }
  }
}
