import 'package:http/http.dart' as http;
import 'package:notas_fiscales/models/models.dart';
import 'package:notas_fiscales/models/post_detail.dart';
import 'package:notas_fiscales/providers/payloads/books_response.dart';
import 'package:notas_fiscales/providers/payloads/magazines_response.dart';
import 'package:notas_fiscales/providers/payloads/news_response.dart';
import 'package:notas_fiscales/providers/payloads/response_auth.dart';
import 'package:notas_fiscales/providers/payloads/response_products.dart';
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
  static const String _NEWS = 'blogs';
  static const String _POST = 'blogs/{0}/get';
  static const String _BOOKS = 'libros';
  static const String _MAGAZINES = 'revistas';
  static const String _ACCOUNT = 'Account/getMensajes';
  static const String _PRODUCTS = 'user/products/get?user_id=';

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
    print(url);
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

  Future<ResponseAuth> login(AuthenticationRequest request) async {
    String url =
        "https://notasfiscales.com.mx/api/user/generate_auth_cookie/?email=" +
            request.username +
            "&password=" +
            request.password;

    final response = await http
        .post(url, headers: this.headers, body: "")
        .timeout(this.timeout);

    Map<String, dynamic> json = jsonDecode(response.body.toString());
    print(json);
    ResponseAuth authResponse = ResponseAuth.fromJson(json);
    if (authResponse.status == "ok") {
      this.token = authResponse.user.id.toString();
    }
    return authResponse;
  }

  set token(String token) {
    this.headers[HttpHeaders.authorizationHeader] = token;
  }

  get token {
    return this.headers[HttpHeaders.authorizationHeader];
  }

  Future<List<Post>> news() async {
    final response = await this._get(_NEWS);
    Map<String, dynamic> json = jsonDecode(response.body);
    print(json);
    return NewsResponse.fromJson(json).data;
  }

  Future<PostDetail> post(int id) async {
    final response = await this._get(_POST.replaceAll("{0}", id.toString()));
    Map<String, dynamic> json = jsonDecode(response.body);
    print(json);
    return PostDetail.fromJson(json);
  }

  Future<List<Book>> books() async {
    final response = await this._get(_BOOKS);
    Map<String, dynamic> json = jsonDecode(response.body);
    print(json);
    return BooksResponse.fromJson(json).data;
  }

  Future<List<Magazine>> magazines() async {
    final response = await this._get(_MAGAZINES);
    Map<String, dynamic> json = jsonDecode(response.body);
    print(json);
    return MagazinesResponse.fromJson(json).data;
  }

  Future<ResponseProducts> products(String customer_id) async {
    //final response = await this._get(_PRODUCTS + customer_id);
    final response = await this._get(_PRODUCTS + "103458");
    Map<String, dynamic> json = jsonDecode(response.body);
    print(json);
    return ResponseProducts.fromJson(json);
  }

  /*Future<SalesResponse> sales(SalesRequest request) async{
    String path = request.toURL();
    final response = await this._get(_NEWS+"/?"+path);
    Map<String, dynamic> json = jsonDecode(response.body.toString());
    return SalesResponse.fromJson(json);
  }

  Future<MessagesResponse> messages() async {
    final response = await this._get(_BOOKS);
    Map<String, dynamic> json = jsonDecode(response.body.toString());
    return MessagesResponse.fromJson(json);
  }*/

}
