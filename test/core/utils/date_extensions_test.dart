import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_movies/core/utils/date_extensions.dart';

void main() {
  group('DateFormatter Extensions Tests', () {
    final dateTest = DateTime(2026, 1, 18);
    test('toBrazilianFormmat deve retornar a data no formato dd/MM/yyyy', () {
      final formattedDate = dateTest.toBrazilianFormat;
      expect(formattedDate, '18/01/2026');
    });

    test('toYearOnly deve retornar apenas o ano da data', () {
      final yearOnly = dateTest.toYearOnly;
      expect(yearOnly, '2026');
    });
  });
}
