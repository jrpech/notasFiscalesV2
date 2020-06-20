import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/blocs/magazines/magazines.dart';
import 'package:notas_fiscales/repositories/magazines.dart';

class MagazinesPage extends StatelessWidget {
  Widget getContent(BuildContext context) {

    var widthScreen = MediaQuery.of(context).size.width * 0.92;

    return BlocProvider<MagazinesBloc>(
      create: (context) {
        return MagazinesBloc(
          repository: 
          RepositoryProvider.of<MagazinesRepository>(context),
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
                    title: Column(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: widthScreen,
                            child: Text(state.magazines[index].post_title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 50,
                            textAlign: TextAlign.center,
                            )
                          )],
                      ),
                      Row(children: <Widget>[
                        Image.network(state.magazines[index].img_url, 
                        width: widthScreen,
                        fit:BoxFit.fitWidth)
                      ],),
                      Row(
                        children: <Widget>[
                          Container(
                            width: widthScreen,
                            child: Text(state.magazines[index].post_content,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 50,
                            textAlign: TextAlign.justify,
                            )
                          )],
                      ),
                    ],),
                    onTap: () async {
                      //await Navigator.pushNamed(context, Routes.pollList, arguments: filters.copyWith(topic: state.resumen[index].id));
                    },
                  );
                });
          }
          if(state is MagazinesLoading) {
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