import 'package:notas_fiscales/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/blocs/sales_branch/sales_branch.dart';
import 'loading_indicator.dart';
import 'sales_item.dart';

class FilteredSales extends StatelessWidget {
  FilteredSales({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesBranchBloc, SalesBranchState>(
      builder: (
        BuildContext context,
        SalesBranchState state,
      ) {
        if (state is SalesBranchLoading) {
          return LoadingIndicator();
        } else if (state is SalesBranchLoaded) {
          final sales = state.sales;
          return ListView.builder(
            itemCount: sales.length,
            itemBuilder: (BuildContext context, int index) {
              final sale = sales[index];
              return SalesItem(
                sales: sale,
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
