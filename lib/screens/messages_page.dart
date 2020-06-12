import 'package:notas_fiscales/blocs/messages/messages.dart';
import 'package:notas_fiscales/repositories/messages.dart';
import 'package:notas_fiscales/widgets/messages_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) {
          return MessagesBloc(messagesRepository: MessagesRepository())
            ..add(LoadMessages());
        },
        child: MessagesList());
  }
}
