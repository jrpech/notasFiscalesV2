import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  Widget build(BuildContext context) {

    return Container(child:Text("SettingsPage"));
    /*return BlocProvider(
        create: (BuildContext context) {
          return MessagesBloc(messagesRepository: MessagesRepository())
            ..add(LoadMessages());
        },
        child: MessagesList());*/
  }
}
