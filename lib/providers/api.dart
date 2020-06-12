import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:collection';
import 'dart:async';
import 'payloads/payloads.dart';
export 'payloads/payloads.dart';

class ServerError implements Exception {
  final String body;
  final int code;
  static const String _UNKNOWN_SERVER_ERROR = "Error inesperado del servidor";

  String errorMessage() {
    return _UNKNOWN_SERVER_ERROR;
  }

  ServerError(this.body, this.code);
}

class ForbiddenError implements Exception {
  String errorMessage() {
    return "Error, tu session a expirado o es invalida";
  }

  ForbiddenError();
}

class ApiProvider {
  final Duration timeout;
  final String endPoint;
  final Map<String, String> headers;

  /* Endpoints */
  static const String _AUTHENTICATE = 'login/authenticate';
  static const String _SALES = 'Ventas/getVentasByAgrupador';
  static const String _MESSAGES = 'Account/getMensajes';


  ApiProvider(String endPoint, {this.timeout = const Duration(seconds: 50)})
      : this.headers = HashMap.from({"Content-Type": "application/json"}),
        this.endPoint = endPoint;

  String _serviceUrl(String apiCall) {
    return this.endPoint + "/" + apiCall;
  }

  Future<http.Response> _get(String url) async {
    print(_serviceUrl(url));
    final response = await http
        .get(_serviceUrl(url), headers: this.headers)
        .timeout(this.timeout);
    return validateResponse(response);
  }

  Future<http.Response> _post(String url, dynamic body) async {
    String payload = json.encode(body);
    final response = await http
        .post(_serviceUrl(url), headers: this.headers, body: payload)
        .timeout(this.timeout);
    return validateResponse(response);
  }

  http.Response validateResponse(http.Response response) {
    if (response.statusCode == HttpStatus.ok) {
      return response;
    } else if (response.statusCode == HttpStatus.forbidden ||
        response.statusCode == HttpStatus.unauthorized) {
      throw ForbiddenError();
    } else {
      throw ServerError(response.body, response.statusCode);
    }
  }

  Future<AuthenticationResponse> login(AuthenticationRequest request) async {
    final response = await _post(_AUTHENTICATE, request.toJson());
    Map<String, dynamic> json = jsonDecode(response.body.toString());
     AuthenticationResponse authResponse = AuthenticationResponse.fromJson(json);
     if(authResponse.response == Response.SUCCESS) {
       this.token = authResponse.token;
     }
     return authResponse;
  }

  set token(String token) {
    this.headers[HttpHeaders.authorizationHeader] = token;
  }

  get token {
    return this.headers[HttpHeaders.authorizationHeader];
  }

  Future<SalesResponse> sales(SalesRequest request) async{
    String path = request.toURL();
    final response = await this._get(_SALES+"/?"+path);
    Map<String, dynamic> json = jsonDecode(response.body.toString());
    return SalesResponse.fromJson(json);
  }

  Future<MessagesResponse> messages() async {
    final response = await this._get(_MESSAGES);
    Map<String, dynamic> json = jsonDecode(response.body.toString());
    return MessagesResponse.fromJson(json);
  }

}
