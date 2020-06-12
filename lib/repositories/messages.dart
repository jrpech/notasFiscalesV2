import 'package:notas_fiscales/providers/api.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/repositories/user.dart';
import 'package:notas_fiscales/models/models.dart';

class MessagesRepository {
  final provider = new ApiProvider(Constants.backendServer);
  final userRepository = UserRepository();

  Future<MessageCollection> getMessages() async {
    this.provider.token = await userRepository.getPersistedToken();
    MessagesResponse response = await this.provider.messages();
    return response.messages;
  }
}
