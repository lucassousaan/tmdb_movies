import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String get toBrazilianFormat {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String get toYearOnly {
    return DateFormat('yyyy').format(this);
  }
}
