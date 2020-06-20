import 'package:notas_fiscales/providers/api.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/models/models.dart';

class BooksRepository {
  final provider = new ApiProvider(Constants.backendServer);

  Future<List<Book>> getPosts() async {
    List<Book> response = await this.provider.books();
    return response;
  }
}
