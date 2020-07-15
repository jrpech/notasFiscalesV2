import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/blocs/posts/posts.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/repositories/repository.dart';
import 'package:notas_fiscales/routes.dart';
import 'package:notas_fiscales/utils/Utils.dart';

class NewsPage extends StatelessWidget {
  Widget getContent(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width * 0.955;

    return BlocProvider<PostsBloc>(
      create: (context) {
        return PostsBloc(
          repository: RepositoryProvider.of<PostsRepository>(context),
        )..add(FetchPosts());
      },
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (BuildContext contex, PostsState state) {
          if (state is PostsLoaded) {
            //return Text("CONSULTADOs: " + state.quote.length.toString());
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.black,
                    ),
                itemCount: state.posts.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: Image.network(
                                    Utils.getURLImg(
                                        state.posts[index].picture_url),
                                    width: widthScreen,
                                    height: 190,
                                    fit: BoxFit.fitWidth),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Container(
                                  width: widthScreen,
                                  child: Text(
                                    state.posts[index].post_title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    textAlign: TextAlign.start,
                                  ))
                            ],
                          ),
                          /*Row(
                            children: <Widget>[
                              Container(
                                  width: widthScreen,
                                  child: Text(
                                    state.posts[index].post_content,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    textAlign: TextAlign.justify,
                                  ))
                            ],
                          ),*/
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerRight,
                                width: widthScreen,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.blueGrey)),
                                  onPressed: () async {
                                    await Navigator.pushNamed(
                                        context, Routes.post_detail,
                                        arguments: state.posts[index]);
                                  },
                                  color: Colors.blueGrey,
                                  textColor: Colors.white,
                                  child: Text("Leer artículo",
                                      style: TextStyle(fontSize: 14)),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ));

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
