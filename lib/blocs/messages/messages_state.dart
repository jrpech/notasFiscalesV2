import 'package:equatable/equatable.dart';
import 'package:notas_fiscales/models/models.dart';

abstract class MessagesState extends Equatable {
  const MessagesState();

  @override
  List<Object> get props => [];
}

class MessagesLoading extends MessagesState {}

class MessagesLoaded extends MessagesState {
  final MessageCollection messages;

  const MessagesLoaded({this.messages = const MessageCollection()});

  @override
  List<Object> get props => [messages];

  @override
  String toString() => 'MessagesState { sales: $messages }';
}

class MessagesNotLoaded extends MessagesState {}
