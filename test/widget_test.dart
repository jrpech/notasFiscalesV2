import 'package:test/test.dart';
import 'package:notas_fiscales/providers/api.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:jiffy/jiffy.dart';
main() {
  group('Save State Middleware', () {
    test('Should get categories', () async {
      final provider = ApiProvider(Constants.backendServer);
      final AuthenticationResponse response = await provider.login(
          AuthenticationRequest(
              username: "",
              password: ""
          ));

      DateTime initialDate = Jiffy().subtract(months: 1);
      DateTime finalDate = DateTime.now();
      final SalesRequest req = SalesRequest(
          initialDate: initialDate,
          finalDate: finalDate
      );
      await provider.sales(req);
    });
    test('Should get messages', () async {
      final provider = ApiProvider(Constants.backendServer);
      final AuthenticationResponse response = await provider.login(
          AuthenticationRequest(
              username: "",
              password: ""
          ));
      MessagesResponse r = await provider.messages();
      print(r.messages.remained.length);
      print(r.messages.recent.length);

    });
  });


}