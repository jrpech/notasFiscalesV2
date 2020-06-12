import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/blocs/sales_branch/sales_branch.dart';
import 'package:jiffy/jiffy.dart';
import 'package:notas_fiscales/widgets/sales_list.dart';
import 'package:notas_fiscales/repositories/sales.dart';
class SalesPage extends StatelessWidget{
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return SalesBranchBloc(
          salesRepository: SalesRepository()
        )..add(LoadSalesBranch(
          startDate: Jiffy(DateTime.now()).subtract(months: 1),
          endDate: DateTime.now(),
        ));
      },
      child: FilteredSales()
    );
  }
}