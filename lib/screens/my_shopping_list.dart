import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/blocs/authentication/authentication.dart';
import 'package:notas_fiscales/blocs/books/books.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/repositories/books.dart';
import 'package:notas_fiscales/routes.dart';

class MyShoppingListPage extends StatelessWidget {

  String getURLImg(String url) {
    if(url == null){
      return Constants.imgNotFound;
    }
    return url;
  }
  
  Widget getContent(BuildContext context) {

    var widthScreen = MediaQuery.of(context).size.width * 0.9;
    var columnImg = widthScreen / 2.3;
    var columnText = widthScreen / 1.6;
    var height = MediaQuery.of(context).size.height * 0.8;

    return BlocProvider<BooksBloc>(
      create: (context) {
        return BooksBloc(
          repository: 
          RepositoryProvider.of<BooksRepository>(context),
        )..add(FetchBooks());
      },
      child: BlocBuilder<BooksBloc, BooksState>(
        builder: (BuildContext contex, BooksState state) {

          if (state is BooksLoaded) {
            //return Text("CONSULTADOs: " + state.quote.length.toString());
             return Column(
               children: <Widget>[
             new Expanded( // Expanded in Column, no expansion vertically 
             flex: 12,
          child: 

          Container(      
                   height: height,     
                   child: ListView.builder(
                     itemCount: state.books.length,
                     itemBuilder: (context, index) {
                       return ListTile(
                         contentPadding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                         title: Row(children: <Widget>[
                           Column(children: <Widget>[
                             Image.network(getURLImg(state.books[index].img_url), 
                             width: columnImg,
                             fit:BoxFit.fitWidth)
                             ],),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: columnText,
                                      child: Text(state.books[index].post_title,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                      textAlign: TextAlign.left,
                                      )
                                    )]),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: columnText,
                                          child: Text("250.00",
                                          style: TextStyle(color: Colors.redAccent, fontSize: 22, fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 50,
                                          textAlign: TextAlign.justify,
                                          ))],),
                                      ],
                                      ),
                    ],),
                    onTap: () async {
                      print(state.books[index].pdf_url);
                      await Navigator.pushNamed(context, Routes.web_view, arguments: state.books[index].pdf_url);
                    },
                  );
                }),
             ),

            ),

             new Expanded(
               flex: 1,
          child: ButtonTheme(
  minWidth: widthScreen,
  child:
              RaisedButton(
                color: Colors.blueGrey,
                onPressed: () async {
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                  },
                  child: Text('Cerrar sesión', style: TextStyle(color: Colors.white)),
                  )
            ))

               ],
             );
          }
          if(state is BooksLoading) {
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
