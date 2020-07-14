import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notas_fiscales/models/order.dart';
import 'package:notas_fiscales/models/user.dart';
import 'package:notas_fiscales/providers/api.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/providers/payloads/response_auth.dart';
import 'package:notas_fiscales/providers/payloads/response_products.dart';

class UserRepository {
  final storage = new FlutterSecureStorage();
  final provider = new ApiProvider(Constants.backendServer);

  static const String _persistKey = "user_token";

  Future<User> authenticate({
    @required String username,
    @required String password,
  }) async {
    ResponseAuth response = await provider
        .login(AuthenticationRequest(username: username, password: password));

    if (response.status == "error") {
      throw (response.error);
    }
    return response.user;
  }

  Future<List<Order>> getProducts() async {
    String id = await this.getPersistedToken();
    ResponseProducts response = await provider.products(id);
    if (response.success == false) {
      throw ("OCURRIO UN ERROR AL CONSULTAR LA INFORMACIÓN");
    }
    return response.data;
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
