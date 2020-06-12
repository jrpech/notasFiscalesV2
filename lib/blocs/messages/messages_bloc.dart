import 'package:notas_fiscales/repositories/messages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:notas_fiscales/blocs/messages/messages.dart';
import 'package:notas_fiscales/models/models.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final MessagesRepository messagesRepository;

  @override
  MessagesState get initialState => MessagesLoaded();

  MessagesBloc({@required this.messagesRepository})
      : assert(messagesRepository != null);

  @override
  Stream<MessagesState> mapEventToState(
    MessagesEvent event,
  ) async* {
    if (event is LoadMessages) {
      yield MessagesLoading();
      MessageCollection messages = await messagesRepository.getMessages();
      yield MessagesLoaded(messages: messages);
    }
  }
}
