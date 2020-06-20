import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:notas_fiscales/blocs/magazines/magazines.dart';
import 'package:notas_fiscales/models/models.dart';
import 'package:notas_fiscales/repositories/magazines.dart';

class MagazinesBloc extends Bloc<MagazinesEvent, MagazinesState> {
  final MagazinesRepository repository;

  MagazinesBloc({@required this.repository}) : assert(repository != null);

  @override
  MagazinesState get initialState => MagazinesEmpty();

  @override
  Stream<MagazinesState> mapEventToState(MagazinesEvent event) async* {
    if (event is FetchMagazines) {
      yield MagazinesLoading();
      try {

        final List<Magazine> magazines = await repository.getMagazines();
        print("RES: " + magazines.length.toString());
        yield MagazinesLoaded(magazines: magazines);
      } catch (_) {
        print("ERROR");
        yield MagazinesError();
      }
    }
  }
}