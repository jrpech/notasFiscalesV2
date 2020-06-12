import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notas_fiscales/keys.dart';
import 'package:notas_fiscales/models/models.dart';

class MessageItem extends StatelessWidget {
  final Message message;

  MessageItem({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: NotasFiscalesAppKeys.messageItem(message.id),
      child: ListTile(
        title: Hero(
          tag: '${message.id}__heroTag',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              message.content,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ),
    );
  }
}
