import 'package:equatable/equatable.dart';

abstract class MyListEvent extends Equatable {
  const MyListEvent();
}

class FetchMyList extends MyListEvent {
  const FetchMyList();

  @override
  List<Object> get props => [];
}
