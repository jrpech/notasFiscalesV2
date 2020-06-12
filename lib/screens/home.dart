import 'package:notas_fiscales/blocs/tab/tab.dart';
import 'package:notas_fiscales/models/models.dart';
import 'package:notas_fiscales/screens/account_page.dart';
import 'package:notas_fiscales/screens/books_page.dart';
import 'package:notas_fiscales/screens/magazines_page.dart';
import 'package:notas_fiscales/screens/news_page.dart';
import 'package:notas_fiscales/widgets/tab_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {

  Widget getBodyWidget(AppTab tab) {
    switch(tab) {
      case AppTab.news:
        return NewsPage();
      case AppTab.books:
        return BooksPage();
      case AppTab.magazines:
        return MagazinesPage();
      case AppTab.account:
        return AccountPage();
    }
    return NewsPage();
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
