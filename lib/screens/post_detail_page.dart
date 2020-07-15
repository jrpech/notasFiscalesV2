import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:notas_fiscales/blocs/posts/posts.dart';
import 'package:notas_fiscales/models/post.dart';
import 'package:notas_fiscales/repositories/repository.dart';
import 'package:notas_fiscales/routes.dart';
import 'package:notas_fiscales/utils/Utils.dart';

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
            return ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        width: widthScreen,
                        child: Text(
                          state.post.post_title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 100,
                          textAlign: TextAlign.justify,
                        ))
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Image.network(Utils.getURLImg(post.picture_url),
                        width: widthScreen, fit: BoxFit.fitWidth)
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Container(
                        width: widthScreen,
                        child: Html(
                          data: state.post.post_content,
                          onLinkTap: (url) async {
                            await Navigator.pushNamed(context, Routes.web_view,
                                arguments: url);
                          },
                        ))
                  ],
                ),
                SizedBox(height: 10),
              ],
            );

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
          if (state is PostDetailLoading) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueGrey,
              ),
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Noticia"),
          backgroundColor: Colors.blueGrey,
        ),
        body: getContent(context));
  }
}
