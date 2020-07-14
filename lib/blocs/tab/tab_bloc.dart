import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:notas_fiscales/blocs/tab/tab.dart';
import 'package:notas_fiscales/models/models.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  TabBloc(AppTab initialState) : super(initialState);

  @override
  AppTab get initialState => AppTab.news;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
