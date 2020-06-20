import 'package:test/test.dart';
import 'package:notas_fiscales/providers/api.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:jiffy/jiffy.dart';
main() {
  group('Save State Middleware', () {
    test('Should get categories', () async {
      final provider = ApiProvider(Constants.backendServer);
      await provider.news();
    });
  });
}