import 'package:notas_fiscales/providers/api.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/repositories/user.dart';
import 'package:notas_fiscales/models/models.dart';

class SalesRepository {
  final provider = new ApiProvider(Constants.backendServer);
  final userRepository = UserRepository();

  Future<List<BranchSale>> getBranchSales(DateTime start, DateTime end) async {
    this.provider.token = await userRepository.getPersistedToken();
    SalesResponse response = await this.provider.sales(SalesRequest(
          initialDate: start,
          finalDate: end,
        ));
    return response.sales;
  }
}
