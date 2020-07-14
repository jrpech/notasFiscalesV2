import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/blocs/authentication/authentication.dart';
import 'package:notas_fiscales/blocs/books/books.dart';
import 'package:notas_fiscales/blocs/my_list/my_list.dart';
import 'package:notas_fiscales/blocs/my_list/my_list_bloc.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/models/order.dart';
import 'package:notas_fiscales/repositories/user.dart';
import 'package:notas_fiscales/routes.dart';
import 'package:notas_fiscales/utils/Utils.dart';

class MyShoppingListPage extends StatelessWidget {
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
    var height = MediaQuery.of(context).size.height * 0.8;

    return BlocProvider<MyListBloc>(
      create: (context) {
        return MyListBloc(
          repository: RepositoryProvider.of<UserRepository>(context),
        )..add(FetchMyList());
      },
      child: BlocBuilder<MyListBloc, MyListState>(
        builder: (BuildContext contex, MyListState state) {
          if (state is MyListLoaded) {
            //return Text("CONSULTADOs: " + state.quote.length.toString());
            return Column(
              children: <Widget>[
                new Expanded(
                  // Expanded in Column, no expansion vertically
                  flex: 12,
                  child: Container(
                    height: height,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: state.orders.length,
                        itemBuilder: (context, index) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: state.orders[index].products.length,
                              itemBuilder: (context, index2) {
                                return ListTile(
                                  onTap: () async {
                                    await Navigator.pushNamed(
                                        context, Routes.pdf_view,
                                        arguments: state
                                            .orders[index]
                                            .products[index2]
                                            .detail
                                            .downloads[0]
                                            .file);
                                  },
                                  contentPadding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  title: Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Image.network(
                                              Utils.getURLListImg(state
                                                  .orders[index]
                                                  .products[index2]
                                                  .detail
                                                  .images),
                                              width: columnImg,
                                              fit: BoxFit.fitWidth)
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Row(children: <Widget>[
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                width: columnText,
                                                child: Text(
                                                  state
                                                      .orders[index]
                                                      .products[index2]
                                                      .detail
                                                      .name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 4,
                                                  textAlign: TextAlign.left,
                                                ))
                                          ]),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }),
                  ),
                ),
                new Expanded(
                    flex: 1,
                    child: ButtonTheme(
                        minWidth: widthScreen,
                        child: RaisedButton(
                          color: Colors.blueGrey,
                          onPressed: () async {
                            BlocProvider.of<AuthenticationBloc>(context)
                                .add(LoggedOut());
                          },
                          child: Text('Cerrar sesión',
                              style: TextStyle(color: Colors.white)),
                        )))
              ],
            );
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
