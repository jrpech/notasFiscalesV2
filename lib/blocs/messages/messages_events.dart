import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class MessagesEvent extends Equatable {
  const MessagesEvent();

  @override
  List<Object> get props => [];
}

class LoadMessages extends MessagesEvent {
  const LoadMessages();

  @override
  String toString() => 'LoadMessages{ }';
}