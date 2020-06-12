import 'package:notas_fiscales/repositories/sales.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:notas_fiscales/blocs/sales_branch/sales_branch.dart';
import 'package:notas_fiscales/models/models.dart';

class SalesBranchBloc extends Bloc<SalesBranchEvent, SalesBranchState> {
  final SalesRepository salesRepository;

  @override
  SalesBranchState get initialState => SalesBranchLoading();

  SalesBranchBloc({@required this.salesRepository}): assert(salesRepository != null);

  @override
  Stream<SalesBranchState> mapEventToState(
      SalesBranchEvent event,
      ) async* {
    if (event is LoadSalesBranch) {
      yield SalesBranchLoading();
      List<BranchSale> sales = await salesRepository.getBranchSales(event.startDate, event.endDate);
      yield SalesBranchLoaded(sales);
    }
  }

}