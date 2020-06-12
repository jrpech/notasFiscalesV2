import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SalesBranchEvent extends Equatable {
  const SalesBranchEvent();

  @override
  List<Object> get props => [];
}

class LoadSalesBranch extends SalesBranchEvent {
  final DateTime startDate;
  final DateTime endDate;

  const LoadSalesBranch({@required this.startDate, @required this.endDate});

  @override
  List<Object> get props => [startDate, endDate];

  @override
  String toString() => 'LoadSalesBranch { startDate: $startDate, endDate: $endDate }';
}