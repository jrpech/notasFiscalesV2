import 'package:equatable/equatable.dart';
import 'package:notas_fiscales/models/models.dart';

abstract class SalesBranchState extends Equatable {
  const SalesBranchState();

  @override
  List<Object> get props => [];
}

class SalesBranchLoading extends SalesBranchState {}

class SalesBranchLoaded extends SalesBranchState {
  final List<BranchSale> sales;

  const SalesBranchLoaded([this.sales = const []]);

  @override
  List<Object> get props => [sales];

  @override
  String toString() => 'SalesBranchLoaded { sales: $sales }';
}

class SalesBranchNotLoaded extends SalesBranchState {}
