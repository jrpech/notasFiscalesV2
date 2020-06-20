import 'package:equatable/equatable.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();
}

class FetchBooks extends BooksEvent {
  const FetchBooks();

  @override
  List<Object> get props => [];
}