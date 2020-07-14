import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/blocs/books/books.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/repositories/books.dart';
import 'package:notas_fiscales/routes.dart';

class BooksPage extends StatelessWidget {
  String getURLImg(String url) {
    if (url == null) {
      return Constants.imgNotFound;
    }
    return url;
  }

  Widget getContent(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width * 0.9;
    var columnImg = widthScreen / 2.3;
    var columnText = widthScreen / 1.6;

    return BlocProvider<BooksBloc>(
      create: (context) {
        return BooksBloc(
          repository: RepositoryProvider.of<BooksRepository>(context),
        )..add(FetchBooks());
      },
      child: BlocBuilder<BooksBloc, BooksState>(
        builder: (BuildContext contex, BooksState state) {
          if (state is BooksLoaded) {
            //return Text("CONSULTADOs: " + state.quote.length.toString());
            return ListView.builder(
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    title: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Image.network(getURLImg(state.books[index].img_url),
                                width: columnImg, fit: BoxFit.fitWidth)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(children: <Widget>[
                              Container(
                                  width: columnText,
                                  child: Text(
                                    state.books[index].post_title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    textAlign: TextAlign.left,
                                  ))
                            ]),
                            Row(
                              children: <Widget>[
                                Container(
                                    width: columnText,
                                    child: Text(
                                      "250.00",
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 50,
                                      textAlign: TextAlign.justify,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () async {
                      await Navigator.pushNamed(context, Routes.web_view,
                          arguments: Constants.urlBaseProductos +
                              state.books[index].post_name);
                    },
                  );
                });
          }
          if (state is BooksLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
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
