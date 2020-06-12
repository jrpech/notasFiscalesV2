import 'package:intl/intl.dart';

class SalesRequest {
  DateTime initialDate;
  DateTime finalDate;
  String groupedBy;
  String branches;

  SalesRequest({
    this.initialDate,
    this.finalDate,
    this.groupedBy,
    this.branches
  });

  Map<String, String> toMap() {
    var formatter = new DateFormat('yyyy-MM-dd');


    return {
      'fechai': formatter.format(initialDate),
      'fechaf': formatter.format(finalDate),
      'Agrupador': groupedBy??'',
      'sucursales': branches??'',
    };
  }

  String toURL() {
    Uri uri = new Uri.http("","", this.toMap());
    return uri.query;
  }
}
