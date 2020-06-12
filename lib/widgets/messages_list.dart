import 'package:notas_fiscales/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/blocs/messages/messages.dart';
import 'loading_indicator.dart';
import 'message_item.dart';

class MessagesList extends StatelessWidget {
  MessagesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(
      builder: (
        BuildContext context,
        MessagesState state,
      ) {
        if (state is MessagesLoading) {
          return LoadingIndicator();
        } else if (state is MessagesLoaded) {
          final messages = state.messages.remained;
          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              final message = messages[index];
              return MessageItem(
                message: message,
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
