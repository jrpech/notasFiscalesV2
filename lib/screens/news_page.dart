import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/blocs/posts/posts.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/repositories/repository.dart';
import 'package:notas_fiscales/routes.dart';

class NewsPage extends StatelessWidget {


  Widget getContent(BuildContext context) {

    var widthScreen = MediaQuery.of(context).size.width * 0.92;

    return BlocProvider<PostsBloc>(
      create: (context) {
        return PostsBloc(
          repository: 
          RepositoryProvider.of<PostsRepository>(context),
        )..add(FetchPosts());
      },
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (BuildContext contex, PostsState state) {

          if (state is PostsLoaded) {
            //return Text("CONSULTADOs: " + state.quote.length.toString());
             return 

             ListView.separated(
               separatorBuilder: (context, index) => Divider(color: Colors.black,),
               itemCount: state.posts.length,
               itemBuilder: (context, index) => Padding(padding: EdgeInsets.all(8.0),
               child: Column(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: widthScreen,
                            child: Text(state.posts[index].post_title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign: TextAlign.justify,
                            )
                          )],
                      ),
                      SizedBox(height: 10),
                      Row(children: <Widget>[
                        Image.network(state.posts[index].picture_url, 
                        width: widthScreen,
                        fit:BoxFit.fitWidth)
                      ],),
                      Row(
                        children: <Widget>[
                          Container(
                            width: widthScreen,
                            child: Text(state.posts[index].post_content,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            textAlign: TextAlign.justify,
                            )
                          )],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerRight,
                            width: widthScreen,
                            child: RaisedButton(
                              color: Colors.blueGrey,
                              onPressed: () async {
              await Navigator.pushNamed(context, Routes.web_view, arguments: Constants.urlBaseProductos);
              },
                              child: const Text('Continuar leyendo', style: TextStyle(color: Colors.white)),
                              ),
                          )],
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
          if(state is PostsLoading) {
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