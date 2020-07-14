import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:notas_fiscales/models/order.dart';

abstract class MyListState extends Equatable {
  const MyListState();

  @override
  List<Object> get props => [];
}

class MyListEmpty extends MyListState {}

class MyListLoading extends MyListState {}

class MyListLoaded extends MyListState {
  final List<Order> orders;

  const MyListLoaded({@required this.orders}) : assert(orders != null);

  @override
  List<Object> get props => [orders];
}

class MyListError extends MyListState {}
