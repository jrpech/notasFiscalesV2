import 'package:notas_fiscales/blocs/tab/tab.dart';
import 'package:notas_fiscales/models/models.dart';
import 'package:notas_fiscales/widgets/tab_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notas_fiscales/screens/sales_page.dart';
import 'package:notas_fiscales/screens/settings_page.dart';
import 'package:notas_fiscales/screens/messages_page.dart';

class HomePage extends StatelessWidget {

  Widget getBodyWidget(AppTab tab) {
    switch(tab) {
      case AppTab.home:
        return SalesPage();
      case AppTab.messages:
        return MessagesPage();
      case AppTab.settings:
        return SettingsPage();
    }
    return SalesPage();
  }

  @override
  Widget build(BuildContext context) {
    final tabBloc = BlocProvider.of<TabBloc>(context);
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Titulo"),
          ),
          body: getBodyWidget(activeTab),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => tabBloc.add(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}
