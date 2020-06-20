import 'package:notas_fiscales/providers/api.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/models/models.dart';

class MagazinesRepository {
  final provider = new ApiProvider(Constants.backendServer);

  Future<List<Magazine>> getMagazines() async {
    List<Magazine> response = await this.provider.magazines();
    return response;
  }
}
