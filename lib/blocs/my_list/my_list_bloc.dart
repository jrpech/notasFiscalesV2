import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:notas_fiscales/blocs/my_list/my_list_event.dart';
import 'package:notas_fiscales/blocs/my_list/my_list_state.dart';
import 'package:notas_fiscales/models/order.dart';
import 'package:notas_fiscales/repositories/user.dart';

class MyListBloc extends Bloc<MyListEvent, MyListState> {
  final UserRepository repository;

  MyListBloc({@required this.repository}) : super(null);

  @override
  MyListState get initialState => MyListEmpty();

  @override
  Stream<MyListState> mapEventToState(MyListEvent event) async* {
    if (event is FetchMyList) {
      yield MyListLoading();
      try {
        final List<Order> order = await repository.getProducts();
        print("RES: " + order.length.toString());
        yield MyListLoaded(orders: order);
      } catch (_) {
        print("ERROR");
        yield MyListError();
      }
    }
  }
}
