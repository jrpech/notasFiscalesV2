import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:notas_fiscales/blocs/books/books.dart';
import 'package:notas_fiscales/models/models.dart';
import 'package:notas_fiscales/repositories/books.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BooksRepository repository;

  BooksBloc({@required this.repository}) : assert(repository != null);

  @override
  BooksState get initialState => BooksEmpty();

  @override
  Stream<BooksState> mapEventToState(BooksEvent event) async* {
    if (event is FetchBooks) {
      yield BooksLoading();
      try {

        final List<Book> books = await repository.getPosts();
        print("RES: " + books.length.toString());
        yield BooksLoaded(books: books);
      } catch (_) {
        print("ERROR");
        yield BooksError();
      }
    }
  }
}