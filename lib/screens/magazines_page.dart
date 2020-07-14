import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/blocs/magazines/magazines.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/repositories/magazines.dart';
import 'package:notas_fiscales/routes.dart';
import 'package:notas_fiscales/utils/Utils.dart';

class MagazinesPage extends StatelessWidget {
  Widget getContent(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width * 0.9;
    var columnImg = widthScreen / 2.3;
    var columnText = widthScreen / 1.6;

    return BlocProvider<MagazinesBloc>(
      create: (context) {
        return MagazinesBloc(
          repository: RepositoryProvider.of<MagazinesRepository>(context),
        )..add(FetchMagazines());
      },
      child: BlocBuilder<MagazinesBloc, MagazinesState>(
        builder: (BuildContext contex, MagazinesState state) {
          if (state is MagazinesLoaded) {
            //return Text("CONSULTADOs: " + state.quote.length.toString());
            return ListView.builder(
                itemCount: state.magazines.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    title: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Image.network(
                                Utils.getURLImg(state.magazines[index].img_url),
                                width: columnImg,
                                fit: BoxFit.fitWidth)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(children: <Widget>[
                              Container(
                                  width: columnText,
                                  child: Text(
                                    state.magazines[index].post_title,
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
                                      Utils.setPrice(
                                          state.magazines[index].price),
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
                              state.magazines[index].post_name);
                    },
                  );
                });
          }
          if (state is MagazinesLoading) {
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
