import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/blocs/posts/posts.dart';
import 'package:notas_fiscales/models/post.dart';
import 'package:notas_fiscales/repositories/repository.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;
  PostDetailPage(this.post);

  Widget getContent(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width * 0.92;

    return BlocProvider<PostsBloc>(
      create: (context) {
        return PostsBloc(
          repository: RepositoryProvider.of<PostsRepository>(context),
        )..add(FetchPostDetail(post));
      },
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (BuildContext contex, PostsState state) {
          if (state is PostDetailLoaded) {
            return Text(state.post.post_title);

            /*ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 16, right: 16),
                    title: ,),
                    onTap: () async {
                      //await Navigator.pushNamed(context, Routes.pollList, arguments: filters.copyWith(topic: state.resumen[index].id));
                    },
                  );
                });*/
          }
          if (state is PostsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // TODO: Loading if it's required? may be not because should be local.
          return Text("No se encontraron valores");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getContent(context);
  }
}
