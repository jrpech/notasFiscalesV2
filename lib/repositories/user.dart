import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notas_fiscales/providers/api.dart';
import 'package:notas_fiscales/constants.dart';
class UserRepository {

  final storage = new FlutterSecureStorage();
  final provider = new ApiProvider(Constants.backendServer);

  static const String _persistKey = "user_token";


  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    AuthenticationResponse response = await provider.login(AuthenticationRequest(
      username: username,
      password: password
    ));
    if(response.response == Response.ERROR) {
      throw(response.message);
    }
    return response.token;
  }

  Future<void> deleteToken() async {
    await storage.delete(key: _persistKey);
    return;
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: _persistKey, value: token);
    return;
  }

  Future<bool> hasToken() async {
    String value = await storage.read(key: _persistKey);
    return value != null;
  }

  Future<String> getPersistedToken() async {
    return await storage.read(key: _persistKey);
  }
}